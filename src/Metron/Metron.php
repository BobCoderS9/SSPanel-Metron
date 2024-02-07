<?php

namespace App\Metron;

use App\Services\MetronSetting;
use App\Models\{Link, Code, Node, Shop, User, Bought, Coupon, Ticket, Paylist, Payback};
use App\Utils\QQWry;

class Metron
{
    /**
     * SSR 节点单独配置生成单端口用户
     */
    public static function node_Config($userDiff, $node)
    {
        $userDiff->id += 1;
        $userDiff->is_multi_user = 2;
        $userDiff->disconnect_ip = null;
        $userDiff->forbidden_port = ""; //25,26,465,587
        $userDiff->forbidden_ip = ""; //127.0.0.0/8,::1/128
        $userDiff->obfs_param = "";
        $userDiff->obfs = $node->obfs;
        $userDiff->protocol_param = "";
        $userDiff->protocol = $node->protocol;
        $userDiff->node_speedlimit = 0;
        $userDiff->method = $node->method;
        $userDiff->port = $node->port;
        $userDiff->u = 0;
        $userDiff->d = 0;
        $userDiff->passwd = $node->passwd;
        $userDiff->email = "单端口用户";
        return $userDiff;
    }

    /**
     * 处理用户其他购买套餐 usedd
     */
    public static function bought_usedd($user, $key, $to)
    {
        $used = Bought::where('userid', $user->id)->where('usedd', $key)->get();
        foreach ($used as $use_del) {
            $use_del->usedd = $to;
            $use_del->save();
        }
        return 0;
    }

    /**
     *  获取商品信息
     *  price           价格
     *
     *  bandwidth       流量GB
     *  expire          账号有效期
     *  class           等级
     *  class_expire    等级有效期天数
     *  reset           每多少天重置
     *  reset_exp       多少天内重置
     *  reset_value     重置流量为多少 G
     *  speedlimit      端口限速
     *  connector       IP限制
     *
     *  traffic_package{
     *      class {
     *          min,
     *          max,
     *      }
     * }
     */
    public function getShopInfo($shopid)
    {
        $shop = Shop::find($shopid);

        if ($shop === null) {
            return 0;
        }

        $shopinfo = json_decode($shop->content, true);
        $shopinfo['name'] = $shop->name;
        $shopinfo['price'] = $shop->price;
        return $shopinfo;
    }

    /**
     * 计算套餐返还的信息
     */
    public function getConversionInfo($user, $bought)
    {
        $shopinfo = $this->getShopInfo($bought->shopid);
        $code = Code::where('code', '#'.$bought->id.' - 套餐折算')->value('id');
        if ($code != null) {
            $res = ['ret' => 2, 'msg' => '该套餐已折算过'];
            return $res;
        }

        if (isset($shopinfo['traffic_package'])) {  /* 是流量包 */
            # 流量包仅当天可退
            if (time() >= strtotime(date('Y-m-d', $bought->datetime))+86400) {
                $res = ['ret' => 0, 'msg' => '流量包仅购买当天可折算'];
                return $res;
            }
            # 用掉流量
            $shopflow = $shopinfo['bandwidth'] * 1024 *1024 *1024;      // 套餐流量
            $usedflow = ($user->transfer_enable - ($user->u + $user->d) >= $shopflow ? 0 : ($user->transfer_enable - ($user->u + $user->d) <= 0 ? $shopflow : $shopflow - ($user->transfer_enable - ($user->u + $user->d))));             // 用掉的流量
            $band_bi = round( $usedflow / $shopflow * 100, 2);          // 用掉的百分比
            /* 折算比例 */
            $ratio = [
                'name' => '流量包',
                'type' => '使用流量',
                'ppt'  => bcsub(100, $band_bi, 2),
                'time' => [
                    'used' => 0,
                    'used_gs' => 0,
                ],
                'flow' => [
                    'used' => $shopflow - $usedflow,
                    'used_gb' => ($shopflow - $usedflow) /1024/1024/1024,
                ],
            ];
        } else {                                    /* 是常规套餐 */
            if ($bought->usedd === 0 ){
                $res = ['ret' => 0, 'msg' => '该套餐已失效, 不能折算余额'];
                return $res;
            }
            /* 用户等级和套餐的不一样, 可能被管理修改过 */
            if ( $shopinfo['class'] != $user->class) {
                $res = ['ret' => 0, 'msg' => '您的等级和套餐等级不符,请联系管理处理'];
                return $res;
            }

            # 1. 用掉时间
            $shoptime = $shopinfo['class_expire'] * 86400;              // 商品等级时长
            $usedtime = time() - $bought->datetime;                     // 用了多久
            $usertime = strtotime($user->class_expire) - time();        // 用户剩余时长
            if ($usedtime >= $shoptime) {
                $res = ['ret' => 0, 'msg' => '该套餐已过期, 无法折算'];
                return $res;
            }
            if ($usertime < $shoptime - $usedtime) {
                $res = ['ret' => 0, 'msg' => '会员时长异常无法折算'];
                return $res;
            }
            $time_bi = round( $usedtime / $shoptime * 100, 2);          // 用掉的百分比

            # 2. 用掉流量
            $user_transfer = $user->transfer_enable - ($user->u + $user->d);    # 用户当前剩余的流量
            $shop_bandwidth     = $shopinfo['bandwidth']*1024*1024*1024;        # 套餐首月流量

            if ($shopinfo['reset'] != 0 && $shopinfo['reset_value'] != 0 && $shopinfo['reset_exp'] != 0) {
                $is_reset = 1;
                # 套餐有重置属性
                $day_flow           = ($shopinfo['reset_value']*1024*1024*1024) / $shopinfo['reset'];                               # 计算商品单日流量值
                $reset_cycle        = floor($shopinfo['class_expire'] / $shopinfo['reset']);                # 计算商品有多少个重置周期 (去除小数位)
                $used_cycle         = floor($usedtime / ($shopinfo['reset']*86400));                        # 计算使用了多少个周期 (去除小数位)
                $shop_reset_value   = $shopinfo['reset_value']*1024*1024*1024;                                                      # 套餐周期流量
                $shop_transfer      = ($reset_cycle <= 1 ? $shop_bandwidth : ($reset_cycle-1)*$shop_reset_value+$shop_bandwidth);   # 套餐总流量

                if ($used_cycle <= 0){
                    # 第一个重置周期
                    $usedflow    = ($user_transfer >= $shop_bandwidth ? 0 : ($user_transfer <= 0 ? $shop_bandwidth : $shop_bandwidth - $user_transfer));
                    $kouchu_flow = $shop_bandwidth - $usedflow;                 # 扣除流量
                } elseif ($used_cycle > 0) {
                    # 过了一个周期
                    $cycle_flow  = ($user_transfer >= $shop_reset_value ? 0 : ($user_transfer <= 0 ? $shop_reset_value : $shop_reset_value - $user_transfer));   # 当前周期使用了流量
                    $usedflow    = ($used_cycle === 1 ? $usedflow+$shop_bandwidth : ($used_cycle-1)*$shop_reset_value+$shop_bandwidth);                          # 所有周期使用了流量
                    $kouchu_flow = $shop_reset_value - $cycle_flow;               # 扣除流量
                }
                $band_bi = round( $usedflow / $shop_transfer * 100, 2);         # 用掉的百分比
            } else {
                $is_reset = 0;
                # 套餐没有重置属性
                $shop_transfer  = $shopinfo['bandwidth']*1024*1024*1024;
                $usedflow       = ($user_transfer >= $shop_transfer ? 0 : ($user_transfer <= 0 ? $shop_transfer : $shop_transfer - $user_transfer));             // 用掉的流量
                $kouchu_flow    = $shop_bandwidth - $usedflow;                  # 扣除流量
                $band_bi        = round( $usedflow / $shop_transfer * 100, 2);  # 用掉的百分比
            }

            # 折算模式
            $mode = MetronSetting::get('shop_conversion_mode');
            if ($mode=='auto') {
                $mode_type = ($time_bi*100 >= $band_bi*100 ? '使用时长' : '使用流量');
                $mode_ppt = bcsub(100, ( $time_bi*100 >= $band_bi*100 ? $time_bi : $band_bi ), 2);    # 剩余百分比
            } else if ($mode=='time') {
                $mode_type = '使用时长';
                $mode_ppt = bcsub(100, $time_bi, 2);
            } else if ($mode=='flow') {
                $mode_type = '使用流量';
                $mode_ppt = bcsub(100, $band_bi, 2);
            }
            $ratio = [
                'name'  => '常规套餐',
                'type'  => $mode_type,   # 计算模式
                'ppt'   => $mode_ppt,    # 剩余百分比
                'reset' => [
                    'is_reset'      => $is_reset,
                    'reset_cycle'   => ($used_cycle ? : 0),
                    'used_cycle'    => ($used_cycle?:0),
                ],
                'time'  => [
                    'used'          => $shoptime - $usedtime,
                    'used_gs'       => round(($shoptime - $usedtime)/86400, 2),
                ],
                'flow'  => [
                    'used'          => $kouchu_flow,
                    'used_gb'       => round($kouchu_flow/1024/1024/1024, 2),
                ],
                'used_bi'    => [
                    'time'          => $time_bi,
                    'band'          => $band_bi
                ],
            ];
        }

        /* 返还金额 */
        $money_a = bcmul($bought->price, $ratio['ppt'] / 100, 2);
        /* 手续费比例 */
        $hdpr = MetronSetting::get('shop_formalities');
        /* 手续费金额 */
        $hdfe = $hdpr > 0 ? bcmul($money_a, bcdiv($hdpr, 100, 10), 2) : 0;

        $res = [
            'ret'       => 1,
            'ratio'     => $ratio,
            'name'      => $shopinfo['name'],           # 商品名称
            'money_a'   => $money_a,                    # 返还金额
            'hdpr'      => $hdpr,                       # 手续费率
            'hdfe'      => $hdfe,                       # 手续费
            'money'     => bcsub($money_a, $hdfe, 2),   # 实际返还
        ];
        return $res;
    }

    /**
     *  开始返还操作
     */
    public function PackageConversion_OK($user, $bought)
    {
        $info = $this->getConversionInfo($user, $bought);
        if ($info['ret'] !== 1) {
            return $info;
        }
        /* 增加 Code 表 */
        $codeq = new Code();
        $codeq->code = '#' . $bought->id . ' - 套餐折算';
        $codeq->isused = 1;
        $codeq->type = 2;
        $codeq->number = $info['money'];
        $codeq->usedatetime = date('Y-m-d H:i:s');
        $codeq->userid = $user->id;
        if (!$codeq->save()) {
            $res = ['ret' => 0, 'msg' => '创建记录失败'];
            return $res;
        }
        /* 处理 Bought 表 */
        $bought->renew = 0;
        $bought->usedd = 0; // 取消生效
        $bought->save();

        /* 处理 User */
        $user->money            = bcadd($user->money, $info['money'], 2);
        $shengyu                = $user->transfer_enable - ($user->u + $user->d);
        $user->transfer_enable  = $user->transfer_enable - $info['ratio']['flow']['used'] - ($user->u + $user->d);
        if ($user->transfer_enable < 2*1024*1024*1024){
            $user->transfer_enable = 2*1024*1024*1024;
        }
        $user->u = 0;
        $user->d = 0;
        $user->last_day_t = 0;
        if ($info['ratio']['name'] == '常规套餐') {
            $user->class_expire = date('Y-m-d H:i:s', (strtotime($user->class_expire) - $info['ratio']['time']['used']));
            if ( (int) strtotime($user->class_expire) <= time()) {
                $user->class = 0;
            }
        }
        if ($user->save()) {
            $res = ['ret' => 1, 'msg' => $info['money'] . '元已返至余额' . PHP_EOL . '并扣除等级时长' . $info['ratio']['time']['used_gs'] . '天、' . $info['ratio']['flow']['used_gb'] . 'GB流量'];
            return $res;
        }
    }

    /**
     *  提前重置流量 计算信息
     */
    public function getAdvanceResetFlow($user)
    {
        $bought = Bought::where('userid', $user->id)->where('usedd', 1)->first();
        if ($bought == null) {
            return ['ret' => 0, 'msg' => '您没有有效套餐'];
        }

        /* 套餐是否有重置属性 */
        $shopinfo = $this->getShopInfo($bought->shopid);
        if ($shopinfo['reset']==0 || $shopinfo['reset_exp']==0 || $shopinfo['reset_value']==0) {
            return ['ret' => 0, 'msg' => '您的套餐没有流量重置属性'];
        }

        $next_restart = strtotime($user->valid_use_loop());     // 下次重置的Unix时间
        $time = $next_restart - time();     // 距离重置还有多久
        if ($time > $shopinfo['reset']*86400) {
            $time = $shopinfo['reset']*86400;
        }
        if ((int) strtotime($user->class_expire) - time() < $time) {
            return ['ret' => 0, 'msg' => '您剩余的会员时长已经低于重置周期'];
        }
        $bi = round($time / ($shopinfo['reset']*86400), 10);
        $add_flow = bcmul($shopinfo['reset_value']*1024*1024*1024, $bi);

        $res = [
            'ret' => 1,
            'info' => [
                'bi' => $bi,
                'sub_time' => $time,
                'sub_time_day' => round($time/86400, 2),
                'add_flow' => $add_flow,
                'add_flow_gib' => round($add_flow/1024/1024/1024, 2),
            ],
        ];
        return $res;
    }

    /**
     *  执行提前重置流量
     */
    public function setAdvanceResetFlow($user)
    {
        $info = $this->getAdvanceResetFlow($user);

        $user->transfer_enable += $info['info']['add_flow'];
        $user->class_expire = date('Y-m-d H:i:s', (strtotime($user->class_expire) - $info['info']['sub_time']));

        if ($user->save()){
            return ['ret' => 1, 'msg' => '您获得了 ' . $info['info']['add_flow_gib'] . 'GB流量, 减少了 ' . $info['info']['sub_time_day'] . '天会员时长'];
        }
    }

    /**
     * 使用 MetronPay 聚合支付时, 商店购买套餐支付回调后自动购买套餐函数
     */
    public static function metronpay_buyshop($pid=0)
    {
        $ps            = Paylist::where('tradeno', $pid)->first();
        $shopinfo      = json_decode($ps->shop, true);
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
        $shop          = $shopinfo['id'];
        $coupon        = isset($shopinfo['coupon']) ? $shopinfo['coupon'] : '';
        $coupon        = trim($coupon);
        $code          = $coupon;
        $disableothers = $shopinfo['disableothers'];
        $autorenew     = isset($shopinfo['autorenew']) ? $shopinfo['autorenew'] : 0;
        $user          = User::find($ps->userid);
        $shop          = Shop::where('id', $shop)->where('status', 1)->first();

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
            $res['msg'] = '余额不足，总价为' . $price . '元; 您的余额为'.$user->money.'元';

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

        Metron::bought_usedd($user, 1, 0);
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
        $bought->price = $price;
        $bought->usedd  = 1;
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
     *  获取用户节点筛选规则
     */
    public static function getNodeFilter($token=null, $user=null)
    {
        if ($token) {
            $link = Link::where('type', 11)->where('token', $token)->first();
        }else if ($user) {
            $link = Link::where('type', 11)->where('userid', $user->id)->first();
        }

        return $link->filter != null ? json_decode($link->filter, true) : false;
    }

    /**
     * 限制地区访问
     */
    public static function Restricted_access()
    {
        # 排除路径
        $parms = MetronSetting::get('Restricted_parm');
        foreach ($parms as $parm) {
            if ( strstr($_SERVER["REQUEST_URI"], $parm) ) {
                $diqu = [
                    'ok'    => true,
                    'info'  => [
                        'ip'    => $_SERVER['REMOTE_ADDR'],
                    ],
                ];
                return $diqu;
            }
        }

        # 限制地区
        $iplocation = new QQWry();
        $location = $iplocation->getlocation($_SERVER['REMOTE_ADDR']);
        $area = iconv('gbk', 'utf-8//IGNORE', $location['country'] . $location['area']);
        $diqu = [
            'ok'    => true,
            'info'  => [
                'ip'    => $_SERVER['REMOTE_ADDR'],
                'addr'  => $area,
            ],
            'match' => false
        ];
        $zh_CN = MetronSetting::get('Restricted_area');
        foreach ($zh_CN as $cn) {
            if ( strstr($area, $cn) ) {
                $diqu['ok']     = false;
                $diqu['match']  = $cn;
                return $diqu;
            }
        }
        return $diqu;
    }

    /**
     * 返利
     * $form_user  邀请人
     * $to_user    被邀请人
     */
    public static function add_payback($form_user, $to_user, $price)
    {
        $check_gift = Payback::where('userid', '=', $to_user->id)->where('ref_by', '=', $form_user->id)->first();

        # 返利比例不为 0
        if ($form_user->rebate !== 0) {
            # 如果用户循环返利 || 用户不是循环循环 和 config 所有用户循环 || 用户不是循环 和 是第一次返利
            if ( ($form_user->c_rebate === 1) || ($form_user->c_rebate === 0 && MetronSetting::get('c_rebate') === true) || ($form_user->c_rebate === 0 && $check_gift == null) ) {
                # 如果用户比例 大于 0
                if ($form_user->rebate > 0) {
                    $ref_money = bcmul($price, ($form_user->rebate/100), 2);
                # 如果用户比例小于 0
                } else if ($form_user->rebate < 0) {
                    $ref_money = bcmul($price, ($_ENV['code_payback']/100), 2);
                }
                $form_user->back_money += $ref_money;
                $form_user->save();

                $Payback = new Payback();
                $Payback->total = $price;
                $Payback->userid = $to_user->id;
                $Payback->ref_by = $form_user->id;
                $Payback->ref_get = $ref_money;
                $Payback->datetime = time();
                $Payback->save();
            }
        }
    }

    public static function recharge($pay, $user)
    {
        $shop  = json_decode($pay->shop, true);
        $config = MetronSetting::get('recharge_shop');
        if ($config['type'] == 1) {
            $shop_flow_ids = array_keys($config['shop_flow']);
            if (in_array($shop['id'], $shop_flow_ids)){
                $flow = $config['shop_flow'][$shop['id']];
                $user->transfer_enable += $flow * 1024 * 1024 * 1024;
            }
        } elseif ($config['type'] == 2) {
            $shop_time_ids = array_keys($config['shop_time']);
            if (in_array($shop['id'], $shop_time_ids)){
                $day = $config['shop_time'][$shop['id']];
                $user->class_expire = date('Y-m-d H:i:s', strtotime($user->class_expire) + $day * 86400);
            }
        } elseif ($config['type'] == 3) {
            $shop_flow_ids = array_keys($config['shop_flow']);
            if (in_array($shop['id'], $shop_flow_ids)){
                $flow = $config['shop_flow'][$shop['id']];
                $user->transfer_enable += $flow * 1024 * 1024 * 1024;
            }
            $shop_time_ids = array_keys($config['shop_time']);
            if (in_array($shop['id'], $shop_time_ids)){
                $day = $config['shop_time'][$shop['id']];
                $user->class_expire = date('Y-m-d H:i:s', strtotime($user->class_expire) + $day * 86400);
            }
        }
        $user->save();
    }
}
