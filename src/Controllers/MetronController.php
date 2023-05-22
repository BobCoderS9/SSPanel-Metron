<?php

namespace App\Controllers;

use App\Services\{Auth, Mail, Config, Payment, MetronSetting};
use App\Models\{Ip,
    Ann,
    Code,
    Node,
    Shop,
    User,
    Help,
    Link,
    Helpc,
    Token,
    Relay,
    Bought,
    Coupon,
    Ticket,
    Paylist,
    Payback,
    BlockIp,
    LoginIp,
    UnblockIp,
    Speedtest,
    DetectLog,
    DetectRule,
    TrafficLog,
    InviteCode,
    EmailVerify,
    UserSubscribeLog
};
use App\Utils\{GA,
    Pay,
    URL,
    Hash,
    QQWry,
    Check,
    Tools,
    Radius,
    Cookie,
    Geetest,
    Telegram,
    ClientProfiles,
    DatatablesHelper,
    TelegramSessionManager
};
use App\Metron\{Metron, MtAuth, MtHttp, MtEmail};
use voku\helper\AntiXSS;
use TelegramBot\Api\BotApi;
use Exception;
use Ramsey\Uuid\Uuid;

class MetronController extends BaseController
{
    /**
     * Metron List
     *
     * @param \Slim\Http\Request $request
     * @param \Slim\Http\Response $response
     * @param array $args
     *
     * @return \Slim\Http\Response
     */

    /**
     * JS 授权
     */
    public function authcode($request, $response, $args)
    {
        $mt = MtAuth::Auth();
        if (!$mt['ret']) {
            return $response->getBody()->write(json_encode($mt, JSON_UNESCAPED_UNICODE));
        }

        $res = [
            'ret' => 1,
            'msg' => 'S授权有效',
            'key' => 'Bob'
        ];
        return $response->getBody()->write(json_encode($res, JSON_UNESCAPED_UNICODE));
    }

    public function Help($request, $response, $args)
    {
        $mt = MtAuth::Auth();
        if (!$mt['ret']) {
            die($mt['msg'] . ' | ' . $_SESSION['authcode']);
        }

        $classList_L1 = Helpc::where('upid', 0)->where('pageshow', 1)->orderBy('sort', 'desc')->get();     /* 列出所有一级分类 */

        /* 所有分类 */
        $classs_list = Helpc::all();
        $classs = [];
        foreach ($classs_list as $class) {
            $classs[$class->id] = ['id' => $class->id, 'name' => $class->name, 'upid' => $class->upid];
        }

        /* 如果是搜索关键字 */
        if ($Keywords = $request->getParam('Keywords')) {
            $arrs = explode(" ", $Keywords);
            $arrs = array_filter($arrs);
            foreach ($arrs as $arr) {
                $titles[] = ['title', 'LIKE', '%' . $arr . '%'];
                $contes[] = ['content', 'LIKE', '%' . $arr . '%'];
            }

            $contents = Help::where($titles)->orWhere($contes)->get();

            return $this->view()
                ->assign('classs', $classs)
                ->assign('classList_L1', $classList_L1)
                ->assign('Keywords', $Keywords)
                ->assign('contents', $contents)
                ->display('user/help/search.tpl');
        } else {
            $Keywords = MetronSetting::get('help_Keywords')[array_rand(MetronSetting::get('help_Keywords'))];
        }

        $type = isset($request->getQueryParams()['type']) ? $request->getQueryParams()['type'] : '开始使用';        /* 获取当前访问页面的路径 */
        $type = Helpc::where('name', $type)->where('pageshow', 1)->value('name');       /* 将路径匹配数据库分类 */
        if (!$type) {
            $home = Helpc::where('upid', 0)->where('pageshow', 1)->orderBy('id', 'asc')->first();     /* 获取第一个一级分类用做首页 */
            $type = $home->name;
        }

        foreach ($classList_L1 as $class_L1) {
            if ($class_L1->name == $type) {
                $typeId = $class_L1->id;        /* 当前页面的一级分类ID */
            }
        }

        $pageDoc = [];
        $classList_L2 = Helpc::where('upid', $typeId)->where('pageshow', 1)->orderBy('sort', 'DESC')->get();   /* 获取指定页面的所有二级分类 */
        if (count($classList_L2) > 0) {
            foreach ($classList_L2 as $class_L2) {
                $list_L2ID[] = $class_L2->id;
                $tutorial_url = BASE_PATH . '/resources/views/metron/user/tutorial/' . str_replace(' ', '', $classs[$class_L2->upid]['name']) . '/' . str_replace(' ', '', $class_L2->name) . '.tpl';
                if (file_exists($tutorial_url)) {
                    $class_L2->url = '/user/tutorial?os=' . str_replace(' ', '', $classs[$class_L2->upid]['name']) . '&amp;client=' . str_replace(' ', '', $class_L2->name);
                }
            }
            $pageDoc = Help::whereIn('class', $list_L2ID)->orderBy('ontop', 'desc')->orderBy('sort', 'desc')->get();
        }

        return $this->view()
            ->assign('classs', $classs)
            ->assign('classList_L1', $classList_L1)
            ->assign('classList_L2', $classList_L2)
            ->assign('Keywords', $Keywords)
            ->assign('pageDoc', $pageDoc)
            ->assign('pageType', $typeId)
            ->display('user/help/home.tpl');
    }

    public function SharedAccount($request, $response, $args)
    {
        $mt = MtAuth::Auth();
        if (!$mt['ret']) {
            die($mt['msg']);
        }

        return $this->view()->display('user/shared_account.tpl');
    }

    public function getmoney($request, $response, $args)
    {
        $mt = MtAuth::Auth();
        if (!$mt['ret']) {
            return $response->getBody()->write(json_encode($mt, JSON_UNESCAPED_UNICODE));
        }

        $user = $this->user;
        $res['money'] = $user->money;
        $res['ret'] = 1;
        return $this->echoJson($response, $res);
    }

    public function ChangeUserName($request, $response, $args)
    {
        $mt = MtAuth::Auth();
        if (!$mt['ret']) {
            return $response->getBody()->write(json_encode($mt, JSON_UNESCAPED_UNICODE));
        }

        $user = $this->user;
        $newname = $request->getParam('newname');
        $regname = '#[^\x{4e00}-\x{9fa5}A-Za-z0-9]#u';

        if ($newname == '') {
            $res['ret'] = 0;
            $res['msg'] = '昵称不允许留空';
            return $response->getBody()->write(json_encode($res));
        }
        if (preg_match($regname, $newname)) {
            $res['ret'] = 0;
            $res['msg'] = '不能包含符号';
            return $response->getBody()->write(json_encode($res));
        }
        if (strlen($newname) > 18) {
            $res['ret'] = 0;
            $res['msg'] = '昵称太长了';
            return $response->getBody()->write(json_encode($res));
        }
        if (Metronsetting::get('change_username') != true) {
            $res['ret'] = 0;
            $res['msg'] = '管理员设置不允许修改';
            return $response->getBody()->write(json_encode($res));
        }
        $user->user_name = $newname;

        if ($user->save()) {
            $res['ret'] = 1;
            $res['msg'] = '修改成功';
            return $response->getBody()->write(json_encode($res));
        }

        $res['ret'] = 0;
        $res['msg'] = '未知错误';
        return $response->getBody()->write(json_encode($res));
    }

    /**
     * 更新设置
     */
    public function updateSetting($request, $response, $args)
    {
        $page = $args['page'];
        $user = $this->user;
        if (!$user->isLogin) {
            $res['ret'] = -1;
            return $response->getBody()->write(json_encode($res));
        }

        switch ($page) {
            case 'profile':
                $name = trim($request->getParam('user_name'));
                $email = trim($request->getParam('email'));
                $email_code = trim($request->getParam('email_code'));

                /* 昵称检验 */
                if ($user->user_name != $name) {
                    if (MetronSetting::get('change_username') !== true) {
                        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '管理员设置禁止修改昵称']));
                    }
                    $regname = '/^[0-9a-zA-Z_\x{4e00}-\x{9fa5}]+$/u';
                    if ($name == '') {
                        $res['ret'] = 0;
                        $res['msg'] = '昵称不允许留空';
                        return $response->getBody()->write(json_encode($res));
                    }
                    if (!preg_match($regname, $name)) {
                        $res['ret'] = 0;
                        $res['msg'] = '昵称仅支持中文、数字、字母和下划线的组合';
                        return $response->getBody()->write(json_encode($res));
                    }
                    if (strlen($name) > 18) {
                        $res['ret'] = 0;
                        $res['msg'] = '昵称太长了';
                        return $response->getBody()->write(json_encode($res));
                    }
                    $user->user_name = $name;
                    if (!$user->save()) {
                        $res['ret'] = 0;
                        $res['msg'] = '昵称修改失败';
                        return $response->getBody()->write(json_encode($res));
                    }
                }

                /* 邮箱校验 */
                if ($user->email != $email) {
                    if (MetronSetting::get('change_usermail') !== true) {
                        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '管理员设置禁止修改邮箱']));
                    }
                    if ($email == '') {
                        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '未填写邮箱']));
                    }
                    if (!Check::isEmailLegal($email)) {
                        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '邮箱无效']));
                    }
                    $metron = new MtEmail();
                    if (!$metron->checkEmailSuffix($email)) {
                        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '不支持的邮箱后缀']));
                    }
                    $checkemail = User::where('email', '=', $email)->first();
                    if ($checkemail) {
                        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '此邮箱已存在']));
                    }
                    if (Config::getconfig('Register.bool.Enable_email_verify')) {
                        $mailcount = EmailVerify::where('email', '=', $email)->where('code', '=', $email_code)->where('expire_in', '>', time())->first();
                        if ($mailcount == null) {
                            return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '您的邮箱验证码不正确或已过期']));
                        }
                    }

                    $user->email = $email;
                    if (!$user->save()) {
                        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '邮箱修改失败']));
                    }
                }

                $res['ret'] = 1;
                $res['msg'] = '更新成功';
                return $response->getBody()->write(json_encode($res));
            case 'safe':
                $old_passwd = $request->getParam('old_passwd');
                $new_passwd = $request->getParam('new_passwd');
                $ret_passwd = $request->getParam('ret_passwd');
                $user = $this->user;

                if (!Hash::checkPassword($user->pass, $old_passwd)) {
                    return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '旧密码错误']));
                }
                if ($new_passwd != $ret_passwd) {
                    return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '两次密码输入不符合']));
                }
                if (strlen($new_passwd) < 8) {
                    return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '密码需8位以上']));
                }
                $hashPwd = Hash::passwordHash($new_passwd);
                $user->pass = $hashPwd;
                $user->save();
                $user->clean_link();

                $res['ret'] = 1;
                $res['msg'] = '更新成功';
                return $response->getBody()->write(json_encode($res));
            case 'sublink':
                $user->uuid = Uuid::uuid3(
                    Uuid::NAMESPACE_DNS,
                    $user->pass . '|' . time()
                )->toString();
                $user->save();
                $user->clean_link();
                $res['ret'] = 1;
                $res['msg'] = '重置成功';
                return $response->getBody()->write(json_encode($res));
            case 'telegram':
                $type = $request->getParam('type');
                if ($type == 'unbind') {
                    $user->TelegramReset();
                    $res['ret'] = 1;
                    $res['msg'] = '解绑成功';
                    return $response->getBody()->write(json_encode($res));
                }
            case 'send_email_code':
                $email = trim($request->getParam('email'));
                $metron = new MtEmail();
                $res = $metron->sendEmailCode($email, $user);
                return $response->getBody()->write(json_encode($res));
        }
    }

    /**
     * 表单远程校验
     */
    public function formCheck($request, $response, $args)
    {
        $type = $args['type'];
        $user = $this->user;
        if ($user == null || !$user->isLogin) {
            return 0;
        }

        switch ($type) {
            case 'email_name':
                $email = $request->getParam('email');
                if (User::where('email', $email)->first()) {
                    $res['valid'] = false;
                    return $response->getBody()->write(json_encode($res));
                }
                break;
            case 'old_passwd':
                $old_passwd = $request->getParam('old_passwd');
                $user = User::find($request->getParam('id'));
                if (!Hash::checkPassword($user->pass, $old_passwd)) {
                    $res['valid'] = false;
                    return $this->echoJson($response, $res);
                }
                break;
        }

        $res['valid'] = true;
        return $response->getBody()->write(json_encode($res));
    }

    /**
     * 处理套餐折算
     */
    public function PackageConversion($request, $response, $args)
    {
        if (!MetronSetting::get('shop_conversion')) {
            $res = ['ret' => 0, 'msg' => '管理员设置不允许折算'];
            return $response->getBody()->write(json_encode($res, JSON_UNESCAPED_UNICODE));
        }
        /* 识别用户 和 登录状态*/
        $user = $this->user;
        if (!$user->isLogin) {
            $res['ret'] = -1;
            return $response->getBody()->write(json_encode($res));
        }

        $id = $request->getParam('id');
        /* 获取套餐记录 */
        $bought = Bought::find($id);

        if ($bought->userid != $user->id) {
            $res = ['ret' => 0, 'msg' => '非法操作'];
            return $response->getBody()->write(json_encode($res, JSON_UNESCAPED_UNICODE));
        }

        $metron = new Metron();
        if ($request->getParam('ok') === 'ok') {
            /* 返还操作 */
            $res = $metron->PackageConversion_OK($user, $bought);
        } else {
            /* 计算返还信息 */
            $res = $metron->getConversionInfo($user, $bought);
        }

        return $response->getBody()->write(json_encode($res, JSON_UNESCAPED_UNICODE));
    }

    /**
     *  提前重置流量
     */
    public function advanceResetFlow($request, $response, $args)
    {
        $mt = MtAuth::Auth();
        if (!$mt['ret']) {
            return $response->getBody()->write(json_encode($mt, JSON_UNESCAPED_UNICODE));
        }

        $mode = $request->getParam('mode');

        if (MetronSetting::get('advanceResetFlow') !== true) {
            $res = ['ret' => 0, 'msg' => '管理员设置不允许重置'];
            return $response->getBody()->write(json_encode($res, JSON_UNESCAPED_UNICODE));
        }

        $user = $this->user;
        if (!$user->isLogin) {
            $res = ['ret' => -1, 'msg' => '登录状态已失效'];
            return $response->getBody()->write(json_encode($res));
        }
        if ($user->class === -1) {
            $res = ['ret' => 0, 'msg' => '未激活账号'];
            return $response->getBody()->write(json_encode($res));
        }
        $resetFlow_maxValue = MetronSetting::get('resetFlow_maxValue');
        if ($resetFlow_maxValue !== -1 && $user->transfer_enable - ($user->u + $user->d) > $resetFlow_maxValue * 1024 * 1024 * 1024) {
            $res = ['ret' => 0, 'msg' => '流量大于 ' . $resetFlow_maxValue . 'GB 无法重置' . PHP_EOL . '您当前剩余' . round(($user->transfer_enable - ($user->u + $user->d)) / 1024 / 1024 / 1024, 2) . 'GB'];
            return $response->getBody()->write(json_encode($res, JSON_UNESCAPED_UNICODE));
        }

        $metron = new Metron();
        if ($mode == 'get') {
            $res = $metron->getAdvanceResetFlow($user);
        } else if ($mode == 'set') {
            $res = $metron->setAdvanceResetFlow($user);
        }
        return $response->getBody()->write(json_encode($res, JSON_UNESCAPED_UNICODE));
    }

    /**
     * 节点信息
     */
    public function NodeInfo($request, $response, $args)
    {
        $user = $this->user;
        if (!$user->isLogin) {
            $res = ['ret' => -1, 'msg' => '登录状态已失效'];
            return $response->getBody()->write(json_encode($res));
        }

        $id = $args['id'];
        $node = Node::find($id);
        if ($node == null) {
            $res = ['ret' => 0, 'msg' => '节点错误,请刷新页面重新获取'];
            return $response->getBody()->write(json_encode($res));
        }
        if ($user->class < $node->node_class) {
            $res = ['ret' => 0, 'msg' => '权限不足'];
            return $response->getBody()->write(json_encode($res));
        }

        switch ($node->sort) {
            case '0':
            case '10':
                if ($node->mu_only != -1) {
                    # 不是多端口节点
                    $mu_port = Node::where('sort', '=', 9)->first();
                    $mu_user = User::where('port', '=', $mu_port->server)->value('port');
                    if (URL::SSRCanConnect($user, $mu_user)) {
                        $nodeinfo = $node->getItem($user, $mu_user, 0, 0);
                        $url = URL::getItemUrl($nodeinfo, 0);
                    } else if (URL::SSCanConnect($user, $mu_user)) {
                        $nodeinfo = $node->getItem($user, $mu_user, 0, 1);
                        $url = URL::getItemUrl($nodeinfo, 1);
                    }

                } else {
                    $mu_user = 0;
                    $nodeinfo = $node->getItem($user, 0);
                    if ($nodeinfo == null) {
                        $res = ['ret' => 0, 'msg' => '您的协议配置不支持连接该节点'];
                        return $response->getBody()->write(json_encode($res));
                    }
                    if (URL::SSRCanConnect($user, $mu_user)) {
                        $nodeinfo = $node->getItem($user, $mu_user, 0, 0);
                        $url = URL::getItemUrl($nodeinfo, 0);
                    } else if (URL::SSCanConnect($user, $mu_user)) {
                        $nodeinfo = $node->getItem($user, $mu_user, 0, 1);
                        $url = URL::getItemUrl($nodeinfo, 1);
                    }
                }
                $res = [
                    'ret' => 1,
                    'sort' => (int)$node->sort,
                    'info' => $nodeinfo,
                    'mu_user' => $mu_user,
                    'mu_only' => $node->mu_only,
                    'url' => $url
                ];
                break;
            case '11':
            case '12':
                $info = $node->getV2RayItem($user);
                $res = [
                    'ret' => 1,
                    'sort' => (int)$node->sort,
                    'info' => $info,
                    'url' => URL::getV2Url($user, $node),
                ];
                break;
            case '13':
                $info = $node->getV2RayPluginItem($user);
                $res = [
                    'ret' => 1,
                    'sort' => 13,
                    'info' => $info,
                ];
                break;
            case '14':
                $info = $node->getTrojanItem($user);
                $res = [
                    'ret' => 1,
                    'sort' => 14,
                    'info' => $info,
                ];
                break;
            case '15':
                $info = $node->getV2RayItem($user);
                $res = [
                    'ret' => 1,
                    'sort' => 15,
                    'info' => $info,
                    'url' => URL::getV2UrlVLESS($user, $node),
                ];
                break;
            default:
                $res = [
                    'ret' => 0,
                    'msg' => '该节点暂不支持查看配置',
                ];
                break;
        }

        return $response->getBody()->write(json_encode($res));

    }

    /**
     * ajax 数据表处理
     */
    public function ajax_datatable($request, $response, $args)
    {
        $name = $args['name'];                        # 得到表名
        $user = $this->user;                          # 得到用户
        $getMeta = $request->getQueryParams();           # 获取所有请求数据
        $page = $getMeta['pagination']['page'];       # 得到当前页码
        $sort = $getMeta['sort']['sort'];             # 得到排序方法
        $field = $getMeta['sort']['field'];            # 得到排序字段
        $perpage = $getMeta['pagination']['perpage'];    # 得到每页数量
        if ($user == null || !$user->isLogin) {
            return 0;
        }

        switch ($name) {
            case 'code':
                $query = Code::query()->where('type', '<>', '-2')->where('userid', $user->id)->orderBy($field, $sort);
                $total = $query->count();

                $codes = [];
                $data = [];
                if ($perpage != -1) {
                    $codes = $query->skip(($page - 1) * $perpage)->limit($perpage)->get();
                } else {
                    $codes = $query->get();
                }
                foreach ($codes as $code) {
                    $dataarr['id'] = $code->id;
                    $dataarr['code'] = $code->code;
                    $dataarr['number'] = $code->number . '元';
                    $dataarr['usedatetime'] = $code->usedatetime;
                    $data[] = $dataarr;
                }
                break;
            case 'shop':
                if (!$getMeta['query']) {
                    $query = Bought::query()->where('userid', $user->id)->orderBy($field, $sort);
                } else {
                    if (isset($getMeta['query']['usedd'])) {
                        $query = Bought::query()->where('userid', $user->id)->where('usedd', $getMeta['query']['usedd'])->orderBy($field, $sort);
                    }
                }
                $total = $query->count();

                $shops = [];
                $data = [];
                if ($perpage != -1) {
                    $shops = $query->skip(($page - 1) * $perpage)->limit($perpage)->get();
                } else {
                    $shops = $query->get();
                }
                $shop_conversion = MetronSetting::get('shop_conversion');
                $metron = new Metron();
                foreach ($shops as $shop) {
                    if ($shop_conversion === true) {
                        $shop_info = $metron->getConversionInfo($user, $shop);
                        $shop_pkcs = $shop_info['ret'];
                    }
                    $dataarr['id'] = $shop->id;
                    $dataarr['shopid'] = $shop->shopid;
                    $dataarr['shopname'] = $shop->shop()->name;
                    $dataarr['datetime'] = date('Y-m-d H:i:s', $shop->datetime);
                    $dataarr['renew'] = $shop->renew != 0 ? $shop->renew_date() : '不自动续费';
                    $dataarr['auto_reset'] = $shop->shop()->auto_reset_bandwidth != 0 ? '自动重置' : '不自动重置';
                    $dataarr['price'] = $shop->price;
                    $dataarr['usedd'] = $shop->usedd;
                    $dataarr['shop_pkcs'] = ($shop_conversion === true ? $shop_pkcs : 0);
                    $dataarr['caozuo'] = '<div class="dropdown dropdown-inline">
                                                    <a href="javascript:;" class="btn btn-sm btn-clean btn-icon" data-toggle="dropdown">
                                                        <span class="svg-icon svg-icon-md">
                                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                    <rect x="0" y="0" width="24" height="24"/>
                                                                    <path d="M5,8.6862915 L5,5 L8.6862915,5 L11.5857864,2.10050506 L14.4852814,5 L19,5 L19,9.51471863 L21.4852814,12 L19,14.4852814 L19,19 L14.4852814,19 L11.5857864,21.8994949 L8.6862915,19 L5,19 L5,15.3137085 L1.6862915,12 L5,8.6862915 Z M12,15 C13.6568542,15 15,13.6568542 15,12 C15,10.3431458 13.6568542,9 12,9 C10.3431458,9 9,10.3431458 9,12 C9,13.6568542 10.3431458,15 12,15 Z" fill="#000000"/>
                                                                </g>
                                                            </svg>
                                                        </span>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                                        <ul class="navi flex-column navi-hover py-2">
                                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                                                选择操作:
                                                            </li>
                                                            <li class="navi-item">
                                                                <a href="javascript:;" class="navi-link">
                                                                    <span class="navi-icon"><i class="la la-edit"></i></span>
                                                                    <span class="navi-text">关闭自动续费</span>
                                                                </a>
                                                            </li>
                                                            ' . ($shop_conversion ?
                            '<li class="navi-item">
                                                                <a href="javascript:;" class="navi-link" onclick="code.PackageConversion(\'' . $shop->id . '\')">
                                                                    <span class="navi-icon"><i class="la la-leaf"></i></span>
                                                                    <span class="navi-text">折算返还余额</span>
                                                                </a>
                                                            </li>' : '') .
                        '</ul>
                                                    </div>
                                                </div>';
                    $data[] = $dataarr;
                }
                break;
            case 'ticket':
                if (!$getMeta['query']) {
                    $query = Ticket::query()->where('userid', $user->id)->where('rootid', 0)->orderBy('datetime', 'desc');
                } else {
                    if (isset($getMeta['query']['status'])) {
                        $query = Ticket::query()->where('userid', $user->id)->where('rootid', 0)->where('status', '=', $getMeta['query']['status'])->orderBy('datetime', 'desc');
                    }
                }
                $total = $query->count();

                $logs = [];
                $data = [];
                if ($perpage != -1) {
                    $logs = $query->skip(($page - 1) * $perpage)->limit($perpage)->get();
                } else {
                    $logs = $query->get();
                }
                foreach ($logs as $log) {
                    $replyUser = User::find(Ticket::where('rootid', '=', $log->id)->orderBy('datetime', 'desc')->value('userid'));
                    if ($replyUser === null) {
                        $replyUser = User::find($log->userid);
                    }

                    $dataarr['id'] = $log->id;
                    $dataarr['title'] = $log->title;
                    $dataarr['user_name'] = $replyUser->user_name;
                    $dataarr['user_pic'] = $replyUser->gravatar;
                    $dataarr['datetime'] = $log->datetime;
                    $dataarr['status'] = $log->status;
                    $dataarr['caozuo'] = 0;
                    $data[] = $dataarr;
                }
                break;
            case 'paylist':
                if (!$getMeta['query']) {
                    $query = Paylist::query()->where('userid', $user->id)->orderBy($field, $sort);
                } else {
                    if (isset($getMeta['query']['status'])) {
                        $query = Paylist::query()->where('userid', $user->id)->where('status', $getMeta['query']['status'])->orderBy($field, $sort);
                    }
                }

                $total = $query->count();

                $pays = [];
                $data = [];
                if ($perpage != -1) {
                    $pays = $query->skip(($page - 1) * $perpage)->limit($perpage)->get();
                } else {
                    $pays = $query->get();
                }
                foreach ($pays as $pay) {
                    if ($pay->shop === null) {
                        $shop_data = '钱包充值';
                        $shop_status = $pay->status;
                    } else {
                        $shopinfo = json_decode($pay->shop, true);
                        if (isset($shopinfo['telegram']['the']) && $shopinfo['telegram']['the'] == 'code') {
                            $shop_data = 'Telegram 充值';
                        } elseif ($shopinfo['id'] == 0) {
                            $shop_data = '钱包充值';
                        } else {
                            $shop_data = '购买【' . Shop::where('id', $shopinfo['id'])->value('name') . '】';
                        }

                        if ($pay->status === 1) {
                            if ($shopinfo['id'] != 0) {
                                if (isset($shopinfo['status']) && $shopinfo['status'] === 1) {
                                    $shop_status = 2;
                                } else {
                                    $shop_status = 3;
                                }
                            } else {
                                $shop_status = 1;
                            }

                        } else {
                            $shop_status = 0;
                        }
                    }

                    $dataarr['id'] = $pay->id;
                    $dataarr['total'] = $pay->total . '元';
                    $dataarr['status'] = $pay->status;
                    $dataarr['shop_status'] = $shop_status;
                    $dataarr['tradeno'] = $pay->tradeno;
                    $dataarr['datetime'] = date('Y-m-d H:i:s', $pay->datetime);
                    $dataarr['shop'] = $shop_data;
                    $dataarr['caozuo'] = '<div class="dropdown dropdown-inline">
                                                    <a href="javascript:;" class="btn btn-sm btn-clean btn-icon" data-toggle="dropdown">
                                                        <span class="svg-icon svg-icon-md">
                                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                    <rect x="0" y="0" width="24" height="24"/>
                                                                    <path d="M5,8.6862915 L5,5 L8.6862915,5 L11.5857864,2.10050506 L14.4852814,5 L19,5 L19,9.51471863 L21.4852814,12 L19,14.4852814 L19,19 L14.4852814,19 L11.5857864,21.8994949 L8.6862915,19 L5,19 L5,15.3137085 L1.6862915,12 L5,8.6862915 Z M12,15 C13.6568542,15 15,13.6568542 15,12 C15,10.3431458 13.6568542,9 12,9 C10.3431458,9 9,10.3431458 9,12 C9,13.6568542 10.3431458,15 12,15 Z" fill="#000000"/>
                                                                </g>
                                                            </svg>
                                                        </span>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                                        <ul class="navi flex-column navi-hover py-2">
                                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">
                                                                选择操作:
                                                            </li>
                                                            <li class="navi-item">
                                                                <a href="javascript:;" class="navi-link" onclick="code.metronPay_restart(\'\', \'\', \'0\' , ' . $pay->id . ')">
                                                                    <span class="navi-icon"><i class="fab fa-amazon-pay"></i></span>
                                                                    <span class="navi-text">重新支付</span>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <a href="javascript:;" class="btn btn-sm btn-clean btn-icon" title="Delete" onclick="table.ajax_data_del(\'paylist\', ' . $pay->id . ' ,\'delete\')">
                                                        <span class="svg-icon svg-icon-md">
                                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                    <rect x="0" y="0" width="24" height="24"/>
                                                                    <path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#000000" fill-rule="nonzero"/>
                                                                    <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"/>
                                                                </g>
                                                            </svg>
                                                        </span>
                                                    </a>
                                                </div>';
                    $data[] = $dataarr;
                }
                break;
            case 'login_log':
                $time = $_SERVER['REQUEST_TIME'] - 86400 * 7;
                $logs = LoginIp::query()->where('userid', '=', $user->id)->where('type', '=', 0)->where('datetime', '>', $time)->orderBy('datetime', 'desc')->get();
                $data = [];
                $iplocation = new QQWry();
                foreach ($logs as $log) {
                    $logIp = $log->ip;
                    if (isset($data[$logIp])) {
                        continue;
                    }
                    $location = $iplocation->getlocation($logIp);
                    $dataarr['id'] = $log->id;
                    $dataarr['ip'] = $logIp;
                    $dataarr['location'] = iconv("gbk", "utf-8//IGNORE", $location['country']) . iconv("gbk", "utf-8//IGNORE", $location['area']);;
                    $dataarr['datetime'] = $log->datetime;
                    $data[$logIp] = $dataarr;
                    if (count($data) === 3) {
                        break;
                    }
                }
                break;
            case 'use_log':
                $time = $_SERVER['REQUEST_TIME'] - 86400 * 7;
                $logs = Ip::query()->where('userid', '=', $user->id)->where('datetime', '>', $time)->orderBy('datetime', 'desc')->get();
                $data = [];
                $iplocation = new QQWry();
                foreach ($logs as $log) {
                    $logIp = $log->ip;
                    if (isset($data[$logIp])) {
                        continue;
                    }
                    $location = $iplocation->getlocation($logIp);
                    $dataarr['id'] = $log->id;
                    $dataarr['ip'] = $logIp;
                    $dataarr['location'] = iconv("gbk", "utf-8//IGNORE", $location['country']) . iconv("gbk", "utf-8//IGNORE", $location['area']);;
                    $dataarr['datetime'] = $log->datetime;
                    $data[$logIp] = $dataarr;
                    if (count($data) === 3) {
                        break;
                    }
                }
                break;
            case 'subscribe_log':
                if (!$getMeta['query']) {
                    $query = UserSubscribeLog::query()->where('user_id', $user->id)->orderBy($field, $sort);
                } else {
                    if (isset($getMeta['query']['subscribe_type'])) {
                        $query = UserSubscribeLog::query()->where('user_id', $user->id)->where('subscribe_type', $getMeta['query']['subscribe_type'])->orderBy($field, $sort);
                    }
                }
                $total = $query->count();

                $logs = [];
                $data = [];
                if ($perpage != -1) {
                    $logs = $query->skip(($page - 1) * $perpage)->limit($perpage)->get();
                } else {
                    $logs = $query->get();
                }
                $iplocation = new QQWry();
                foreach ($logs as $log) {
                    $location = $iplocation->getlocation($log->request_ip);
                    $dataarr['id'] = $log->id;
                    $dataarr['subscribe_type'] = $log->subscribe_type;
                    $dataarr['request_ip'] = $log->request_ip;
                    $dataarr['location'] = iconv("gbk", "utf-8//IGNORE", $location['country']) . iconv("gbk", "utf-8//IGNORE", $location['area']);
                    $dataarr['request_time'] = $log->request_time;
                    $dataarr['request_user_agent'] = $log->request_user_agent;
                    $dataarr['caozuo'] = '<div href="javascript:void(0);" onclick="table.ajax_data_del(\'subscribe_log\', ' . $log->id . ' ,\'delete\')" class="btn btn-sm btn-clean btn-icon btn-icon-md" title="删除"><i class="la la-trash"></i></div>';
                    $data[] = $dataarr;
                }
                break;
            case 'traffic_log':
                if (!$getMeta['query']) {
                    $query = TrafficLog::query()->where('user_id', $user->id)->where('log_time', '>', time() - 3 * 86400)->orderBy($field, $sort);
                } else {
                    if (isset($getMeta['query']['subscribe_type'])) {
                        $query = UserSubscribeLog::query()->where('user_id', $user->id)->where('subscribe_type', $getMeta['query']['subscribe_type'])->orderBy($field, $sort);
                        $query = TrafficLog::query()->where('user_id', $user->id)->where('log_time', '>', time() - 3 * 86400)->orderBy($field, $sort);
                    }
                }
                $total = $query->count();

                $logs = [];
                $data = [];
                if ($perpage != -1) {
                    $logs = $query->skip(($page - 1) * $perpage)->limit($perpage)->get();
                } else {
                    $logs = $query->get();
                }
                foreach ($logs as $log) {
                    $dataarr['id'] = $log->id;
                    $dataarr['node_id'] = $log->node_id;
                    $dataarr['node_name'] = $log->node()->name;
                    $dataarr['rate'] = $log->rate;
                    $dataarr['traffic'] = $log->traffic;
                    $dataarr['log_time'] = $log->log_time;
                    $data[] = $dataarr;
                }
                break;
            case 'detect_log':
                $query = DetectLog::query()->orderBy('id', 'desc')->where('user_id', $user->id);
                $total = $query->count();

                $logs = [];
                $data = [];
                if ($perpage != -1) {
                    $logs = $query->skip(($page - 1) * $perpage)->limit($perpage)->get();
                } else {
                    $logs = $query->get();
                }
                foreach ($logs as $log) {
                    $dataarr['id'] = $log->id;
                    $dataarr['node_id'] = $log->node_id;
                    $dataarr['node_name'] = $log->Node()->name;
                    $dataarr['list_id'] = $log->list_id;
                    $dataarr['rule_name'] = $log->DetectRule()->name;
                    $dataarr['rule_text'] = $log->DetectRule()->text;
                    $dataarr['rule_regex'] = $log->DetectRule()->regex;
                    $dataarr['rule_type'] = ($log->DetectRule()->type === 1 ? '数据包明文匹配' : ($log->DetectRule()->type === 2 ? '数据包 hex 匹配' : '未知'));
                    $dataarr['datetime'] = $log->datetime;
                    $data[] = $dataarr;
                }
                break;
            case 'detect_rule':
                $query = DetectRule::query()->orderBy($field, $sort);
                $total = $query->count();
                $logs = [];
                $data = [];
                if ($perpage != -1) {
                    $logs = $query->skip(($page - 1) * $perpage)->limit($perpage)->get();
                } else {
                    $logs = $query->get();
                }
                foreach ($logs as $log) {
                    $dataarr['id'] = $log->id;
                    $dataarr['name'] = $log->name;
                    $dataarr['text'] = $log->text;
                    $dataarr['regex'] = $log->regex;
                    $dataarr['type'] = ($log->type === 1 ? '数据包明文匹配' : ($log->type === 2 ? '数据包 hex 匹配' : '未知'));
                    $data[] = $dataarr;
                }
                break;
            case 'relay_rule':
                $query = Relay::where('user_id', $user->id)->orwhere('user_id', 0)->orderBy($field, $sort);
                $total = $query->count();
                $logs = [];
                $data = [];
                if ($perpage != -1) {
                    $logs = $query->skip(($page - 1) * $perpage)->limit($perpage)->get();
                } else {
                    $logs = $query->get();
                }
                foreach ($logs as $log) {
                    $dataarr['id'] = $log->id;
                    $dataarr['name'] = $log->source_node_id == 0 ? '所有节点' : $log->Source_Node()->name;
                    $dataarr['dist_name'] = $log->Dist_Node() == null ? '不进行中转' : $log->Dist_Node()->name;
                    $dataarr['port'] = $log->port == 0 ? '所有端口' : $log->port;
                    $dataarr['source_class'] = $log->Source_Node()->node_class;
                    $dataarr['dist_class'] = $log->Dist_Node()->node_class;
                    $dataarr['priority'] = $log->priority;
                    $dataarr['user_id'] = $log->user_id;
                    $data[] = $dataarr;
                }
                break;
            case 'relay_link':
                $nodes = Node::where(static function ($query) use ($user) {
                    $query->Where('node_group', '=', $user->node_group)->orWhere('node_group', '=', 0);
                })->where('type', 1)->where(static function ($query) {
                    $query->Where('sort', 10)->orWhere('sort', 12);
                })->where('node_class', '<=', $user->class)->orderBy('name')->get();

                $pathset = new \ArrayObject();
                $relay_rules = Relay::where('user_id', $user->id)->orwhere('user_id', 0)->get();
                $mu_nodes = Node::where('sort', 9)->where('node_class', '<=', $user->class)->where('type', '1')->where(static function ($query) use ($user) {
                    $query->where('node_group', '=', $user->node_group)->orWhere('node_group', '=', 0);
                })->get();

                foreach ($nodes as $node) {
                    if ($node->mu_only == 0 || $node->mu_only == -1) {
                        $relay_rule = Tools::pick_out_relay_rule($node->id, $user->port, $relay_rules);

                        if ($relay_rule != null) {
                            $pathset = Tools::insertPathRule($relay_rule, $pathset, $user->port);
                        }
                    }

                    if ($node->custom_rss == 1 || $node->mu_only == -1) {
                        foreach ($mu_nodes as $mu_node) {
                            $mu_user = User::where('port', '=', $mu_node->server)->first();

                            if ($mu_user == null) {
                                continue;
                            }

                            if (!($mu_user->class >= $node->node_class && ($node->node_group == 0 || $node->node_group == $mu_user->node_group))) {
                                continue;
                            }

                            if ($mu_user->is_multi_user != 2) {
                                $relay_rule = Tools::pick_out_relay_rule($node->id, $mu_user->port, $relay_rules);

                                if ($relay_rule != null) {
                                    $pathset = Tools::insertPathRule($relay_rule, $pathset, $mu_user->port);
                                }
                            }
                        }
                    }
                }

                foreach ($pathset as $path) {
                    foreach ($pathset as $index => $single_path) {
                        if ($path != $single_path && $path->port == $single_path->port) {
                            if ($single_path->end_node->id == $path->begin_node->id) {
                                $path->begin_node = $single_path->begin_node;
                                if ($path->begin_node->isNodeAccessable() == false) {
                                    $path->path = '<font color="#FF0000">' . $single_path->begin_node->name . '</font>' . ' → ' . $path->path;
                                    $path->status = '阻断';
                                } else {
                                    $path->path = $single_path->begin_node->name . ' → ' . $path->path;
                                    $path->status = '通畅';
                                }

                                $pathset->offsetUnset($index);
                                continue;
                            }

                            if ($path->end_node->id == $single_path->begin_node->id) {
                                $path->end_node = $single_path->end_node;
                                if ($single_path->end_node->isNodeAccessable() == false) {
                                    $path->path = $path->path . ' → ' . '<font color="#FF0000">' . $single_path->end_node->name . '</font>';
                                    $path->status = '阻断';
                                } else {
                                    $path->path = $path->path . ' → ' . $single_path->end_node->name;
                                }

                                $pathset->offsetUnset($index);
                                continue;
                            }
                        }
                    }
                }

                $logs = [];
                $data = [];
                foreach ($pathset as $path) {
                    $dataarr['port'] = $path->port;
                    $dataarr['begin_node'] = $path->begin_node->name;
                    $dataarr['end_node'] = $path->end_node->name;
                    $dataarr['path'] = $path->path;
                    $dataarr['status'] = $path->status;
                    $data[] = $dataarr;
                }
                $res['data'] = $data;
                return $response->getBody()->write(json_encode($res));
            case 'invite_back':
                $query = Payback::where('ref_by', '=', $user->id)->orderBy($field, $sort);
                $total = $query->count();
                $logs = [];
                $data = [];
                # 每页数量
                if ($perpage != -1) {
                    $logs = $query->skip(($page - 1) * $perpage)->limit($perpage)->get();
                } else {
                    $logs = $query->get();
                }
                foreach ($logs as $log) {
                    $dataarr['id'] = $log->id;
                    $dataarr['userid'] = $log->userid;
                    $dataarr['ref_get'] = $log->ref_get;
                    $dataarr['datetime'] = $log->datetime;
                    $data[] = $dataarr;
                }
                break;
            case 'invite_user':
                if (!$getMeta['query']) {
                    $query = User::query()->where('ref_by', '=', $user->id)->orderBy($field, $sort);
                } elseif (isset($getMeta['query']['invite_user_status']) && $getMeta['query']['invite_user_status'] == 1) {
                    # 只获取有充值的用户
                    $codes = Code::groupBy('userid')->pluck('userid')->toArray();
                    $query = User::query()->whereIn('id', $codes)->where('ref_by', '=', $user->id)->orderBy($field, $sort);
                } elseif (isset($getMeta['query']['invite_user_status']) && $getMeta['query']['invite_user_status'] == 0) {
                    # 只获取没有充值的用户
                    $codes = Code::groupBy('userid')->pluck('userid')->toArray();
                    $query = User::query()->whereNotIn('id', $codes)->where('ref_by', '=', $user->id)->orderBy($field, $sort);
                }
                $total = $query->count();
                $logs = [];
                $data = [];
                # 每页数量
                if ($perpage != -1) {
                    $logs = $query->skip(($page - 1) * $perpage)->limit($perpage)->get();
                } else {
                    $logs = $query->get();
                }
                foreach ($logs as $log) {
                    # 用户累计充值
                    if (!$number = Code::where('userid', '=', $log->id)->sum('number')) {
                        $number = 0;
                    }
                    # 通过该用户获得的返利
                    if (!$backprice = Payback::where('userid', '=', $log->id)->sum('ref_get')) {
                        $backprice = 0;
                    }
                    $dataarr['id'] = $log->id;
                    $dataarr['user_name'] = $log->user_name;
                    $dataarr['reg_date'] = $log->reg_date;
                    $dataarr['accumulated_recharge'] = $number . ' 元';
                    $dataarr['get_rebates'] = $backprice . ' 元';
                    $data[] = $dataarr;
                }
                break;
            default:
                return 0;
                break;
        }

        $meta = [
            "page" => $page,                       # 当前页码
            "pages" => ceil($total / $perpage),     # 总页数
            "perpage" => $perpage,                    # 每页数量
            "total" => $total,                      # 总数量
            "sort" => $sort,                       # 排序方式
            "field" => $field,                      # 排序字段
        ];
        $res['meta'] = $meta;
        $res['data'] = $data;
        return $response->getBody()->write(json_encode($res));
    }

    /**
     * ajax 删除数据
     */
    public function ajax_datatable_delete($request, $response, $args)
    {
        $mt = MtAuth::Auth();
        if (!$mt['ret']) {
            return $response->getBody()->write(json_encode($mt, JSON_UNESCAPED_UNICODE));
        }

        $name = $request->getParam('name');
        $id = $request->getParam('id');
        $mode = $request->getParam('mode');

        switch ($name) {
            case 'paylist':
                $table = Paylist::find($id);

                if ($table->status === 1) {
                    $res = ['ret' => 0, 'msg' => '已到账的订单无法删除'];
                    return $response->getBody()->write(json_encode($res, JSON_UNESCAPED_UNICODE));
                }

                if ($table->userid !== $this->user->id) {
                    $res = ['ret' => 0, 'msg' => '非法操作'];
                    return $response->getBody()->write(json_encode($res, JSON_UNESCAPED_UNICODE));
                }

                break;
            case('subscribe_log'):
                $table = UserSubscribeLog::find($id);

                if ($table->user_id !== $this->user->id) {
                    $res = ['ret' => 0, 'msg' => '非法操作'];
                    return $response->getBody()->write(json_encode($res, JSON_UNESCAPED_UNICODE));
                }
                break;
            default:
                $res = ['ret' => 0, 'msg' => '删除失败'];
                return $response->getBody()->write(json_encode($res, JSON_UNESCAPED_UNICODE));
                break;
        }

        if (!$table->delete()) {
            $res = ['ret' => 0, 'msg' => '删除失败'];
            return $response->getBody()->write(json_encode($res, JSON_UNESCAPED_UNICODE));
        }
        $res = ['ret' => 1, 'msg' => '删除成功'];
        return $response->getBody()->write(json_encode($res, JSON_UNESCAPED_UNICODE));
    }

    /**
     * 检测账号状态
     */
    public function AccountCheck($request, $response, $args)
    {
        $type = $request->getParam('type');
        $key = $request->getParam('key');

        $url = "https://idmsa.apple.com/appleauth/auth/signin";
        $data = [
            "accountName" => MetronSetting::get('shared_account')[$type][$key]['account'],
            "rememberMe" => false,
            "password" => MetronSetting::get('shared_account')[$type][$key]['passwd'],
        ];
        $header = [];
        $header[] = 'Content-Type: application/json';
        $header[] = 'Accept: application/json, text/javascript, */*; q=0.01';
        $header[] = 'Accept-Encoding: gzip, deflate, br';
        $header[] = 'Accept-Language: zh-CN,zh;q=0.9,und;q=0.8,en;q=0.7';

        $curl = curl_init();  //初始化curl
        curl_setopt($curl, CURLOPT_URL, $url); //抓取指定网页
        curl_setopt($curl, CURLOPT_HEADER, 0);    //显示header
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);    //要求结果为字符串且输出到屏幕上
        curl_setopt($curl, CURLOPT_POST, 1);  //post提交方式
        curl_setopt($curl, CURLOPT_HTTPHEADER, $header);  // 发送 header
        curl_setopt($curl, CURLOPT_AUTOREFERER, 0);//自动设置referer
        curl_setopt($curl, CURLOPT_ENCODING, "");   //解压缩防止乱码
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);//设置跟踪页面的跳转，有时候你打开一个链接，在它内部又会跳到另外一个，就是这样理解
        curl_setopt($curl, CURLOPT_TIMEOUT, 60);//设置超时限制，防止死循环
        //curl_setopt($curl, CURLOPT_COOKIEJAR, 'cookie.txt');//获取的cookie 保存到指定的 文件路径，我这里是相对路径，可以是$变量
        //curl_setopt($curl, CURLOPT_COOKIEFILE, 'cookie.txt');//要发送的cookie文件，注意这里是文件，还一个是变量形式发送
        //curl_setopt ($curl, CURLOPT_REFERER,$referer_); //在HTTP请求中包含一个'referer'头的字符串。告诉服务器我是从哪个页面链接过来的，服务器籍此可以获得一些信息用于处理。
        //curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']); // 模拟用户使用的浏览器
        curl_setopt($curl, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36'); // 模拟使用的浏览器
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);    // 跳过证书检查
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);    // 从证书中检查SSL加密算法是否存在
        curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($data));   //设置表单

        $done = curl_exec($curl); //运行curl
        //preg_match('/Set-Cookie:(.*);/iU',$content,$str); //这里采用正则匹配来获取cookie并且保存它到变量$str里，这就是为什么上面可以发送cookie变量的原因
        //$cookie = $str[1]; //获得COOKIE（SESSIONID）

        curl_close($curl);    // 关闭curl

        $res_array = json_decode($done, true);

        if ($res_array['authType'] == 'sa') {
            $res = ['ret' => 1, 'code' => 'sa', 'msg' => '账号状态正常'];
        }
        if ($res_array['serviceErrors'][0]['code'] == '-20209') {
            $res = ['ret' => 0, 'code' => '-20209', 'msg' => 'Apple ID 已被锁定'];
        }
        if ($res_array['serviceErrors'][0]['code'] == '-20101') {
            $res = ['ret' => 0, 'code' => '-20101', 'msg' => 'Apple ID 或密码不正确'];
        }

        return $response->getBody()->write(json_encode($res, JSON_UNESCAPED_UNICODE));
    }

    /**
     *  节点筛选
     */
    public function nodeFilterSave($request, $response, $args)
    {
        $user = $this->user;
        if (!$user->isLogin) {
            $res['ret'] = -1;
            return $response->getBody()->write(json_encode($res));
        }

        $mode = $request->getParam('filter_mode');
        $sort = explode("-", $request->getParam('filter_sort'));
        $link = Link::where('type', 11)->where('userid', $user->id)->first();
        if ($link == null) {
            return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '您的订阅异常, 请尝试重置订阅']));
        }
        $rule = json_decode($link->filter, true);

        switch ($mode) {
            case ('all'):
                $rule['mode'] = 'all';
                break;
            case ('nodes_class'):
                $rule['mode'] = 'nodes_class';
                $rule['nodes_class']['the'] = $request->getParam('nodes_class_the');
                if ($rule['nodes_class']['the'] === null) {
                    return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '请指定订阅节点等级']));
                }
                $rule['nodes_class']['value'] = $request->getParam('nodes_class_value');
                break;
            case ('nodes_id'):
                $rule['mode'] = 'nodes_id';
                $rule['nodes_id'] = $request->getParam('nodes_id');
                if ($rule['nodes_id'] === null) {
                    return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '节点不能为空']));
                }
                break;
        }

        $rule['sort'] = ['type' => $sort[0], 'value' => $sort[1]];
        if (MetronSetting::get('nodes_miniName') === true) {
            $rule['mininame'] = (int)$request->getParam('filter_mininame');
        }

        $link->filter = json_encode($rule);
        if ($link->save()) {
            return $response->getBody()->write(json_encode(['ret' => 1, 'msg' => '保存成功, ' . PHP_EOL . '请更新订阅获取最新节点']));
        }

        return $response->getBody()->write(json_encode(['ret' => 0, 'msg' => '保存失败']));
    }

    /**
     * ajax 图表数据处理
     */
    public function ajax_datachart($request, $response, $args)
    {
        $name = $args['name'];                        # 得到表名
        $key = $request->getParam('key');            # 得到 Key
        $user = $this->user;                          # 得到用户
        if ($user == null || !$user->isLogin) {
            return 0;
        }

        $data = [];
        switch ($name) {
            case 'index_node_traffic':
                $logs = TrafficLog::where('user_id', $user->id)->where('log_time', '>', time() - 3 * 86400)->orderBy('id', 'desc')->get();
                foreach ($logs as $log) {
                    if (!isset($data[$log->node_id])) {
                        $dataarr['node_name'] = $log->node()->name;
                        $dataarr['ud'] = ($log->u + $log->d) * $log->rate;
                        $dataarr['traffic'] = Tools::flowAutoShow($dataarr['ud']);
                        $dataarr['mb'] = round($dataarr['ud'] / 1048576, 2);
                        $data[$log->node_id] = $dataarr;
                    } else {
                        $data[$log->node_id]['ud'] = ($log->u + $log->d) * $log->rate + $data[$log->node_id]['ud'];
                        $data[$log->node_id]['traffic'] = Tools::flowAutoShow($data[$log->node_id]['ud']);
                        $data[$log->node_id]['mb'] = round($data[$log->node_id]['ud'] / 1048576, 2);
                    }
                }
                foreach ($data as $da => $ta) {
                    if ($ta['mb'] < 10) {
                        unset($data[$da]);
                    }
                }
                if (empty($data)) {
                    $res['ret'] = 0;
                    $res['msg'] = '暂无记录';
                    return $response->getBody()->write(json_encode($res));
                }
                //var_dump($data);
                //{number_format($single_log->totalUsedRaw()/1024,2,'.', '')};
                break;
        }

        $res['ret'] = 1;
        $res['data'] = $data;
        return $response->getBody()->write(json_encode($res));
    }

    /**
     * 主题切换
     */
    public function changeTheme($request, $response, $args)
    {
        $user = $this->user;
        if ($user == null || !$user->isLogin) {
            return 0;
        }

        $type = $request->getParam('type');

        $config = $user->config;
        $config['theme_style'] = $type;
        $user->config = $config;
        $user->save();

        $res['ret'] = 1;
        $res['msg'] = '切换成功';
        return $response->getBody()->write(json_encode($res));
    }
}
