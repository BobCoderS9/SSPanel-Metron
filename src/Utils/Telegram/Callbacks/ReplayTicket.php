<?php


namespace App\Utils\Telegram\Callbacks;


use App\Metron\MtTelegram;
use App\Models\Ticket;
use App\Models\User;
use voku\helper\AntiXSS;

class ReplayTicket
{
    /**
     * Bot
     */
    protected $bot;

    /**
     * 触发用户
     */
    protected $User;

    /**
     * 触发用户TG信息
     */
    protected $triggerUser;

    /**
     * 回调
     */
    protected $Callback;

    /**
     * 消息会话 ID
     */
    protected $ChatID;

    /**
     * 触发源信息 ID
     */
    protected $MessageID;

    /**
     * 工单ID
     */
    protected $TickedId;

    /**
     * @param \Telegram\Bot\Api $bot
     * @param \Telegram\Bot\Objects\Message $Message
     * @param $ticketId
     */
    public function __construct($bot, $Message, $ticketId)
    {
        $this->bot              = $bot;
        $this->triggerUser      = [
            'id'       => $Message->getFrom()->getId(),
            'name'     => $Message->getFrom()->getFirstName() . ' ' . $Message->getFrom()->getLastName(),
            'username' => $Message->getFrom()->getUsername(),
        ];
        $AdminUser = User::where('is_admin', 1)->where('telegram_id', $Message->getFrom()->getId())->first();
        $this->User             = $AdminUser;
        $this->ChatID           = $Message->getChat()->getId();
        $this->Callback         = $Message;
        $this->MessageID        = $Message->getMessageId();
        $this->TickedId         = $ticketId;

        if ($this->ChatID < 0 && $_ENV['telegram_group_quiet'] === true) {
            // 群组中不回应
            return;
        }
        // 如果不是管理员
        if (!$AdminUser){
            return;
        }
        if ($ticketId){
            $ticket_main = Ticket::where('id', $ticketId)->where('rootid', 0)->first();
            $content = $Message->getText();
            $antiXss              = new AntiXSS();
            $ticket               = new Ticket();
            $ticket->title        = $antiXss->xss_clean($ticket_main->title);
            $ticket->content      = $antiXss->xss_clean($content);
            $ticket->rootid       = $ticket_main->id;
            $ticket->userid       = $AdminUser->id;
            $ticket->datetime     = time();
            $ticket_main->status  = 1;
            $ticket_main->save();
            $ticket->save();
            MtTelegram::Send("# {$ticketId} 的工单已回复成功", $this->ChatID);
        }
    }
}
