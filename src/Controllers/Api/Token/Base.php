<?php

namespace App\Controllers\Api\Token;

use App\Models\User;

abstract class Base
{
    abstract public function store($token, User $user, $expireTime);

    abstract public function delete($token);

    abstract public function get($token);
}
