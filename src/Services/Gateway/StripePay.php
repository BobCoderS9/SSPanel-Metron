<?php

namespace App\Services\Gateway;

use App\Services\{ Auth, View, MetronSetting };
use App\Models\Paylist;
use Stripe\{ Stripe, Charge, Source };
use Exception;

class StripePay extends AbstractPayment
{
    public function __construct()
    {
        Stripe::setApiKey($_ENV['stripe_key']);
    }

    public function MetronPay($type, $price, $shopinfo, $paylist_id=0)
    {
        if ($_ENV['stripe_limit'] > $price) {
            return [ 'ret' => 0, 'msg' => '金额需大于 ' . $_ENV['stripe_limit'] . ' 元' ];
        }

        if ( isset($shopinfo['telegram']) ) {
            $user = $shopinfo['telegram']['user'];
        } else {
            $user = Auth::getUser();
        }

        $url = 'https://api.exchangerate-api.com/v4/latest/'.strtoupper($_ENV['stripe_currency']);
        $stream_opts = [
            "ssl" => [
                "verify_peer"=>false,
                "verify_peer_name"=>false,
            ]
        ];
        $response = file_get_contents($url,false, stream_context_create($stream_opts));
        $currency = json_decode($response);

        $price_exchanged = bcdiv((double)$price, $currency->rates->CNY, 10);
        try {
            $source = Source::create([
                'amount'    => floor($price_exchanged * 100),
                'currency'  => $_ENV['stripe_currency'],
                'type'      => $type,
                'redirect'  => [
                    'return_url' => $_ENV['baseUrl'] . '/user/payment/return',
                ],
            ]);
        } catch (\Stripe\Exception\InvalidRequestException $e) {
            return [ 'ret' => 0, 'msg' => $this->amount_verification($e->getMessage(), $currency->rates->CNY) ];
        }

        if ($paylist_id == 0) {
            $pl             = new Paylist();
            $pl->userid     = $user->id;
            $pl->total      = $price;
            $pl->datetime   = time();
            $pl->tradeno    = $source['id'];
            if ($shopinfo) {
                if ( isset($shopinfo['telegram']) ) {
                    unset($shopinfo['telegram']['user']);
                }
                $pl->shop   = json_encode($shopinfo);
            }
            $pl->save();
        } else {
            $pl = Paylist::find($paylist_id);
            if ($pl->status === 1){
                return ['ret' => 0, 'msg' => "该订单已交易完成"];
            }
        }

        if ($type == 'alipay') {
            return [ 'ret' => 1, 'url' => $source['redirect']['url'], 'tradeno' => $pl->tradeno, 'type' => 'url' ];
        } else {
            return [ 'ret' => 1, 'url' => $source['wechat']['qr_code_url'], 'tradeno' => $pl->tradeno, 'type' => 'qrcode' ];
        }
    }

    public function amount_verification($total, $cny)
    {
        $error_message = explode('$', $total, 2);
        $Limit_amount  = explode(' ', $error_message[1], 2);
        if ($error_message[0] === 'Amount must be at least ') {
            return '金额需大于 ' . round(bcmul($Limit_amount[0], $cny, 3), 2) . ' 元 ($' . $Limit_amount[0] . ' ' . strtoupper($Limit_amount[1]) . ')';
        }
        return $total;
    }

    public function purchase($request, $response, $args)
    {
        return 0;
    }

    public function notify($request, $response, $args)
    {
        return 0;
    }

    public function getPurchaseHTML()
    {
        return 1;
    }

    public function getReturnHTML($request, $response, $args)
    {
        return 0;
    }

    public function getStatus($request, $response, $args)
    {
        $p = Paylist::where('id', $_POST['pid'])->first();
        $return['ret'] = 1;
        $return['result'] = $p->status;
        return json_encode($return);
    }
}
