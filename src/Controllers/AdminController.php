<?php

namespace App\Controllers;

use App\Models\{
    Node,
    User,
    Coupon
};
use App\Utils\{
    Tools,
    DatatablesHelper
};
use App\Services\{
    Analytics
};
use Ozdemir\Datatables\Datatables;

/**
 *  Admin Controller
 */
class AdminController extends UserController
{
    public function index($request, $response, $args)
    {
        $sts = new Analytics();
	// admin增加收入和用户统计
        $days = [];

        for ($i = 1; $i <= 7; $i++) {
            $date_expression = '-'.$i.' days';
            $day = strtotime($date_expression);
            $days[] = date("Y-m-d", $day);
        }

        return $this->view()->assign('sts', $sts)->assign('days', $days)->display('admin/index.tpl');
    }

    public function node($request, $response, $args)
    {
        $nodes = Node::all();
        return $this->view()->assign('nodes', $nodes)->display('admin/node.tpl');
    }

    public function sys()
    {
        return $this->view()->display('admin/index.tpl');
    }

    public function invite($request, $response, $args)
    {
        $table_config['total_column'] = array(
            'id' => 'ID',
            'total' => '原始金额', 'event_user_id' => '发起用户ID',
            'event_user_name' => '发起用户名', 'ref_user_id' => '获利用户ID',
            'ref_user_name' => '获利用户名', 'ref_get' => '获利金额',
            'datetime' => '时间'
        );
        $table_config['default_show_column'] = array();
        foreach ($table_config['total_column'] as $column => $value) {
            $table_config['default_show_column'][] = $column;
        }
        $table_config['ajax_url'] = 'payback/ajax';
        return $this->view()->assign('table_config', $table_config)->display('admin/invite.tpl');
    }

    public function chgInvite($request, $response, $args)
    {
        $prefix = $request->getParam('prefix');

        if ($request->getParam('userid') != NULL && $request->getParam('refid') != NULL) {
            if (strpos($request->getParam('userid'), '@') != false) {
                $user = User::where('email', '=', $request->getParam('userid'))->first();
            } else {
                $user = User::Where('id', '=', $request->getParam('userid'))->first();
            }

            if ($user == null) {
                $res['ret'] = 0;
                $res['msg'] = '邀请者更改失败，检查用户id是否输入正确';
                return $response->getBody()->write(json_encode($res));
            }
            $uid = $user->id;
        } else {
            $uid = 0;
        }
        $user->ref_by = $request->getParam('refid');
        $user->save();
        $res['ret'] = 1;
        $res['msg'] = '邀请者更改成功';
        return $response->getBody()->write(json_encode($res));
    }

    public function addInvite($request, $response, $args)
    {
        $num = $request->getParam('num');
        $prefix = $request->getParam('prefix');

        if (Tools::isInt($num) == false) {
            $res['ret'] = 0;
            $res['msg'] = '非法请求';
            return $response->getBody()->write(json_encode($res));
        }

        if ($request->getParam('uid') != '0') {
            if (strpos($request->getParam('uid'), '@') != false) {
                $user = User::where('email', '=', $request->getParam('uid'))->first();
            } else {
                $user = User::Where('id', '=', $request->getParam('uid'))->first();
            }

            if ($user == null) {
                $res['ret'] = 0;
                $res['msg'] = '邀请次数添加失败，检查用户id或者用户邮箱是否输入正确';
                return $response->getBody()->write(json_encode($res));
            }
            $uid = $user->id;
        } else {
            $uid = 0;
        }
        $user->invite_num += $num;
        $user->save();
        $res['ret'] = 1;
        $res['msg'] = '邀请次数添加成功';
        return $response->getBody()->write(json_encode($res));
    }

    public function coupon($request, $response, $args)
    {
        $table_config['total_column'] = array(
            'id' => 'ID', 'code' => '优惠码',
            'expire' => '过期时间', 'shop' => '限定商品ID',
            'credit' => '额度', 'onetime' => '次数'
        );
        $table_config['default_show_column'] = array();
        foreach ($table_config['total_column'] as $column => $value) {
            $table_config['default_show_column'][] = $column;
        }
        $table_config['ajax_url'] = 'coupon/ajax';
        return $this->view()->assign('table_config', $table_config)->display('admin/coupon.tpl');
    }

    public function addCoupon($request, $response, $args)
    {
        $code = new Coupon();
        $code->onetime = $request->getParam('onetime');
        $generate_type = $request->getParam('generate_type');
        $final_code = $request->getParam('prefix');

        if (empty($final_code) && ($generate_type == 1 || $generate_type == 3)) {
            $res['ret'] = 0;
            $res['msg'] = '优惠码不能为空';
            return $response->getBody()->write(json_encode($res));
        }

        if ($generate_type == 1) {
            if (Coupon::where('code', $final_code)->count() != 0) {
                $res['ret'] = 0;
                $res['msg'] = '优惠码已存在';
                return $response->getBody()->write(json_encode($res));
            }
        } else {
            while (true) {
                if ($generate_type == 2) {
                    $temp_code = Tools::genRandomChar(8);
                } elseif ($generate_type == 3) {
                    $temp_code = $final_code . Tools::genRandomChar(8);
                }

                if (Coupon::where('code', $temp_code)->count() == 0) {
                    $final_code = $temp_code;
                    break;
                }
            }
        }

        $code->code = $final_code;
        $code->expire = time() + $request->getParam('expire') * 3600;
        $code->shop = $request->getParam('shop');
        $code->credit = $request->getParam('credit');

        $code->save();

        $res['ret'] = 1;
        $res['msg'] = '优惠码添加成功';
        return $response->getBody()->write(json_encode($res));
    }

    public function trafficLog($request, $response, $args)
    {
        $table_config['total_column'] = array(
            'id' => 'ID', 'user_id' => '用户ID',
            'user_name' => '用户名', 'node_name' => '使用节点',
            'rate' => '倍率', 'origin_traffic' => '实际使用流量',
            'traffic' => '结算流量',
            'log_time' => '记录时间'
        );
        $table_config['default_show_column'] = array(
            'id', 'user_id',
            'user_name', 'node_name',
            'rate', 'origin_traffic',
            'traffic', 'log_time'
        );
        $table_config['ajax_url'] = 'trafficlog/ajax';
        return $this->view()->assign('table_config', $table_config)->display('admin/trafficlog.tpl');
    }

    public function ajax_trafficLog($request, $response, $args)
    {
        $datatables = new Datatables(new DatatablesHelper());
        $datatables->query('Select log.id,log.user_id,user.user_name,node.name as node_name,log.rate,(log.u + log.d) as origin_traffic,log.traffic,log.log_time from user_traffic_log as log,user,ss_node as node WHERE log.user_id = user.id AND log.node_id = node.id');

        $datatables->edit('log_time', static function ($data) {
            return date('Y-m-d H:i:s', $data['log_time']);
        });

        $datatables->edit('origin_traffic', static function ($data) {
            return Tools::flowAutoShow($data['origin_traffic']);
        });

        $body = $response->getBody();
        $body->write($datatables->generate());
    }

    public function ajax_payback($request, $response, $args)
    {
        $datatables = new Datatables(new DatatablesHelper());
        $datatables->query('Select payback.id,payback.total,payback.userid as event_user_id,event_user.user_name as event_user_name,payback.ref_by as ref_user_id,ref_user.user_name as ref_user_name,payback.ref_get,payback.datetime from payback,user as event_user,user as ref_user where event_user.id = payback.userid and ref_user.id = payback.ref_by');

        $datatables->edit('datetime', static function ($data) {
            return date('Y-m-d H:i:s', $data['datetime']);
        });

        $body = $response->getBody();
        $body->write($datatables->generate());
    }

    public function ajax_coupon($request, $response, $args)
    {
        $datatables = new Datatables(new DatatablesHelper());
        $datatables->query('Select id,code,expire,shop,credit,onetime from coupon');

        $datatables->edit('expire', static function ($data) {
            return date('Y-m-d H:i:s', $data['expire']);
        });

        $body = $response->getBody();
        $body->write($datatables->generate());
    }
    // admin增加收入统计
    public function getIncome($request, $response, $args)
    {
        $date = $request->getParam('date');
        $date_in_timestamp = strtotime($date);
        //$date_in_timestamp = strtotime('2019-12-12');

        $stats = new Analytics();

        $today_income = $stats->getIncome($date_in_timestamp,  $date_in_timestamp+86400);
        $yesterday_income = $stats->getIncome($date_in_timestamp-86400, $date_in_timestamp);

        $first_day_of_this_week_timestamp = strtotime("last monday midnight",$date_in_timestamp);
        $first_day_of_next_week_timestamp = strtotime("next monday midnight",$date_in_timestamp);
        $this_week_income = $stats->getIncome($first_day_of_this_week_timestamp, $first_day_of_next_week_timestamp);
        $first_day_of_last_week_timestamp = strtotime("last monday midnight",$date_in_timestamp-604800);
        $last_week_income = $stats->getIncome($first_day_of_last_week_timestamp, $first_day_of_this_week_timestamp);

        $first_day_of_this_month_timestamp = strtotime("first day of this month",$date_in_timestamp);
        $first_day_of_next_month_timestamp = strtotime("first day of next month",$date_in_timestamp);
        $this_month_income = $stats->getIncome($first_day_of_this_month_timestamp, $first_day_of_next_month_timestamp);
        $first_day_of_last_month_timestamp = strtotime("first day of last month",$date_in_timestamp);
        $last_moneth_income = $stats->getIncome($first_day_of_last_month_timestamp, $first_day_of_this_month_timestamp);

        $res['success'] = true;
        $res['error'] = '';
        $res['message'] = '';
        $res['data'] = array(
            "date" => $date,
            "todayIncome" => $today_income,
            "yesterdayIncome" => $yesterday_income,
            "thisWeekIncome" => $this_week_income,
            "lastWeekIncome" => $last_week_income,
            "thisMonthIncome" => $this_month_income,
            "lastMonthIncome" => $last_moneth_income
        );
        return $response->getBody()->write(json_encode($res));
    }
    // admin增加用户统计
    public function newUsers($request, $response, $args)
    {
        $date = $request->getParam('date');
        $date_in_timestamp = strtotime($date);

        $stats = new Analytics();

        $today_users = $stats->getNewUsers($date_in_timestamp, $date_in_timestamp+86400);
        $yesterday_users = $stats->getNewUsers($date_in_timestamp-86400, $date_in_timestamp);

        $first_day_of_this_week_timestamp = strtotime("last monday midnight",$date_in_timestamp);
        $first_day_of_next_week_timestamp = strtotime("next monday midnight",$date_in_timestamp);
        $this_week_users = $stats->getNewUsers($first_day_of_this_week_timestamp, $first_day_of_next_week_timestamp);
        $first_day_of_last_week_timestamp = strtotime("last monday midnight",$date_in_timestamp-604800);
        $last_week_users = $stats->getNewUsers($first_day_of_last_week_timestamp, $first_day_of_this_week_timestamp);

        $first_day_of_this_month_timestamp = strtotime("first day of this month",$date_in_timestamp);
        $first_day_of_next_month_timestamp = strtotime("first day of next month",$date_in_timestamp);
        $this_month_users = $stats->getNewUsers($first_day_of_this_month_timestamp, $first_day_of_next_month_timestamp);
        $first_day_of_last_month_timestamp = strtotime("first day of last month",$date_in_timestamp);
        $last_moneth_users = $stats->getNewUsers($first_day_of_last_month_timestamp, $first_day_of_this_month_timestamp);

        $res['success'] = true;
        $res['error'] = '';
        $res['message'] = '';
        $res['data'] = array(
            "date" => $date,
            "today" => $today_users,
            "yesterday" => $yesterday_users,
            "thisWeek" => $this_week_users,
            "lastWeek" => $last_week_users,
            "thisMonth" => $this_month_users,
            "lastMonth" => $last_moneth_users
        );
        return $response->getBody()->write(json_encode($res));
    }
}
