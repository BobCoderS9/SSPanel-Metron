<?php
/**
 * Copyright (c) 2019.
 * Author:Alone88
 * Github:https://github.com/anhao
 */

namespace App\Services\Gateway;

use App\Services\Gateway\Epay\Epay_notify;
use App\Services\Gateway\Epay\Epay_submit;
use App\Services\Auth;
use App\Services\Config;
use App\Models\Paylist;


class Epay extends AbstractPayment
{

    protected $epay = array();

    public function __construct()
    {
        $this->epay['apiurl'] = $_ENV['epay']['epay_api_url'];//
        $this->epay['partner'] = $_ENV['epay']['epay_pid'];//易支付商户pid
        $this->epay['key'] = $_ENV['epay']['epay_key'];//易支付商户Key
        $this->epay['sign_type'] = strtoupper('MD5'); //签名方式
        $this->epay['input_charset'] = strtolower('utf-8');//字符编码
        $this->epay['transport'] = $_ENV['epay']['transport'];//协议 http 或者https
    }

    public function MetronPay($type, $price, $buyshop, $paylist_id=0)
    {
        if ($paylist_id == 0 && $price <= 0) {
            return ['errcode' => -1, 'errmsg' => "非法的金额."];
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

        //请求参数
        $data = array(
            "pid" => trim($this->epay['partner']),
            "type" => $type,
            "out_trade_no" => $pl->tradeno,
            "notify_url" => $_ENV['baseUrl'] . "/payment/notify/epay",
            "return_url" => $_ENV['baseUrl'] . "/user/code",
            "name" => $_ENV['appName'] . "充值" . $pl->total . "元",
            "money" => $pl->total,
            "sitename" => $_ENV['appName']
        );
        $alipaySubmit = new Epay_submit($this->epay);
        $html_text = $alipaySubmit->buildRequestForm($data);
        $result = array('code'=>$html_text,'errcode'=>0,'tradeno' => $pl->tradeno );
        return $result;
    }

    public function purchase($request, $response, $args)
    {
        $type = $request->getParam('type');
        $price = $request->getParam('price');
        if ($price <= 0) {
            return json_encode(['errcode' => -1, 'errmsg' => "非法的金额."]);
        }
        $user = Auth::getUser();
        $pl = new Paylist();

        $pl->userid = $user->id;
        $pl->total = $price;
        //订单号
        $pl->tradeno = self::generateGuid();
        $pl->save();

        //请求参数
        $data = array(
            "pid" => trim($this->epay['partner']),
            "type" => $type,
            "out_trade_no" => $pl->tradeno,
            "notify_url" => Config::get('baseUrl') . "/epay/notify",
            "return_url" => Config::get('baseUrl') . "/epay/return",
            "name" => Config::get('appName') . "充值" . $price . "元",
            "money" => $price,
            "sitename" => Config::get('appName')
        );
        $alipaySubmit = new Epay_submit($this->epay);
        $html_text = $alipaySubmit->buildRequestForm($data);
        echo $html_text;
    }

    public function notify($request, $response, $args)
    {
        $alipayNotify = new Epay_notify($this->epay);
        $verify_result = $alipayNotify->verifyNotify();
        if ($verify_result) {
            $out_trade_no = $_GET['out_trade_no'];
            $type = $_GET['type'];
            switch ($type) {
                case 'alipay':
                    $type = "Epay-支付宝";
                    break;
                case 'qqpay':
                    $type = "Epay-QQ";
                    break;
                case 'wxpay':
                    $type = "Epay-微信";
                    break;
            }
            $trade_status = $_GET['trade_status'];
            if ($trade_status == 'TRADE_SUCCESS') {
                $this->postPayment($out_trade_no, $type);
                die('SUCCESS');
            }else{
                die('FAIL');
            }
        } else {
            return '非法请求';
        }
    }

    public function getStatus($request, $response, $args)
    {
        // TODO: Implement getStatus() method.
    }

    public function getPurchaseHTML()
    {
        return '
                        <div class="card-inner">
                        <p class="card-heading">请输入充值金额</p>
                        <form class="epay" name="epay" action="/user/payment/purchase" method="post">
                            <input class="form-control maxwidth-edit" id="price" name="price" placeholder="输入充值金额后，点击你要付款的应用图标即可" autofocus="autofocus" type="number" min="0.01" max="1000" step="0.01" required="required">
                            <br>
                            <button class="btn btn-flat waves-attach" id="btnSubmit" type="submit" name="type" value="alipay" ><img src="/images/alipay.jpg" width="50px" height="50px" /></button>
                            <button class="btn btn-flat waves-attach" id="btnSubmit" type="submit" name="type" value="qqpay" ><img src="/images/qqpay.jpg" width="50px" height="50px" /></button>
                            <button class="btn btn-flat waves-attach" id="btnSubmit" type="submit" name="type" value="wxpay" ><img src="/images/weixin.jpg" width="50px" height="50px" /></button>

                        </form>
                        </div>
';
    }

    public function getReturnHTML($request, $response, $args)
    {
        $money = $_GET['money'];
        echo "您已经成功支付 $money 元,正在跳转..";
        echo <<<HTML
<script>
    setTimeout(function() {
      location.href="/user/code";
    },500)
</script>
HTML;
        return;
    }

    public function postPayment($pid, $method)
    {
        return parent::postPayment($pid, $method);
    }

    public static function generateGuid()
    {
        return parent::generateGuid();
    }
}
