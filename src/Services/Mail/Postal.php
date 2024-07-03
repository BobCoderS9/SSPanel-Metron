<?php

namespace App\Services\Mail;

use Postal\Client;
use Postal\Send\Message;


class Postal extends Base
{
    private $config;
    private $client;
    private $message;

    public function __construct()
    {
        $this->config = $this->getConfig();
        $this->client = new Client($this->config['host'], $this->config['key']);
        $this->message = new Message();
        $this->message->sender($this->config['sender']); # 发件邮箱
        $this->message->from($this->config['name'] . ' <' . $this->config['sender'] . '>'); # 发件人
        $this->message->replyTo($this->config['sender']);
    }

    public function getConfig()
    {
        return [
            'host' => $_ENV['postal_host'],
            'key' => $_ENV['postal_key'],
            'sender' => $_ENV['postal_sender'],
            'name' => $_ENV['postal_name']
        ];
    }

    public function send($to_address, $subject_raw, $text, $files)
    {
        $this->message->subject($subject_raw);
        $this->message->to($to_address);
        $this->message->htmlBody($text);
        foreach ($files as $file) {
            $this->message->attach(basename($file), 'text/plain', $file);
        }
        return $this->client->send->message($this->message);
    }
}
