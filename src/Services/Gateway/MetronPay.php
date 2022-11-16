<?php

namespace App\Services\Gateway;

use App\Services\{View, Auth, Config, MetronSetting};
use App\Models\{Shop, Paylist};
use Omnipay\Omnipay;

class MetronPay extends AbstractPayment
{
    public function purchase($request, $response, $args, $telegram = 0)
    {
        if ($telegram === 0) {
            $price = $request->getParam('price') ?? 0;
            $pay_type = $request->getParam('type');
            $type = isset(explode('_', $pay_type)[1]) ? explode('_', $pay_type)[1] : $request->getParam('type');
            $client = $request->getParam('client');
            $paylist_id = (int)$request->getParam('paylist_id');

            $shopinfo = array();
            $shopinfo['id'] = (int)$request->getParam('shopid');
            $shopinfo['autorenew'] = 0;
            if ($request->getParam('shopauto')) {
                $shopinfo['autorenew'] = $request->getParam('shopauto');
            }
            $shopinfo['coupon'] = '';
            if ($request->getParam('shopcoupon')) {
                $shopinfo['coupon'] = $request->getParam('shopcoupon');
            }
            $shopinfo['disableothers'] = 1;
        } else {
            $type = $telegram['type'];
            $price = $telegram['price'];
            $paylist_id = 0;
            $shopinfo = [
                'id' => 0,
                'type' => $telegram['type'],
                'telegram' => [
                    'user' => $telegram['user'],
                    'ChatID' => $telegram['ChatID'],
                    'the' => $telegram['the'],
                ],
            ];
        }

        # 不是重新支付订单 和 商店订单
        if ($paylist_id === 0 && $shopinfo['id'] === 0) {
            if ($price < MetronSetting::get('mix_amount')) {
                return json_encode(['ret' => 0, 'msg' => '充值最低金额为 ' . MetronSetting::get('mix_amount') . ' 元']);
            }
            if ($price <= 0) {
                return json_encode(['ret' => 0, 'msg' => "金额必须大于0元"]);
            }
        }

        if ($type == 'alipay') {
            # 支付宝
            $payment_system = MetronSetting::get($pay_type);
            if (MetronSetting::get('max_alipay_pay') != 'none' && MetronSetting::get('max_alipay_pay') != '' && MetronSetting::get('max_alipay_num') != 0 && $price >= MetronSetting::get('max_alipay_num')) {
                $payment_system = MetronSetting::get('max_alipay_pay');
            }
            switch ($payment_system) {
                case ('wolfpay_qr'):
                    $isqr = 'qr';
                    $wolfpay = new wolfpay();
                    $result = $wolfpay->MetronPay($type, $price, $shopinfo, $paylist_id, $isqr);
                    if ($result['errcode'] === 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'img',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('wolfpay_ur'):
                    if ($paylist_id == 0 && $price < 3) {
                        return json_encode(['ret' => 0, 'msg' => '支付系统限制金额需大于3元']);
                    }
                    $isqr = 'url';
                    $wolfpay = new wolfpay();
                    $result = $wolfpay->MetronPay($type, $price, $shopinfo, $paylist_id, $isqr);
                    if ($result['errcode'] === 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'url',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('paytaro'):
                    $paytaro = new PayTaro(Config::get('paytaro_app_secret'));
                    $result = $paytaro->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['errcode'] === 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'url',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('epay'):
                    $epay = new Epay();
                    $result = $epay->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['errcode'] === 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'url',
                            'tradeno' => $result['tradeno'],
                            'url' => $result['code']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('f2fpay'):
                    $f2fpay = new AopF2F();
                    $result = $f2fpay->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['ret'] === 1) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'qrcode',
                            'tradeno' => $result['tradeno'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['msg']
                        );
                    }
                    return json_encode($return);
                case ('stripe'):
                    $stripe = new StripePay();
                    $result = $stripe->MetronPay($type, $price, $shopinfo, $paylist_id);
                    break;
                case ('pcexpay'):
                    $pcexPay = new PcexPay();
                    $result = $pcexPay->MetronPay($type, $price, $shopinfo, $paylist_id);
                    break;
                case ('mgate'):
                    $mgate = new MGate();
                    $result = $mgate->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['errcode'] === 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'url',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('theadpay'):
                    $theadpay = new THeadPay();
                    $result = $theadpay->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['errcode'] === 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => $result['type'],
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('vmq'):
                    $vmq = new BobVmqPay();
                    $result = $vmq->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['errcode'] === 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'qrcode',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('alpha'):
                    $alpha = new AlphaPay();
                    $result = $alpha->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['errcode'] == 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'url',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                default:
                    $return = array(
                        'ret' => 0,
                        'msg' => $payment_system . ' 支付系统不支持,请联系客服'
                    );
                    return json_encode($return);
            }
            if ($result['ret'] === 1) {
                $return = [
                    'ret' => 1,
                    'msg' => '成功创建订单',
                    'type' => $result['type'],
                    'tradeno' => $result['tradeno'],
                    'url' => $result['url']
                ];
            } else {
                $return = [
                    'ret' => 0,
                    'msg' => isset($result['msg']) ? $result['msg'] : '未知错误',
                ];
            }
            return json_encode($return);

        } else if ($type == 'wxpay') {
            # 微信支付
            $payment_system = MetronSetting::get($pay_type);
            if (MetronSetting::get('max_wxpay_pay') != 'none' && MetronSetting::get('max_wxpay_pay') != '' && MetronSetting::get('max_wxpay_num') != 0 && $price >= MetronSetting::get('max_wxpay_num')) {
                $payment_system = MetronSetting::get('max_wxpay_pay');
            }
            switch ($payment_system) {
                case ('wolfpay_qr'):
                    $isqr = 'qr';
                    $wolfpay = new wolfpay();
                    $result = $wolfpay->MetronPay($type, $price, $shopinfo, $paylist_id, $isqr);
                    if ($result['errcode'] == 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'img',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('wolfpay_ur'):
                    if ($paylist_id == 0 && $price < 3) {
                        return json_encode(['ret' => 0, 'msg' => '支付系统限制金额需大于3元']);
                    }
                    $isqr = 'url';
                    $wolfpay = new wolfpay();
                    $result = $wolfpay->MetronPay($type, $price, $shopinfo, $paylist_id, $isqr);
                    if ($result['errcode'] === 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'url',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('paytaro'):
                    $paytaro = new PayTaro(Config::get('paytaro_app_secret'));
                    $result = $paytaro->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['errcode'] == 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'url',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('payjs'):
                    $payjs = new PAYJS($_ENV['payjs_key']);
                    $result = $payjs->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['ret'] === 1) {
                        $return = [
                            'ret' => 1,
                            'msg' => '成功创建订单',
                            'type' => $result['type'],
                            'tradeno' => $result['tradeno'],
                            'url' => $result['url'],
                        ];
                    } else {
                        $return = [
                            'ret' => 0,
                            'msg' => $result['msg'],
                        ];
                    }
                    return json_encode($return);
                case('stripe'):
                    $type = 'wechat';
                    $stripe = new StripePay();
                    $result = $stripe->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['ret'] === 1) {
                        $return = [
                            'ret' => 1,
                            'msg' => '成功创建订单',
                            'type' => $result['type'],
                            'tradeno' => $result['tradeno'],
                            'url' => $result['url']
                        ];
                    } else {
                        $return = [
                            'ret' => 0,
                            'msg' => $result['msg']
                        ];
                    }
                    return json_encode($return);
                case ('mgate'):
                    $mgate = new MGate();
                    $result = $mgate->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['errcode'] == 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'url',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('vmq'):
                    $vmq = new BobVmqPay();
                    $result = $vmq->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['errcode'] === 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'qrcode',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('epay'):
                    $epay = new Epay();
                    $result = $epay->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['errcode'] === 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'url',
                            'tradeno' => $result['tradeno'],
                            'url' => $result['code']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('alpha'):
                    $type = 'wechat';
                    $alpha = new AlphaPay();
                    $result = $alpha->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['errcode'] == 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'url',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                default:
                    $return = array(
                        'ret' => 0,
                        'msg' => $payment_system . ' 支付系统错误,请联系客服'
                    );
                    return json_encode($return);
            }
        } else if ($type == 'qqpay') {
            # QQ钱包
            $payment_system = MetronSetting::get('pay_qqpay');
            if (MetronSetting::get('max_qqpay_pay') != 'none' && MetronSetting::get('max_qqpay_pay') != '' && MetronSetting::get('max_qqpay_num') != 0 && $price >= MetronSetting::get('max_qqpay_num')) {
                $payment_system = MetronSetting::get('max_qqpay_pay');
            }
            switch ($payment_system) {
                case ('wolfpay_qr'):
                    $isqr = 'qr';
                    $wolfpay = new wolfpay();
                    $result = $wolfpay->MetronPay($type, $price, $shopinfo, $paylist_id, $isqr);
                    if ($result['errcode'] == 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'img',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('wolfpay_ur'):
                    if ($paylist_id == 0 && $price < 3) {
                        return json_encode(['ret' => 0, 'msg' => '支付系统限制金额需大于3元']);
                    }
                    $isqr = 'url';
                    $wolfpay = new wolfpay();
                    $result = $wolfpay->MetronPay($type, $price, $shopinfo, $paylist_id, $isqr);
                    if ($result['errcode'] === 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'url',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('alpha'):
                    $alpha = new AlphaPay();
                    $result = $alpha->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['errcode'] == 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'url',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                default:
                    $return = array(
                        'ret' => 0,
                        'msg' => $payment_system . ' 支付系统错误,请联系客服'
                    );
                    return json_encode($return);
            }
        }  else if ($type == 'crypto') {
            # 数字货币支付
            $payment_system = MetronSetting::get('pay_crypto');
            switch ($payment_system) {
                case ('bobpay'):
                    $tron = new BobTronPay();
                    $result = $tron->MetronPay($type, $price, $shopinfo, $paylist_id);
                    if ($result['errcode'] == 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'url',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                case ('alpha'):
                    $alpha = new AlphaPay();
                    $result = $alpha->MetronPay('USDT', $price, $shopinfo, $paylist_id);
                    if ($result['errcode'] == 0) {
                        $return = array(
                            'ret' => 1,
                            'type' => 'url',
                            'tradeno' => $result['pid'],
                            'url' => $result['url']
                        );
                    } else {
                        $return = array(
                            'ret' => 0,
                            'msg' => $result['errmsg']
                        );
                    }
                    return json_encode($return);
                default:
                    $return = array(
                        'ret' => 0,
                        'msg' => $payment_system . ' 支付系统错误,请联系客服'
                    );
                    return json_encode($return);
            }
        } else {
            return json_encode(['ret' => 0, 'msg' => '错误的支付方式']);
        }
    }

    public function telegram($info)
    {
        $res = [
            'ret' => 1,
            'msg' => '测试'
        ];
        return json_encode($res);
    }

    public function notify($request, $response, $args)
    {
        $path = $request->getUri()->getPath();
        file_put_contents(BASE_PATH . '/storage/pay.log', json_encode(file_get_contents("php://input")) . "\r\n", FILE_APPEND);
        $path_exploded = explode('/', $path);
        $payment_system = $path_exploded[3];

        switch ($payment_system) {
            case ('vmq'):
                $vmq = new BobVmqPay();
                $vmq->notify($request, $response, $args);
                return;
            case ('wolfpay'):
                $wolfpay_notify = new wolfpay();
                $wolfpay_notify->notify($request, $response, $args);
                return;
            case ('paytaro'):
                $paytaro = new PayTaro(Config::get('paytaro_app_secret'));
                if (!$paytaro->verify($request->getParams(), $request->getParam('sign'))) {
                    die('FAIL');
                }
                $done = $this->postPayment($request->getParam('out_trade_no'), 'PayTaro');
                die('SUCCESS');
                return;
            case ('epay'):
                $epay = new Epay();
                $epay->notify($request, $response, $args);
                return;
            case ('f2fpay'):
                $gateway = Omnipay::create('Alipay_AopF2F');
                $gateway->setSignType('RSA2'); //RSA/RSA2
                $gateway->setAppId($_ENV['f2fpay_app_id']);
                $gateway->setPrivateKey($_ENV['merchant_private_key']); // 可以是路径，也可以是密钥内容
                $gateway->setAlipayPublicKey($_ENV['alipay_public_key']); // 可以是路径，也可以是密钥内容
                $notifyUrl = $_ENV['f2fNotifyUrl'] ?? ($_ENV['baseUrl'] . '/payment/notify/f2fpay');
                $gateway->setNotifyUrl($notifyUrl);

                $aliRequest = $gateway->completePurchase();
                $aliRequest->setParams($_POST);

                try {
                    /** @var \Omnipay\Alipay\Responses\AopCompletePurchaseResponse $response */
                    $aliResponse = $aliRequest->send();
                    $pid = $aliResponse->data('out_trade_no');
                    if ($aliResponse->isPaid()) {
                        $this->postPayment($pid, '支付宝' . $pid);
                        die('success'); //The response should be 'success' only
                    }
                } catch (Exception $e) {
                    die('fail');
                }
                return;
            case ('payjs'):
                $payjs = new PAYJS($_ENV['payjs_key']);
                $payjs->notify($request, $response, $args);
                return;
            case ('stripe'):
                \Stripe\Stripe::setApiKey($_ENV['stripe_key']);
                $endpoint_secret = $_ENV['stripe_webhook'];
                $payload = @file_get_contents('php://input');
                $sig_header = $_SERVER['HTTP_STRIPE_SIGNATURE'];
                $event = null;
                try {
                    $event = \Stripe\Webhook::constructEvent(
                        $payload,
                        $sig_header,
                        $endpoint_secret
                    );
                } catch (\UnexpectedValueException $e) {
                    http_response_code(400);
                    exit();
                } catch (\Stripe\Error\SignatureVerification $e) {
                    http_response_code(400);
                    exit();
                }
                switch ($event->type) {
                    case 'source.chargeable':
                        $source = $event->data->object;
                        $charge = \Stripe\Charge::create([
                            'amount' => $source['amount'],
                            'currency' => $source['currency'],
                            'source' => $source['id'],
                        ]);
                        if ($charge['status'] == 'succeeded') {
                            $type = null;
                            if ($source['type'] == 'alipay') {
                                $type = '支付宝';
                            } else if ($source['type'] == 'wechat') {
                                $type = '微信支付';
                            }
                            $order = Paylist::where('tradeno', '=', $source['id'])->first();
                            if ($order->status !== 1) {
                                $this->postPayment($source['id'], 'Stripe ' . $type);
                                echo 'SUCCESS';
                            } else {
                                echo 'ERROR';
                            }
                        }
                        break;
                    default:
                        http_response_code(400);
                        exit();
                }
                return http_response_code(200);
            case ('pcexpay'):
                $pcexpay = new PcexPay();
                $pcexpay->notify($request, $response, $args);
                return;
            case ('mgate'):
                $mgate = new MGate();
                $mgate->notify($request, $response, $args);
                return;
            case ('theadpay'):
                $notify = new THeadPay();
                $notify->notify($request, $response, $args);
                return;
            case ('bobpay'):
                $tron = new BobTronPay();
                $tron->notify($request, $response, $args);
                return;
            case ('alpha'):
                $tron = new AlphaPay();
                $tron->notify($request, $response, $args);
                return;
            default:
                return 'failed';
        }
    }

    public function getPurchaseHTML()
    {
        return 1;
    }

    public function getReturnHTML($request, $response, $args)
    {
        $tradeno = $_GET['tradeno'];
        if ($tradeno == '' || $tradeno == null) {
            $tradeno = $_GET['source'];
        }
        if ($tradeno == '' || $tradeno == null) {
            $tradeno = $_GET['out_trade_no'];
        }
        $result = array();
        $p = Paylist::where('tradeno', '=', $tradeno)->first();        # 获取对应的充值记录
        if ($p->status === 1) {      # 充值已完成
            $result['status'] = 1;
            # 记录中商品字段存在
            if ($p->shop) {
                $shopinfo = json_decode($p->shop, true);                                        # shop 字段转数组
                if ($shopinfo['id'] != 0) {
                    $shop = Shop::where('id', $shopinfo['id'])->where('status', 1)->first();    # 提取对应的商品信息
                    if (isset($shopinfo['status']) && $shopinfo['status'] === 1) {                                                 # 要购买的商品状态为1 (已购买)
                        $result['shop_status'] = 1;
                    } else if (!isset($shopinfo['status']) || $shopinfo['status'] === null) {
                        $result['shop_status'] = 0;
                    } else {
                        $result['shop_status'] = $shopinfo['status'];
                    }
                    $result['shop_name'] = $shop->name;
                } else {
                    $result['money'] = $p->total;
                }
            } else {
                $result['money'] = $p->total;
            }
        } else {        /* 充值没有完成 */
            $result['status'] = 0;
        }
        return View::getSmarty()->assign('result', $result)->fetch('user/pay_success.tpl');
    }

    public function getStatus($request, $response, $args)
    {
        $p = Paylist::where('tradeno', $_POST['tradeno'])->first();

        $return['ret'] = 1;
        $return['result'] = $p->status;

        if (isset($_POST['checkshop']) && $_POST['checkshop']) {
            $shopinfo = json_decode($p['shop'], true);
            if ($shopinfo['status'] == 1) {
                $return['buyshop'] = 1;
            } else {
                $return['buyshop'] = 0;
            }
        }

        return json_encode($return);
    }
}
