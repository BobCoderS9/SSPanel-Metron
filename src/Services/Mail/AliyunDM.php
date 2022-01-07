<?php

namespace App\Services\Mail;

require_once('aliyun-php-sdk/aliyun-php-sdk-core/Config.php');

use Dm\Request\V20151123 as Dm;
use App\Services\Mail;

class AliyunDM
{
    public static function sendtouser($to, $subject, $text)
    {
        //需要设置对应的region名称，如华东1（杭州）设为cn-hangzhou，新加坡Region设为ap-southeast-1，澳洲Region设为ap-southeast-2。
        $iClientProfile = \DefaultProfile::getProfile($_ENV['aliyun_RegionId'], $_ENV['aliyun_accessKey'], $_ENV['aliyun_accessSecret']);
        //新加坡或澳洲region需要设置服务器地址，华东1（杭州）不需要设置。
        $iClientProfile::addEndpoint($_ENV['aliyun_endpointName'], $_ENV['aliyun_RegionId'], 'Dm', $_ENV['aliyun_Host']);
        $client = new \DefaultAcsClient($iClientProfile);
        $request = new Dm\SingleSendMailRequest();
        //新加坡或澳洲region需要设置SDK的版本，华东1（杭州）不需要设置。
        $request->setVersion($_ENV['aliyun_Version']);
        $request->setAccountName($_ENV['aliyun_AccountName']);
        $request->setFromAlias($_ENV['aliyun_FromAlias']);
        $request->setAddressType(1);
        if ($_ENV['aliyun_TagName'] != '') {
            $request->setTagName($_ENV['aliyun_TagName']);
        }
        $request->setReplyToAddress($_ENV['aliyun_ReplyToAddress']);
        $request->setToAddress($to);
        //可以给多个收件人发送邮件，收件人之间用逗号分开,若调用模板批量发信建议使用BatchSendMailRequest方式
        $request->setSubject($subject);
        $request->setHtmlBody($text);
        try {
            $response = $client->getAcsResponse($request);
            return true;
        } catch (\ClientException  $e) {
            return false;
        } catch (\ServerException  $e) {
            return false;
        }
    }

    public static function send($to, $subject, $template, $ary = [])
    {
        $text = Mail::genHtml($template, $ary);
        return self::sendtouser($to, $subject, $text);
    }
}
