<?php

namespace App\Services;

class MetronStyle
{
    public static function get($key)
    {
        global $_style;
        return $_style[$key];
    }

    public static function getPublicSetting()
    {
        global $_style;
        return $_style;
    }
}
