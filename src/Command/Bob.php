<?php


namespace App\Command;

use App\Models\Shop;
use App\Models\User;
use App\Services\Config;
use App\Services\MetronSetting;
use App\Utils\AppURI;
use App\Utils\GA;
use App\Utils\Hash;
use App\Utils\Tools;
use App\Utils\URL;
use Ramsey\Uuid\Uuid;

class Bob extends Command
{
    public $description = ''
    . '├─=: php xcat Bob' . PHP_EOL
    . '│ ├─ createUser - [数量(必填)] [名称(选填)] [密码(选填)] - 批量新增用户' . PHP_EOL
    . '│ ├─ createUuid - 批量生成UUID' . PHP_EOL
    . '│ ├─ addExpireOrFlow [等级(-1:全部用户)] [类型(1:时间 2:流量 3:余额)] [数值(天/GB/金额)] - 批量添加到期时间、流量或余额' . PHP_EOL;

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

    public function createUser()
    {
        $number = $this->argv[3];
        $name = $this->argv[4] ?? 'bob';
        $pass = $this->argv[5] ?? 12345678;
        if (!$number) {
            echo('请输入需要批量插入的数量！' . PHP_EOL);
            die();
        }
        for ($i = 1; $i <= $number; $i++) {
            $email_list = MetronSetting::get('list_of_available_mailboxes');
            $rand = rand(0, count($email_list) - 1);
            $email = $name . mt_rand(0, 999999) . $i . $email_list[$rand];
            $user = new User();
            $user->user_name = $email;
            $user->email = $email;
            $user->pass = Hash::passwordHash($pass);
            $user->passwd = Tools::genRandomChar(16);
            $user->port = Tools::getAvPort();
            $user->t = 0;
            $user->u = 0;
            $user->d = 0;
            $user->method = Config::getconfig('Register.string.defaultMethod');
            $user->protocol = Config::getconfig('Register.string.defaultProtocol');
            $user->protocol_param = Config::getconfig('Register.string.defaultProtocol_param');
            $user->obfs = Config::getconfig('Register.string.defaultObfs');
            $user->obfs_param = Config::getconfig('Register.string.defaultObfs_param');
            $user->forbidden_ip = $_ENV['reg_forbidden_ip'];
            $user->forbidden_port = $_ENV['reg_forbidden_port'];
            $user->im_type = 2;
            $user->im_value = $email;
            $user->transfer_enable = Tools::toGB((int)Config::getconfig('Register.string.defaultTraffic'));
            $user->invite_num = (int)Config::getconfig('Register.string.defaultInviteNum');
            $user->auto_reset_day = $_ENV['reg_auto_reset_day'];
            $user->auto_reset_bandwidth = $_ENV['reg_auto_reset_bandwidth'];
            $user->money = 0;
            $user->class_expire = date('Y-m-d H:i:s', time() + (int)Config::getconfig('Register.string.defaultClass_expire') * 3600);
            $user->class = (int)Config::getconfig('Register.string.defaultClass');
            $user->node_connector = (int)Config::getconfig('Register.string.defaultConn');
            $user->node_speedlimit = (int)Config::getconfig('Register.string.defaultSpeedlimit');
            $user->expire_in = date('Y-m-d H:i:s', time() + (int)Config::getconfig('Register.string.defaultExpire_in') * 86400);
            $user->reg_date = date('Y-m-d H:i:s');
            $user->reg_ip = '127.0.0.1';
            $user->plan = 'A';
            $user->theme = $_ENV['theme'];
            $user->uuid = Tools::genUUID();

            $groups = explode(',', $_ENV['random_group']);

            $user->node_group = $groups[array_rand($groups)];

            $ga = new GA();
            $secret = $ga->createSecret();

            $user->ga_token = $secret;
            $user->ga_enable = 0;
            $user->save();
            if ($number <= 20) {
                echo('已插入完成' . $i . '条数据' . PHP_EOL);
            } elseif ($number > 20 && $number == $i) {
                echo('已插入完成' . $i . '条数据' . PHP_EOL);
            } elseif ($number > 20 && $number != $i && ($i % 10 == 0)) {
                echo('已插入完成' . $i . '条数据' . PHP_EOL);
            }
        }

        echo('批量插入成功！' . PHP_EOL);
    }

    public function createUuid()
    {
        $users = User::query()->where('uuid', null)->get();
        foreach ($users as $item) {
            $item->uuid = Uuid::uuid3(Uuid::NAMESPACE_DNS, ($item->passwd) . $_ENV['key'])->toString();
            $item->save();
        }

        echo('批量生成成功！' . PHP_EOL);
    }

    public function addExpireOrFlow()
    {
        $level = $this->argv[3] ?? null;
        $type = $this->argv[4] ?? null;
        $value = $this->argv[5] ?? null;
        if (!$level || !$type || !$value) {
            echo '参数缺失.' . PHP_EOL;
            die();
        }
        $users = User::query()
            ->when($level > -1, function ($query) use ($level) {
                return $query->where('class', $level);
            })
            ->get();

        $users->each(function ($user) use ($type, $value) {
            $text = "";
            switch ($type){
                case 1:
                    $value = $value * 86400;
                    $user->class_expire = date('Y-m-d H:i:s', strtotime($user->class_expire) + $value);
                    $text = '时间';
                    $user->save();
                    break;
                case 2:
                    $value = $value * 1024 * 1024 * 1024;
                    $user->transfer_enable = $user->transfer_enable + $value;
                    $text = '流量';
                    $user->save();
                    break;
                case 3:
                    $user->money = $user->money + $value;
                    $text = '余额';
                    $user->save();
                    break;
            }
            echo "用户[{$user->email}]添加" . $text . "成功" . PHP_EOL;
        });
    }
}
