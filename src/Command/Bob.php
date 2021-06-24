<?php


namespace App\Command;

use App\Controllers\BobClashController;
use App\Models\Shop;
use App\Models\User;
use App\Services\Config;
use App\Services\MetronSetting;
use App\Utils\AppURI;
use App\Utils\GA;
use App\Utils\Hash;
use App\Utils\Tools;
use App\Utils\URL;

class Bob extends Command
{
    public $description = ''
    . '├─=: php xcat Bob' . PHP_EOL
    . '│ ├─ createClashYaml - 预生成配置文件' . PHP_EOL
    . '│ ├─ createUser [数量(必填)] [名称(选填)] [密码(选填)] - 批量新增用户' . PHP_EOL
    . '│ ├─ createUuid - 批量生成UUID' . PHP_EOL;

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

    public function createClashYaml()
    {
        $classs = User::query()->groupBy('class')->pluck('class');
        $config = require(BASE_PATH . '/config/.bobvpn.php');
        foreach ($classs as $class) {
            $user = User::where('class', $class)->first();
            if ($user) {
                $ssr_support = true;
                if (method_exists(URL::class, 'getNew_AllItems')) {
                    $items = URL::getNew_AllItems($user, [
                        'type' => 'all',
                        'emoji' => false,
                        'is_mu' => 1
                    ]);
                }
                $Proxys = [];
                foreach ($items as $item) {
                    $Proxy = AppURI::getClashURI($item, $ssr_support);
                    if ($Proxy !== null) {
                        $Proxys[] = $Proxy;
                    }
                }
                $file_path = BASE_PATH . "/public/bob";
                if (is_dir($file_path) || @mkdir($file_path, 0777)) ;
                $content = BobClashController::getClashConfs($user, $Proxys, $config['Clash_Profiles']['default']);
                $filename = $file_path . '/clash_' . $user->class . '.yaml';
                $myfile = fopen($filename, "w") or die("Unable to open file!");
                fwrite($myfile, $content);
                fclose($myfile);
            }
        }

        echo('订阅节点文件更新成功！' . PHP_EOL);
    }

    public function createUser()
    {
        $number = $this->argv[3];
        $name = $this->argv[4] ?? 'bob' ;
        $pass = $this->argv[5] ?? 12345678 ;
        if (!$number){
            echo ('请输入需要批量插入的数量！'. PHP_EOL);die();
        }
        for ($i = 1; $i <= $number; $i++) {
            $email_list = MetronSetting::get('list_of_available_mailboxes');
            $rand = rand(0, count($email_list) - 1);
            $email = $name . mt_rand(0, 999999) . $i . $email_list[$rand];
            $user                       = new User();
            $user->user_name            = $email;
            $user->email                = $email;
            $user->pass                 = Hash::passwordHash($pass);
            $user->passwd               = Tools::genRandomChar(16);
            $user->port                 = Tools::getAvPort();
            $user->t                    = 0;
            $user->u                    = 0;
            $user->d                    = 0;
            $user->method               = Config::getconfig('Register.string.defaultMethod');
            $user->protocol             = Config::getconfig('Register.string.defaultProtocol');
            $user->protocol_param       = Config::getconfig('Register.string.defaultProtocol_param');
            $user->obfs                 = Config::getconfig('Register.string.defaultObfs');
            $user->obfs_param           = Config::getconfig('Register.string.defaultObfs_param');
            $user->forbidden_ip         = $_ENV['reg_forbidden_ip'];
            $user->forbidden_port       = $_ENV['reg_forbidden_port'];
            $user->im_type              = 2;
            $user->im_value             = $email;
            $user->transfer_enable      = Tools::toGB((int) Config::getconfig('Register.string.defaultTraffic'));
            $user->invite_num           = (int) Config::getconfig('Register.string.defaultInviteNum');
            $user->auto_reset_day       = $_ENV['reg_auto_reset_day'];
            $user->auto_reset_bandwidth = $_ENV['reg_auto_reset_bandwidth'];
            $user->money                = 0;
            $user->class_expire         = date('Y-m-d H:i:s', time() + (int) Config::getconfig('Register.string.defaultClass_expire') * 3600);
            $user->class                = (int) Config::getconfig('Register.string.defaultClass');
            $user->node_connector       = (int) Config::getconfig('Register.string.defaultConn');
            $user->node_speedlimit      = (int) Config::getconfig('Register.string.defaultSpeedlimit');
            $user->expire_in            = date('Y-m-d H:i:s', time() + (int) Config::getconfig('Register.string.defaultExpire_in') * 86400);
            $user->reg_date             = date('Y-m-d H:i:s');
            $user->reg_ip               = '127.0.0.1';
            $user->plan                 = 'A';
            $user->theme                = $_ENV['theme'];
            $user->uuid                = Tools::genUUID();

            $groups = explode(',', $_ENV['random_group']);

            $user->node_group = $groups[array_rand($groups)];

            $ga = new GA();
            $secret = $ga->createSecret();

            $user->ga_token = $secret;
            $user->ga_enable = 0;
            $user->save();
            if ($number <= 20) {
                echo('已插入完成' . $i . '条数据' . PHP_EOL);
            } elseif($number > 20 && $number == $i) {
                echo('已插入完成' . $i . '条数据' . PHP_EOL);
            } elseif($number > 20 && $number != $i && ($i % 10 == 0) ) {
                echo('已插入完成' . $i . '条数据' . PHP_EOL);
            }
        }

        echo('批量插入成功！' . PHP_EOL);
    }

    public function createUuid()
    {
        $users = User::query()->where('uuid', null)->get();
        foreach ($users as $item){
            $item->uuid = Tools::genUUID();
            $item->save();
        }

        echo('批量生成成功！' . PHP_EOL);
    }
}
