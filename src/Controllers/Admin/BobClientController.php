<?php


namespace App\Controllers\Admin;


use App\Controllers\AdminController;
use App\Models\Config;

class BobClientController extends AdminController
{
    public function index($request, $response, $args)
    {
//        $config = Config::query()->where('name', 'bob_client')->value('value');
//        if (!$config){
            $config = require(BASE_PATH . '/config/.bobvpn.php');
//            Config::query()->insert(['name' => 'bob_client', 'value' => json_encode($config)]);
//        } else {
//            $config = json_decode($config, true);
//        }

        return $this->view()
            ->assign('config', $config)
            ->display('admin/bob_client.tpl');
    }
}
