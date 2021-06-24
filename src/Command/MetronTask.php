<?php

namespace App\Command;

//use Illuminate\Database\Capsule\Manager as DB;
use App\Models\{ Ip, Node, User, Shop, Token, Bought, BlockIp, LoginIp, DetectLog, UnblockIp, Speedtest, RadiusBan, TrafficLog, Disconnect, EmailVerify, DetectBanLog, NodeInfoLog, NodeOnlineLog, TelegramTasks, TelegramSession, UserSubscribeLog };
use App\Services\{ Mail, Config, MetronSetting };
use App\Utils\{ GA, QQWry, Tools, Radius, Telegram, DatatablesHelper };
use Exception;
use ArrayObject;
use RuntimeException;

class MetronTask extends Command
{
    public $description = ''
        . '├─=: php xcat MetronTask [选项]' . PHP_EOL
        . '│ ├─ changeBought            - 将用户最后购买套餐设置成生效套餐 (仅首次安装主题执行一次)' . PHP_EOL;

    public function boot()
    {
        if (count($this->argv) === 2) {
            echo $this->description;
        } else {
            $methodName = $this->argv[2];
            if (method_exists($this, $methodName)) {
                $this->$methodName();
            } else {
                echo '方法不存在.' . PHP_EOL;
            }
        }
    }

    public function Reset()
    {
        /**
         * $sql = '(select a.* from bought a inner join (select userid , max(datetime) datetime from bought group by userid) b on a.userid = b.userid and a.datetime = b.datetime order by a.userid)';
         */
        if (MetronSetting::get('auto_reset_mode')=='metron'){
            $boughts = Bought::where('usedd', 1)->get();
            $bought_users = array();

            foreach ($boughts as $bought) {
                $user = User::where('id', $bought->userid)->first();        /* 获取对应的用户 */
                if ($user == null) {        /* 用户不存在删除对应的购买记录 */
                    $bought->delete();
                    continue;
                }
                $shop = Shop::where('id', $bought->shopid)->first();        /* 获取商品信息 */
                if ($shop == null) {        /* 商品不存在删除对应的购买记录 */
                    $bought->delete();
                    continue;
                }
                if ($shop->reset() != 0 && $shop->reset_value() != 0 && $shop->reset_exp() != 0) {
                    $bought_users[] = $bought->userid;
                    if ($user->class > 0 && (int) ((time() - $bought->datetime) / 86400) % $shop->reset() == 0 && (int) ((time() - $bought->datetime) / 86400) != 0) {
                        echo ('用户ID:'.$user->id.' 根据套餐ID:'.$shop->id.' 重置流量为'.$shop->reset_value().'GB'.PHP_EOL);
                        $user->transfer_enable = Tools::toGB($shop->reset_value());
                        $user->u = 0;
                        $user->d = 0;
                        $user->last_day_t = 0;
                        $user->save();
                        $user->sendMail(
                            $_ENV['appName'] . '-您的流量被重置了',
                            'news/warn.tpl',
                            [
                                'text' => '您好，根据您所订购的订单 ID:' . $bought->id . '，流量已经被重置为' . $shop->reset_value() . 'GB'
                            ],
                            [],
                            $_ENV['email_queue']
                        );
                    }
                }
            }

            $users = User::all();
            foreach ($users as $user) {
                $user->last_day_t = ($user->u + $user->d);
                $user->save();
                if (in_array($user->id, $bought_users)) {
                    continue;
                }
                if (date('d') == $user->auto_reset_day) {
                    $user->u = 0;
                    $user->d = 0;
                    $user->last_day_t = 0;
                    $user->transfer_enable = $user->auto_reset_bandwidth * 1024 * 1024 * 1024;
                    $user->save();
                    $user->sendMail(
                        $_ENV['appName'] . '-您的流量被重置了',
                        'news/warn.tpl',
                        [
                            'text' => '您好，根据管理员的设置，流量已经被重置为' . $user->auto_reset_bandwidth . 'GB'
                        ],
                        [],
                        $_ENV['email_queue']
                    );
                }
            }
        } else {
            echo ('当前套餐重置模式不是 metron' . PHP_EOL);
        }
    }

    public function changeBought()
    {
        $logfile_open = fopen(BASE_PATH . '/storage/changebought-' . date('Y-m-d H:i:s', time()) . '.log', 'wb');

        /**
         * 获取每个用户的最后购买套餐 mysql 5.7 无法分组排序,故放弃
         * $sql = Bought::orderBy('datetime','DESC');
         * $boughts = Bought::select('*')->from(DB::raw('('.$sql->toSql().') as a'))->mergeBindings($sql->getQuery())->groupBy(['userid'])->orderBy('userid','ASC')->get();
         */

        $userids = Bought::groupBy('userid')->pluck('userid');

        foreach ($userids as $userid) {
            fwrite($logfile_open, '用户ID: ' . $userid . PHP_EOL);
            echo ('用户ID: ' . $userid . PHP_EOL);
            $bought = Bought::where('userid', $userid)->orderBY('datetime', 'desc')->first();

            fwrite($logfile_open, '    生效该用户最后购买的一条套餐: ' . PHP_EOL);
            echo ('    生效该用户最后购买的一条套餐: ' . PHP_EOL);
            $shopname = Shop::where('id', $bought->shopid)->value('name');
            $bought->usedd = 1;
            if ($bought->save()) {
                fwrite($logfile_open, '        ' . $shopname . ' (ID: ' . $bought->shopid . ') 购买时间: ' . date('Y-m-d H:i:s', $bought->datetime) . PHP_EOL);
                echo ('        ' . $shopname . ' (ID: ' . $bought->shopid . ') 购买时间: ' . date('Y-m-d H:i:s', $bought->datetime) . PHP_EOL);
            } else {
                fwrite($logfile_open, '        ' . '数据库执行保存失败' . PHP_EOL);
                echo ('        ' . '数据库执行保存失败' . PHP_EOL);
            }

            fwrite($logfile_open, '    设置该用户其他套餐为失效套餐: ' . PHP_EOL);
            echo ('    设置该用户其他套餐为失效套餐: ' . PHP_EOL);
            $boughts_or = Bought::where('userid', $bought->userid)->where('datetime', '<>', $bought->datetime)->get();
            if ($boughts_or == null) {
                fwrite($logfile_open, '        无' . PHP_EOL);
                echo ('        无' . PHP_EOL);
            } else {
                foreach ($boughts_or as $bought_or) {
                    $bought_or->usedd = 0;
                    $shopname_or = Shop::where('id', $bought_or->shopid)->value('name');
                    if ($bought_or->save()) {
                        fwrite($logfile_open, '        ' . $shopname_or . ' (ID: ' . $bought_or->shopid . ') 购买时间: ' . date('Y-m-d H:i:s', $bought_or->datetime) . PHP_EOL);
                        echo ('        ' . $shopname_or . ' (ID: ' . $bought_or->shopid . ') 购买时间: ' . date('Y-m-d H:i:s', $bought_or->datetime) . PHP_EOL);
                    }

                }
            }

            fwrite($logfile_open, '-------------------------' . PHP_EOL);
            echo ('-------------------------' . PHP_EOL);
        }

        fclose($logfile_open);
        echo ('执行完毕' . PHP_EOL);
    }

}
