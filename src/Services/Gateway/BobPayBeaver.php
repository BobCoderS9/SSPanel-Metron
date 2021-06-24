<?php

/**
 * Created by PayBeaver <merchant.paybeaver.com>
 * Version: 2020-12-06
 */

namespace App\Services\Gateway;

use App\Controllers\BobPayController;
use App\Metron\Metron;
use App\Models\Bought;
use App\Models\Code;
use App\Models\Coupon;
use App\Models\Payback;
use App\Models\Shop;
use App\Models\User;
use App\Services\View;
use App\Services\Auth;
use App\Services\Config;
use App\Models\Paylist;
use App\Utils\Telegram;
use Slim\Http\Request;
use Slim\Http\Response;
use Telegram\Bot\Api;

class BobPayBeaver extends AbstractPayment
{
    public static function get($key = '')
    {
        $resp = require(BASE_PATH . '/config/.bobvpn.php');

        return $key ? $resp[$key] : $resp;
    }

    public static function pay_config($key = '')
    {
        $config = self::get('payment')['default'];

        return self::get('payment')[$config][$key];
    }

    private function buildQuery($data)
    {
        ksort($data);
        return http_build_query($data);
    }

    private function sign($data)
    {
        return strtolower(md5($data . self::pay_config('app_secret')));
    }

    private function verify($data, $signature)
    {
        unset($data['sign']);
        $mySign = $this->sign($this->buildQuery($data));
        return $mySign === $signature;
    }

    public function post($data)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, self::pay_config('pay_url') . '/v1/gateway/fetch');
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        $data = curl_exec($curl);
        curl_close($curl);
        return $data;
    }


    public function purchase($request, $response, $args)
    {
        $price = $request->getParam('price') ?? 0;
        $type = $request->getParam('type');
        $client = $request->getParam('client');
        $shopcoupon = $request->getParam('shopcoupon');
        $paylist_id = (int)$request->getParam('paylist_id');
        $shop_id = (int)$request->getParam('shopid');
        if ($shopcoupon){
            $coupon = Coupon::where('code', $shopcoupon)->first();
            $shop = Shop::where('id', $shop_id)->where('status', 1)->first();
            if (!$coupon) {
                return json_encode(['ret' => 0, 'msg' => '优惠码不存在']);
            }
            if ($coupon->order($shop->id) == false) {
                return json_encode(['ret' => 0, 'msg' => '此优惠码不可用于此商品']);
            }
            if ($coupon->expire < time()) {
                return json_encode(['ret' => 0, 'msg' => '此优惠码已过期']);
            }
        }
        $shopinfo = array();
        $shopinfo['id'] = (int)$request->getParam('shopid');
        if ($request->getParam('shopauto')) {
            $shopinfo['autorenew'] = $request->getParam('shopauto');
        }
        if ($request->getParam('shopcoupon')) {
            $shopinfo['coupon'] = $request->getParam('shopcoupon');
        }
        $shopinfo['disableothers'] = 1;
        if (floatval($price) <= 0) {
            return json_encode(['ret' => 0, 'msg' => '非法的金额.']);
        }
        $user = Auth::getUser();
        $pl = new Paylist();
        $pl->userid = $user->id;
        $pl->total = $price;
        $pl->shop = json_encode($shopinfo);
        $pl->datetime = time();
        $pl->tradeno = self::generateGuid();
        $pl->save();
        $data['app_id'] = self::pay_config('app_id');
        $data['out_trade_no'] = $pl->tradeno;
        $data['total_amount'] = (int)($price * 100);
        $data['notify_url'] = Config::get('baseUrl') . '/api/v1/bob/payment/notify';
        $data['return_url'] = Config::get('baseUrl') . '/api/v1/bob/payment/return?tradeno='.$pl->tradeno;
        $params = $this->buildQuery($data);
        $data['sign'] = $this->sign($params);
        $result = json_decode($this->post($data), true);
        if (!isset($result['data'])) {
            return json_encode(['ret' => 0, 'msg' => '支付网关处理失败']);
        }
        $result['pid'] = $pl->tradeno;

        return json_encode(['url' => $result['data']['pay_url'], 'ret' => 1, 'pid' => $pl->tradeno]);
    }

    public function notify($request, $response, $args)
    {
        file_put_contents(BASE_PATH . '/storage/bobpay.log', json_encode($request->getParams()) . "\r\n", FILE_APPEND);
        if (!$this->verify($request->getParams(), $request->getParam('sign'))) {
            die('FAIL');
        }
        $res = $this->postPayment($request->getParam('out_trade_no'), 'PayBeaver');
        die('SUCCESS');
//        return $response->getBody()->write(json_encode($res));
    }

    public function getStatus($request, $response, $args)
    {
        $return = [];
        $p = Paylist::where('tradeno', $_POST['pid'])->first();
        $return['ret'] = 1;
        $return['result'] = $p->status;

        return json_encode($return);
    }

    public function postPayment($pid, $method)
    {
        $p = Paylist::where('tradeno', $pid)->first();
        if ($p->status == 1) {
            return ['errcode' => 0, 'errmsg' => '交易已完成'];
        }

        $p->status = 1;
        $p->save();
        $user = User::find($p->userid);
        $user->money = bcadd($user->money, $p->total, 2);
        $user->save();
        $codeq = new Code();
        $codeq->code = $method;
        $codeq->isused = 1;
        $codeq->type = -1;
        $codeq->number = $p->total;
        $codeq->usedatetime = date('Y-m-d H:i:s');
        $codeq->userid = $user->id;
        $codeq->save();

        self::buyshop($pid);

        if ($user->ref_by >= 1) {
            $gift_user = User::where('id', '=', $user->ref_by)->first();
            $gift_user->money += ($codeq->number * (Config::get('code_payback') / 100));
            $gift_user->save();
            $Payback = new Payback();
            $Payback->total = $codeq->number;
            $Payback->userid = $user->id;
            $Payback->ref_by = $user->ref_by;
            $Payback->ref_get = $codeq->number * (Config::get('code_payback') / 100);
            $Payback->datetime = time();
            $Payback->save();
        }

        if (Config::get('enable_donate') == true) {
            if ($user->is_hide == 1) {
                Telegram::Send('一位不愿透露姓名的大老爷给我们捐了 ' . $codeq->number . ' 元!');
            } else {
                Telegram::Send($user->user_name . ' 大老爷给我们捐了 ' . $codeq->number . ' 元！');
            }
        }

        self::SendPayment($user, $p, $codeq);

        return ['errcode' => 1, 'errmsg' => '回调处理完成'];;
    }

    /**
     * 商店购买套餐支付回调后自动购买套餐函数
     */
    public static function buyshop($pid = 0)
    {
        $ps = Paylist::where('tradeno', $pid)->first();
        $shopinfo = json_decode($ps->shop, true);
        if ($shopinfo['id'] == 0) {
            $res['ret'] = 0;
            $res['msg'] = '无商品购买';
            return $res;
        }
        if (isset($shopinfo['status']) && $shopinfo['status'] == 1) {
            $res['ret'] = 0;
            $res['msg'] = '该订单商品已购买';
            return $res;
        }
        $shop = $shopinfo['id'];
        $coupon = isset($shopinfo['coupon']) ? $shopinfo['coupon'] : '';
        $coupon = trim($coupon);
        $code = $coupon;
        $disableothers = $shopinfo['disableothers'];
        $autorenew = isset($shopinfo['autorenew']) ? $shopinfo['autorenew'] : 1;
        $user = User::find($ps->userid);
        $shop = Shop::where('id', $shop)->where('status', 1)->first();

        if ($shop == null) {
            $res['ret'] = 0;
            $res['msg'] = '非法请求';

            $shopinfo['status'] = '非法请求';
            $ps->shop = json_encode($shopinfo, JSON_UNESCAPED_UNICODE);
            $ps->save();
            return $res;
        }

        if ($coupon == '') {
            $credit = 0;
        } else {
            $coupon = Coupon::where('code', $coupon)->first();

            if ($coupon == null) {
                $credit = 0;
            } else {
                if ($coupon->onetime == 1) {
                    $onetime = true;
                }
                $credit = $coupon->credit;
            }

            if ($coupon->order($shop->id) == false) {
                $res['ret'] = 0;
                $res['msg'] = '此优惠码不可用于此商品';

                $shopinfo['status'] = '优惠码不适用此商品';
                $ps->shop = json_encode($shopinfo, JSON_UNESCAPED_UNICODE);
                $ps->save();
                return $res;
            }

            if ($coupon->expire < time()) {
                $res['ret'] = 0;
                $res['msg'] = '此优惠码已过期';

                $shopinfo['status'] = '此优惠码已过期';
                $ps->shop = json_encode($shopinfo, JSON_UNESCAPED_UNICODE);
                $ps->save();
                return $res;
            }
        }

        $price = $shop->price * ((100 - $credit) / 100);

        if (bccomp($user->money, $price, 2) == -1) {
            $res['ret'] = 0;
            $res['msg'] = '余额不足，总价为' . $price . '元; 您的余额为' . $user->money . '元';

            $shopinfo['status'] = '余额不足';
            $ps->shop = json_encode($shopinfo, JSON_UNESCAPED_UNICODE);
            $ps->save();
            return $res;
        }

        $user->money = bcsub($user->money, $price, 2);
        $user->save();

        if ($disableothers == 1) {
            $boughts = Bought::where('userid', $user->id)->get();
            foreach ($boughts as $disable_bought) {
                $disable_bought->renew = 0;
                $disable_bought->save();
            }
        }

        $used = Bought::where('userid', $user->id)->where('usedd', 1)->get();
        foreach ($used as $use_del) {
            $use_del->usedd = 0;
            $use_del->save();
        }

        (new BobPayController())::bought_usedd($user, 1, 0);
        $bought = new Bought();
        $bought->userid = $user->id;
        $bought->shopid = $shop->id;
        $bought->datetime = time();
        if ($autorenew == 0 || $shop->auto_renew == 0) {
            $bought->renew = 0;
        } else {
            $bought->renew = time() + $shop->auto_renew * 86400;
        }

        $bought->coupon = $code;

        if (isset($onetime)) {
            $price = $shop->price;
        }
        $bought->price = $price;
        $bought->usedd = 1;
        $bought->save();

        $shop->buy($user);
        $shopinfo['status'] = 1;
        $ps->shop = json_encode($shopinfo);
        $ps->save();

        $res['ret'] = 1;
        $res['msg'] = '购买成功';

        return $res;
    }

    /**
     *  用户充值 给管理员TG提醒
     */
    public static function SendPayment($user, $pl, $codeq)
    {
        if ($pl->shop == null) {
            $type = '钱包充值';
        } else {
            $shopinfo = json_decode($pl->shop, true);
            if ($shopinfo['id'] != 0) {
                $shopname = Shop::where('id', $shopinfo['id'])->value('name');
                $type = '购买套餐【' . $shopname . '】';
            } elseif ($shopinfo['telegram']['the'] == 'code') {
                $type = 'Telegram 钱包充值';
            } else {
                $type = '钱包充值';
            }
        }

        $messageText = '交易提醒' . PHP_EOL .
            '------------------------------' . PHP_EOL .
            '用户名：' . $user->user_name . '  #' . $user->id . PHP_EOL .
            '交易类型：' . $type . PHP_EOL .
            '充值金额：' . $pl->total . PHP_EOL .
            '钱包余额：' . $user->money . PHP_EOL .
            '发起时间：' . date('Y-m-d H:i:s', $pl->datetime) . PHP_EOL .
            '到账时间：' . $codeq->usedatetime;

        $config = require(BASE_PATH . '/config/.bobvpn.php');
        $sendAdmin = $config['payment']['telegram_admin'];
        if ($sendAdmin > 0){
            $admin_telegram_id = User::where('id', $sendAdmin)->where('is_admin', '1')->value('telegram_id');
            if ($admin_telegram_id != null) {
                self::Send($messageText, $admin_telegram_id);
            }
        }
    }

    public static function Send($messageText, $chat_id = 0, $keyboard = null)
    {
        if ($chat_id === 0) {
            $chat_id = $_ENV['telegram_chatid'];
        }
        // 发送给非群组时使用异步
        $async = ($chat_id != $_ENV['telegram_chatid']);
        $bot = new Api($_ENV['telegram_token'], $async);

        if ($keyboard !== null) {
            $reply_markup = json_encode(
                [
                    'inline_keyboard' => $keyboard
                ]
            );
        } else {
            $reply_markup = null;
        }

        $sendMessage = [
            'chat_id'                   => $chat_id,
            'text'                      => $messageText,
            'parse_mode'                => '',
            'disable_web_page_preview'  => false,
            'reply_to_message_id'       => null,
            'reply_markup'              => $reply_markup
        ];
        try {
            $bot->sendMessage($sendMessage);
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }


    public function getReturnHTML($request, $response, $args)
    {
        echo '<script>window.close();</script>';
    }

    public function getPurchaseHTML()
    {
        // TODO: Implement getPurchaseHTML() method.
    }
}
