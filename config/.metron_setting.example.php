<?php

// ┌───────────────────────────────────────────────────────────────────────────────────────────────────────┐ \\
// │ Metron - SSPanle Theme                                                                                │ \\
// ├───────────────────────────────────────────────────────────────────────────────────────────────────────┤ \\
// │ Copyright © 2020 (https://t.me/WeChatTeam)                                                            │ \\
// └───────────────────────────────────────────────────────────────────────────────────────────────────────┘ \\

#####  主题设置  --------------------------------------------------------------------------------------------
$_MT['assets_true'] = true;                 // 目前不要动, 保持 true
$_MT['assets_bb']   = '3.0.2';                // 版本
$_MT['assets_url']  = $_MT['assets_true']?'https://cdn.jsdelivr.net/gh/mt-theme/metron-assets@'.$_MT['assets_bb'].'/metron' : '/theme/metron';

$_MT['style_shadow'] = 'rounded-lg shadow';    // 卡片圆角: rounded / rounded-lg / rounded-xl ; 卡片阴影: shadow / shadow-lg

#####  落地页设置  --------------------------------------------------------------------------------------------
$_MT['index_enable'] = false;                // true: 开启落地页 false:关闭落地页,并自动跳转至用户中心  落地页还在咕,先不要开

#####  背景图设置  --------------------------------------------------------------------------------------------
// 登录/注册页面 背景图
$_MT['index_background_image'] = "https://cdn.jsdelivr.net/gh/BobCoderS9/metron-assets@3.0.2/metron/media/bg/bg-2.jpg";
// 登录/注册页面 LOGO
$_MT['index_background_logo'] = "https://cdn.jsdelivr.net/gh/BobCoderS9/metron-assets@3.0.2/metron/media/logos/user.png";
// 用户中心顶部背景图
$_MT['user_background_top'] = "https://cdn.jsdelivr.net/gh/BobCoderS9/metron-assets@3.0.2/metron/media/bg/bg-01-450.jpg";


#####  重要通知弹窗  --------------------------------------------------------------------------------------------
$_MT['domain_info']  = true;                     // 当用户访问网站的地址不是config设置的, 提示用户转到 config 地址
$_MT['domain_time']  = 15;                     // 弹出后间隔多久再提示 (单位:分钟)

$_MT['enable_pop']   = true;                      // 开启右下角重要通知弹窗
$_MT['pop_time']     = 1440;                          // 每次弹出间隔多久时间 (单位:分钟)

/**  弹窗内容
 * [ 加粗 font-weight-bold 灰色 text-muted 紫色 text-primary 蓝色 text-info 绿色 text-success 橙色 text-warning 红色 text-danger ]
 * [ 左 : text-left 中 : text-center 右 : text-right ];
 **/
$_MT['pop_text'] = '
<p class="text-danger font-weight-bold">如何防止网站被污染打不开？</p>
<p class="text-muted font-weight-bold">
收藏网址 <a href="https://url.com" target=”_blank”>https://url.com</a> (如果卡在英文界面进不去，请把网页翻译功能关闭重试)，点击第一个图标即可进入最新网站，后续如有更换域名也会优先更新此处链接<br>
</p>
';

#####  签到设置  --------------------------------------------------------------------------------------------
$_MT['daily_bonus_mode'] = 'level';  // 签到的模式，sspanel: 为原版模式，level: 为不同等级给不同的签到流量
$_MT['daily_bonus_settings'] = [  // 为不同等级给不同的签到流量，仅在 daily_bonus_mode 为 level 时生效
    0 => [  // 用户等级
        'min' => 0,  // 最低流量，单位为MB
        'max' => 999   // 最高流量，单位为MB
    ],
    1 => [
        'min' => 100,
        'max' => 999
    ],
    2 => [
        'min' => 100,
        'max' => 1024
    ],
    3 => [
        'min' => 100,
        'max' => 1024
    ],
];

#####  返利设置  --------------------------------------------------------------------------------------------
$_MT['c_rebate']            = false;            // true: 默认所有用户都循环返利, false:除了单独用户设置为循环外,其他用户都只会获取被邀请用户的首次充值金额
$_MT['invite_user']         = false;            // 用户可查看自己邀请的所有用户
$_MT['invite_user_for']     = false;            // 只有设置为循环返利的用户可查看自己邀请的所有用户(仅当上方选项开启时生效)

$_MT['take_back_total']     = 1;        // 申请转账提现需大于多少金额, 0 为不限制
$_MT['agent_menu_enable']   = true;     // 菜单显示 代理中心 (代理中心需额外 Agent 授权, 未购买无法使用);
$_MT['take_cash_enable']    = false;    // 非代理商(邀请注册页面)允许申请现金提现, 需主题有 Agent 授权, 没有授权保持关闭, 默认有提现至钱包余额
$_MT['take_account_type']   = [ '支付宝', 'USDT-ERC20', 'USDT-TRC20'];  // 设置提现账号时允许用户设置的账号类型, 可以以数组方式自行添加, 只是方便管理识别提现账号类型 没有其他作用

$_MT['recharge_enable'] = false;       // 开启购买套餐活动
// 【购买套餐】赠送流量/时长
$_MT['recharge_shop'] = [
    'type' => 1,    // 1:流量(GB) 2:时间(天) 3:流量+时间
    'shop_time' => [
        1 => 10,    //套餐ID => 赠送时间（天）
        2 => 20,
        3 => 30,
    ],
    'shop_flow' => [
        1 => 10,    //套餐ID => 赠送流量（GB）
        2 => 20,
        3 => 30,
    ],
];

#####  会员等级名称  --------------------------------------------------------------------------------------------
$_MT['user_level'] = [      // 等级 => 对应的名称显示
   -1 => '暂未激活',
    0 => '免费会员',
    1 => '青铜会员',
    2 => '白银会员',
    3 => '钻石会员',
];
#####  用户注册  --------------------------------------------------------------------------------------------
$_MT['register_code']               = false;          // true: 注册必须邀请码, false: 邀请码可不填 (admin面板 - 用户注册 - 将注册模式改为 invite)
$_MT['register_restricted_email']   = true;      // 设置为true时，注册时必须使用指定的邮箱后缀;
$_MT['list_of_available_mailboxes'] = [ '@qq.com', '@gmail.com', '@outlook.com', '@163.com', '@126.com', '@live.com', '@msn.com', '@yeah.net', '@foxmail.com', ];         // 注册邮箱可以使用的邮箱后缀,仅在上面设置为true时生效;
$_MT['disable_mailbox_list']        = [ '@bcaoo.com', '@chacuo.net', '@tmpmail.net', '@tmail.ws', '@tmpmail.org', '@moimoi.re', '@bccto.me', '@027168.com', '@disbox.org', '@linshiyouxiang.net', '@t.odmail.cn', '@tmails.net', '@moakt.co', '@moakt.ws', '@disbox.net', '@bareed.ws', ];            // 注册邮箱禁止使用的邮箱后缀;

# ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────┐
# │                                              客服系统 设置                                                │
# └──────────────────────────────────────────────────────────────────────────────────────────────────────────┘
$_MT['enable_cust']                 = 'none';                   // 使用哪种客服系统  none: 关闭 目前支持: crisp | chatra
$_MT['enable_cust_auth']            = true;                     // 在登录注册页显示客服

# crisp  |  https://crisp.chat
$_MT['crisp_id']                    = '';  // Crisp 的网站ID，格式类似 '18b46e92-eb21-76d3-bfb7-8f2ae9adba64'

# chatra  |  https://chatra.io
$_MT['chatra_id']                   = '';  // Chatra 的 ChatraID，可以在 Chatra 提供的网站代码里找到

# ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────┐
# │                                              页面内容 设置                                                │
# └──────────────────────────────────────────────────────────────────────────────────────────────────────────┘
# 节点中转规则
$_MT['node_relay_enable'] = true;       // 导航菜单显示 节点中转 设置
# 限制地区访问
$_MT['Restricted_access'] = false;   // 开启限制地区访问网站
$_MT['Restricted_area'] = [     // 数组, 不允许访问的地区
    '北京', '天津', '河北', '山西', '内蒙古', '辽宁', '吉林', '黑龙江', '上海', '江苏', '浙江', '安徽', '福建', '江西', '山东', '河南',
    '湖北', '湖南', '广东', '广西', '海南', '重庆', '四川', '贵州', '云南', '西藏', '陕西', '甘肃', '青海', '宁夏', '新疆',
];
$_MT['Restricted_parm'] = [ '/mod_mu', '/payment', '/link', '/api', '/getClient', '/appApi'];       // 数组, 排除指定路径不进行限制
# 用户资料页面  -----------------------------------------------------------------------------------------------
$_MT['change_username']       = true;        // 允许用户修改昵称
$_MT['change_usermail']       = true;        // 允许用户修改邮箱(开启注册验证码,修改时也需要验证码,否则修改无需验证码)
# 帮助文档页面
$_MT['help_Keywords'] = ['下载', '套餐', 'SSR',];     // 文档中心推荐用户搜索的默认关键字
# 节点订阅筛选
$_MT['nodes_filter'] = false;        // 开启订阅节点筛选
$_MT['nodes_miniName'] = false;     // 允许用户开启节点正则匹配简化节点名称, 启用该选项需熟悉使用正则表达式
$_MT['nodes_regex'] = '/\[(.*?)\]/';     // 节点筛选设置中节点名称缩短的正则表达式, 默认 [ ] 中的字符都会被移除
# 主页订阅框显示哪些订阅     可选: ssr, v2ray, surge, clash, surfboard, kitsunebi, shadowrocket, quantumult, quantumultx,
$_MT['index_sub'] = [
    'ssr',
    'v2ray',
    'surge',
    'clash',
    'surfboard',
    'kitsunebi',
    'quantumult',
    'quantumultx',
    'shadowrocket',
    'stash'
];
# 共享账号
$_MT['shared_account_enable'] = true;       // 显示 共享账号 导航菜单
$_MT['shared_account'] = [
    'AppleID' => [  // 共享账号的类型, 不要改动这个字符
        'show' => true,    // 是否显示该类型共享账号
        # 开始::一个账号    一个 array(), 为一个账号, 可以复制增加
        array(
            'name'      => 'Apple ID 1',     // 名称
            'account'   => '123456@qq.com',   // 账号
            'passwd'    => '123456',   // 密码
            'class'     => 1,    // 用户大于等于该等级可见
            'check'     => true,    // 开启检测账号状态
            'hidepawd'  => false,    // 隐藏密码仅让用户复制,防止用户手动输入密码错误导致账号频繁被锁定
        ),
        # 结束::一个账号
    ],
    'Netflix' => [
        'show' => false,
        array(
            'name' => 'Netflix 1',
            'account' => '111111@qq.com',
            'passwd' => '123456',
            'class' => 1
        ),
    ],
    'HBO' => [
        'show' => false,
        array(
            'name' => 'HBO 1',
            'account' => '111111@qq.com',
            'passwd' => '123456',
            'class' => 2
        ),
    ],
    'Hulu' => [
        'show' => false,
        array(
            'name' => 'HBO 1',
            'account' => '111111@qq.com',
            'passwd' => '123456',
            'class' => 1
        ),
    ],
];

# ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────┐
# │                                              支付系统 设置                                                │
# └──────────────────────────────────────────────────────────────────────────────────────────────────────────┘
# 使用哪种支付方式需要在 Config 中设置好参数
# 目前支持的支付方式: 不使用请设置为 none
# 支付方式后面带 _qr 为使用站内二维码方式, 无需离开网站即可支付, _url 为跳转到支付链接进行支付, 不带的默认使用原支付的方式
# 支付宝: codepay |stripe | paytaro | wolfpay_ur | wolfpay_qr | yftpay | epay | f2fpay | pcexpay
# 微信  : codepay | stripe | paytaro | wolfpay_ur | payjs
# QQ钱包: codepay |

$_MT['pay_alipay']     = 'none';        // 支付宝默认
$_MT['pay_alipay_2']     = 'none';        // 支付宝2
$_MT['pay_alipay_3']     = 'none';        // 支付宝3
$_MT['max_alipay_num'] = 0;     // 使用支付宝支付时, 金额大于等于设定值, 使用下方支付方式 (设置 0 不使用)
$_MT['max_alipay_pay'] = 'none';      // 支付金额大于上面设置的值时, 使用此支付方式

$_MT['pay_wxpay']      = 'none';      // 微信默认
$_MT['pay_wxpay_2']      = 'none';      // 微信2
$_MT['pay_wxpay_3']      = 'none';      // 微信3
$_MT['max_wxpay_num']  = 0;     // 使用微信支付时, 金额大于等于设定值, 使用下方支付方式 (设置 0 不使用)
$_MT['max_wxpay_pay']  = 'none';  // 支付金额大于上面设置的值时, 使用此支付方式

$_MT['pay_qqpay']      = 'none';      // QQ钱包默认
$_MT['max_qqpay_num']  = 0;     // 使用微信支付时, 金额大于等于设定值, 使用下方支付方式
$_MT['max_qqpay_pay']  = 'none';  // 支付金额大于上面设置的值时, 使用此支付方式

$_MT['pay_crypto']     = 'bobpay';	// 数字货币支付

$_MT['mix_amount'] = 0;     // 限制每次最低充值, 商店购买套餐不受此限制。（因为商店扣除余额后可能出现很低的金额）

# ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────┐
# │                                              商店套餐 设置                                                │
# └──────────────────────────────────────────────────────────────────────────────────────────────────────────┘
# 折算金额计算方式 time : 按套餐使用了多久计算, flow : 按用户当前流量和套餐流量对比计算 , auto : 自动计算套餐使用时间和流量, 按两者使用百分比最多的计算
# 流量包只按流量计算 且只购买当日才能退
$_MT['shop_conversion_mode']   = 'auto';
$_MT['shop_conversion']        = false;                      // 允许套餐折算返还余额
$_MT['shop_formalities']       = 2;                      // 套餐折算时扣除手续费 (单位: 百分比, 0 为不扣手续费) 不建议太高免得挨骂

$_MT['advanceResetFlow']       = false;                  // 提前重置流量
$_MT['resetFlow_maxValue']     = 5;                     // 用户流量低于多少(GB)时,才允许重置, -1为不限制

$_MT['shop_pop_enable']         = true;                 // 商店套餐顶部显示信息, 可用于显示给用户促销,优惠等
$_MT['shop_pop_info']           = '
<p>向用户显示可用的优惠码</p>
<p>或者编写相关套餐的优惠等待</p>
';                   // 套餐顶部显示的内容 使用 html 编写

$_MT['shop_activity_true']     = false;                     //是否显示活动套餐
$_MT['shop_activity_name']     = '活动限定';                 //活动套餐商品名称
$_MT['shop_activity_text']     = '限时购买套餐, 过时不候';    //活动套餐商品描述
$_MT['shop_activity_id']       = 1;                         //活动套餐商品id
$_MT['shop_activity_buy_time'] = '2020/03/15 00:00:00';     //活动截止购买时间, 到时间后套餐自动隐藏

$_MT['shop_Experience_true']   = true;    // 是否显示试用套餐
$_MT['shop_Experience_pos']    = 'top';    // 试用套餐卡片位置 top : 放于常规套餐前面, bottom : 放于常规套餐后面
$_MT['shop_Experience_plan']   = [
    '试用 A' => 1,     // 一行一个试用套餐 ID, 可增加 可删除, 建议1-4个之间
    '试用 B' => 2,
    '试用 C' => 3,
];

/**
 * 只需要填写商品的名称, 时长对应的商品ID,
 * 商品的支持特性 直接编辑套餐的 [服务支持] 中填写,格式为   true-全球节点分布;false-快速客服响应   减号左边 true:代表支持 false:代表不支持 右边为文字, 以英文分号;隔开
 */
$_MT['shop_plan'] = array(
    '青铜套餐' => array(                    //  对应商店显示的名称
        '描述' => array(  //  对应的商品描述, 目前取消了
            '月付' => 1,                   // 对应的商品ID
            '季度' => 2,
            '半年' => 3,
            '年付' => 4,
        ),
    ),
    '白银套餐' => array(            // 需要多个套餐可以自己复制array增加到下面
        '描述' => array(
            '月付' => 5,
            '季度' => 6,
            '年付' => 8,
        ),
    ),
);

# ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────┐
# │                                              节点相关 设置                                                │
# └──────────────────────────────────────────────────────────────────────────────────────────────────────────┘
$_MT['enable_webapi_email_hash'] = true;   // 节点webapi对接时 邮件地址进行md5加密
$_MT['enable_node_traffic_rate'] = true;   // 是否显示节点的流量倍率
$_MT['enable_online_user']       = true;   // 是否显示节点的在线人数
$_MT['enable_node_load']         = true;   // 是否显示节点的负载
$_MT['node_flag_mode']           = 'name';   // name: 从节点名字正则匹配地区(正则方法在.config.php国旗选项) info: 为从节点状态取值，在节点列表里编辑节点，填写节点状态为 us 则显示美国国旗。us这个是国家ISO 3166码，不懂就谷歌。
$_MT['node_class_name']          = [   //  节点的等级对应的名字
    0 => '公益节点',   // 格式为 节点等级 => 节点等级名字
    1 => '青铜节点',
    2 => '白银节点',
    3 => '钻石节点',
];

# ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────┐
# │                                              TG机器人 设置                                                │
# └──────────────────────────────────────────────────────────────────────────────────────────────────────────┘
# Telegram 私发至管理员
$_MT['Telegram_Admin']  = [1];      // 管理员的ID (只有这些管理员才能接收到TG通知)
$_MT['Telegram_Ticket'] = true;     // 开启工单的TG通知
$_MT['Telegram_Payment'] = true;    // 用户充值提醒

# ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────┐
# │                                              使用教程 设置                                                │
# └──────────────────────────────────────────────────────────────────────────────────────────────────────────┘
# 说明一下: 安装教程的文件在 主题目录 user/tutorial 下, 该目录下的文件夹对应文档中心的一级分类(去除空格,并区分大小写)
# 各文件夹下的tpl文件的名字 对应文档中心的二级分类(去除空格,并区分大小写)。
# 如果目录名字或文件名字不对， 文档中心不会显示下载教程链接，首页的下载教程链接也会404
# 这里设置的选项控制主页的显示， 客户端下载链接控制教程页面的客户端下载

/**
 *    Windows 客户端  --------------------------------------------------------------------------------------------
 */
$_MT['client_windows'] = [
    'clash' => array(           // 一个array为一个客户端, 可以自行增加或删除
        'name'  => 'Bob加速器',      // 客户端名称
        'img'   => 'https://cdn.jsdelivr.net/gh/BobCoderS9/metron-assets@3.0.2/metron/media/client-logos/clashr-ico.png',        // 图标, 使用png透明文件
        'url'   => '/user/tutorial?os=Windows&client=Clash',      // 安装教程的url地址
        'down'  => 'https://www.google.com',              // 教程页里的客户端下载地址
        'vs'    => 'v3.2.4',     // 版本号
    ),
];

/**
 *    Android 客户端  --------------------------------------------------------------------------------------------
 */
$_MT['client_android'] = [
    'clash' => array(
        'name'  => 'Bob加速器',
        'img'   => 'https://cdn.jsdelivr.net/gh/BobCoderS9/metron-assets@3.0.2/metron/media/client-logos/clashr-ico.png',
        'url'   => '/user/tutorial?os=Android&client=Clash',
        'down'  => 'https://www.google.com',
        'vs'    => 'v2.0.0',
    ),
];


/**
 *    Apple Mac客户端  --------------------------------------------------------------------------------------------
 */
$_MT['client_macos'] = [
    'clash' => array(
        'name'  => 'Bob加速器',
        'img'   => 'https://cdn.jsdelivr.net/gh/BobCoderS9/metron-assets@3.0.2/metron/media/client-logos/clashr-ico.png',
        'url'   => '/user/tutorial?os=MacOS&client=Clash',
        'down'  => 'https://www.google.com',
        'vs'    => 'v3.2.4',
    ),
];

/**
 *    Apple iOS客户端  --------------------------------------------------------------------------------------------
 */
$_MT['client_ios'] = [
    'Shadowrocket' => array(
        'name'  => 'Shadowrocket',
        'img'   => 'https://cdn.jsdelivr.net/gh/BobCoderS9/metron-assets@3.0.2/metron/media/client-logos/shadowrocket-ico.png',
        'url'   => '/user/tutorial?os=iOS&client=Shadowrocket',
        'vs'    => 'v0.10.0',
    ),
    'Quantumult' => array(
        'name'  => 'Quantumult',
        'img'   => 'https://cdn.jsdelivr.net/gh/BobCoderS9/metron-assets@3.0.2/metron/media/client-logos/quantumult-ico.png',
        'url'   => '/user/tutorial?os=iOS&client=Quantumult',
        'vs'    => 'v1.1.0.1',
    ),
];
# 教程页共享账号
$_MT['ios_class']    = 2;    //iOS账户多少级以上可见(包括)
$_MT['ios_account']  = '';    //iOS账户
$_MT['ios_password'] = '';    //ios密码

# ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────┐
# │                                              任务计划 设置                                               │
# └──────────────────────────────────────────────────────────────────────────────────────────────────────────┘
# 用户套餐流量重置的模式 sspanel:原版模式  metron:用户等级未过期(大于0), 按用户生效的套餐重置流量
# 使用 'metron' 模式请注意:
#   1. 宝塔面板 - 网站 - PHP命令行版本 需要修改成有加载 metron.so 扩展的版本
#   2. 需要在网站目录执行 php xcat MetronTask changebought 将用户最后一个套餐设置为有效套餐 (仅需执行一次)
#       因为是将用户最后一次购买的套餐设为有效,如果用户之前最后购买的有可能是流量包,会导致后续用户没有重置流量
#       执行后会在网站目录/storage 下生成更改log, 您请查看log中是否有用户生效套餐是流量包, 如果是请手动修改bought表要生效套餐的usedd字段为1
$_MT['auto_reset_mode'] = 'sspanel';

# 自动关闭工单
$_MT['auto_close_ticket'] = true;       // 自动关闭用户没有回复的工单
$_MT['close_ticket_time'] = 3;          // 用户多久(天)没有回复的工单自动关闭
$_MT['del_user_ticket']   = true;       // 清理用户不存在的工单

# 节点显示流媒体检测结果
$_MT['show_stream_media']  = true;
//流媒体解锁 如下设置将使397，297号节点复用4号节点的检测结果 使用时去掉注释符 //
$_MT['streaming_media_unlock_multiplexing'] = [
    //'397' => '4',
    //'297' => '4',
];
