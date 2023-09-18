<?php

namespace App\Metron;

use Exception;
use Telegram\Bot\Api;
use App\Services\MetronSetting;
use App\Models\{User, Shop, Ticket, Paylist};
use App\Utils\Telegram\TelegramTools;

class MtTelegram
{
    /**
     *  工单通知
     */
    public static function SendTicket($userid, $title, $content, $mode = 'add')
    {
        $new_ticket = Ticket::where('userid', $userid)->where('title', $title)->orderBy('id', 'desc')->first();
        $user_name = User::where('id', $userid)->value('user_name');
        if ($mode == 'update') {
            $text = '用户回复工单';
        } else if ($mode == 'add') {
            $text = 'Hi，管理员, 有新工单需要您处理';
        } else if ($mode == 'restart') {
            $text = '用户重启了工单';
        }
        $ticketId = $new_ticket->rootid === 0 ? $new_ticket->id : $new_ticket->rootid;
        $messageText = $text . ' #'. $ticketId . PHP_EOL . '------------------------------' . PHP_EOL . '用户：' . $user_name . PHP_EOL . '标题：' . $title . PHP_EOL . '内容：' . $content;
        $Keyboard = [
            [
                [
                    'text' => '回复工单 #' . $ticketId,
                    'url' => $_ENV['baseUrl'] . '/admin/ticket/' . $ticketId . '/view'
                ]
            ]
        ];

        $sendAdmins = MetronSetting::get('Telegram_Admin');
        foreach ($sendAdmins as $sendAdmin) {
            $admin_telegram_id = User::where('id', $sendAdmin)->where('is_admin', '1')->value('telegram_id');
            if ($admin_telegram_id != null) {
                self::Send($messageText, $admin_telegram_id, $Keyboard);
            }
        }
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

        $messageText = '交易提醒 - '.$pl->tradeno . PHP_EOL .
            '------------------------------' . PHP_EOL .
            '用户名：' . $user->user_name . '  #' . $user->id . PHP_EOL .
            '用户邮箱：' . $user->email . PHP_EOL .
            '交易类型：' . $type . PHP_EOL .
            '充值金额：' . $pl->total . PHP_EOL .
            '钱包余额：' . $user->money . PHP_EOL .
            '发起时间：' . date('Y-m-d H:i:s', $pl->datetime) . PHP_EOL .
            '到账时间：' . $codeq->usedatetime . PHP_EOL .
            '支付类型：' . $codeq->code;

        $sendAdmins = MetronSetting::get('Telegram_Admin');
        foreach ($sendAdmins as $sendAdmin) {
            $admin_telegram_id = User::where('id', $sendAdmin)->where('is_admin', '1')->value('telegram_id');
            if ($admin_telegram_id != null) {
                self::Send($messageText, $admin_telegram_id);
            }
        }
    }

    /**
     * 用户在TG进行充值的回调
     */
    public static function TelegramCode($user, $pl, $codeq)
    {
        if ($pl->shop == null || $user->telegram_id == null) {
            return false;
        } else {
            $shopinfo = json_decode($pl->shop, true);
            if (isset($shopinfo['telegram'])) {
                if ($shopinfo['telegram']['the'] == 'code') {
                    $type = 'Telegram 钱包充值';
                }
                $messageText = '您刚刚充值的 ' . $pl->total . ' 元 已到账，感谢使用.' . PHP_EOL;
                $messageText .= '当前钱包余额：' . $user->money . ' 元';
                self::SendPost(
                    'deleteMessage',
                    [
                        'chat_id' => $shopinfo['telegram']['ChatID'],
                        'message_id' => $shopinfo['telegram']['MessageID']
                    ]
                );
                self::Send($messageText, $user->telegram_id);
            }

        }

    }

    /**
     * deleteMessage 删除消息
     * editMessageText 编辑消息
     */
    public static function SendPost($Method, $Params)
    {

        //file_put_contents(BASE_PATH . '/storage/telegram.log', '发送：'.json_encode($Params, JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT) . PHP_EOL. PHP_EOL, FILE_APPEND);  // 记录日志
        $URL = 'https://api.telegram.org/bot' . $_ENV['telegram_token'] . '/' . $Method;
        $POSTData = json_encode($Params);
        $C = curl_init();
        curl_setopt($C, CURLOPT_URL, $URL);
        curl_setopt($C, CURLOPT_POST, 1);
        curl_setopt($C, CURLOPT_HTTPHEADER, ['Content-Type:application/json; charset=utf-8']);
        curl_setopt($C, CURLOPT_POSTFIELDS, $POSTData);
        curl_setopt($C, CURLOPT_TIMEOUT, 1);
        curl_exec($C);
        curl_close($C);
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
            'chat_id' => $chat_id,
            'text' => $messageText,
            'parse_mode' => '',
            'disable_web_page_preview' => false,
            'reply_to_message_id' => null,
            'reply_markup' => $reply_markup
        ];
        try {
            $bot->sendMessage($sendMessage);
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }
}
