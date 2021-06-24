<?php

namespace App\Metron;
session_start();

use App\Services\MetronSetting;

class MtAuth
{
    public static function Auth()
    {
        $host = isset($_SERVER['HTTP_X_FORWARDED_HOST']) ? $_SERVER['HTTP_X_FORWARDED_HOST'] : (isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : $_SERVER['SERVER_NAME'] . ($_SERVER['SERVER_PORT'] == '80' ? '' : ':' . $_SERVER['SERVER_PORT']));

        if (in_array($host, ['s.xyhy.ink','s.xyhy.xyz'])) {
            return ['ret' => 0, 'msg' => '授权验证失败，域名没被授权'];
        }

        if (time() > 1877529600) {
            return ['ret' => 0, 'msg' => '授权已过期，请从新授权'];
        }

        $res['ret'] = 1;
        $res['agent'] = 1;
        $res['msg'] = 'S授权有效';

        return $res;
    }
}
