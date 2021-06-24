<?php
/**
 * Created by Bob.
 * User: Bobs9
 */

namespace App\Services\Gateway;

use App\Services\Auth;
use App\Models\Paylist;
use App\Services\Config;
use App\Services\View;
use Exception;

class THeadPay extends AbstractPayment
{
    protected $config;

    public function __construct()
    {
        $this->config = [
            'theadpay_url' => $_ENV['theadpay_url'],
            'theadpay_mchid' => $_ENV['theadpay_mchid'],
            'theadpay_key' => $_ENV['theadpay_key'],
        ];
    }

    public function pay($order)
    {
        $params = [
            'mchid' => $this->config['theadpay_mchid'],
            'out_trade_no' => $order['trade_no'],
            'total_fee' => (string)$order['total_fee'],
            'notify_url' => $order['notify_url'],
        ];
        $params['sign'] = $this->sign($params);
        $data = json_encode($params);

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $this->config['theadpay_url']);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        $data = curl_exec($curl);
        curl_close($curl);

        $result = json_decode($data, true);
        if (!is_array($result) || !isset($result["status"])) {
            throw new \Exception('未知错误');
        }
        if ($result["status"] !== "success") {
            throw new \Exception($result["message"]);
        }

        return [
            'type' => 0, // QRCode
            'data' => $result["code_url"],
        ];
    }

    public function verify($params)
    {
        return $params['sign'] === $this->sign($params);
    }

    protected function sign($params)
    {
        unset($params['sign']);
        ksort($params);
        reset($params);
        $data = http_build_query($params) . "&key=" . $this->config['theadpay_key'];
        return strtoupper(md5($data));
    }

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
            if ($pl->status === 1){
                return ['errcode' => -1, 'errmsg' => "该订单已交易完成"];
            }
        }
        $params = $this->pay([
            'trade_no' => $pl->tradeno,
            'total_fee' => $pl->total * 100,
            'notify_url' => rtrim($_ENV['baseUrl'], '/') . '/payment/notify/theadpay',
        ]);;
        $result['pid'] = $pl->tradeno;

        return ['ret' => 1, 'url' => $params['data'], 'pid' => $pl->tradeno, 'type' => 'qrcode', 'errcode' => 0];
    }


    public function purchase($request, $response, $args)
    {
        $amount = (int)$request->getParam('amount');
        $user = Auth::getUser();
        if ($amount <= 0) {
            return $response->withJson([
                'ret' => 0,
                'msg' => '订单金额错误：' . $amount
            ]);
        }

        $pl = new Paylist();
        $pl->userid = $user->id;
        $pl->tradeno = self::generateGuid();
        $pl->total = $amount;
        $pl->save();

        try {
            $res = $this->pay([
                'trade_no' => $pl->tradeno,
                'total_fee' => $pl->total * 100,
                'notify_url' => rtrim($_ENV['baseUrl'], '/') . '/payment/notify',
            ]);

            return $response->withJson([
                'ret' => 1,
                'qrcode' => $res['data'],
                'amount' => $pl->total,
                'pid' => $pl->tradeno,
            ]);
        } catch (Exception $e) {
            return $response->withJson([
                'ret' => 0,
                'msg' => '创建支付订单错误：' . $e->getMessage(),
            ]);
        }
    }

    public function notify($request, $response, $args)
    {
        $inputString = file_get_contents('php://input', 'r');
        $inputStripped = str_replace(array("\r", "\n", "\t", "\v"), '', $inputString);
        $params = json_decode($inputStripped, true); //convert JSON into array

        if ($this->verify($params)) {
            $pid = $params['out_trade_no'];
            $this->postPayment($pid, 'THeadPay 平头哥支付 ' . $pid);
            die('success'); //The response should be 'success' only
        }

        die('fail');
    }


    public function getPurchaseHTML()
    {
        return View::getSmarty()->fetch('user/theadpay.tpl');
    }

    public function getReturnHTML($request, $response, $args)
    {
        return 0;
    }

    public function getStatus($request, $response, $args)
    {
        $p = Paylist::where('tradeno', $_POST['pid'])->first();
        return $response->withJson([
            'ret' => 1,
            'result' => $p->status,
        ]);
    }
}
