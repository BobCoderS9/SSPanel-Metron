<?php


namespace App\Services\Gateway;

use App\Models\Paylist;
use App\Services\Auth;
use App\Services\Config;
use Slim\Http\Request;
use Slim\Http\Response;

class BobVmqPay extends AbstractPayment
{
    /**
     * @name    生成签名
     * @param sourceData
     */
    public function sign($payId, $type, $price)
    {
        $vmq_param = Config::get('vmq_param');
        $vmq_secret = Config::get('vmq_secret');

        return md5($payId . $vmq_param . $type . $price . $vmq_secret);
    }

    /**
     * @param $type
     * @param $price
     * @param $buyshop
     * @param int $paylist_id
     */
    public function MetronPay($type, $price, $buyshop, $paylist_id = 0)
    {
        if ($paylist_id == 0 && $price <= 0) {
            return ['errcode' => -1, 'errmsg' => '非法的金额'];
        }
        $user = Auth::getUser();
        if ($paylist_id == 0) {
            $pl = new Paylist();
            $pl->userid = $user->id;
            $pl->total = $price;
            if ($buyshop['id'] != 0) $pl->shop = json_encode($buyshop);
            $pl->datetime = time();
            $pl->tradeno = self::generateGuid();
            $pl->save();
        } else {
            $pl = Paylist::find($paylist_id);
            if ($pl->status === 1) {
                return ['errcode' => -1, 'errmsg' => "该订单已交易完成"];
            }
        }
        $type = $type === 'alipay' ? 2 : 1;
        $sign = $this->sign($pl->tradeno, $type, $price);
        $url = Config::get('vmq_url') . '/createOrder';
        $url .= '?payId=' . $pl->tradeno;
        $url .= '&type=' . $type;
        $url .= '&price=' . $price;
        $url .= '&sign=' . $sign;
        $url .= '&param=' . Config::get('vmq_param') . '&isHtml=0';
        $url .= '&notifyUrl=' . urlencode(Config::get('baseUrl') . '/payment/notify/vmq');
        $url .= '&returnUrl=' . urlencode(Config::get('baseUrl') . '/user/payment/return?tradeno=' . $pl->tradeno);
        $json = file_get_contents($url);
        $result = json_decode($json, true);
        if ($result['code'] === -1) {
            return ['errcode' => -1, 'errmsg' => $result['msg']];
        }

        return ['errcode' => 0, 'url' => $result['data']['payUrl'], 'pid' => $pl->tradeno, 'type' => 'qrcode'];
    }

    public function purchase($request, $response, $args)
    {
        // TODO: Implement purchase() method.
    }

    public function notify($request, $response, $args)
    {
        ini_set("error_reporting", "E_ALL & ~E_NOTICE");
        $key = Config::get('vmq_secret');//通讯密钥
        $payId = $request->getParam('payId');//商户订单号
        $param = $request->getParam('param');//创建订单的时候传入的参数
        $type = $request->getParam('type');//支付方式 ：微信支付为1 支付宝支付为2
        $price = $request->getParam('price');//订单金额
        $reallyPrice = $request->getParam('reallyPrice');//实际支付金额
        $sign = $request->getParam('sign');//校验签名，计算方式 = md5(payId + param + type + price + reallyPrice + 通讯密钥)
        //开始校验签名
        $_sign = md5($payId . $param . $type . $price . $reallyPrice . $key);
        if ($_sign != $sign) {
            die('error_sign');//sign校验不通过
        }
        $this->postPayment($payId, 'V免签');
        die('success');
    }

    public function getReturnHTML($request, $response, $args)
    {
        // TODO: Implement getReturnHTML() method.
    }

    public function getStatus($request, $response, $args)
    {
        // TODO: Implement getStatus() method.
    }

    public function getPurchaseHTML()
    {
        // TODO: Implement getPurchaseHTML() method.
    }
}
