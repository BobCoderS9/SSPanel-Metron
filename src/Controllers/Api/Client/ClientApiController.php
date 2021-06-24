<?php

namespace App\Controllers\Api\Client;

use App\Controllers\{BaseController, LinkController};
use App\Models\{Ann, User};
use App\Services\{Auth, Config};

use App\Controllers\Api\TokenStorage;

class ClientApiController
{
    public function GetAnnouncement($request, $response, $args)
    {
        $accessToken = $request->getParam('access_token');
        $storage = TokenStorage::createTokenStorage();
        $token = $storage->get($accessToken);
        $user = User::find($token->userId);
        $Anns = Ann::orderBy('date', 'desc')->first();
        $res['ret'] = 1;
        $res['msg'] = 'ok';
        $res['data'] = $Anns;
        return $response->getBody()->write(json_encode($res));
    }

    public function Redirect($request, $response, $args)
    {
        $user = Auth::getUser();
        $url = $request->getQueryParams()['target'];
        if (!$user->isLogin) {
            $accessToken = $request->getParam('access_token');
            $storage = TokenStorage::createTokenStorage();
            $token = $storage->get($accessToken);
            if ($token == null) {
                $res['ret'] = 0;
                $res['msg'] = 'token is null';
                return $response->getBody()->write(json_encode($res));
            }
            $user = User::find($token->userId);
            $time = 3600 * 24;
            Auth::login($user->id, $time);
        }
        return $response->withRedirect($url);
    }

    public function GetSubLink($request, $response, $args)
    {
        $accessToken = $request->getParam('access_token');
        $sub = ($request->getParam('sub') != ''
            ? $request->getParam('sub')
            : 1);
        $storage = TokenStorage::createTokenStorage();
        $token = $storage->get($accessToken);
        $user = User::find($token->userId);
        $ssr_sub_token = LinkController::GenerateSSRSubCode($user->id, 0);
        $res['ret'] = 1;
        $res['msg'] = 'ok';
        $res['data'] = Config::get('subUrl') . $ssr_sub_token . '?sub=' . $sub;
        return $response->getBody()->write(json_encode($res));
    }
}
