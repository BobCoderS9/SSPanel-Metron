<?php

namespace App\Metron;
session_start();

use App\Services\MetronSetting;

class MtAuth
{
    public static function Auth()
    {
        $res['ret'] = 1;
        $res['agent'] = 1;
        $res['msg'] = 'S授权有效';

        return $res;
    }
}
