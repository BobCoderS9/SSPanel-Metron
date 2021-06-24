<!DOCTYPE html>
<html lang="cn"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="/favicon.ico">
    <link rel="stylesheet" href="/theme/cool/bootstrap.min.css">
    <link rel="stylesheet" href="/theme/cool/animate.min.css">
    <link rel="stylesheet" href="/theme/cool/meanmenu.css">
    <link rel="stylesheet" href="/theme/cool/slick.min.css">
    <link rel="stylesheet" href="/theme/cool/style.css">
    <link rel="stylesheet" href="/theme/cool/responsive.css">
    <title>{$config['appName']}</title>
</head>
<body>

<div class="preloader" style="display: none;">
    <div class="spinner"></div>
</div>

<header id="header" class="headroom headroom--not-bottom headroom--top">
    <div class="startp-responsive-nav">
        <div class="container">
            <div class="startp-responsive-menu">
                <div class="logo">
                    <a href="/">
                        {$config['appName']}
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="startp-nav">
        <div class="container">
            <nav class="navbar navbar-expand-md navbar-light">
                <a class="navbar-brand" href="/">{$config['appName']}</a>
                <div class="collapse navbar-collapse mean-menu" id="navbarSupportedContent" style="display: block;">
                    <ul class="navbar-nav nav ml-auto">
                        <li class="nav-item"><a href="/#features" class="nav-link">特性</a></li>
                        <li class="nav-item"><a href="/#purchase" class="nav-link">价格</a></li>
                        <li class="nav-item"><a href="/" class="nav-link">支持</a></li>
                    </ul>
                </div>
                <div class="others-option">
                    {if $user->isLogin}
                        <a href="/user" class="btn btn-primary">用户中心</a>
                    {else}
                        <a href="/auth/register" class="btn btn-light">注册</a>
                        <a href="/auth/login" class="btn btn-primary">登录</a>
                    {/if}
                </div>
            </nav>
        </div>
    </div>
</header>


<div class="main-banner">
    <div class="d-table">
        <div class="d-table-cell">
            <div class="container">
                <div class="row h-100 justify-content-center align-items-center">
                    <div class="col-lg-5">
                        <div class="hero-content">
                            <h1>{$config['appName']}</h1>
                            <p>科学上网畅通无阻、科学游戏加速响应</p>
                            <a href="/auth/register" class="btn btn-primary">开始使用</a>
                        </div>
                    </div>
                    <div class="col-lg-6 offset-lg-1">
                        <div class="banner-image">
                            <img src="/theme/cool/man.png" class="wow fadeInDown" data-wow-delay="0.6s" alt="man" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInDown;">
                            <img src="/theme/cool/code.png" class="wow fadeInUp" data-wow-delay="0.6s" alt="code" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">
                            <img src="/theme/cool/carpet.png" class="wow fadeInLeft" data-wow-delay="0.6s" alt="carpet" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInLeft;">
                            <img src="/theme/cool/bin.png" class="wow zoomIn" data-wow-delay="0.6s" alt="bin" style="visibility: visible; animation-delay: 0.6s; animation-name: zoomIn;">
                            <img src="/theme/cool/book.png" class="wow bounceIn" data-wow-delay="0.6s" alt="book" style="visibility: visible; animation-delay: 0.6s; animation-name: bounceIn;">
                            <img src="/theme/cool/dekstop.png" class="wow fadeInDown" data-wow-delay="0.6s" alt="dekstop" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInDown;">
                            <img src="/theme/cool/dot.png" class="wow zoomIn" data-wow-delay="0.6s" alt="dot" style="visibility: visible; animation-delay: 0.6s; animation-name: zoomIn;">
                            <img src="/theme/cool/flower-top-big.png" class="wow fadeInUp" data-wow-delay="0.6s" alt="flower-top-big" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">
                            <img src="/theme/cool/flower-top.png" class="wow rotateIn" data-wow-delay="0.6s" alt="flower-top" style="visibility: visible; animation-delay: 0.6s; animation-name: rotateIn;">
                            <img src="/theme/cool/keyboard.png" class="wow fadeInUp" data-wow-delay="0.6s" alt="keyboard" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">
                            <img src="/theme/cool/pen.png" class="wow zoomIn" data-wow-delay="0.6s" alt="pen" style="visibility: visible; animation-delay: 0.6s; animation-name: zoomIn;">
                            <img src="/theme/cool/tea-cup.png" class="wow fadeInLeft" data-wow-delay="0.6s" alt="tea-cup" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInLeft;">
                            <img src="/theme/cool/headphone.png" class="wow rollIn" data-wow-delay="0.6s" alt="headphone" style="visibility: visible; animation-delay: 0.6s; animation-name: rollIn;">
                            <img src="/theme/cool/main-pic.png" class="wow fadeInUp animated" data-wow-delay="0.6s" alt="main-pic" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="shape1"><img src="/theme/cool/shape1.png" alt="shape"></div>
    <div class="shape2 rotateme"><img src="/theme/cool/shape2.svg" alt="shape"></div>
    <div class="shape3"><img src="/theme/cool/shape3.svg" alt="shape"></div>
    <div class="shape4"><img src="/theme/cool/shape4.svg" alt="shape"></div>
    <div class="shape5"><img src="/theme/cool/shape5.png" alt="shape"></div>
    <div class="shape6 rotateme"><img src="/theme/cool/shape4.svg" alt="shape"></div>
    <div class="shape7"><img src="/theme/cool/shape4.svg" alt="shape"></div>
    <div class="shape8 rotateme"><img src="/theme/cool/shape2.svg" alt="shape"></div>
</div>


<section class="boxes-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-box">
                    <div class="icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-server"><rect x="2" y="2" width="20" height="8" rx="2" ry="2"></rect><rect x="2" y="14" width="20" height="8" rx="2" ry="2"></rect><line x1="6" y1="6" x2="6" y2="6"></line><line x1="6" y1="18" x2="6" y2="18"></line></svg>
                    </div>
                    <h3>服务</h3>
                    <p>致力于为用户提供高速稳定的高性价比网络中继服务</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-box bg-f78acb">
                    <div class="icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-code"><polyline points="16 18 22 12 16 6"></polyline><polyline points="8 6 2 12 8 18"></polyline></svg>
                    </div>
                    <h3>便携设置</h3>
                    <p>借助第三方客户端，可在手机、电脑、路由器、游戏机、电视盒子中使用</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-box bg-eb6b3d">
                    <div class="icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-git-branch"><line x1="6" y1="3" x2="6" y2="15"></line><circle cx="18" cy="6" r="3"></circle><circle cx="6" cy="18" r="3"></circle><path d="M18 9a9 9 0 0 1-9 9"></path></svg>
                    </div>
                    <h3>教程</h3>
                    <p>我们用心设计教程，详细解说每一步配置，即使是零基础小白用户也可以无忧使用只需下载软件、复制粘贴，即可享用最优的定制服务</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-box bg-c679e3">
                    <div class="icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                    </div>
                    <h3>稳定</h3>
                    <p>我们将严格遵守用户隐私保护法，在传输过程中使用最强的加密方式，致力于保护每一位用户的隐私，稳定运营是我们团队一直以来的追求</p>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="services-area ptb-80 bg-f7fafd">
    <div class="container">
        <div class="row h-100 justify-content-center align-items-center" id="features">
            <div class="col-lg-6 col-md-12 services-content">
                <div class="section-title">
                    <h2>为你 量身定制 的服务</h2>
                    <div class="bar"></div>
                    <p>可靠的基础设施，并能提供您喜爱的诸多功能</p>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="box">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-database"><ellipse cx="12" cy="5" rx="9" ry="3"></ellipse><path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"></path><path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"></path></svg> 高速稳定
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="box">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg> 便携设置
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="box">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg> 节省成本
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="box">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trending-up"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg> 全球互联
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="box">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-server"><rect x="2" y="2" width="20" height="8" rx="2" ry="2"></rect><rect x="2" y="14" width="20" height="8" rx="2" ry="2"></rect><line x1="6" y1="6" x2="6" y2="6"></line><line x1="6" y1="18" x2="6" y2="18"></line></svg> 运营商友好
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="box">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-monitor"><rect x="2" y="3" width="20" height="14" rx="2" ry="2"></rect><line x1="8" y1="21" x2="16" y2="21"></line><line x1="12" y1="17" x2="12" y2="21"></line></svg> 多应用兼容
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-12 services-right-image">
                <img src="/theme/cool/book-self.png" class="wow fadeInDown" data-wow-delay="0.6s" alt="book-self" style="visibility: hidden; animation-delay: 0.6s; animation-name: none;">
                <img src="/theme/cool/box.png" class="wow fadeInUp" data-wow-delay="0.6s" alt="box" style="visibility: hidden; animation-delay: 0.6s; animation-name: none;">
                <img src="/theme/cool/chair.png" class="wow fadeInLeft" data-wow-delay="0.6s" alt="chair" style="visibility: hidden; animation-delay: 0.6s; animation-name: none;">
                <img src="/theme/cool/cloud.png" class="wow zoomIn" data-wow-delay="0.6s" alt="cloud" style="visibility: hidden; animation-delay: 0.6s; animation-name: none;">
                <img src="/theme/cool/cup.png" class="wow bounceIn" data-wow-delay="0.6s" alt="cup" style="visibility: hidden; animation-delay: 0.6s; animation-name: none;">
                <img src="/theme/cool/flower-top.png" class="wow fadeInDown" data-wow-delay="0.6s" alt="flower" style="visibility: hidden; animation-delay: 0.6s; animation-name: none;">
                <img src="/theme/cool/head-phone.png" class="wow zoomIn" data-wow-delay="0.6s" alt="head-phone" style="visibility: hidden; animation-delay: 0.6s; animation-name: none;">
                <img src="/theme/cool/monitor.png" class="wow fadeInUp" data-wow-delay="0.6s" alt="monitor" style="visibility: hidden; animation-delay: 0.6s; animation-name: none;">
                <img src="/theme/cool/mug.png" class="wow rotateIn" data-wow-delay="0.6s" alt="mug" style="visibility: hidden; animation-delay: 0.6s; animation-name: none;">
                <img src="/theme/cool/tissue.png" class="wow zoomIn" data-wow-delay="0.6s" alt="tissue" style="visibility: hidden; animation-delay: 0.6s; animation-name: none;">
                <img src="/theme/cool/water-bottle.png" class="wow zoomIn" data-wow-delay="0.6s" alt="water-bottle" style="visibility: hidden; animation-delay: 0.6s; animation-name: none;">
                <img src="/theme/cool/wifi.png" class="wow fadeInLeft" data-wow-delay="0.6s" alt="wifi" style="visibility: hidden; animation-delay: 0.6s; animation-name: none;">
                <img src="/theme/cool/cercle-shape.png" class="bg-image rotateme" alt="shape">
                <img src="/theme/cool/main-pic.png" class="wow fadeInUp animated" data-wow-delay="0.6s" alt="main-pic" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">
            </div>
        </div>
    </div>
</section>


<section class="ready-to-talk">
    <div class="container">
        <h3>如何使用?</h3>
        <p>点击下方注册按钮，立即开始畅游网络</p>
        <a href="/auth/register" class="btn btn-primary">立即注册</a>
    </div>
</section>


<footer class="footer-area bg-f7fafd">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <div class="logo">
                        <a class="navbar-brand" href="/">{$config['appName']}</a>
                    </div>
                    <p>致力于为用户提供高速稳定的高性价比网络中继服务</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-footer-widget pl-5">
                    <h3>首页</h3>
                    <ul class="list">
                        <li><a href="/user/shop">商店</a></li>
                        <li><a href="/user/node">节点列表</a></li>
                        <li><a href="/user/invite">邀请注册</a></li>
                        <li><a href="/">下载与使用</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h3>支持</h3>
                    <ul class="list">
                        <li><a href="/">联系我们</a></li>
                        <li><a href="/">新建工单</a></li>
                        <li><a href="/">常见问题</a></li>
                        <li><a href="https://t.me/Bobs9">加入 Telegram 群组</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h3>联系</h3>
                    <ul class="social-links">
                        <li><a href="/" class="facebook"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-facebook"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg></a></li>
                        <li><a href="/" class="twitter"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-twitter"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg></a></li>
                        <li><a href="/" class="instagram"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-instagram"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.5" y2="6.5"></line></svg></a></li>
                        <li><a href="/" class="linkedin"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-linkedin"><path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path><rect x="2" y="9" width="4" height="12"></rect><circle cx="4" cy="4" r="2"></circle></svg></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-12 col-md-12">
                <div class="copyright-area">
                    <p>© {$config['appName']}&nbsp;•&nbsp;<span id="copyright">Powered by <a href="/staff">SSPANEL</a>&nbsp;    &nbsp;</span></p>
                </div>
            </div>
        </div>
    </div>
    <img src="/theme/cool/map.png" class="map" alt="map">
    <div class="shape1"><img src="/theme/cool/shape1.png" alt="shape"></div>
    <div class="shape8 rotateme"><img src="/theme/cool/shape2.svg" alt="shape"></div>
</footer>

<div class="go-top"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-up"><line x1="12" y1="19" x2="12" y2="5"></line><polyline points="5 12 12 5 19 12"></polyline></svg></div>

<script src="/theme/cool/jquery.min.js"></script>
<script src="/theme/cool/bootstrap.min.js"></script>
<script src="/theme/cool/meanmenu.min.js"></script>
<script src="/theme/cool/wow.min.js"></script>
<script src="/theme/cool/magnific-popup.min.js"></script>
<script src="/theme/cool/appear.min.js"></script>
<script src="/theme/cool/odometer.min.js"></script>
<script src="/theme/cool/slick.min.js"></script>
<script src="/theme/cool/headroom.js"></script>
<script src="/theme/cool/isotope.pkgd.min.js"></script>
<script src="/theme/cool/owl.carousel.min.js"></script>
<script src="/theme/cool/feather.min.js"></script>
<script src="/theme/cool/main.js"></script>

</body></html>
