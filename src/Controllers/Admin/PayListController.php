<?php

namespace App\Controllers\Admin;

use App\Controllers\AdminController;
use App\Utils\DatatablesHelper;
use App\Models\{Code, Paylist, User};
use Ozdemir\Datatables\Datatables;
use Slim\Http\{
    Request,
    Response
};
use Psr\Http\Message\ResponseInterface;

class PayListController extends AdminController
{
    /**
     * @param Request   $request
     * @param Response  $response
     * @param array     $args
     */
    public function index($request, $response, $args): ResponseInterface
    {
        $table_config['total_column'] = array(
            'id'          => 'ID',
            'userid'      => '用户ID',
            'username'    => '用户名',
            'total'        => '金额',
            'status'      => '状态',
            'tradeno'     => '订单号',
            'shop'        => '商品信息',
            'type'        => '类型',
            'datetime'    => '时间',
        );
        $table_config['default_show_column'] = array();
        foreach ($table_config['total_column'] as $column => $value) {
            $table_config['default_show_column'][] = $column;
        }
        $table_config['ajax_url'] = 'paylist/ajax';


        return $response->write(
            $this->view()
                ->assign('table_config', $table_config)
                ->display('admin/user/paylist.tpl')
        );
    }

    public function ajax_paylist($request, $response, $args)
    {
        $datatables = new Datatables(new DatatablesHelper());
        $datatables->query('Select paylist.id,paylist.userid,paylist.userid as user_name,paylist.total,paylist.status,paylist.tradeno,paylist.shop,paylist.type,paylist.datetime from paylist');

        $datatables->edit('status', static function ($data) {
            return $data['status'] == 1 ? '已付款' : '未支付';
        });

        $datatables->edit('username', static function ($data) {
            return User::where('id', $data['userid'])->value('email');
        });

        $datatables->edit('datetime', static function ($data) {
            return date('Y-m-d H:i:s', $data['datetime']);
        });

        $body = $response->getBody();
        $body->write($datatables->generate());
    }
}
