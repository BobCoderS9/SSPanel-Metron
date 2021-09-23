<?php

namespace App\Utils\Telegram;

use Telegram\Bot\Api;
use Exception;

class Process
{
    public static function index()
    {
        try {
            $bot = new Api($_ENV['telegram_token']);
            $bot->addCommands(
                [
                    Commands\MyCommand::class,
                    Commands\HelpCommand::class,
                    Commands\InfoCommand::class,
                    Commands\MenuCommand::class,
                    Commands\PingCommand::class,
                    Commands\StartCommand::class,
                    Commands\UnbindCommand::class,
                    Commands\CheckinCommand::class,
                    Commands\SetuserCommand::class,
                ]
            );
            $update = $bot->commandsHandler(true);
            $Message = $update->getMessage();
//            file_put_contents(BASE_PATH . '/storage/telegram.log', json_encode(file_get_contents("php://input")) . "\r\n", FILE_APPEND);
            if ($Message && $Message->getReplyToMessage() != null) {
                if (preg_match("/[#](.*)/", $Message->getReplyToMessage()->getText(), $match)) {
                    new Callbacks\ReplayTicket($bot, $Message, $match[1]);
                }
            } else if ($update->getCallbackQuery() !== null) {
                new Callbacks\Callback($bot, $update->getCallbackQuery());
            } else if ($Message !== null) {
                new Message($bot, $update->getMessage());
            }
        } catch (Exception $e) {
            $e->getMessage();
        }
    }
}
