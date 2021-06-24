<!DOCTYPE html>
<!-- saved from url=(0033)https://www.jindcloud.com/#client -->
<html class="no-js" lang="zxx">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>{$config['appName']} - 世界触手可及 </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="shortcut icon" type="image/x-icon" href="/theme/malio/imgm/icon/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- all css here -->
    <link rel="stylesheet" href="/theme/wukong/css/bootstrap.min.css">
    <link rel="stylesheet" href="/theme/wukong/css/font-awesome.min.css">
    <link rel="stylesheet" href="/theme/wukong/css/icofont.css">
    <link rel="stylesheet" href="/theme/wukong/css/meanmenu.min.css">
    <link rel="stylesheet" href="/theme/wukong/css/slick.css">
    <link rel="stylesheet" href="/theme/wukong/css/owl.carousel.css">
    <link rel="stylesheet" href="/theme/wukong/css/magnific-popup.css">
    <link rel="stylesheet" href="/theme/wukong/css/animate.css">
    <link rel="stylesheet" href="/theme/wukong/css/animated-headlines.css">
    <link rel="stylesheet" href="/theme/wukong/css/shortcodes.css">
    <link rel="stylesheet" href="/theme/wukong/css/stylem.css">
    <link rel="stylesheet" href="/theme/wukong/css/responsive.css">
    <script src="/theme/wukong/js/modernizr-2.8.3.min.js"></script>

</head>
<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<!-- header area start -->
<header>
    <nav id="header-top" class="navbar navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation"
                        aria-expanded="false">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/#">
                    <span style="color: #ffffff;width:100%;font-size: 28px;" class="img-responsive">
                        {$config['appName']}
                    </span>
                </a>
            </div>
            <div class="collapse navbar-collapse" id="navigation">
                <ul class="nav navbar-nav navbar-right">
                    <li class=""><a href="/#slider-area">首页</a></li>
                    <li class=""><a href="/#about">产品</a></li>
                    <li class=""><a href="/#features">优势</a></li>
                    <li class=""><a href="/#pricing">价格</a></li>
                    <li class=""><a href="/#client">下载</a></li>
                    <!--<li><a href="#team">Team</a></li>-->
                    <li class="active"><a target="_blank" href="/auth/login">登录</a></li>
                    <li><a target="_blank" class="download-btn" href="/auth/register">注册</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<!-- header area end -->
<!-- hero area start -->
<div class="hero-area slider-4" id="slider-area">
    <div class="slider">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-4 col-sm-offset-4 col-md-8">
                    <div class="hero-text mr-ri-l">
                        <h1>{$config['appName']}</h1>
                        <h1>{$i18n->get('index-slogan')}</h1>
                        <p> {$i18n->get('index-text-under-slogan')}</p>
                        <a target="_blank" href="/auth/login" class="hero-btn">登录</a>
                        <a target="_blank" href="/auth/register" class="hero-btn">免费试用</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="slide-animation wow slideInLeft" data-wow-duration="2s" data-wow-delay="1s"
             style="visibility: visible; animation-duration: 2s; animation-delay: 1s; animation-name: slideInLeft;">
            <img src="/theme/wukong/png/10.png" alt="">
        </div>
    </div>
</div>
<!-- hero area end -->
<!-- service area start -->
<section class="service-area gray-bg">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="single-service">
                    <div class="service-icon">
                        <img src="/theme/wukong/png/service-icon-1.png" alt="">
                    </div>
                    <div class="service-content">
                        <h2>各大平台全通用</h2>
                        <p>一个账号各大平台全通用（MacOS、Windows、IOS、Android、Linux和路由器等）</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="single-service">
                    <div class="service-icon">
                        <img src="/theme/wukong/png/service-icon-2.png" alt="">
                    </div>
                    <div class="service-content">
                        <h2>高速流畅</h2>
                        <p>油管4K视频、网络直播如滑水般流畅，谷歌Google、推特、脸谱毫无压力，支持免费体验</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 hidden-sm">
                <div class="single-service">
                    <div class="service-icon">
                        <img src="/theme/wukong/png/service-icon-3.png" alt="">
                    </div>
                    <div class="service-content">
                        <h2>长期运营</h2>
                        <p>信誉可靠，实力雄厚，提供长期运营的VPN服务</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- service area start -->
<!-- About area start -->
<section id="about" class="about-area pt-125">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="about-content">
                    <h2>{$i18n->get('index-section-2-title')}</h2>
                    <p>{$i18n->get('index-section-2-desc')}</p>
                    <p>{$i18n->get('index-section-3-desc')}</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="about-img">
                    <img src="/theme/wukong/png/about.png" alt="">
                </div>
            </div>
        </div>
    </div>
</section>
<!-- About area End -->
<!-- Feature area start -->
<section id="features" class="feature-area gray-bg pt-128 pb-70">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="section-heading pb-55 text-center">
                    <h2>产品优势</h2>
                    <p>产品创新，支持分布式高可用集群技术（独有），支持BGP全中转隧道加速技术，支持 V2RAY+SSR 网络双栈加速技术</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="awesome-feature text-center">
                    <div class="awesome-feature-icon">
                        <span><i class="icofont icofont-alarm"></i></span>
                    </div>
                    <div class="awesome-feature-details">
                        <h5>全球网络覆盖</h5>
                        <p>覆盖亚太、北美、西欧等全球网络区域，具备香港、东京等数据交换中心</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="awesome-feature text-center">
                    <div class="awesome-feature-icon">
                        <span><i class="icofont icofont-light-bulb"></i></span>
                    </div>
                    <div class="awesome-feature-details">
                        <h5>智能极速带宽</h5>
                        <p>智能带宽动态管理技术，带来极畅快的网络体验</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 hidden-sm">
                <div class="awesome-feature text-center">
                    <div class="awesome-feature-icon">
                        <span><i class="icofont icofont-code"></i></span>
                    </div>
                    <div class="awesome-feature-details">
                        <h5>智能安全防护</h5>
                        <p>智能加密技术确保用户会话不被非法窃听，保障个人隐私安全</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="awesome-feature text-center">
                    <div class="awesome-feature-icon">
                        <span><i class="icofont icofont-ui-video-chat"></i></span>
                    </div>
                    <div class="awesome-feature-details">
                        <h5>教育科研</h5>
                        <p>筋斗云帮助科研人员科学上网，随时随地查阅科研文献</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="awesome-feature text-center">
                    <div class="awesome-feature-icon">
                        <span><i class="icofont icofont-ui-head-phone"></i></span>
                    </div>
                    <div class="awesome-feature-details">
                        <h5>视听娱乐</h5>
                        <p>筋斗云实现颠覆性的4K高清视频超畅快体验</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 hidden-sm">
                <div class="awesome-feature text-center">
                    <div class="awesome-feature-icon">
                        <span><i class="icofont icofont-heart"></i></span>
                    </div>
                    <div class="awesome-feature-details">
                        <h5>跨境外贸</h5>
                        <p>筋斗云帮助外贸人员使用外贸应用连接全球客户</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Feature feature area end -->
<!-- How it work start -->
<section class="how-work-area pt-130 pb-125 bg-1">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="how-work-right text-center">
                    <img src="/theme/wukong/png/work.png" alt="">
                </div>
            </div>
            <div class="col-md-6">
                <div class="how-work-left mt-90">
                    <h2>产品使用</h2>
                    <div class="how-work-tab mt-55">
                        <ul>
                            <li class="active"><a data-toggle="tab" href="/#home">1. 注册</a></li>
                            <li><a data-toggle="tab" href="/#menu1">2. 下载</a></li>
                            <li><a data-toggle="tab" href="/#menu2">3. 运行</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="home" class="mt-45 tab-pane fade in active">
                                <p>1.免费注册并登录，进入用户中心</p>
                            </div>
                            <div id="menu1" class="mt-45 tab-pane fade">
                                <p>2并安装对应平台的客户端软件</p>
                            </div>
                            <div id="menu2" class="mt-45 tab-pane fade">
                                <p>3.观看本站提供的原创视频教程，运行和配置客户端软件，畅游云端世界</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- How it work End -->
<!-- fun fact area start -->
<section class="funfact-area bg-2 pt-125 pb-130">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="single-fact text-center">
                    <h2 class="counter">28000</h2>
                    <h5>教育科研工作者</h5>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="single-fact text-center">
                    <h2 class="counter">39000</h2>
                    <h5>视听娱乐用户</h5>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="single-fact text-center">
                    <h2 class="counter">23000</h2>
                    <h5>币圈炒股用户</h5>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="single-fact text-center">
                    <h2 class="counter">11000</h2>
                    <h5>跨境外贸工作者</h5>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- fun fact area end -->
<!-- app screenshot area start -->
<!--
<section class="screenshot-area pt-130 pb-130">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="section-heading pb-55 text-center">
                    <h2>App Screenshots</h2>
                    <p>Lorem Ipsum is slechts een proeftekst uit het drukkerij- en zetterijwezen. Lorem Ipsum is de standaard proeftekst in deze bedrijfstak sinds.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <div class="screenshot-slider">
                    <div class="single-screenshot">
                        <div class="image">
                            <img src="/theme/wukong/imgm/screenshot/1.png" alt="">
                        </div>
                    </div>
                    <div class="single-screenshot">
                        <div class="image">
                            <img src="/theme/wukong/imgm/screenshot/2.png" alt="">
                        </div>
                    </div>
                    <div class="single-screenshot">
                        <div class="image">
                            <img src="/theme/wukong/imgm/screenshot/3.png" alt="">
                        </div>
                    </div>
                    <div class="single-screenshot">
                        <div class="image">
                            <img src="/theme/wukong/imgm/screenshot/4.png" alt="">
                        </div>
                    </div>
                    <div class="single-screenshot">
                        <div class="image">
                            <img src="/theme/wukong/imgm/screenshot/5.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
-->
<!-- app screenshot area end -->

<!-- Pricing Plan Area Start -->
<section id="pricing" class="pricing-area pt-130 pb-100">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="section-heading pb-55 text-center">
                    <h2>{$i18n->get('index-section-5-title')}</h2>
                    <p>{$i18n->get('index-section-5-desc')}</p>
                    {*          <p>备注：高可用集群属本站独有，具备流量负载均衡和故障自动切换功能</p>*}
                </div>
            </div>
        </div>
        <div class="row">
            {foreach $I18N['plans-info'][$i18n->lang] as $name => $plan}
                <div class="col-md-4 col-sm-6">
                    <div class="pricing-single white-bg text-center mb-30">
                        <div class="price-titel uppercase">
                            <h4> {$plan['name']} </h4>
                        </div>
                        <div class="pricing-price">
                            <span>{$plan['currency']}{$plan['price']}<p>/{$plan['billing']}</p></span>
                        </div>
                        <div class="price-decs">
                            <ul>
                                {foreach $plan['features'] as $feature}
                                    <li> {$feature['name']}</li>
                                {/foreach}
                            </ul>
                        </div>
                        <div class="ordr-btn uppercase">
                            <a target="_blank" href="/auth/register">{$i18n->get('subscribe')}</a>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
</section>
<!-- Pricing Plan Area End -->
<!-- Team Area Start -->
<section id="team" class="team-area ptb-130">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="section-heading pb-55 text-center">
                    <h2>客户群体</h2>
                    <p>聚集教育、科研、币圈、跨境外贸、娱乐资讯等各行各业的精英人士</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="team-single">
                    <img src="/theme/wukong/png/1.png" alt="">
                    <div class="team-overlay text-center">
                        <h5>Sathi</h5>
                        <h6>科研人员</h6>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="team-single">
                    <img src="/theme/wukong/png/2.png" alt="">
                    <div class="team-overlay text-center">
                        <h5>Kausar</h5>
                        <h6>娱乐爱好者</h6>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="team-single">
                    <img src="/theme/wukong/png/3.png" alt="">
                    <div class="team-overlay text-center">
                        <h5>Nirob</h5>
                        <h6>币圈投资者</h6>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="team-single">
                    <img src="/theme/wukong/png/4.png" alt="">
                    <div class="team-overlay text-center">
                        <h5>Rana</h5>
                        <h6>外贸工作者</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Testimonial Area Start -->
<section id="client" class="testimonial-area pt-120 pb-130 bg-4">
    <div class="container">
        <div class="row">
            <div class="testimonial-active owl-carousel owl-loaded owl-drag">
                <div class="owl-stage-outer">
                    <div class="owl-stage"
                         style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 3540px;">
                        {foreach $I18N['index-user-reviews'][$i18n->lang] as $review}
                        <div class="owl-item active" style="width: 1170px; margin-right: 10px;">
                            <div class="col-md-12">
                                <div class="testimonial-desc text-center">
                                    <p>{$review['review']}</p>
                                    <h4>{$review['user']}</h4>
                                </div>
                            </div>
                        </div>
                        {/foreach}
                    </div>
                </div>
                <div class="owl-nav disabled">
                    <div class="owl-prev">prev</div>
                    <div class="owl-next">next</div>
                </div>
                <div class="owl-dots disabled"></div>
            </div>
        </div>
    </div>
</section>
<!-- Testimonial Area End -->
<!-- Download Area Start -->
<section class="download-area bg-3 ptb-130">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="section-heading text-center pb-45">
                    <h2>软件下载</h2>
                    <p>请下载客户端软件，免费注册并登录，进入用户中心观看视频教程</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="download-option-btn text-center">
                    <ul>
                        <li>
                            <a href="http://ossi.vpn200.net:38888/vpn/downloads/ClashX.dmg"><i
                                        class="icofont icofont-brand-apple"></i> MacOS </a>
                            <a class="active"
                               href="http://ossi.vpn200.net:38888/vpn/downloads/Clash.for.Windows-0.9.1-win.7z"><i
                                        class="icofont icofont-brand-windows"></i> Windows </a>
                            <a href="/user/tutorial?os=ios&amp;client=shadowrocket"><i
                                        class="icofont icofont-brand-apple"></i> App Store</a>
                            <a href="http://ossi.vpn200.net:38888/vpn/downloads/clash-for-android.apk"><i
                                        class="icofont icofont-brand-android-robot"></i> Android</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Download Area End -->
<!-- Team Area End -->
<!-- Subcribe Area Start -->
<!--
<section class="subcribe-area pt-130 pb-115 bg-6">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="section-heading pb-35 text-center">
                    <h2>Subscribe a free update</h2>
                    <p>Lorem Ipsum is slechts een proeftekst uit het drukkerij- en zetterijwezen. Lorem Ipsum is de standaard proeftekst in deze bedrijfstak sinds.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="subcribe-form text-center">
                    <form id="mc-form">
                        <input autocomplete="off" placeholder="Enter Your Email" type="text">
                        <button type="submit">Subscribe</button>

                        <div class="mailchimp-alerts text-centre">
                            <div class="mailchimp-submitting"></div>
                            <div class="mailchimp-success"></div>
                            <div class="mailchimp-error"></div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
-->
<!-- Subcribe Area End -->
<!-- Contact Area Start -->
<!--
<div id="contact" class="contact-area pt-130">
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="contact-form">
                    <form class="form" name="enq" method="post" action="mail.php">
                        <div class="row">
                            <div class="form-group col-md-12">
                                <input type="text" name="name" class="form-control" id="first-name" placeholder="Name" required="required">
                            </div>
                            <div class="form-group col-md-12">
                                <input type="email" name="email" class="form-control" id="email" placeholder="Email" required="required">
                            </div>
                            <div class="form-group description col-md-12 mbnone">
                                <textarea rows="3" name="message" class="form-control" id="description" placeholder="Message" required="required"></textarea>
                            </div>
                            <div class="col-md-12">
                                <div class="actions text-center">
                                    <input type="submit" value="SUBMIT" name="submit" class="btn btn-lg btn-contact-bg" title="Submit Your Message!">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="google-map">
                    <div id="map"></div>
                </div>

            </div>
        </div>
    </div>
</div>
-->

<!-- Contact Area End -->
<!-- Copyright Area Start -->
<div class="copyright-area bg-7 ptb-65">
    <div class="container">
        <!-- Contact address left -->
        <div class="row">
            <div class="conct-border two">
                <div class="col-md-4 col-sm-4">
                    <div class="single-address">
                        <div class="media">
                            <div class="media-left">
                                <i class="icofont icofont-phone"></i>
                            </div>
                            <div class="media-body text-center">
                                <p>电报群 <br> https://t.me/vpn200g1 </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="single-address">
                        <div class="media">
                            <div class="media-left">
                                <i class="icofont icofont-web"></i>
                            </div>
                            <div class="media-body text-center">
                                <p>{$config['appName']}官网<br> {$config['baseUrl']} </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="single-address">
                        <div class="media">
                            <div class="media-left">
                                <i class="icofont icofont-social-google-map"></i>
                            </div>
                            <div class="media-body text-center">
                                <p>{$config['appName']} <br> 您的智能云专线</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact address left -->
        <!-- Copyright right -->
        <div class="row">
            <div class="col-md-12">
                <div class="copyright-area text-center">
                    <!-- Copyright social -->
                    <div class="contact-social text-center pt-70 pb-35">
                        <ul>
                            <li>
                                <a target="_blank" href="https://t.me/vpn200g1"><i
                                            class="icofont icofont-social-facebook"></i></a>

                            </li>
                            <li>
                                <a target="_blank" href="https://t.me/vpn200g1"><i
                                            class="icofont icofont-social-twitter"></i></a>


                            </li>
                            <li>

                                <a target="_blank" href="https://t.me/vpn200g1"><i
                                            class="icofont icofont-social-pinterest"></i></a>
                            </li>
                            <li>

                                <a target="_blank" href="https://t.me/vpn200g1"><i
                                            class="icofont icofont-social-vimeo"></i></a>
                            </li>
                            <li>

                                <a target="_blank" href="https://t.me/vpn200g1"><i
                                            class="icofont icofont-social-google-plus"></i></a>
                            </li>
                        </ul>
                    </div>
                    <!-- Copyright social -->
                    <div class="copyright-text">
                        <p>Copyright © <a href="/#"> {$config['appName']}. </a> All Rights Reserved.</p>
                    </div>
                    <!-- Copyright text -->
                </div>
            </div>
        </div>
        <!-- Copyright right -->
    </div>
</div>
<!-- Copyright Area End -->

<!-- all js here -->
<script src="/theme/wukong/js/jquery-1.12.4.min.js"></script>
<script src="/theme/wukong/js/bootstrap.min.js"></script>
<script src="/theme/wukong/js/owl.carousel.min.js"></script>
<script src="/theme/wukong/js/slick.min.js"></script>
<script src="/theme/wukong/js/jquery.ajaxchimp.min.js"></script>
<script src="/theme/wukong/js/plugins.js"></script>
<script src="/theme/wukong/js/main.js"></script>
<a id="scrollUp" href="/#top" style="position: fixed; z-index: 2147483647;"><i class="fa fa-angle-up"></i></a>
<!-- map js -->
<!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwIQh7LGryQdDDi-A603lR8NqiF3R_ycA"></script>-->
<!--
<script>
    /*START CONTACT MAP JS*/
    function initialize() {
      var mapOptions = {
        zoom: 12,
        scrollwheel: false,
        center: new google.maps.LatLng(43.538263, -80.305922)
      };
      var map = new google.maps.Map(document.getElementById('map'),
          mapOptions);
      var marker = new google.maps.Marker({
        position: map.getCenter(),
        icon: '/theme/wukong/imgm/icon/map-icon.png',
        map: map
      });
    }
    google.maps.event.addDomListener(window, 'load', initialize);
   /*END CONTACT MAP JS*/
</script>
-->


</body>
</html>
