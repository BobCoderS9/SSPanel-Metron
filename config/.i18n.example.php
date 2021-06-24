<?php

## Admin Settings 站长设置 ##
$I18N['appName'] = array(
    'en' => 'Malio',
    'zh-cn' => 'Malio'
);
$I18N['class-plan-name-map'] = array(  // 用户等级 => 等级名字
    'en' => array(
        1 => 'Basic',
        2 => 'Plus',
        3 => 'Pro'
    ),
    'zh-cn' => array(
        1 => '基础版',
        2 => '高级版',
        3 => '专业版'
    ),
);
$I18N['node-class-name-map'] = array(  // 节点等级 => 节点列表等级标题
    'en' => array(
        1 => 'Basic Servers',
        2 => 'Plus Servers',
        3 => 'Pro Servers'
    ),
    'zh-cn' => array(
        1 => '基础版节点',
        2 => '高级版节点',
        3 => '专业版节点'
    ),
);
$I18N['trial_plan'] = array(
    'en' => array(
        'name' => 'Trail',
        'price' => 'Free',
        'currency' => '',
        'billing' => 'one time',
        'features' => [
            array(
                'support' => true,
                'name' => '5GB Data'
            ),
            array(
                'support' => true,
                'name' => '1 Devices'
            ),
            array(
                'support' => false,
                'name' => 'Ticket Support'
            ),
            array(
                'support' => true,
                'name' => 'Standard Servers'
            ),
            array(
                'support' => false,
                'name' => 'Relay Servers'
            ),
            array(
                'support' => false,
                'name' => 'IPLC Servers'
            ),
        ]

    ),
    'zh-cn' => array(
        'name' => '新用户试用',
        'price' => '免费',
        'currency' => '',
        'billing' => '一次性',
        'features' => [
            array(
                'support' => true,
                'name' => '5GB 使用流量'
            ),
            array(
                'support' => true,
                'name' => '1个 在线客户端'
            ),
            array(
                'support' => false,
                'name' => '工单技术支持'
            ),
            array(
                'support' => true,
                'name' => '国际标准节点'
            ),
            array(
                'support' => false,
                'name' => '国内中转节点'
            ),
            array(
                'support' => false,
                'name' => 'IPLC专线节点'
            ),
        ]
    ),
);
$I18N['plans-info'] = array(   // 会员计划的信息， 可以复制array增加会员计划，比如增加第四个会员计划，使用 'plan_4' => array(...) 这样的格式
    'en' => [
        'plan_1' => array(
            'name' => 'Basic',
            'price' => '1.9',
            'currency' => '$',
            'billing' => 'per month',
            'features' => [
                array(
                    'support' => true,
                    'name' => '500GB Data'
                ),
                array(
                    'support' => true,
                    'name' => '3 Devices'
                ),
                array(
                    'support' => true,
                    'name' => 'Ticket Support'
                ),
                array(
                    'support' => true,
                    'name' => 'Standard Servers'
                ),
                array(
                    'support' => false,
                    'name' => 'Relay Servers'
                ),
                array(
                    'support' => false,
                    'name' => 'IPLC Servers'
                ),
            ]
        ),
        'plan_2' => array(
            'name' => 'Plus',
            'price' => '3.9',
            'currency' => '$',
            'billing' => 'per month',
            'features' => [
                array(
                    'support' => true,
                    'name' => '1000GB Data'
                ),
                array(
                    'support' => true,
                    'name' => '6 Devices'
                ),
                array(
                    'support' => true,
                    'name' => 'LiveChat Support'
                ),
                array(
                    'support' => true,
                    'name' => 'Standard Servers'
                ),
                array(
                    'support' => true,
                    'name' => 'Relay Servers'
                ),
                array(
                    'support' => false,
                    'name' => 'IPLC Servers'
                ),
            ]
        ),
        'plan_3' => array(
            'name' => 'Pro',
            'price' => '6.9',
            'currency' => '$',
            'billing' => 'per month',
            'features' => [
                array(
                    'support' => true,
                    'name' => '2000GB Data'
                ),
                array(
                    'support' => true,
                    'name' => '10 Devices'
                ),
                array(
                    'support' => true,
                    'name' => 'LiveChat Support'
                ),
                array(
                    'support' => true,
                    'name' => 'Standard Servers'
                ),
                array(
                    'support' => true,
                    'name' => 'Relay Servers'
                ),
                array(
                    'support' => true,
                    'name' => 'IPLC Servers'
                ),
            ]
        )
    ],
    'zh-cn' => [
        'plan_1' => array(
            'name' => '标准版',
            'price' => '9.9',
            'currency' => '¥',
            'billing' => '每月',
            'features' => [
                array(
                    'support' => true,
                    'name' => '50GB 使用流量'
                ),
                array(
                    'support' => true,
                    'name' => '2个 在线客户端'
                ),
                array(
                    'support' => true,
                    'name' => '工单技术支持'
                ),
                array(
                    'support' => true,
                    'name' => '国际标准节点'
                ),
                array(
                    'support' => false,
                    'name' => '国内中转节点'
                ),
                array(
                    'support' => false,
                    'name' => 'IPLC专线节点'
                ),
            ]
        ),
        'plan_2' => array(
            'name' => '高级版',
            'price' => '19.9',
            'currency' => '¥',
            'billing' => '每月',
            'features' => [
                array(
                    'support' => true,
                    'name' => '100GB 使用流量'
                ),
                array(
                    'support' => true,
                    'name' => '4个 在线客户端'
                ),
                array(
                    'support' => true,
                    'name' => '24/7 在线技术支持'
                ),
                array(
                    'support' => true,
                    'name' => '国际标准节点'
                ),
                array(
                    'support' => true,
                    'name' => '国内中转节点'
                ),
                array(
                    'support' => false,
                    'name' => 'IPLC专线节点'
                ),
            ]
        ),
        'plan_3' => array(
            'name' => '加强版',
            'price' => '29.9',
            'currency' => '¥',
            'billing' => '每月',
            'features' => [
                array(
                    'support' => true,
                    'name' => '300GB 使用流量'
                ),
                array(
                    'support' => true,
                    'name' => '8个 在线客户端'
                ),
                array(
                    'support' => true,
                    'name' => '24/7 在线技术支持'
                ),
                array(
                    'support' => true,
                    'name' => '国际标准节点'
                ),
                array(
                    'support' => true,
                    'name' => '国内中转节点'
                ),
                array(
                    'support' => true,
                    'name' => 'IPLC专线节点'
                ),
            ]
        ),
    ]
);

## General 通用 ##
$I18N['email'] = array(
    'en' => 'Email',
    'zh-cn' => '邮箱'
);
$I18N['password'] = array(
    'en' => 'Password',
    'zh-cn' => '密码'
);
$I18N['or'] = array(
    'en' => 'OR',
    'zh-cn' => '或'
);
$I18N['next'] = array(
    'en' => 'Next',
    'zh-cn' => '下一步'
);
$I18N['enable'] = array(
    'en' => 'Enable',
    'zh-cn' => '开启'
);
$I18N['confirm'] = array(
    'en' => 'Confirm',
    'zh-cn' => '确定'
);
$I18N['cancel'] = array(
    'en' => 'Cancel',
    'zh-cn' => '取消'
);
$I18N['action'] = array(
    'en' => 'Action',
    'zh-cn' => '操作'
);
$I18N['logout'] = array(
    'en' => 'Logout',
    'zh-cn' => '退出登录'
);
$I18N['join-telegram-group'] = array(
    'en' => 'Join Telegram Group',
    'zh-cn' => '加入 Telegram 群组'
);
$I18N['alipay'] = array(
    'en' => 'Alipay',
    'zh-cn' => '支付宝'
);
$I18N['wechat-pay'] = array(
    'en' => 'Wechat Pay',
    'zh-cn' => '微信支付'
);
$I18N['cryptocurrency'] = array(
    'en' => 'Cryptocurrency',
    'zh-cn' => '加密货币'
);
$I18N['qq-wallet'] = array(
    'en' => 'QQ Wallet',
    'zh-cn' => 'QQ钱包'
);
$I18N['unionpay'] = array(
    'en' => 'UnionPay',
    'zh-cn' => '银联支付'
);
$I18N['my'] = array(
    'en' => 'My',
    'zh-cn' => '我的'
);
$I18N['usage'] = array(
    'en' => 'Usage',
    'zh-cn' => '使用'
);
$I18N['copied'] = array(
    'en' => 'Copied',
    'zh-cn' => '已复制'
);

## Landing Page 着陆页 ##
$I18N['features'] = array(
    'en' => 'Features',
    'zh-cn' => '特性'
);
$I18N['pricing'] = array(
    'en' => 'Pricing',
    'zh-cn' => '价格'
);
$I18N['support'] = array(
    'en' => 'Support',
    'zh-cn' => '支持'
);
$I18N['index-dashboard-button'] = array(
    'en' => 'Dashboard',
    'zh-cn' => '用户中心'
);
$I18N['index-slogan'] = array(
    'en' => 'We Dedicate to Providing the Finest Network Proxy Service',
    'zh-cn' => '全球网络中继服务，随时随处尽情使用'
);
$I18N['index-text-under-slogan'] = array(
    'en' => 'The ultimate proxy for all of your devices',
    'zh-cn' => '通过我们的网络访问内容提供商、公司网络和公共云服务'
);
$I18N['get-started'] = array(
    'en' => 'Get Started',
    'zh-cn' => '开始使用'
);
$I18N['index-offer-bar'] = array(
    'en' => '17% Off For Annual Subscription',
    'zh-cn' => '年付8折优惠活动，限时进行中'
);
$I18N['not-a-reason-to-use'] = array(
    'en' => 'Not a reason to use',
    'zh-cn' => '为什么选择 '. $I18N['appName']['zh-cn']
);
$I18N['just-a-statistic'] = array(
    'en' => '<span class="font-weight-500">just a</span> statistic',
    'zh-cn' => '迄今为止
    '
);
$I18N['index-servers'] = array(
    'en' => 'Servers',
    'zh-cn' => '国际节点'
);
$I18N['regions'] = array(
    'en' => 'Regions',
    'zh-cn' => '国家地区'
);
$I18N['users'] = array(
    'en' => 'Users',
    'zh-cn' => '满意用户'
);
$I18N['index-section-1-title'] = array(
    'en' => 'The service <span class="text-primary">you have been looking for</span> is here',
    'zh-cn' => '为你 <span class="text-primary">量身定制<span> 的服务'
);
$I18N['index-section-1-subtitle'] = array(
    'en' => 'The finest proxy service built for you with the most reliable technology',
    'zh-cn' => '可靠的基础设施，并能提供您喜爱的诸多功能'
);
$I18N['index-section-1-feature-1-lead'] = array(
    'en' => 'Fast & Reliable Connection',
    'zh-cn' => '高速稳定'
);
$I18N['index-section-1-feature-1-desc'] = array(
    'en' => 'Make you never feel a thing of the existance of the GFW again',
    'zh-cn' => '体验宛若身在海外的访问速度'
);
$I18N['index-section-1-feature-2-lead'] = array(
    'en' => 'Easy Configuration',
    'zh-cn' => '便携设置'
);
$I18N['index-section-1-feature-2-desc'] = array(
    'en' => 'Our products are compatible with macOS, iOS, Android, Windows, and Linux',
    'zh-cn' => '我们的服务适用于 macOS、iOS、Android、Windows 和 Linux'
);
$I18N['index-section-1-feature-3-lead'] = array(
    'en' => 'Cheap but Trustworthy',
    'zh-cn' => '节省成本'
);
$I18N['index-section-1-feature-3-desc'] = array(
    'en' => 'Save you money from building your own service',
    'zh-cn' => '相比自托管服务可节省大量费用'
);
$I18N['index-section-1-feature-4-lead'] = array(
    'en' => 'Global Proxy',
    'zh-cn' => '全球互联'
);
$I18N['index-section-1-feature-4-desc'] = array(
    'en' => 'Use IXP to connect to any service provider around the world',
    'zh-cn' => '通过 IXP 连接至全球内容提供商，更加快速'
);
$I18N['index-section-1-feature-5-lead'] = array(
    'en' => 'Carrier Friendly',
    'zh-cn' => '运营商友好'
);
$I18N['index-section-1-feature-5-desc'] = array(
    'en' => 'We made easy for any internet service subscriber to use our service',
    'zh-cn' => '我们的产品和您的当地运营商兼容，适用于您的固网与移动网络'
);
$I18N['index-section-1-feature-6-lead'] = array(
    'en' => 'Third-Party Compatibility',
    'zh-cn' => '多应用兼容'
);
$I18N['index-section-1-feature-6-desc'] = array(
    'en' => 'We provide compatible third-party apps to extend our potential',
    'zh-cn' => '提供全面且可靠的第三方应用程序兼容'
);
$I18N['index-section-2-above-title'] = array(
    'en' => 'CROSS DEVICES & PLATFORMS',
    'zh-cn' => 'CROSS DEVICES & PLATFORMS'
);
$I18N['index-section-2-title'] = array(
    'en' => 'Use Our Service on Your Favorite Devices, Either Your Laptop or Your Phone. Enjoy Our Service at Any Place',
    'zh-cn' => '在你心爱的电子设备中使用，无论是移动的手机还是固定的电脑，随时随处可用'
);
$I18N['index-section-2-desc'] = array(
    'en' => $I18N['appName']['en'] . ' provides services compatible on macOS, iOS, Android, Windows, and Linux. Using third-party apps, you may use our service on your phone, computer, router, game console, and even TV boxes.',
    'zh-cn' => $I18N['appName']['zh-cn'] . '的服务适用于 macOS、iOS、Android、Windows 和 Linux，借助第三方客户端，可在手机、电脑、路由器、游戏机、电视盒子中使用。'
);
$I18N['index-section-3-above-title'] = array(
    'en' => 'UNBLOCK STREAMING MEDIA',
    'zh-cn' => 'UNBLOCK STREAMING MEDIA'
);
$I18N['index-section-3-title'] = array(
    'en' => 'Stream Your Favorite TV Shows and Music',
    'zh-cn' => '解锁流媒体，观赏和聆听优质的内容'
);
$I18N['index-section-3-desc'] = array(
    'en' => 'Using service provided by ' . $I18N['appName']['en'] . ', you may unblock media streaming services like Netflix, Hulu, HBO, TVB, Happyon, and AbemaTV, and listen to streaming music provided by services like Spotify and Pandora',
    'zh-cn' => '通过 '.$I18N['appName']['zh-cn'].' 的服务，可以观看包括 Netflix、Hulu、HBO、TVB、Happyon、AbemaTV 等在内的多种流媒体视频，聆听包括 Spotify、Pandora 等在内的流媒体音乐。'
);
$I18N['index-section-4-title'] = array(
    'en' => 'Even More Built-in Features',
    'zh-cn' => '不仅仅如此，亦包含以下诸多特性'
);
$I18N['index-section-4-desc'] = array(
    'en' => '* Some features will require the use of a third-party app',
    'zh-cn' => '* 部分特性需要配合第三方客户端与托管规则使用'
);
$I18N['index-section-5-title'] = array(
    'en' => 'Execllent Service with Affordable Prices',
    'zh-cn' => '出色的体验，意想不到的价格'
);
$I18N['index-section-5-desc'] = array(
    'en' => 'Never waste your time on waiting again, start enjoy our proxy service.',
    'zh-cn' => '不要把宝贵的时间，浪费在等待上。即刻开启全球网络中继服务，在任何时间任何地点访问全球互联网。'
);
$I18N['index-section-6-title'] = array(
    'en' => 'Start Using Our Global Proxy Service',
    'zh-cn' => '开始使用优秀的全球网络中继服务'
);
$I18N['index-section-6-subtitle'] = array(
    'en' => 'Start using outstanding global network relay service',
    'zh-cn' => 'Start using outstanding global network relay service'
);
$I18N['index-section-6-card-1-title'] = array(
    'en' => 'Pre-sales',
    'zh-cn' => '售前咨询'
);
$I18N['index-section-6-card-1-desc'] = array(
    'en' => 'Any questions on our service? Contact our Sales Team now.',
    'zh-cn' => '有任何关于会员计划的疑问？联系我们的售前咨询小组，马上为您解答。'
);
$I18N['index-section-6-card-2-title'] = array(
    'en' => 'Tech Support',
    'zh-cn' => '技术支持'
);
$I18N['index-section-6-card-2-desc'] = array(
    'en' => $I18N['appName']['en'] . ' provides certain tech support during your subscription.',
    'zh-cn' => $I18N['appName']['zh-cn'].' 在您的订阅周期内为您提供一定程度上的技术支持。'
);
$I18N['start-now'] = array(
    'en' => 'Start Now',
    'zh-cn' => '立即注册'
);
$I18N['contact-us'] = array(
    'en' => 'Contact Us',
    'zh-cn' => '联系我们'
);
$I18N['subscribe'] = array(
    'en' => 'Subscribe',
    'zh-cn' => '订阅'
);
$I18N['index-footer-slogan'] = array(
    'en' => 'We dedicate to providing the finest network proxy service',
    'zh-cn' => '致力于为用户提供高速稳定的高性价比网络中继服务'
);
$I18N['index-more-features'] = array(
    'en' => array(
        array(
            'icon' => 'fas fa-ad',
            'feature' => 'Block Ads when viewing webpages and streaming videos',
        ),
        array(
            'icon' => 'fas fa-filter',
            'feature' => 'Smart Router, automatically choose the proxy for various requests',
        ),
        array(
            'icon' => 'fab fa-apple',
            'feature' => 'Apple Service Proxied (App Store, Apple Music, iCloud, and iTunes etc.)',
        ),
        array(
            'icon' => 'fas fa-tachometer-alt',
            'feature' => 'Unblock Websites (Google/Youtube/Twitter/Instagram/Github etc.)',
        ),
        array(
            'icon' => 'fas fa-lock',
            'feature' => 'Encrypt all your connections to protect your privacy',
        ),
        array(
            'icon' => 'fas fa-fire',
            'feature' => 'Compatible with awesome third-party apps developed on many system platforms',
        ),
    ),
    'zh-cn' => array(
        array(
            'icon' => 'fas fa-ad',
            'feature' => '过滤常用网站广告、常用视频广告、其他流媒体网站广告',
        ),
        array(
            'icon' => 'fas fa-filter',
            'feature' => '智能分流系统，所有国内网站直线连接，增强用户体验',
        ),
        array(
            'icon' => 'fab fa-apple',
            'feature' => 'Apple服务加速 (App Store、Apple Music、iCloud、iTunes等)',
        ),
        array(
            'icon' => 'fas fa-tachometer-alt',
            'feature' => '国外常用网站加速 (Google/Youtube/Twitter/Instgram/Github等)',
        ),
        array(
            'icon' => 'fas fa-lock',
            'feature' => '在传输过程中使用最强的加密方式，保护用户数据和隐私',
        ),
        array(
            'icon' => 'fas fa-fire',
            'feature' => '与诸多平台上的优秀应用程序兼容，这些应用程序由许多创新公司和开发人员开发',
        ),
    )
);
$I18N['index-user-reviews'] = array(
    'en' => [
        array(
            'user' => 'xxx',
            'position' => '<a href="/">xxxx</a> xxx',
            'review' => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        ),
        array(
            'user' => 'CXK',
            'position' => '<a href="/">xxxx</a>xxxxxx',
            'review' => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        ),
        array(
            'user' => 'xxx',
            'position' => 'xxxx',
            'review' => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx🐈🐶'
        ),
    ],
    'zh-cn' => [
        array(
            'user' => '某一沙雕网友',
            'position' => '<a href="/">家里蹲大学</a> 学生',
            'review' => '我的妈我跟你说真的好用到飞起，我的妈我跟你说真的好用到飞起，我的妈我跟你说真的好用到飞起。素质三连。'
        ),
        array(
            'user' => 'CXK',
            'position' => '<a href="/">XX公司</a>唱跳练习生',
            'review' => '大家好，我是练习时长两年半的个人练习生，喜欢唱、跳、rap、篮球'
        ),
        array(
            'user' => '用户名',
            'position' => '职位',
            'review' => '第三个评价要咋写啊我编不下去了，你们记得改文案啊不然就。这个是占位符占位符🐈🐶'
        ),
    ],
);

## Login 登录 ##
$I18N['login'] = array(
    'en' => 'Login',
    'zh-cn' => '登录'
);
$I18N['forgot-password-question-mark'] = array(
    'en' => 'Forgot Password?',
    'zh-cn' => '忘记密码？'
);
$I18N['remember-me'] = array(
    'en' => 'Remember Me',
    'zh-cn' => '记住我'
);
$I18N['login-with-telegram'] = array(
    'en' => 'Login with Telegram',
    'zh-cn' => '使用 Telegram 登录'
);
$I18N['dont-have-an-account-question-mark'] = array(
    'en' => 'Don&apos;t have an account? <a href="/auth/register">Create One 👉</a>',
    'zh-cn' => '还没有账号？<a href="/auth/register">马上注册 👉</a>'
);
$I18N['login_welcome'] = array(
    'en' => 'Welcome to <span class="font-weight-bold">' . $I18N['appName']['en'] . '</span>',
    'zh-cn' => '欢迎使用 <span class="font-weight-bold">' . $I18N['appName']['zh-cn'] . '</span>'
);
$I18N['login_slogan'] = array(
    'en' => 'We Dedicate to Providing the Finest Network Proxy Service',
    'zh-cn' => '这是一句好听顺嘴而且不长不短刚刚好的Slogan<br>甚至可以写第二行'
);
$I18N['please-fill-in-your-email'] = array(
    'en' => 'Please fill in your email',
    'zh-cn' => '请填写邮箱'
);
$I18N['please-fill-in-your-password'] = array(
    'en' => 'Please fill in your password',
    'zh-cn' => '请填写密码'
);

## Sign Up 注册 ##
$I18N['sign-up'] = array(
    'en' => 'Sign Up',
    'zh-cn' => '注册'
);
$I18N['closed-on-registeration'] = array(
    'en' => '$1 已停止新用户注册',
    'zh-cn' => '$1 has closed on registeration'
);
$I18N['nickname'] = array(
    'en' => 'Nickname',
    'zh-cn' => '昵称'
);
$I18N['please-fill-in-your-nickname'] = array(
    'en' => 'Please fill in your nickname',
    'zh-cn' => '请填写昵称'
);
$I18N['please-fill-in-your-passsword'] = array(
    'en' => 'Please fill in your passsword',
    'zh-cn' => '请填写密码'
);
$I18N['please-fill-in-invitation-code'] = array(
    'en' => 'Please fill in invitation code',
    'zh-cn' => '请填写邀请码'
);
$I18N['confirm-password'] = array(
    'en' => 'Confirm Password',
    'zh-cn' => '确认密码'
);
$I18N['please-your-confirm-password'] = array(
    'en' => 'Please confirm your password',
    'zh-cn' => '请再次填写密码'
);
$I18N['invitation-code'] = array(
    'en' => 'Invitation Code',
    'zh-cn' => '邀请码'
);
$I18N['optional'] = array(
    'en' => 'Optional',
    'zh-cn' => '选填'
);
$I18N['email-verification-code'] = array(
    'en' => 'Email Verification Code',
    'zh-cn' => '邮箱验证码'
);
$I18N['please-fill-in-email-verification-code'] = array(
    'en' => 'Please fill in email verification code',
    'zh-cn' => '请填写邮箱验证码'
);
$I18N['send'] = array(
    'en' => 'Send',
    'zh-cn' => '发送'
);
$I18N['phone-number'] = array(
    'en' => 'Phone Number',
    'zh-cn' => '手机号'
);
$I18N['please-fill-in-your-phone-number'] = array(
    'en' => 'Please fill in your phone number',
    'zh-cn' => '请填写手机号'
);
$I18N['sms-verification-code'] = array(
    'en' => 'SMS Verification Code',
    'zh-cn' => '短信验证码'
);
$I18N['please-fill-in-sms-verification-code'] = array(
    'en' => 'Please fill in sms verification code',
    'zh-cn' => '请填写短信验证码'
);
$I18N['sign-up-tos-check'] = array(
    'en' => 'By signing up, you automatically agree to our <a href="/tos" target="blank">Term of Service</a>',
    'zh-cn' => '注册即代表同意 <a href="/tos" target="blank">服务条款</a>'
);
$I18N['check-tos-feedback'] = array(
    'en' => 'Please read the Term of Service then check the checkbox',
    'zh-cn' => '请阅读服务条款并勾选'
);
$I18N['already-got-an-account-question-mark'] = array(
    'en' => 'Already got an account? <a href="/auth/login">Login Now 👉</a>',
    'zh-cn' => '已经有账号了？<a href="/auth/login">马上登录 👉</a>'
);
$I18N['too-weak'] = array(
    'en' => 'Too weak',
    'zh-cn' => '超级弱鸡'
);
$I18N['weak'] = array(
    'en' => 'Weak',
    'zh-cn' => '弱鸡'
);
$I18N['average'] = array(
    'en' => 'Average',
    'zh-cn' => '一般般'
);
$I18N['strong'] = array(
    'en' => 'Strong',
    'zh-cn' => '有点强'
);
$I18N['perfect'] = array(
    'en' => 'Perfect😆',
    'zh-cn' => '很强👌'
);
$I18N['sign-up-successful'] = array(
    'en' => 'New account created',
    'zh-cn' => '注册成功'
);
$I18N['hey'] = array(
    'en' => 'Hey',
    'zh-cn' => '提示'
);
$I18N['send-again'] = array(
    'en' => 'Send again',
    'zh-cn' => '再次发送'
);
$I18N['code-sent'] = array(
    'en' => 'Code sent',
    'zh-cn' => '已发送验证码'
);
$I18N['email-code-desc'] = array(
    'en' => 'If not received, check your Spam Inbox',
    'zh-cn' => '如长时间未收到，请查看邮件垃圾箱'
);
$I18N['hey'] = array(
    'en' => 'Hey',
    'zh-cn' => '提示'
);

## Dashboard 首页 ##
$I18N['dashboard'] = array(
    'en' => 'Dashboard',
    'zh-cn' => '首页'
);
$I18N['daily-bonus'] = array(
    'en' => 'Daily Bonus',
    'zh-cn' => '每日签到'
);
$I18N['alredy-got-daily-bonus'] = array(
    'en' => 'Come back tomorrow',
    'zh-cn' => '明日再来'
);
$I18N['no-available-data-alert'] = array(
    'en' => 'You have used up all the data, and your service is currently suspended. Purchase data add-on in the store to resume your service.',
    'zh-cn' => '您的流量已用尽，无法继续使用本站服务。如需更多流量，请前往会员商店购买流量叠加包。'
);
$I18N['plan-expired-alert'] = array(
    'en' => 'Your plan has expired, please renew your plan in time.',
    'zh-cn' => '您的会员计划已过期，请及时续费。'
);
$I18N['no-enough-data-alert'] = array(
    'en' => 'You have less than 5GB data left, you can purchase Data Add-on in the store if you need more data.',
    'zh-cn' => '您的可用流量不足5GB，如需更多流量，可前往会员商店购买流量叠加包。'
);
$I18N['new-user-guide-alert'] = array(
    'en' => 'Don&apos;t know how to start？<b>Download</b> and use our apps with just few steps!',
    'zh-cn' => '新手上路？<b>点我下载客户端</b>，轻松上手！'
);
$I18N['your-plan'] = array(
    'en' => 'Your Plan',
    'zh-cn' => '会员时长'
);
$I18N['days'] = array(
    'en' => 'Days',
    'zh-cn' => '天'
);
$I18N['plan-expired'] = array(
    'en' => 'Expired',
    'zh-cn' => '已过期'
);
$I18N['lifetime'] = array(
    'en' => 'Lifetime',
    'zh-cn' => '永久'
);
$I18N['plan-expire-at'] = array(
    'en' => 'Expire at $1',
    'zh-cn' => '$1 过期'
);
$I18N['available-data'] = array(
    'en' => 'Available Data',
    'zh-cn' => '剩余流量'
);
$I18N['used-today'] = array(
    'en' => 'Used today',
    'zh-cn' => '今日已用'
);
$I18N['online-devices'] = array(
    'en' => 'Online Devices',
    'zh-cn' => '在线设备数'
);
$I18N['last-used-time'] = array(
    'en' => 'Last used time',
    'zh-cn' => '上次使用时间'
);
$I18N['never-used'] = array(
    'en' => 'Never used',
    'zh-cn' => '从未使用过'
);
$I18N['balance'] = array(
    'en' => 'Balance',
    'zh-cn' => '钱包余额'
);
$I18N['announcement'] = array(
    'en' => 'Announcement',
    'zh-cn' => '公告'
);
$I18N['data-usage-72-hours'] = array(
    'en' => 'Data Usage of Recent 72 Hours',
    'zh-cn' => '最近72小时流量使用情况'
);
$I18N['load-data'] = array(
    'en' => 'Load Data',
    'zh-cn' => '加载数据'
);
$I18N['data-useage'] = array(
    'en' => 'Data Usage',
    'zh-cn' => '流量使用情况'
);
$I18N['data-used'] = array(
    'en' => 'Used',
    'zh-cn' => '已用'
);
$I18N['data-available'] = array(
    'en' => 'Available',
    'zh-cn' => '可用'
);
$I18N['data-used-today'] = array(
    'en' => 'Used Today',
    'zh-cn' => '今日已用'
);
$I18N['quick-import'] = array(
    'en' => 'Quick Import',
    'zh-cn' => '便捷导入'
);
$I18N['import-clash-config'] = array(
    'en' => 'Import ClashX / CFW / CFA Config',
    'zh-cn' => '一键导入 ClashX / CFW / CFA 配置'
);
$I18N['import-quantumult-config'] = array(
    'en' => 'Import Quantumult Config',
    'zh-cn' => '一键导入 Quantumult 配置'
);
$I18N['import-shadowrocket-config'] = array(
    'en' => 'Import Shadowrocket Config',
    'zh-cn' => '一键导入 Shadowrocket 配置'
);
$I18N['import-surfboard-config'] = array(
    'en' => 'Import Surboard Config',
    'zh-cn' => '一键导入 Surfboard 配置'
);
$I18N['import-surge-config'] = array(
    'en' => 'Surge Configs',
    'zh-cn' => 'Surge 托管配置'
);
$I18N['import-surge-version-config'] = array(
    'en' => 'Import Surge $1 Config',
    'zh-cn' => '一键导入 Surge $1 托管配置'
);
$I18N['import-ssr-config'] = array(
    'en' => 'Import SSR Config',
    'zh-cn' => '一键导入 SSR 订阅链接'
);
$I18N['copy-surge-version-config-url'] = array(
    'en' => 'Copy Surge $1 Config URL',
    'zh-cn' => '复制 Surge $1 托管配置链接'
);
$I18N['copy-kitsunebi-config-url'] = array(
    'en' => 'Copy Kitsunebi Config URL',
    'zh-cn' => '复制 Kitsunebi 订阅链接'
);
$I18N['ssr-config'] = array(
    'en' => 'SSR Config',
    'zh-cn' => 'SSR 订阅链接'
);
$I18N['copy-ssr-config-url'] = array(
    'en' => 'Copy SSR Config URL',
    'zh-cn' => '复制 SSR 订阅链接'
);
$I18N['copy-ss-config-url'] = array(
    'en' => 'Copy SS Config URL',
    'zh-cn' => '复制 SS 订阅链接'
);
$I18N['copy-v2ray-config-url'] = array(
    'en' => 'Copy V2Ray Config URL',
    'zh-cn' => '复制 V2Ray 订阅链接'
);
$I18N['copy-ssd-config-url'] = array(
    'en' => 'Copy SSD Config URL',
    'zh-cn' => '复制 SSD 订阅链接'
);
$I18N['copy-ss-urls'] = array(
    'en' => 'Copy SS URLs',
    'zh-cn' => '批量复制 SS 链接'
);
$I18N['copy-ssr-urls'] = array(
    'en' => 'Copy SSR URLs',
    'zh-cn' => '批量复制 SSR 链接'
);
$I18N['copy-vmess-urls'] = array(
    'en' => 'Copy Vmess URLs',
    'zh-cn' => '批量复制 Vmess 链接'
);
$I18N['new-user-guide-lead'] = array(
    'en' => 'Start using our service by',
    'zh-cn' => '按照下面步骤开始使用吧!'
);
$I18N['new-user-guide-setp-1'] = array(
    'en' => 'Subscribe to your perfect plan or have a free trial at the store',
    'zh-cn' => '前往商店购买会员订阅计划或免费试用'
);
$I18N['new-user-guide-setp-2'] = array(
    'en' => 'Follow the steps in tutorials to setup your devices',
    'zh-cn' => '下载客户端并按照教程安装'
);
$I18N['new-user-guide-setp-3'] = array(
    'en' => 'Enjoy our fast and reliable service',
    'zh-cn' => '开开心心看世界'
);
$I18N['read'] = array(
    'en' => '已读',
    'zh-cn' => 'Read'
);
$I18N['important-announcement'] = array(
    'en' => 'Important Announcement',
    'zh-cn' => '重要通知'
);

## Store 商店 ##
$I18N['store'] = array(
    'en' => 'Store',
    'zh-cn' => '商店'
);
$I18N['purchase-data-add-on'] = array(
    'en' => 'Purchase Data Add-on',
    'zh-cn' => '购买流量叠加包'
);
$I18N['purchase'] = array(
    'en' => 'Purchase',
    'zh-cn' => '购买'
);
$I18N['data-add-on-item'] = array(
    'en' => '$1 CNY - $2GB Data Add-on',
    'zh-cn' => '$1 元 $2GB 流量叠加包'
);
$I18N['store-title'] = array(
    'en' => 'Choose Your Subscription Plan',
    'zh-cn' => '选择合适的会员订阅计划'
);
$I18N['store-sub-title'] = array(
    'en' => 'We Dedicate to Providing the Finest Network Proxy Service',
    'zh-cn' => '竭尽全力为您提供优质的服务'
);
$I18N['start-trail'] = array(
    'en' => 'Start Trail',
    'zh-cn' => '开始试用'
);
$I18N['mo'] = array(
    'en' => ' mo',
    'zh-cn' => '月'
);
$I18N['subscribe-plan'] = array(
    'en' => 'Subscribe Plan',
    'zh-cn' => '购买会员计划'
);
$I18N['choose-plan'] = array(
    'en' => 'Choose Plan',
    'zh-cn' => '选择会员计划'
);
$I18N['choose-plan-time'] = array(
    'en' => 'Plan Time',
    'zh-cn' => '选择会员时长'
);
$I18N['1-month'] = array(
    'en' => '1 Month',
    'zh-cn' => '1个月'
);
$I18N['3-months'] = array(
    'en' => '3 Months',
    'zh-cn' => '3个月'
);
$I18N['6-months'] = array(
    'en' => '6 Months',
    'zh-cn' => '6个月'
);
$I18N['12-months'] = array(
    'en' => '12 Months',
    'zh-cn' => '12个月'
);
$I18N['autorenew'] = array(
    'en' => 'Autorenew',
    'zh-cn' => '自动续费'
);
$I18N['autorenew-disable'] = array(
    'en' => 'Disable',
    'zh-cn' => '关闭'
);
$I18N['autorenew-enable'] = array(
    'en' => 'Enable',
    'zh-cn' => '启用'
);
$I18N['payment-notice'] = array(
    'en' => '* Uses balance when available',
    'zh-cn' => '* 默认抵扣账户余额'
);
$I18N['read-before-subscribe'] = array(
    'en' => 'Read Before Subscribe',
    'zh-cn' => '购买须知'
);
$I18N['read-before-subscribe-content'] = array(
    'en' => '
        <div class="bullet"></div> xxxxxxxxxxxxxxxxxxx<br>
        <div class="bullet"></div> xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    ',
    'zh-cn' => '
        <div class="bullet"></div> 购买会员计划即代表同意《服务条款》和《使用政策》。<br>
        <div class="bullet"></div> 流量每30天重置一次 (从购买日开始计算)，未使用的流量不结转到下个周期。
    '
);
$I18N['product-name'] = array(
    'en' => 'Product',
    'zh-cn' => '商品名称'
);
$I18N['total-price'] = array(
    'en' => 'Total Price',
    'zh-cn' => '总价'
);
$I18N['discount'] = array(
    'en' => 'Discount',
    'zh-cn' => '优惠'
);
$I18N['pay-with-balance'] = array(
    'en' => 'Pay with Balance',
    'zh-cn' => '余额支付'
);
$I18N['still-need-to-pay'] = array(
    'en' => 'Still Need to Pay',
    'zh-cn' => '还需要支付'
);
$I18N['apply-promo-code'] = array(
    'en' => 'Apply Promo Code',
    'zh-cn' => '使用优惠码'
);
$I18N['enter-promo-code'] = array(
    'en' => 'Enter Promo Code',
    'zh-cn' => '输入优惠码'
);
$I18N['validate-code'] = array(
    'en' => 'Validate Code',
    'zh-cn' => '验证优惠码'
);
$I18N['pay-now'] = array(
    'en' => 'Pay Now',
    'zh-cn' => '立即支付'
);
$I18N['pay-now-modal-text'] = array(
    'en' => 'Click "Continue" to redirect to the payment page<br>
    It takes a while to proccess your order after payment. Please do not close this page.',
    'zh-cn' => '点击“继续支付”打开支付页面支付<br>
    支付到账需要一段时间，请勿关闭或刷新此页面'
);
$I18N['continue-pay'] = array(
    'en' => 'Continue',
    'zh-cn' => '继续支付'
);
$I18N['open-app-to-scan-qrcode'] = array(
    'en' => 'Open $1 to scan the QR Code',
    'zh-cn' => '打开$1，扫码支付'
);
$I18N['shop-dont-close-windows-hint'] = array(
    'en' => 'It takes a while to proccess your order after payment. Please do not close this page.',
    'zh-cn' => '支付到账需要一段时间，请勿关闭或刷新此页面'
);
$I18N['go-to-alipay-app'] = array(
    'en' => 'Go to Alipay app',
    'zh-cn' => '打开手机支付宝支付'
);
$I18N['shop-ask-if-user-have-promo-code'] = array(
    'en' => 'Do you have a promo code? Click "Next" if you don&apos;t',
    'zh-cn' => '是否有优惠码？没有请直接点下一步'
);
$I18N['data'] = array(
    'en' => 'Data',
    'zh-cn' => '流量'
);


## Account 我的账号 ##
$I18N['my-account'] = array(
    'en' => 'Account',
    'zh-cn' => '我的账号'
);
$I18N['change-password'] = array(
    'en' => 'Change Password',
    'zh-cn' => '修改密码'
);
$I18N['change-password-desc'] = array(
    'en' => 'We suggest you change password regularly',
    'zh-cn' => '定期修改为高强度密码以保护您的账号'
);
$I18N['change'] = array(
    'en' => 'Change',
    'zh-cn' => '立即修改'
);
$I18N['current-password'] = array(
    'en' => 'Current Password',
    'zh-cn' => '当前密码'
);
$I18N['new-password'] = array(
    'en' => 'New Password',
    'zh-cn' => '新密码'
);
$I18N['confirm-new-password'] = array(
    'en' => 'Confirm New Password',
    'zh-cn' => '确认新密码'
);
$I18N['change-password-modal-confirm'] = array(
    'en' => 'Change',
    'zh-cn' => '确定修改'
);
$I18N['connect-to-telegram'] = array(
    'en' => 'Connect to Telegram',
    'zh-cn' => '绑定 Telegram 账号'
);
$I18N['connect-to-telegram-desc'] = array(
    'en' => 'You can login with Telegram after connect',
    'zh-cn' => '绑定后可使用 Telegram 快速登录网站和机器人 <a href="https://t.me/$1" target="blank">@$1</a>'
);
$I18N['telegram-connect'] = array(
    'en' => 'Connect',
    'zh-cn' => '立即绑定'
);
$I18N['telegram-modal-desc'] = array(
    'en' => 'Copy this bind code and send to the Telegram Bot <a href="https://t.me/$1" target="blank">@$1</a>',
    'zh-cn' => '将下面的绑定码复制发送给 Telegram 机器人 <a href="https://t.me/$1" target="blank">@$1</a>'
);
$I18N['connect-to-another-account'] = array(
    'en' => 'Connect to a new account',
    'zh-cn' => '绑定其他账号'
);
$I18N['currently-connected-to-telegram-account'] = array(
    'en' => '当前绑定 Telegram 账号',
    'zh-cn' => '绑定其他账号'
);
$I18N['two-factor-authentication'] = array(
    'en' => 'Two-factor Authentication',
    'zh-cn' => '二步验证'
);
$I18N['2fa-desc'] = array(
    'en' => '2FA is an extra layer of security for your account',
    'zh-cn' => '为您的帐号添加一道额外的安全保障'
);
$I18N['2fa-enable'] = array(
    'en' => 'Enable',
    'zh-cn' => '立即开启'
);
$I18N['2fa-modal-setp-1-desc'] = array(
    'en' => 'Please scan the QR Code with a 2FA app, Google Authenticator is recommended',
    'zh-cn' => '请使用二步验证APP扫描二维码，推荐使用 Google Authenticator'
);
$I18N['2fa-modal-setp-2-desc'] = array(
    'en' => 'Please enter the 6-digit code shown on the app',
    'zh-cn' => '请输入二步验证APP上的6位验证码'
);
$I18N['6-digit-code'] = array(
    'en' => '6-Digit Code',
    'zh-cn' => '6位验证码'
);
$I18N['2fa-enbaled-desc'] = array(
    'en' => 'You have enabled 2FA for your account',
    'zh-cn' => '您的账号已开启二步验证'
);
$I18N['disable-2fa'] = array(
    'en' => 'Disable',
    'zh-cn' => '关闭二步验证'
);
$I18N['delete-account'] = array(
    'en' => 'Delete Account',
    'zh-cn' => '删除账号'
);
$I18N['delete-account-desc'] = array(
    'en' => 'All your data will be deleted and not recoverable',
    'zh-cn' => '您的所有数据都会被删除，无法找回'
);
$I18N['delete-account-button'] = array(
    'en' => 'Delete',
    'zh-cn' => '申请删除'
);
$I18N['delete-account-modal-desc'] = array(
    'en' => 'Warning: All your data will be deteled and nonrecoverable!',
    'zh-cn' => '注意：您的所有数据都会被删除，无法找回。'
);
$I18N['delete-account-enter-password-hint'] = array(
    'en' => 'Please enter your account password to proceed',
    'zh-cn' => '请输入账号登录密码确认'
);
$I18N['delete-account-confirm'] = array(
    'en' => 'Yes, I am Sure',
    'zh-cn' => '确定删除'
);
$I18N['5-mins-used-ip'] = array(
    'en' => 'IP Used in Last 5 Minutes',
    'zh-cn' => '最近五分钟使用IP'
);
$I18N['not-use-service-in-5-mins'] = array(
    'en' => 'You have not used our service in last 5 minutes',
    'zh-cn' => '最近五分钟未使用服务'
);
$I18N['10-login-ip'] = array(
    'en' => 'Last 10 Successful Login IP',
    'zh-cn' => '最近十次登录IP'
);
$I18N['location'] = array(
    'en' => 'Location',
    'zh-cn' => '地点'
);

## Wallet 我的钱包 ##
$I18N['wallet'] = array(
    'en' => 'Wallet',
    'zh-cn' => '我的钱包'
);
$I18N['top-up'] = array(
    'en' => 'Top-up',
    'zh-cn' => '充值'
);
$I18N['redeem-gift-code'] = array(
    'en' => 'Redeem Gift Code',
    'zh-cn' => '使用充值码'
);
$I18N['please-enter-the-code'] = array(
    'en' => 'Please enter the code',
    'zh-cn' => '请输入充值码'
);
$I18N['redeem'] = array(
    'en' => 'Redeem',
    'zh-cn' => '使用'
);
$I18N['top-up-history'] = array(
    'en' => 'Top-up History',
    'zh-cn' => '充值记录'
);
$I18N['no-top-up-history'] = array(
    'en' => 'No Top-up History',
    'zh-cn' => '无充值记录'
);
$I18N['gift-code'] = array(
    'en' => 'Gift Code',
    'zh-cn' => '充值码'
);
$I18N['type'] = array(
    'en' => 'Type',
    'zh-cn' => '类型'
);
$I18N['amount'] = array(
    'en' => 'Amount',
    'zh-cn' => '金额'
);
$I18N['please-enter-amount-feedback'] = array(
    'en' => 'Please enter amount',
    'zh-cn' => '请输入金额'
);
$I18N['date'] = array(
    'en' => 'Date',
    'zh-cn' => '日期'
);
$I18N['purchase-history'] = array(
    'en' => 'Purchase History',
    'zh-cn' => '购买记录'
);
$I18N['no-purchase-history'] = array(
    'en' => 'No Purchase History',
    'zh-cn' => '无购买记录'
);
$I18N['product'] = array(
    'en' => 'Product',
    'zh-cn' => '商品'
);
$I18N['price'] = array(
    'en' => 'Price',
    'zh-cn' => '价格'
);
$I18N['purchase-date'] = array(
    'en' => 'Purchase Date',
    'zh-cn' => '购买时间'
);
$I18N['renewal-date'] = array(
    'en' => 'Renewal Date',
    'zh-cn' => '续费时间'
);
$I18N['auto-renewal-off'] = array(
    'en' => 'Auto-Renewal Off',
    'zh-cn' => '不自动续费'
);
$I18N['auto-renewal-at'] = array(
    'en' => 'Auto-Renewal at $1',
    'zh-cn' => '在 $1 续费'
);
$I18N['data-reset-when-renewal'] = array(
    'en' => 'Data Reset when Renewal',
    'zh-cn' => '续费时重置流量'
);
$I18N['data-auto-reset-off'] = array(
    'en' => 'Data Auto-Renewal Off',
    'zh-cn' => '不自动重置'
);
$I18N['data-auto-reset-on'] = array(
    'en' => 'Data Auto Reset On',
    'zh-cn' => '自动重置'
);
$I18N['no-action'] = array(
    'en' => 'No Action',
    'zh-cn' => '无操作'
);
$I18N['turn-off-auto-renewal'] = array(
    'en' => 'Turn off auto-renewal',
    'zh-cn' => '关闭自动续费'
);
$I18N['payment'] = array(
    'en' => 'Payment',
    'zh-cn' => '支付方式'
);

## Affiliation 邀请注册 ##
$I18N['aff'] = array(
    'en' => 'Affiliation',
    'zh-cn' => '邀请注册'
);
$I18N['total-aff-reward'] = array(
    'en' => 'Total Affiliation Reward',
    'zh-cn' => '累计获得返利金额'
);
$I18N['aff-card-title'] = array(
    'en' => 'When You Invite Your Friend',
    'zh-cn' => '当您邀请朋友注册时'
);
$I18N['aff-card-content-1'] = array(
    'en' => 'Whenever s/he makes a payment, you will be rewarded by <b>$1%</b> of the payment amount',
    'zh-cn' => '每次TA充值时，您都会获得TA的充值金额 <b>$1%</b> 的返利'
);
$I18N['aff-card-content-2'] = array(
    'en' => 'Also, you will get a <b>$1GB</b> Data Usage reward',
    'zh-cn' => '您将一次性获得 <b>$1GB</b> 流量奖励'
);
$I18N['aff-card-content-3'] = array(
    'en' => 'and your friend will get a <b>10 CNY</b> reward',
    'zh-cn' => 'TA将获得 <b>1</b> 元奖励作为初始资金'
);
$I18N['copy-inivtation-link'] = array(
    'en' => ' Copy Inivtation Link',
    'zh-cn' => '复制邀请链接'
);
$I18N['chances-of-invitation-left'] = array(
    'en' => '$1 Chances of Invitation Left',
    'zh-cn' => '剩余 $1 次邀请次数'
);
$I18N['inivitation-link-settings'] = array(
    'en' => 'Inivitation Link Settings',
    'zh-cn' => '邀请链接设置'
);
$I18N['purchase-invitation-chances'] = array(
    'en' => 'Purchase Invitation Chances',
    'zh-cn' => '购买邀请次数'
);
$I18N['customize-my-link'] = array(
    'en' => 'Customize My Link',
    'zh-cn' => '定制邀请链接'
);
$I18N['reset-my-link'] = array(
    'en' => 'Reset My Link',
    'zh-cn' => '重置邀请链接'
);
$I18N['affiliation-history'] = array(
    'en' => 'Affiliation History',
    'zh-cn' => '返利记录'
);
$I18N['invitee-id'] = array(
    'en' => 'Invitee ID',
    'zh-cn' => '被邀请用户ID'
);
$I18N['reward'] = array(
    'en' => 'Reward',
    'zh-cn' => '获得返利'
);
$I18N['no-affiliation-history'] = array(
    'en' => 'No Affiliation History',
    'zh-cn' => '无返利记录'
);
$I18N['purchase-invitation-chances'] = array(
    'en' => 'Purchase Invitation Chances',
    'zh-cn' => '购买邀请次数'
);
$I18N['invitation-chances-price'] = array(
    'en' => 'At $1 CNY/Chance',
    'zh-cn' => '价格为$1元/次'
);
$I18N['enter-invitation-chances'] = array(
    'en' => 'Enter the amount of chances you want to purchase',
    'zh-cn' => '请输入想要购买的次数'
);
$I18N['customize-invitation-link'] = array(
    'en' => 'Customize Invitation Link',
    'zh-cn' => '定制邀请链接'
);
$I18N['customize-invitation-link-price'] = array(
    'en' => 'At $1 CNY/Time',
    'zh-cn' => '价格为$1元/次'
);
$I18N['enter-customize-invitation-link-postfix'] = array(
    'en' => 'Enter your customized postfix of your link',
    'zh-cn' => '输入链接后缀'
);
$I18N['reset-invitation-link'] = array(
    'en' => 'Reset Invitation Link',
    'zh-cn' => '重置邀请链接'
);
$I18N['reset-invitation-link-desc'] = array(
    'en' => 'Are you sure to reset your link? Click "Confirm" to proceed, and this page will refresh',
    'zh-cn' => '确定要要重置邀请链接吗？点击确定后会重置并自动刷新本页。'
);
$I18N['reward'] = array(
    'en' => 'Reward',
    'zh-cn' => '获得返利'
);
$I18N['reward'] = array(
    'en' => 'Reward',
    'zh-cn' => '获得返利'
);
$I18N['reward'] = array(
    'en' => 'Reward',
    'zh-cn' => '获得返利'
);

## Servers 节点列表 ##
$I18N['servers'] = array(
    'en' => 'Servers',
    'zh-cn' => '节点列表'
);
$I18N['online'] = array(
    'en' => 'Online',
    'zh-cn' => '在线'
);
$I18N['rate'] = array(
    'en' => 'Rate',
    'zh-cn' => '倍率'
);
$I18N['load'] = array(
    'en' => 'Load',
    'zh-cn' => '负载'
);
$I18N['speedlimit'] = array(
    'en' => 'Speedlimit',
    'zh-cn' => '限速'
);
$I18N['address'] = array(
    'en' => 'Address',
    'zh-cn' => '地址'
);
$I18N['transport'] = array(
    'en' => 'transport',
    'zh-cn' => '传输协议'
);
$I18N['path'] = array(
    'en' => 'Path',
    'zh-cn' => '路径'
);
$I18N['camouflage-type'] = array(
    'en' => 'Camouflage Type',
    'zh-cn' => '伪装方式'
);
$I18N['vmess-url'] = array(
    'en' => 'Vmess URL',
    'zh-cn' => 'VMess链接'
);
$I18N['server-info'] = array(
    'en' => 'Server Info',
    'zh-cn' => '节点信息'
);



## Apps and Tutorial 下载和使用 ##
$I18N['apps-and-tutorial'] = array(
    'en' => 'Apps and Tutorial',
    'zh-cn' => '下载和教程'
);
$I18N['windows-minimal-version'] = array(
    'en' => 'For Windows 7 or later',
    'zh-cn' => '适用于 Windows 7 或更高版本'
);
$I18N['ios-minimal-version'] = array(
    'en' => 'For iOS 9 or later',
    'zh-cn' => '适用于 iOS 9 或更高版本'
);
$I18N['android-minimal-version'] = array(
    'en' => 'For Android 5.0 or later',
    'zh-cn' => '适用于 Android 5.0 或更高版本'
);
$I18N['mac-minimal-version'] = array(
    'en' => 'For macOS Sierra (10.12) or later',
    'zh-cn' => '适用于 macOS Sierra (10.12) 或更高版本'
);
$I18N['linux-minimal-version'] = array(
    'en' => 'Works with probably all distributions',
    'zh-cn' => '适用于……所有版本？'
);
$I18N['faq-desc'] = array(
    'en' => 'Frequently Asked Questions',
    'zh-cn' => '常见问题解答'
);

## Config History 订阅记录 ##
$I18N['config-history'] = array(
    'en' => 'Config History',
    'zh-cn' => '订阅记录'
);
$I18N['config-history-notice'] = array(
    'en' => 'You can look up all your server config sub log on this page to make sure your account is not compromised',
    'zh-cn' => '您可在此查询您账户所有的订阅记录，确保您的账户没有被盗用'
);
$I18N['no-config-history-yet'] = array(
    'en' => 'No config history yet',
    'zh-cn' => '暂无订阅记录'
);

## Shared Account 共享账号 ##
$I18N['shared-account'] = array(
    'en' => 'Shared Account',
    'zh-cn' => '共享账号'
);
$I18N['account'] = array(
    'en' => 'Account',
    'zh-cn' => '账号'
);
$I18N['click-to-copy'] = array(
    'en' => 'Click to copy',
    'zh-cn' => '点击复制'
);
$I18N['no-access-to-shared-account-desc'] = array(
    'en' => 'Your current plan dose not have access to this account.',
    'zh-cn' => '您目前订阅的会员计划无法查看此共享账号，请升级会员计划。'
);

## Ticket Support 工单支持 ##
$I18N['ticket-support'] = array(
    'en' => 'Ticket Support',
    'zh-cn' => '工单支持'
);
$I18N['new-ticket'] = array(
    'en' => 'New Ticket',
    'zh-cn' => '新建工单'
);
$I18N['notice'] = array(
    'en' => 'Notice',
    'zh-cn' => '提示'
);
$I18N['new-ticket-notice'] = array(
    'en' => 'Make sure you check the FAQ page before creating a new ticket',
    'zh-cn' => '新建工单前请在FAQ页面查看常见问题解答'
);
$I18N['title'] = array(
    'en' => 'Title',
    'zh-cn' => '标题'
);
$I18N['content'] = array(
    'en' => 'Content',
    'zh-cn' => '内容'
);
$I18N['submit'] = array(
    'en' => 'Submit',
    'zh-cn' => '提交'
);
$I18N['my-tickets'] = array(
    'en' => 'My Tickets',
    'zh-cn' => '工单列表'
);
$I18N['create-at'] = array(
    'en' => 'Create at',
    'zh-cn' => '创建时间'
);
$I18N['status'] = array(
    'en' => 'Status',
    'zh-cn' => '状态'
);
$I18N['ticket-closed'] = array(
    'en' => 'Closed',
    'zh-cn' => '已关闭'
);
$I18N['ticket-open'] = array(
    'en' => 'Open',
    'zh-cn' => '处理中'
);
$I18N['reply-ticket'] = array(
    'en' => 'Reply',
    'zh-cn' => '回复'
);
$I18N['close-ticket'] = array(
    'en' => 'Close',
    'zh-cn' => '关闭'
);
$I18N['view-ticket'] = array(
    'en' => 'View Ticket',
    'zh-cn' => '查看工单'
);

## Server Settings 节点设置 ##
$I18N['server-settings'] = array(
    'en' => 'Server Settings',
    'zh-cn' => '节点设置'
);
$I18N['server-settings-notice'] = array(
    'en' => 'You may need to update your configuration on your devices after you change any configurations',
    'zh-cn' => '修改设置后您可能需要在客户端更新节点列表才能恢复使用'
);
$I18N['server-password'] = array(
    'en' => 'Server Password',
    'zh-cn' => '连接密码'
);
$I18N['server-password-desc'] = array(
    'en' => 'When you change your password, your V2Ray UUID will also change. Please update your remote configuration after changing your password.',
    'zh-cn' => '您需要了解的是，修改此密码同时也会变更您 V2Ray 节点的 UUID，请注意及时更新托管订阅。'
);
$I18N['current-server-password'] = array(
    'en' => 'Current Server Password',
    'zh-cn' => '当前连接密码'
);
$I18N['apply-changes'] = array(
    'en' => 'Apply Changes',
    'zh-cn' => '提交更改'
);
$I18N['enter-new-server-password'] = array(
    'en' => 'Enter New Server Password',
    'zh-cn' => '输入新密码'
);
$I18N['ramdom-password'] = array(
    'en' => 'Ramdom Password',
    'zh-cn' => '随机生成密码'
);
$I18N['encryption'] = array(
    'en' => 'Encryption',
    'zh-cn' => '加密方式'
);
$I18N['encryption-desc'] = array(
    'en' => 'Be reminded that SS/SSD/SSR may vary in support of different protocols & obfs',
    'zh-cn' => 'SS/SSD/SSR 支持的加密方式有所不同，请根据实际情况来进行选择'
);
$I18N['current-encryption'] = array(
    'en' => 'Current Encryption',
    'zh-cn' => '当前加密方式'
);
$I18N['protocol-and-obfs'] = array(
    'en' => 'Protocol & Obfs',
    'zh-cn' => '协议和混淆'
);
$I18N['protocol-desc'] = array(
    'en' => 'To make your settings compatible to SS/SSD, please choose "origin" or protocols with "_compatible"<br>
    auth_chain series are experimental protocols, which may cause service unstability. Make sure you ask us about this before you choose this series of protocols',
    'zh-cn' => '如果需要兼容 SS/SSD 请设置为 origin 或选择带_compatible的兼容选项<br>
    auth_chain 系为实验性协议，可能造成不稳定或无法使用，开启前请询问是否支持'
);
$I18N['current-protocol'] = array(
    'en' => 'Current Protocol',
    'zh-cn' => '当前协议'
);
$I18N['obfs-desc'] = array(
    'en' => 'Be reminded that SS/SSD/SSR may vary in support of different protocols & obfs<br>
    If you are using SS/SSD clients, make sure you understand how to download and install obfs plugins',
    'zh-cn' => '如果需要兼容 SS/SSD 请设置为 plain 或选择带_compatible的兼容选项<br>
    SS/SSD 和 SSR 支持的混淆类型有所不同，simple_obfs_* 为 SS/SSD 的混淆方式，其他为 SSR 的混淆方式<br>
    如果使用 SS/SSD 作为客户端，请确保自己知道如何下载并使用混淆插件'
);
$I18N['current-obfs'] = array(
    'en' => 'Current Obfs',
    'zh-cn' => '当前混淆方式'
);
$I18N['current-obfs-param'] = array(
    'en' => 'Current Obfs Param',
    'zh-cn' => '当前混淆参数'
);
$I18N['enter-your-obfs-param'] = array(
    'en' => 'Enter your obfs param',
    'zh-cn' => '输入你的混淆参数'
);
$I18N['reset-config-url'] = array(
    'en' => 'Reset Config URL',
    'zh-cn' => '重置订阅链接'
);
$I18N['reset-config-url-desc'] = array(
    'en' => 'Click to reset your subscribe link. This operation is not invertable.',
    'zh-cn' => '点击会重置您的订阅链接，此操作不可逆，请谨慎操作。'
);
$I18N['currnt-config-url'] = array(
    'en' => 'Current Config URL',
    'zh-cn' => '当前订阅链接'
);
$I18N['reset'] = array(
    'en' => 'Reset',
    'zh-cn' => '重置'
);
$I18N['reset-port'] = array(
    'en' => 'Reset Port',
    'zh-cn' => '重置端口'
);
$I18N['reset-port-desc'] = array(
    'en' => 'Reset to a random port: <code>$1</code> CNY/Time.<br>Change will be effective in 1 min',
    'zh-cn' => '<p>随机更换一个端口使用，价格：<code>$1</code>元/次<br>重置后1分钟内生效</p>'
);
$I18N['current-port'] = array(
    'en' => 'Current Port',
    'zh-cn' => '当前端口'
);
$I18N['customize-port'] = array(
    'en' => 'Customize Port',
    'zh-cn' => '定制端口'
);
$I18N['customize-port-desc'] = array(
    'en' => 'At <code>$1</code> CNY/Time<br>
    Port Range: <code>$2～$3</code>',
    'zh-cn' => '价格：<code>$1</code>元/次端口范围：<code>$2～$3</code>'
);
$I18N['customize-port-input-placeholder'] = array(
    'en' => 'Enter the port you wish to use',
    'zh-cn' => '在这里输入你想要的端口'
);

## Relay 中转系统 ##
$I18N['relay-settings'] = array(
    'en' => 'Relay Settings',
    'zh-cn' => '中转规则'
);
$I18N['relay-notice'] = array(
    'en' => 'Relay rules are used to redirect connection from a relay server to a target server<br>
    Please set the port as your own port<br>
    When there are multiple rules, the rule with a higher priority will be adopted<br>
    When a relay server is not set up, it may be used like how you use any other servers.',
    'zh-cn' => '中转规则一般由中国中转至其他国外节点<br>
    请设置端口号为您自己的端口<br>
    优先级越大，代表其在多个符合条件的规则并存时会被优先采用，当优先级一致时，先添加的规则会被采用<br>
    节点不设置中转时，这个节点就可以当作一个普通的节点来做代理使用<br>'
);
$I18N['add-rule'] = array(
    'en' => 'Add Rule',
    'zh-cn' => '添加规则'
);
$I18N['all-rules'] = array(
    'en' => 'All Rules',
    'zh-cn' => '所有规则'
);
$I18N['rules-table'] = array(
    'en' => 'Rules Talbe',
    'zh-cn' => '规则表'
);
$I18N['relay-table'] = array(
    'en' => 'Relay Table',
    'zh-cn' => '链路表'
);
$I18N['relay-server-origin'] = array(
    'en' => 'Relay Server (Origin)',
    'zh-cn' => '起源节点'
);
$I18N['target-server'] = array(
    'en' => 'Target Server	',
    'zh-cn' => '目标节点'
);
$I18N['port'] = array(
    'en' => 'Port',
    'zh-cn' => '端口'
);
$I18N['priority'] = array(
    'en' => 'Priority',
    'zh-cn' => '优先级'
);
$I18N['edit'] = array(
    'en' => 'Edit',
    'zh-cn' => '编辑'
);
$I18N['delete'] = array(
    'en' => 'Delete',
    'zh-cn' => '删除'
);
$I18N['no-relay-rule'] = array(
    'en' => 'No Existing Relay Rule',
    'zh-cn' => '无中转规则'
);
$I18N['relay-server-in-berween'] = array(
    'en' => 'Relay Server (In-Between)	',
    'zh-cn' => '途径节点'
);
$I18N['no-relay-info'] = array(
    'en' => 'No Relay Info',
    'zh-cn' => '无链路信息'
);
$I18N['reset'] = array(
    'en' => 'Reset',
    'zh-cn' => '重置'
);
$I18N['edit-rule'] = array(
    'en' => 'Edit Rule',
    'zh-cn' => '编辑规则'
);
$I18N['edit'] = array(
    'en' => 'Edit',
    'zh-cn' => '编辑'
);
$I18N['no-relay'] = array(
    'en' => 'No Relay',
    'zh-cn' => '不进行中转'
);

## Audit 审计系统 ##
$I18N['audit-system'] = array(
    'en' => 'Audit System',
    'zh-cn' => '审计系统'
);
$I18N['audit-rules'] = array(
    'en' => 'Audit Rules',
    'zh-cn' => '审计规则'
);
$I18N['audit-rules-notice'] = array(
    'en' => 'For a better user experience, we had to set up following block rules: your connections will be automatically dropped when you hit the following rules<br>
    About Privacy: Your connections are completely private and not monitored by any third party other than the block system itself; thank you for your understanding.',
    'zh-cn' => '为了爱与和平，也同时为了系统的正常运行，特制定了如下过滤规则，当您使用节点执行这些动作时，您的通信就会被截断。<br>
    关于隐私：注意，我们仅用以下规则进行实时匹配和记录匹配到的规则，您的通信方向和通信内容我们不会做任何记录，请您放心。也请您理解我们对于这些不当行为的管理，谢谢 '
);
$I18N['rules'] = array(
    'en' => 'Rules',
    'zh-cn' => '规则'
);
$I18N['name'] = array(
    'en' => 'Name',
    'zh-cn' => '名称'
);
$I18N['description'] = array(
    'en' => 'Description',
    'zh-cn' => '描述'
);
$I18N['regex'] = array(
    'en' => 'Regex',
    'zh-cn' => '正则表达式'
);
$I18N['type'] = array(
    'en' => 'Type',
    'zh-cn' => '类型'
);
$I18N['audit-logs'] = array(
    'en' => 'Audit Logs',
    'zh-cn' => '审计记录'
);
$I18N['logs'] = array(
    'en' => 'Logs',
    'zh-cn' => '记录'
);
$I18N['audit-logs-notice'] = array(
    'en' => 'All block records detected by the system.<br>
    About Privacy: Your connections are completely private and not monitored by any third party other than the block system itself; thank you for your understanding.',
    'zh-cn' => '系统中所有审计记录。<br>
    关于隐私：注意，我们仅用以下规则进行实时匹配和记录匹配到的规则，您的通信方向和通信内容我们不会做任何记录，请您放心。也请您理解我们对于这些不当行为的管理，谢谢 '
);

## Other Modals ##
$I18N['failed'] = array(
    'en' => 'Failed',
    'zh-cn' => '失败'
);
$I18N['join-telegram-group-modal-text'] = array(
    'en' => '加入群组之前需要在 <a href="/user/profile">我的账号</a> 页面绑定 Telegram 账号，未绑定则无法加入群组。',
    'zh-cn' => '加入群组之前需要在 <a href="/user/profile">我的账号</a> 页面绑定 Telegram 账号，未绑定则无法加入群组。'
);
$I18N['success-got-daily-bonus'] = array(
    'en' => 'Wow',
    'zh-cn' => '签到成功'
);
$I18N['got-daily-bonus'] = array(
    'en' => 'You got $1 MB data as bonus',
    'zh-cn' => '你获得了 $1 MB流量'
);
$I18N['server-password-changed-successfully'] = array(
    'en' => 'Server password changed successfully',
    'zh-cn' => '成功更改连接密码'
);
$I18N['encryption-changed-successfully'] = array(
    'en' => 'Encryption changed successfully',
    'zh-cn' => '成功更改加密方式'
);
$I18N['protocol-and-obfs-changed-successfully'] = array(
    'en' => 'Protocol and obfs changed successfully',
    'zh-cn' => '成功设置混淆和协议'
);
$I18N['reset-config-url-confirm-modal-title'] = array(
    'en' => 'Are you sure you want to reset config url?',
    'zh-cn' => '确定要重置订阅链接吗?'
);
$I18N['reset-config-url-confirm-modal-desc'] = array(
    'en' => 'This operation is not invertable',
    'zh-cn' => '此操作不可逆，请谨慎操作'
);
$I18N['config-url-has-been-reseted'] = array(
    'en' => 'Your config url has been reseted',
    'zh-cn' => '已重置订阅链接'
);
$I18N['config-url-reset-modal-desc'] = array(
    'en' => 'You need to update your config url on your devices after reset',
    'zh-cn' => '您需要在客户端内删除旧订阅链接，然后添加新订阅链接'
);
$I18N['port-reseted-successfully'] = array(
    'en' => 'Port reseted successfully',
    'zh-cn' => '成功重置端口'
);
$I18N['new-port'] = array(
    'en' => 'New port: ',
    'zh-cn' => '新端口: '
);
$I18N['customize-port-successfully'] = array(
    'en' => 'Customize port successfully',
    'zh-cn' => '成功定制端口'
);
$I18N['please-enter-the-amount-of-chances-feedback'] = array(
    'en' => 'Please enter the amount of chances',
    'zh-cn' => '请输入购买次数'
);
$I18N['successful-purchase'] = array(
    'en' => 'Successful purchase',
    'zh-cn' => '购买成功'
);
$I18N['go-to-wallet'] = array(
    'en' => 'Go to wallet',
    'zh-cn' => '前往我的钱包充值'
);
$I18N['please-enter-postfix-inivitation-link-feedback'] = array(
    'en' => 'Please enter postfix of your link',
    'zh-cn' => '请输入定制后缀'
);
$I18N['customize-inivitation-link-successfully'] = array(
    'en' => 'Customize inivitation link successfully',
    'zh-cn' => '成功定制邀请链接后缀'
);
$I18N['2fa-has-been-disabled'] = array(
    'en' => '2FA has been disabled for your account',
    'zh-cn' => '已关闭二步验证'
);
$I18N['password-changed-successfully'] = array(
    'en' => 'Password changed successfully',
    'zh-cn' => '成功更改密码'
);
$I18N['your-account-has-been-deleted'] = array(
    'en' => 'Your account has been deleted',
    'zh-cn' => '您的账号已删除，后会有期！'
);
$I18N['submitted'] = array(
    'en' => 'Submitted',
    'zh-cn' => '已提交'
);
$I18N['this-ticket-has-been-closed'] = array(
    'en' => 'This ticket has been closed',
    'zh-cn' => '此工单已关闭'
);
$I18N['unable-import-config-on-computer-modal'] = array(
    'en' => 'Unable import this config on computer, please tap import config button on your mobile device.',
    'zh-cn' => '导入配置到此客户端需要在手机浏览器操作，无法在电脑端导入。'
);
$I18N['proceed'] = array(
    'en' => 'Proceed',
    'zh-cn' => '继续操作'
);
$I18N['top-up-successful'] = array(
    'en' => 'Top-up successful',
    'zh-cn' => '充值成功'
);

// Payment result page
$I18N['payment-result'] = array(
    'en' => 'Payment result',
    'zh-cn' => '支付结果'
);
$I18N['payment-result-confirmed'] = array(
    'en' => 'Payment result confirmed',
    'zh-cn' => '支付结果已确认'
);
$I18N['payment-result-confirmed-info'] = array(
    'en' => 'The $1 you topped up has already been credited, feel free to close this page!',
    'zh-cn' => '您充值的 $1 元已到账，可以随意关闭此页面'
);
$I18N['payment-result-waiting'] = array(
    'en' => 'Please wait while the payment result is confirmed',
    'zh-cn' => '支付结果确认中，请稍等'
);
$I18N['payment-result-waiting-info'] = array(
    'en' => 'You can also choose to close this page, the recharge amount will be automatically credited',
    'zh-cn' => '您也可以选择关闭此页面，充值的金额将自动到账'
);
$I18N['go-to-my-wallet'] = array(
    'en' => 'Go to my wallet 👉',
    'zh-cn' => '前往我的钱包 👉'
);

// reset password page
$I18N['reset-password'] = array(
    'en' => 'Reset password',
    'zh-cn' => '找回密码'
);
$I18N['reset-password-info'] = array(
    'en' => 'We will send an email with a link to reset your password to your email mailbox',
    'zh-cn' => '我们将会发送一封包含重置密码链接的邮件到您的邮箱'
);
$I18N['back-to-login'] = array(
    'en' => '返回登录',
    'zh-cn' => 'Back to login
    '
);
$I18N['reset-password-page-button'] = array(
    'en' => 'Reset',
    'zh-cn' => '找回密码'
);