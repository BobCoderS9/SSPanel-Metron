<?php


namespace App\Services;

use App\Utils\Tools;
use Predis\Client;

class RedisClient
{
    public $client;

    public function __construct()
    {
        $config = [
            'scheme' => $_ENV['redis_scheme'],
            'password' => $_ENV['redis_password'],
            'host' => $_ENV['redis_host'],
            'port' => $_ENV['redis_port'],
            'database' => $_ENV['redis_database'],
        ];
        $this->client = new Client($config);
    }

    public function getClient()
    {
        return $this->client;
    }

    public function get($key)
    {
        $value = $this->client->get($key);

        return Tools::isJson($value) ? json_decode($value, true) : $value;
    }

    public function forever($key, $value)
    {
        $value = $this->checkValueToString($value);
        $this->client->set($key, $value);
    }

    public function set($key, $value, $time)
    {
        $value = $this->checkValueToString($value);
        $this->client->setex($key, $time, $value);
    }

    public function has($key)
    {
        $value = $this->client->type($key);

        return $value === 'none' ? false : true;
    }

    public function del($key)
    {
        $this->client->del($key);
    }

    public function checkValueToString($value)
    {
        if (is_array($value)){
            return json_encode($value);
        } elseif (is_object($value)){
            return json_encode($value);
        }

        return $value;
    }
}
