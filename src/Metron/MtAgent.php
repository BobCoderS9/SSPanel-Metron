<?php

namespace App\Metron;

use App\Models\{ User, Code, Shop, Bought, Payback, Paytake };
use App\Services\{ Mail, Config, MetronSetting };
use App\Utils\{GA, Hash, Check, Tools };
use App\Metron\{ MtAuth, Metron };
use Exception;
use Ramsey\Uuid\Uuid;

class MtAgent extends \App\Controllers\BaseController
{
    public function pages($request, $response, $args)
    {
        if ( MtAuth::Auth()['agent'] !== 1) {
            die( '无 Agent 授权' );
        }

        $user       = $this->user;
        $backs      = Payback::where('ref_by', $user->id)->orderBy('datetime', 'desc');

        # 累计数据
        $back_sum   = $backs->sum('ref_get');       # 累计返利
        $user_num   = User::where('ref_by', $user->id)->count();

        # 最新3条返利
        $back_logs  = $backs->limit(3)->get();
        $back_news  = [];
        foreach ($back_logs as $back_log){
            $log_user = User::where('id', $back_log->userid)->first();
            if ($log_user === null) {
                $back_news[] = [
                    'name'      => '该用户已注销',
                    'email'     => '该用户已注销',
                    'avatar'    => '',
                    'time'      => date('Y-m-d H:i:s', $back_log->datetime),
                    'ref_get'   => $back_log->ref_get,
                ];
            } else {
                $back_news[] = [
                    'name'      => $log_user->user_name,
                    'email'     => $log_user->email,
                    'avatar'    => $log_user->getGravatarAttribute(),
                    'time'      => date('Y-m-d H:i:s', $back_log->datetime),
                    'ref_get'   => $back_log->ref_get,
                ];
            }

        }

        # 今日数据
        $unix_time  = strtotime(date('Y-m-d',time()));
        $today_back = $backs->where('datetime', '>', $unix_time)->sum('ref_get') ?? 0;
        $today_user = User::where('ref_by', $user->id)->whereDate('reg_date', '=', date('Y-m-d'))->count();

        # 提现中金额
        if (!$take_total = Paytake::where('userid', $user->id)->where('type', 2)->where('status', 0)->sum('total')) {
            $take_total = 0;
        }

        return $this->view()
            ->assign('back_sum', $back_sum)
            ->assign('user_num', $user_num)
            ->assign('back_news', $back_news)
            ->assign('today_back', $today_back)
            ->assign('today_user', $today_user)
            ->assign('take_total', $take_total)
            ->display('user/agent/index.tpl');
    }

    public function edit_user($request, $response, $args)
    {
        $user = $this->user;
        if ($user == null || !$user->isLogin || $user->agent < 1) { return 0; }

        $id = $args['id'];
        $edituser = User::find($id);
        if ($edituser->ref_by !== $user->id) {
            return '您无权操作该用户';
        }

        $edituser_config = $edituser->config;
        if (isset($edituser_config['form_agent_create']) && $edituser_config['form_agent_create'] !== true) {
            return '您无权操作通过邀请链接或邀请码注册的用户';
        }

        $shops = Shop::where('status', 1)->orderBy('name')->get();
        $email = explode('@', $edituser->email);
        $email = [ $email[0], '@'.$email[1] ];
        return $this->view()
            ->assign('shops', $shops)
            ->assign('email', $email)
            ->assign('edituser', $edituser)
            ->assign('subInfo', \App\Controllers\LinkController::getSubinfo($edituser, 0))
            ->display('user/agent/edit_user.tpl');
    }

    public function edit_user_save($request, $response, $args)
    {
        $user = $this->user;
        if ($user == null || !$user->isLogin || $user->agent < 1) {
            $res['ret'] = -1;
            return $response->getBody()->write(json_encode($res));
        }

        $id       = $args['id'];
        $edituser = User::find($id);
        if ($edituser->ref_by !== $user->id) {
            $res['ret'] = 0;
            $res['msg'] = '您无权操作该用户';
            return $response->getBody()->write(json_encode($res));
        }

        $edituser_config = $edituser->config;
        if (isset($edituser_config['form_agent_create']) && $edituser_config['form_agent_create'] !== true) {
            $res['ret'] = 0;
            $res['msg'] = '您无权操作通过邀请链接或邀请码注册的用户';
            return $response->getBody()->write(json_encode($res));
        }

        $mode      = $request->getParam('mode');
        $name      = $request->getParam('name');
        $email     = trim($request->getParam('email'));
        $email     = strtolower($email);
        $suffix    = trim($request->getParam('email_suffix'));
        $password  = $request->getParam('password');
        $enable    = (int) $request->getParam('enable');
        $shopid    = (int) $request->getParam('shopid');

        switch ($mode) {
            case 'edit_user':
                # 昵称检验
                if (MetronSetting::get('change_username') !== true) {
                    return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '管理员设置禁止修改昵称']));
                }
                if ($name == ''){
                    $res['ret'] = 0;
                    $res['msg'] = '昵称不允许留空';
                    return $response->getBody()->write(json_encode($res));
                }

                /*
                $regname = '/^[0-9a-zA-Z_\x{4e00}-\x{9fa5}]+$/u';
                if (!preg_match($regname,$name)){
                    $res['ret'] = 0;
                    $res['msg'] = '昵称仅支持中文、数字、字母和下划线的组合';
                    return $response->getBody()->write(json_encode($res));
                }*/
                if (strlen($name) > 24) {
                    $res['ret'] = 0;
                    $res['msg'] = '昵称太长了';
                    return $response->getBody()->write(json_encode($res));
                }

                # 检测邮箱
                if ($edituser->email != $email.$suffix) {
                    if (MetronSetting::get('change_usermail') !== true) {
                        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '管理员设置禁止修改邮箱']));
                    }
                    if ($email == '') {
                        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '未填写邮箱']));
                    }
                    if (MetronSetting::get('register_restricted_email') === true ) {
                        if (!in_array($suffix, MetronSetting::get('list_of_available_mailboxes'))) {
                            $res['ret'] = 0;
                            $res['msg'] = '禁止的邮箱后缀';
                            return $response->getBody()->write(json_encode($res));
                        }
                        $email .= $suffix;
                    }
                    if (!Check::isEmailLegal($email)) {
                        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '邮箱无效']));
                    }
                    $checkemail = User::where('email', '=', $email)->first();
                    if ($checkemail != null) {
                        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '此邮箱已存在']));
                    }
                }
                # 检测密码
                if ($password != '') {
                    if (strlen($password) < 8) {
                        $res['ret'] = 0;
                        $res['msg'] = '密码需8位以上';
                        return $response->getBody()->write(json_encode($res));
                    }
                    $edituser->pass = Hash::passwordHash($password);
                    $edituser->save();
                    $edituser->clean_link();
                }

                $edituser->user_name    = $name;
                $edituser->email        = $email;
                $edituser->enable       = $enable;
                if (!$edituser->save()){
                    $res['ret'] = 0;
                    $res['msg'] = '保存失败';
                    return $response->getBody()->write(json_encode($res));
                }
                $res['ret'] = 1;
                $res['msg'] = '保存成功';
                return $response->getBody()->write(json_encode($res));
            case 'buy_shop':
                # 开通套餐
                if ($shopid > 0) {
                    $shop = Shop::find($shopid);
                    if ($shop != null) {
                        if ($user->money < $shop->price) {
                            $res['ret'] = 0;
                            $res['msg'] = '套餐开通失败，原因是您的钱包余额不足!';
                            return $response->getBody()->write(json_encode($res));
                        }
                        $user->money = bcsub($user->money, $shop->price, 2);
                        $user->save();

                        Metron::bought_usedd($edituser, 1, 0);
                        $bought           = new Bought();
                        $bought->userid   = $edituser->id;
                        $bought->shopid   = $shop->id;
                        $bought->datetime = time();
                        $bought->renew    = 0;
                        $bought->coupon   = '';
                        $bought->price    = $shop->price;
                        $bought->usedd    = 1;
                        $bought->save();
                        $shop->buy($edituser);

                        Metron::add_payback($user, $edituser, $shop->price);
                        $res['ret'] = 1;
                        $res['msg'] = '套餐开通成功';
                        return $response->getBody()->write(json_encode($res));
                    } else {
                        $res['ret'] = 0;
                        $res['msg'] = '套餐开通失败，原因是套餐不存在!';
                        return $response->getBody()->write(json_encode($res));
                    }
                } else {
                    $res['ret'] = 1;
                    $res['msg'] = '不开通套餐无需保存';
                    return $response->getBody()->write(json_encode($res));
                }
                break;
            case 'reset_link':
                $edituser->clean_link();
                $res['ret'] = 1;
                $res['msg'] = '重置成功';
                return $response->getBody()->write(json_encode($res));
        }

        $res['ret'] = 0;
        $res['msg'] = '未知错误';
        return $response->getBody()->write(json_encode($res));
    }

    /**
     * 新建客户 页面
     */
    public function add_user($request, $response, $args)
    {
        $user = $this->user;
        if ($user == null || !$user->isLogin || $user->agent < 1) { return 0; }

        $shop_plan = MetronSetting::get('shop_plan');
        foreach ($shop_plan as $shop_a) {
            foreach ($shop_a as $shop_b) {

            }
        }
        $shops = Shop::where('status', 1)->orderBy('name')->get();

        return $this->view()->assign('shops', $shops)->display('user/agent/add_user.tpl');
    }

    /**
     * 新建客户 POST
     */
    public function add_user_save($request, $response, $args)
    {
        $user = $this->user;
        if ($user == null || !$user->isLogin || $user->agent < 1) {
            $res['ret'] = -1;
            return $response->getBody()->write(json_encode($res));
        }

        $email     = trim($request->getParam('email'));
        $shop_id     = $request->getParam('shop_id');
        $email     = strtolower($email);
        $suffix    = trim($request->getParam('email_suffix'));

        if (MetronSetting::get('register_restricted_email') === true ) {
            if (!in_array($suffix, MetronSetting::get('list_of_available_mailboxes'))) {
                $res['ret'] = 0;
                $res['msg'] = '禁止的邮箱后缀';
                return $response->getBody()->write(json_encode($res));
            }
            $email .= $suffix;
        }
        if (!Check::isEmailLegal($email)) {
            return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '邮箱无效']));
        }
        if (!Check::isGmailSmall($email)) {
            $res['ret'] = 0;
            $res['msg'] = '禁止使用带+号的Gmail虚拟邮箱';
            return $response->getBody()->write(json_encode($res));
        }

        $newuser = User::where('email', $email)->first();
        if ($newuser != null) {
            $res['ret'] = 0;
            $res['msg'] = '邮箱已经被注册了';
            return $response->getBody()->write(json_encode($res));
        }

        $current_timestamp             = time();
        $newuser                       = new User();
        $pass                          = Tools::genRandomChar();
        $newuser->user_name            = $email;
        $newuser->email                = $email;
        $newuser->pass                 = Hash::passwordHash($pass);
        $newuser->passwd               = Tools::genRandomChar(16);
        $newuser->uuid                 = Uuid::uuid3(Uuid::NAMESPACE_DNS, $email . '|' . $current_timestamp);
        $newuser->port                 = 0;
        $newuser->t                    = 0;
        $newuser->u                    = 0;
        $newuser->d                    = 0;
        $newuser->method               = Config::getconfig('Register.string.defaultMethod');
        $newuser->protocol             = Config::getconfig('Register.string.defaultProtocol');
        $newuser->protocol_param       = Config::getconfig('Register.string.defaultProtocol_param');
        $newuser->obfs                 = Config::getconfig('Register.string.defaultObfs');
        $newuser->obfs_param           = Config::getconfig('Register.string.defaultObfs_param');
        $newuser->forbidden_ip         = $_ENV['reg_forbidden_ip'];
        $newuser->forbidden_port       = $_ENV['reg_forbidden_port'];
        $newuser->im_type              = 2;
        $newuser->im_value             = $email;
        $newuser->transfer_enable      = Tools::toGB((int) Config::getconfig('Register.string.defaultTraffic'));
        $newuser->invite_num           = (int) Config::getconfig('Register.string.defaultInviteNum');
        $newuser->auto_reset_day       = $_ENV['reg_auto_reset_day'];
        $newuser->auto_reset_bandwidth = $_ENV['reg_auto_reset_bandwidth'];
        $newuser->money                = 0;
        $newuser->class_expire         = date('Y-m-d H:i:s', time() + (int) Config::getconfig('Register.string.defaultClass_expire') * 3600);
        $newuser->class                = (int) Config::getconfig('Register.string.defaultClass');
        $newuser->node_connector       = (int) Config::getconfig('Register.string.defaultConn');
        $newuser->node_speedlimit      = (int) Config::getconfig('Register.string.defaultSpeedlimit');
        $newuser->expire_in            = date('Y-m-d H:i:s', time() + (int) Config::getconfig('Register.string.defaultExpire_in') * 86400);
        $newuser->reg_date             = date('Y-m-d H:i:s');
        $newuser->reg_ip               = $_SERVER['REMOTE_ADDR'];
        $newuser->plan                 = 'A';
        $newuser->theme                = $_ENV['theme'];

        # 是代理商新建
        $newuser->ref_by                    = $user->id;
        $newuserconfig['form_agent_create'] = true;
        $newuser->config                    = $newuserconfig;

        # 注册分组
        $groups = explode(',', $_ENV['random_group']);
        $newuser->node_group = $groups[array_rand($groups)];

        # 二步验证
        $ga = new GA();
        $secret = $ga->createSecret();
        $newuser->ga_token = $secret;
        $newuser->ga_enable = 0;

        if ($newuser->save()) {
            $res['ret']         = 1;
            $res['msg']         = '新用户注册成功' . PHP_EOL . '用户名： ' . $email . PHP_EOL . ' 随机初始密码： ' . $pass;
            $res['email_error'] = 'success';
            if ($shop_id > 0) {
                $shop = Shop::find($shop_id);
                if ($shop != null) {
                    $bought           = new Bought();
                    $bought->userid   = $newuser->id;
                    $bought->shopid   = $shop->id;
                    $bought->datetime = time();
                    $bought->renew    = 0;
                    $bought->coupon   = '';
                    $bought->price    = $shop->price;
                    $bought->save();
                    $shop->buy($newuser);
                } else {
                    $res['msg'] .= '<br/>但是套餐添加失败了，原因是套餐不存在';
                }
            }
            /*
            $newuser->addMoneyLog($newuser->money);
            $subject            = $_ENV['appName'] . '-新用户注册通知';
            $to                 = $newuser->email;
            $text               = '您好，管理员已经为您生成账户，用户名: ' . $email . '，登录密码为：' . $pass . '，感谢您的支持。 ';
            try {
                Mail::send($to, $subject, 'newuser.tpl', [
                    'user' => $newuser, 'text' => $text,
                ], []);
            } catch (Exception $e) {
                $res['email_error'] = $e->getMessage();
            }*/
            return $response->getBody()->write(json_encode($res));
        }
        $res['ret'] = 0;
        $res['msg'] = '未知错误';
        return $response->getBody()->write(json_encode($res));
    }

    /**
     * 返利申请提现
     */
    public function take_total($request, $response, $args)
    {
        $user = $this->user;
        if ($user == null || !$user->isLogin) {
            $res['ret'] = -1;
            return $response->getBody()->write(json_encode($res));
        }

        $total = trim($request->getParam('total'));         # 金额
        $type  = (int) trim($request->getParam('type'));    # 1:转余额 2:提现

        if (!is_numeric($total)) {
            $res['ret'] = 0;
            $res['msg'] = '非法金额';
            return $response->getBody()->write(json_encode($res));
        }

        if ($total > $user->back_money) {
            $res['ret'] = 0;
            $res['msg'] = '可提现余额不足';
            return $response->getBody()->write(json_encode($res));
        }

        # 提现
        if ($type === 2) {
            # 检查是否有提现账号
            if (!$user->config['take_account']['acc'] || !$user->config['take_account']['type']) {
                $res['ret'] = 0;
                $res['msg'] = '您还未设置提现账号';
                return $response->getBody()->write(json_encode($res));
            }
            $take_back_total = MetronSetting::get('take_back_total');
            if ($take_back_total !== 0 && $total < $take_back_total) {
                $res['ret'] = 0;
                $res['msg'] = '提现金额需大于 ' . $take_back_total . ' 元';
                return $response->getBody()->write(json_encode($res));
            }
        }

        # 创建提现记录
        $paytake           = new Paytake();
        $paytake->userid   = $user->id;
        $paytake->type     = $type;
        $paytake->total    = $total;
        $paytake->status   = ($type === 1 ? 1 : 0);
        $paytake->datetime = time();
        if (!$paytake->save()) {
            $res['ret'] = 0;
            $res['msg'] = '创建提现申请失败, 请联系客服';
            return $response->getBody()->write(json_encode($res));
        }

        # 扣除用户返利余额
        $user->back_money = bcsub($user->back_money, $total, 2);

        # 转余额
        if ($type === 1){
            if ($total <= 0) {
                $paytake->delete();
                $res['ret'] = 0;
                $res['msg'] = '提现金额需大于0元';
                return $response->getBody()->write(json_encode($res));
            }
            # 转至余额 直接创建 code 记录 和 增加余额
            $code               = new Code();
            $code->code         = '#'.$paytake->id.' - '.'返利转余额';
            $code->type         = 3;
            $code->number       = $total;
            $code->isused       = 1;
            $code->userid       = $user->id;
            $code->usedatetime  = date('Y-m-d H:i:s', time());
            if (!$code->save()) {
                $res['ret'] = 0;
                $res['msg'] = '创建 code 记录失败, 请联系客服';
                return $response->getBody()->write(json_encode($res));
            }
            $user->money        = bcadd($user->money, $total, 2);
        }

        if (!$user->save()){
            $res['ret'] = 0;
            $res['msg'] = '出现错误, 请联系客服';
            return $response->getBody()->write(json_encode($res));
        }

        $res['ret'] = 1;
        $res['msg'] = ($type === 1 ? '已提现至账号余额' : '提现申请成功' );
        return $response->getBody()->write(json_encode($res));
    }

    /**
     * 提现账号设置
     */
    public function take_account_setting($request, $response, $args)
    {
        $user = $this->user;
        if ($user == null || !$user->isLogin) {
            $res['ret'] = -1;
            return $response->getBody()->write(json_encode($res));
        }

        $acc   = trim($request->getParam('acc'));   # 账号
        $type  = trim($request->getParam('type'));  # 类型

        if ( MtAuth::Auth()['agent'] !== 1) {
            $res['ret'] = 0;
            $res['msg'] = '无 Agent 授权';
            return $response->getBody()->write(json_encode($res));
        }
        if (!in_array($type, MetronSetting::get('take_account_type'))) {
            $res['ret'] = 0;
            $res['msg'] = '不支持该账号类型提现';
            return $response->getBody()->write(json_encode($res));
        }
        if (!$acc) {
            $res['ret'] = 0;
            $res['msg'] = '提现账号不能留空';
            return $response->getBody()->write(json_encode($res));
        }

        $config                         = $user->config;
        $config['take_account']['type'] = $type;
        $config['take_account']['acc']  = $acc;
        $user->config                   = $config;

        if (!$user->save()){
            $res['ret'] = 0;
            $res['msg'] = '出现错误, 请联系客服';
            return $response->getBody()->write(json_encode($res));
        }

        $res['ret'] = 1;
        $res['msg'] = '保存成功';
        return $response->getBody()->write(json_encode($res));
    }

    /**
     * ajax 数据表
     */
    public function ajax_datatable($request, $response, $args)
    {
        $name       = $args['name'];                        # 得到表名
        $user       = $this->user;                          # 得到用户
        $getMeta    = $request->getQueryParams();           # 获取所有请求数据
        $page       = isset($getMeta['pagination']['page']) ? $getMeta['pagination']['page'] : 1;       # 得到当前页码
        $sort       = isset($getMeta['sort']['sort']) ? $getMeta['sort']['sort'] : 'desc';             # 得到排序方法
        $field      = isset($getMeta['sort']['field']) ? $getMeta['sort']['field'] : 'reg_date';            # 得到排序字段
        $perpage    = isset($getMeta['pagination']['perpage']) ? $getMeta['pagination']['perpage'] : 10;    # 得到每页数量
        $querydata  = isset($getMeta['query'][0]) ? $getMeta['query'][0] : "";                 # 筛选数据

        if ($user == null || !$user->isLogin || $user->agent < 1) { return 0; }

        switch ($name) {
            case 'agent_user':
                # 所有
                $users = User::query()->where('ref_by', '=', $user->id);

                if ($field === 'unusedTraffic') {
                    # 根据剩余流量排序
                    $users = $users->orderByRaw('transfer_enable - u - d '.$sort);
                } else {
                    $users = $users->orderBy($field, $sort);
                }

                # 按等级筛选
                if ( isset($getMeta['query']['class']) ) {
                    $users = $users->where('class', $getMeta['query']['class']);
                }

                # 搜索
                if ( !empty($querydata) ) {
                    $users = $users->where(function ($query) use ($querydata) {
                        $query->where('id', 'LIKE', '%' . $querydata . '%')->orwhere('user_name', 'LIKE', '%' . $querydata . '%')->orwhere('email', 'LIKE', '%' . $querydata . '%');
                    });
                }

                $total = $users->count();
                $logs  = [];
                $data  = [];
                # 每页数量
                if ($perpage != -1) {
                    $logs = $users->skip(($page - 1)*$perpage)->limit($perpage)->get();
                } else {
                    $logs = $users->get();
                }
                foreach ($logs as $log) {
                    /*
                    # 用户累计充值
                    if (!$number = Code::where('userid', '=', $log->id)->sum('number')) {
                        $number = 0;
                    }
                    # 通过该用户获得的返利
                    if (!$backprice = Payback::where('userid', '=', $log->id)->sum('ref_get')) {
                        $backprice = 0;
                    }*/
                    $dataarr['id']                   = $log->id;
                    $dataarr['user_name']            = $log->user_name;
                    $dataarr['email']                = $log->email;
                    $dataarr['money']                = $log->money;
                    $dataarr['unusedTraffic']        = $log->unusedTraffic();
                    $dataarr['class']                = MetronSetting::get('user_level')[$log->class];
                    $dataarr['class_expire']         = $log->class_expire;
                    $dataarr['reg_date']             = $log->reg_date;
                    //$dataarr['accumulated_recharge'] = $number . ' 元';
                    //$dataarr['get_rebates']          = $backprice . ' 元';
                    $dataarr['ref_by']               = $log->ref_by;
                    $data[]                          = $dataarr;
                }
                break;
            case 'amount_records':
                $time_a = strtotime(date('Y-m-d',$_SERVER['REQUEST_TIME'])) + 86400;
                $time_b = $time_a + 86400;
                $datas = [];
                for ($i=0; $i < 7 ; $i++) {
                    $time_a -= 86400;
                    $time_b -= 86400;
                    $total   = Payback::where('ref_by', $user->id)->where('datetime', '>', $time_a)->where('datetime', '<', $time_b)->sum('ref_get');
                    $datas[] = [
                        'time'  => date('Y-m-d', $time_a),
                        'total' => $total ?? 0,
                    ];
                }
                return $response->getBody()->write(json_encode(array_reverse($datas)));
            case 'agent_take_log':
                $paytakes = Paytake::where('userid', $user->id)->orderBy($field, $sort);
                # 按状态筛选
                if ( isset($getMeta['query']['status']) ) {
                    $paytakes = $paytakes->where('status', $getMeta['query']['status']);
                }

                $total = $paytakes->count();
                $logs  = [];
                $data  = [];
                # 每页数量
                if ($perpage != -1) {
                    $paytakes = $paytakes->skip(($page - 1)*$perpage)->limit($perpage)->get();
                } else {
                    $paytakes = $paytakes->get();
                }
                foreach ($paytakes as $paytake) {
                    $dataarr['id']          = $paytake->id;
                    $dataarr['type']        = $paytake->type;
                    $dataarr['total']       = $paytake->total;
                    $dataarr['status']      = $paytake->status;
                    $dataarr['datetime']    = $paytake->datetime;
                    $data[]                 = $dataarr;
                }
                break;
            default:
                return 0;
        }

        $meta = [
            "page"      => $page,                       # 当前页码
            "pages"     => ceil($total / $perpage),     # 总页数
            "perpage"   => $perpage,                    # 每页数量
            "total"     => $total,                      # 总数量
            "sort"      => $sort,                       # 排序方式
            "field"     => $field,                      # 排序字段
        ];
        $res  = [ 'meta' => $meta, 'data' => $data];
        return $response->getBody()->write(json_encode($res));
    }

    /**
     * 删除用户
     */
    public function delete($request, $response, $args)
    {
        $user = $this->user;

        if ($user == null || !$user->isLogin || $user->agent < 1) {
            $res['ret'] = 0;
            $res['msg'] = '非法操作';
            return $response->getBody()->write(json_encode($res));
        }

        $id         = $request->getParam('id');
        $delluser   = User::find($id);

        if ($delluser->ref_by !== $user->id) {
            $res['ret'] = 0;
            $res['msg'] = '您无权操作该用户';
            return $response->getBody()->write(json_encode($res));
        }

        $delluser_config = $delluser->config;
        if ($delluser_config['form_agent_create'] !== true) {
            $res['ret'] = 0;
            $res['msg'] = '您无权操作通过邀请链接或邀请码注册的用户';
            return $response->getBody()->write(json_encode($res));
        }

        if (!$delluser->kill_user()) {
            $res['ret'] = 0;
            $res['msg'] = '删除失败';
            return $response->getBody()->write(json_encode($res));
        }

        $res['ret'] = 1;
        $res['msg'] = '删除成功';
        return $response->getBody()->write(json_encode($res));
    }
}
