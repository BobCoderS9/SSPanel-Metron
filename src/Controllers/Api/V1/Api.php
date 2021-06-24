<?php

namespace App\Controllers\Api\V1;

use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;
use App\Controllers\Api\TokenStorage;

class Api
{
    public function __invoke($request, $response, $next)
    {
        $accessToken = $request->getParam('access_token');
        if ($accessToken == null) {
            $res['ret'] = 0;
            $res['msg'] = 'token is null';
            $response->getBody()->write(json_encode($res));
            return $response;
        }
        $storage = TokenStorage::createTokenStorage();
        $token = $storage->get($accessToken);
        if ($token == null) {
            $res['ret'] = 0;
            $res['msg'] = 'token is null';
            $response->getBody()->write(json_encode($res));
            return $response;
        }
        if ($token->expireTime < time()) {
            $res['ret'] = 0;
            $res['msg'] = 'token is expire';
            $response->getBody()->write(json_encode($res));
            return $response;
        }
        $response = $next($request, $response);
        return $response;
    }
}
