<?php

namespace App\Services;

class MetronSetting
{
    public static function get($key)
    {
        global $_MT;
        return $_MT[$key];
    }

    public static function getPublicSetting()
    {
        global $_MT;
        return $_MT;
    }
}
