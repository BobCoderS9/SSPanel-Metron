<?php

namespace App\Controllers\Api;

use App\Services\Auth\{Redis, Cookie, JwtToken};
use App\Controllers\Api\Token\{DB, Dynamodb};

class TokenStorage
{
    public static function createAuth()
    {
        $method = $_ENV['authDriver'];
        switch ($method) {
            case 'cookie':
                return new Cookie();
            case 'redis':
                return new Redis();
            case 'jwt':
                return new JwtToken();
        }
        return new Redis();
    }

    public static function createCache()
    {
    }

    public static function createMail()
    {
    }

    public static function createTokenStorage()
    {
        switch ($_ENV['tokenDriver']) {
            case 'db':
                return new DB();
            case 'dynamodb':
                return new Dynamodb();
            default:
                return new DB();
        }
    }
}
