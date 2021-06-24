<?php


namespace App\Command;


use App\Models\Node;
use App\Models\User;
use App\Services\Config;
use App\Utils\Telegram;
use App\Utils\URL;
use TelegramBot\Api\BotApi;

class DetectTransfer extends Command
{
    public $description = '├─=: php xcat DetectTransfer      - 中转掉线检测定时任务' . PHP_EOL;

    public function boot()
    {
        //节点被墙检测
        $last_time = file_get_contents(BASE_PATH . '/storage/last_detect_transfer_gfw_time');
        $file_interval = fopen(BASE_PATH . '/storage/last_detect_transfer_gfw_time', 'wb');
        fwrite($file_interval, time());
        fclose($file_interval);
        $nodes = Node::where('type', 1)->whereIn('sort', [0, 10, 11, 12, 13, 14, 15])->get();
        $user = User::where('is_admin', '=', '1')->whereNotNull('telegram_id')->first();
        foreach ($nodes as $node) {
            if (time() - $last_time >= $_ENV['detect_gfw_interval']) {
                $server = explode(';', $node->server);
                $item = URL::parse_args($server[5]);
                if (isset($item['outside_port']) && isset($item['server'])) {
                    $res = $this->check($item['server'], $item['outside_port']);
                    if (!$res) {
                        echo 'Send gfw mail to user: ' . $user->id . PHP_EOL;
                        $user->sendMail(
                            $_ENV['appName'] . '-系统警告',
                            'news/warn.tpl',
                            [
                                'text' => '管理员您好，系统发现中转服务器 ' . $item['server'] . ':' . $item['outside_port'] . ' 挂了，请您及时处理。'
                            ],
                            []
                        );
                        $notice_text = '管理员您好，系统发现中转服务器 IP[' . $item['server'] . ']，端口[' . $item['outside_port'] . '] 挂了，请您及时处理。';
                        try {
                            Telegram::Send($notice_text, $user->telegram_id);
                        } catch (\Exception $exception) {

                        }
                    }
                }
            }
        }
    }

    public function check($ip, $port)
    {
        $connection = @fsockopen($ip, $port, $errno, $errstr, 2);
        echo is_resource($connection);
        if (is_resource($connection)) {
            echo $ip . ':' . $port . ' ' . '(' . getservbyport($port, 'tcp') . ') is open.' . PHP_EOL;
            fclose($connection);
            $status = true;
        } else {
            $status = false;
            echo $ip . ':' . $port . ' is not responding.' . PHP_EOL;
        }

        return $status;
    }
}
