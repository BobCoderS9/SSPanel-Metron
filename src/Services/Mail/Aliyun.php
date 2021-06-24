<?php


namespace App\Services\Mail;

class Aliyun extends Base
{
    public function __construct()
    {
    }

    public function send($to, $subject, $text, $files)
    {
        return AliyunDM::sendtouser($to, $subject, $text);
    }
}
