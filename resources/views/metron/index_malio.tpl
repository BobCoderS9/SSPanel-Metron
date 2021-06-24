<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
          name="viewport">

    <title>{$config['appName']}</title>
    <link rel="shortcut icon" href="/">
    <link rel="stylesheet" href="/theme/malio/index/css/prism.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.8.2/css/all.min.css">
    <link rel="stylesheet" href="/theme/malio/index/css/chocolat.css">
    <link rel="stylesheet" href="/theme/malio/index/css/style.css">
    <link rel="stylesheet" href="/theme/malio/index/css/custom.css">
    <link rel="stylesheet" href="/theme/malio/index/landing/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@4.5.0/dist/css/swiper.min.css">

    <style>
        .pricing {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.03);
            background-color: #fff;
            border-radius: 3px;
            border: none;
            position: relative;
            margin-bottom: 30px;
            text-align: center;
        }

        .pricing.pricing-highlight .pricing-title {
            background-color: #6777ef;
            color: #fff;
        }

        .pricing.pricing-highlight .pricing-cta a {
            background-color: #6777ef;
            color: #fff;
        }

        .pricing.pricing-highlight .pricing-cta a:hover {
            background-color: #394eea !important;
        }

        .pricing .pricing-padding {
            padding: 40px;
        }

        .pricing .pricing-title {
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2.5px;
            background-color: #f3f6f8;
            color: #6777ef;
            border-radius: 0 0 3px 3px;
            display: inline-block;
            padding: 5px 15px;
        }

        .pricing .pricing-price {
            margin-bottom: 45px;
            color: #6c757d
        }

        .pricing .pricing-price div:first-child {
            font-weight: 600;
            font-size: 50px;
        }

        .pricing .pricing-details {
            text-align: left;
            display: inline-block;
            color: #6c757d;
        }

        .pricing .pricing-details .pricing-item {
            display: flex;
            margin-bottom: 15px;
        }

        .pricing .pricing-details .pricing-item .pricing-item-icon {
            width: 20px;
            height: 20px;
            line-height: 20px;
            border-radius: 50%;
            text-align: center;
            background-color: #63ed7a;
            color: #fff;
            margin-right: 10px;
        }

        .pricing .pricing-details .pricing-item .pricing-item-icon i {
            font-size: 11px;
        }

        .pricing .pricing-cta {
            margin-top: 20px;
        }

        .pricing .pricing-cta a {
            display: block;
            padding: 20px 40px;
            background-color: #f3f6f8;
            text-transform: uppercase;
            letter-spacing: 2.5px;
            font-size: 14px;
            font-weight: 700;
            text-decoration: none;
            border-radius: 0 0 3px 3px;
        }

        .pricing .pricing-cta a .fas,
        .pricing .pricing-cta a .far,
        .pricing .pricing-cta a .fab,
        .pricing .pricing-cta a .fal,
        .pricing .pricing-cta a .ion {
            margin-left: 5px;
        }

        .pricing .pricing-cta a:hover {
            background-color: #e3eaef;
        }
    </style>
</head>

<body class="">
<nav class="navbar navbar-reverse navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand smooth" href="/">{$config['appName']}</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto ml-lg-3 align-items-lg-center">
                <li class="nav-item"><a href="#features" class="nav-link">{$i18n->get('features')}</a></li>
                <li class="nav-item"><a href="#purchase" class="nav-link">{$i18n->get('pricing')}</a></li>
                <li class="nav-item"><a href="#contact-support" class="nav-link">{$i18n->get('support')}</a></li>
                {if $user->isLogin}
                    <li class="nav-item d-lg-none d-md-block"><a href="/user"
                                                                 class="nav-link smooth">{$i18n->get('index-dashboard-button')}</a>
                    </li>
                {else}
                    <li class="nav-item d-lg-none d-md-block"><a href="/auth/login"
                                                                 class="nav-link smooth">{$i18n->get('login')}</a></li>
                {/if}
            </ul>
            <ul class="navbar-nav ml-auto align-items-lg-center d-none d-lg-block">
                <li class="ml-lg-3 nav-item">
                    {if $user->isLogin}
                        <a href="/user" class="btn btn-round smooth btn-icon icon-left">
                            <i class="fab fa-fort-awesome"></i> {$i18n->get('index-dashboard-button')}
                        </a>
                    {else}
                        <a href="/auth/login" class="btn btn-round smooth btn-icon icon-left">
                            <i class="fas fa-sign-in-alt"></i> {$i18n->get('login')}
                        </a>
                    {/if}
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="hero-wrapper" id="top">
    <div class="hero">
        <div class="container">
            <div class="text text-center text-lg-left">
                <a href="/user/shop" class="headline">
                    <div class="badge badge-danger">New</div>
                    {$i18n->get('index-offer-bar')} &nbsp; <i class="fas fa-chevron-right"></i>
                </a>
                <h1>{$i18n->get('index-slogan')}</h1>
                <p class="lead">
                    {$i18n->get('index-text-under-slogan')}
                </p>
                <div class="cta">
                    <a class="btn btn-lg btn-warning btn-icon icon-right"
                       href="/auth/register">{$i18n->get('get-started')} <i class="fas fa-chevron-right"></i></a> &nbsp;
                </div>
                {if $user->isLogin}
                    <div class="mt-3 text-job d-lg-none">
                        <a href="/user" style="color:rgba(255,255,255,.6);">
                            进入用户中心
                        </a>
                    </div>
                {else}
                    <div class="mt-3 text-job d-lg-none">
                        <a href="/auth/login" style="color:rgba(255,255,255,.6);">
                            已有账号？立即登录
                        </a>
                    </div>
                {/if}
            </div>
            <div class="image d-none d-lg-block">
                <img src="/theme/malio/index/landing/ill.svg" alt="img">
            </div>
        </div>
    </div>
</div>
<div class="callout container">
    <div class="row">
        <div class="col-md-6 col-12 mb-4 mb-lg-0">
            <div class="text-job text-muted text-14">{$i18n->get('not-a-reason-to-use')}</div>
            <div class="h1 mb-0 font-weight-bold mt-1" style="font-size: 2rem;">{$i18n->get('just-a-statistic')}</div>
        </div>
        <div class="col-4 col-md-2 text-center">
            <div class="h2 font-weight-bold">100+</div>
            <div class="text-uppercase font-weight-bold ls-2 text-primary">{$i18n->get('index-servers')}</div>
        </div>
        <div class="col-4 col-md-2 text-center">
            <div class="h2 font-weight-bold">25+</div>
            <div class="text-uppercase font-weight-bold ls-2 text-primary">{$i18n->get('regions')}</div>
        </div>
        <div class="col-4 col-md-2 text-center">
            <div class="h2 font-weight-bold">6500+</div>
            <div class="text-uppercase font-weight-bold ls-2 text-primary">{$i18n->get('users')}</div>
        </div>
    </div>
</div>

<section id="features">
    <div class="container">
        <div class="row mb-5 text-center">
            <div class="col-lg-10 offset-lg-1">
                <h2>{$i18n->get('index-section-1-title')}</h2>
                <p class="lead">{$i18n->get('index-section-1-subtitle')}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="features">
                    <div class="feature">
                        <div class="feature-icon">
                            <i class="fas fa-mobile-alt"></i>
                        </div>
                        <h5 data-i18n="">{$i18n->get('index-section-1-feature-1-lead')}</h5>
                        <p data-i18n="">{$i18n->get('index-section-1-feature-1-desc')}</p>
                    </div>
                    <div class="feature">
                        <div class="feature-icon">
                            <i class="fab fa-html5"></i>
                        </div>
                        <h5 data-i18n="">{$i18n->get('index-section-1-feature-2-lead')}</h5>
                        <p data-i18n="">{$i18n->get('index-section-1-feature-2-desc')}</p>
                    </div>
                    <div class="feature">
                        <div class="feature-icon">
                            <i class="fas fa-fire"></i>
                        </div>
                        <h5 data-i18n="">{$i18n->get('index-section-1-feature-3-lead')}</h5>
                        <p data-i18n="">{$i18n->get('index-section-1-feature-3-desc')}</p>
                    </div>
                    <div class="feature">
                        <div class="feature-icon">
                            <i class="fas fa-check"></i>
                        </div>
                        <h5 data-i18n="">{$i18n->get('index-section-1-feature-4-lead')}</h5>
                        <p data-i18n="">{$i18n->get('index-section-1-feature-4-desc')}</p>
                    </div>
                    <div class="feature">
                        <div class="feature-icon">
                            <i class="fas fa-columns"></i>
                        </div>
                        <h5 data-i18n="">{$i18n->get('index-section-1-feature-5-lead')}</h5>
                        <p data-i18n="">{$i18n->get('index-section-1-feature-5-desc')}</p>
                    </div>
                    <div class="feature">
                        <div class="feature-icon">
                            <i class="fas fa-chevron-right"></i>
                        </div>
                        <h5 data-i18n="">{$i18n->get('index-section-1-feature-6-lead')}</h5>
                        <p data-i18n="">{$i18n->get('index-section-1-feature-6-desc')}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="design" class="section-design">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 d-none d-lg-block">
                <img src="/theme/malio/index/img/data_center.svg" alt="user flow" class="img-fluid">
            </div>
            <div class="col-lg-7 pl-lg-5 col-md-12">
                <div class="badge badge-primary mb-3" data-i18n="">{$i18n->get('index-section-2-above-title')}</div>
                <h2 data-i18n="">{$i18n->get('index-section-2-title')}</h2>
                <p class="lead" data-i18n="">{$i18n->get('index-section-2-desc')}</p>
            </div>
        </div>
    </div>
</section>

<section id="components" class="section-design section-design-right">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 pr-lg-5 pr-0">
                <div class="badge badge-primary mb-3" data-i18n="">{$i18n->get('index-section-3-above-title')}</div>
                <h2 data-i18n="">{$i18n->get('index-section-3-title')}</h2>
                <p class="lead" data-i18n="">{$i18n->get('index-section-3-desc')}</p>
            </div>
            <div class="col-lg-5 d-none d-lg-block">
                <div class="abs-images">
                    <img src="/theme/malio/index/img/netflix.png" alt="user flow" class="img-fluid rounded dark-shadow">
                    <img src="/theme/malio/index/img/spotify.png" alt="user flow" class="img-fluid rounded dark-shadow">
                    <img src="/theme/malio/index/img/hbo.png" alt="user flow" class="img-fluid rounded dark-shadow">
                </div>
            </div>
        </div>
    </div>
</section>

<section id="support-us" class="support-us section-design">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 d-none d-lg-block">
                <img src="/theme/malio/index/img/waiting_notifications.svg" alt="user flow" class="img-fluid"
                     style="width:30rem">
            </div>
            <div class="col-lg-4 col-md-12">
                <h2 data-i18n="">{$i18n->get('index-section-4-title')}</h2>
                <p class="lead" data-i18n="">{$i18n->get('index-section-4-desc')}</p>
                <ul class="list-icons">
                    {foreach $I18N['index-more-features'][$i18n->lang] as $feature}
                        <li>
              <span class="card-icon bg-primary text-white">
                <i class="{$feature['icon']}"></i>
              </span>
                            <span>{$feature['feature']}</span>
                        </li>
                    {/foreach}
                </ul>
            </div>
        </div>
    </div>
</section>

<section id="purchase" class="bg-gr">
    <div class="container">
        <div class="row">
            <div class="col-md-10 offset-md-1 col-lg-10 offset-lg-1 col-12 text-center">
                <h2 class="mt-3 text-white">{$i18n->get('index-section-5-title')}</h2>
                <p class="lead" style="color: rgba(255, 255, 255, 0.5);">{$i18n->get('index-section-5-desc')}</p>
            </div>
        </div>
        <div class="row mt-5">
            {foreach $I18N['plans-info'][$i18n->lang] as $name => $plan}
                <div class="col-12 col-md-4 col-lg-4">
                    <div class="pricing">
                        <div class="pricing-title">
                            {$plan['name']}
                        </div>
                        <div class="pricing-padding">
                            <div class="pricing-price">
                                <div>{$plan['currency']}{$plan['price']}</div>
                                <div>{$plan['billing']}</div>
                            </div>
                            <div class="pricing-details">
                                {foreach $plan['features'] as $feature}
                                    <div class="pricing-item">
                                        {if $feature['support'] == true}
                                            <div class="pricing-item-icon" style="background:#6574f7"><i
                                                        class="fas fa-check"></i></div>
                                            <div class="pricing-item-label">{$feature['name']}</div>
                                        {else}
                                            <div class="pricing-item-icon text-white" style="background: #98a6ad"><i
                                                        class="fas fa-times"></i></div>
                                            <div class="pricing-item-label text-muted">
                                                <del>{$feature['name']}</del>
                                            </div>
                                        {/if}
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                        <div class="pricing-cta go-to-buy-page">
                            <a href="/user/shop">{$i18n->get('subscribe')} <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
</section>

<section id="try" class="section-dark">
    <div class="container ">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                {foreach $I18N['index-user-reviews'][$i18n->lang] as $review}
                    <div class="swiper-slide">
                        <div class="col-lg-8 offset-lg-2 text-center">
                            <blockquote>{$review['review']}</blockquote>
                            <div class="text-name mt-4">{$review['user']}</div>
                            <div class="text-job mt-2">{$review['position']}</div>
                        </div>
                    </div>
                {/foreach}
            </div>
            <div class="swiper-button-prev" style="color: rgba(255,255,255,.6);background-image: none;"><i
                        class="fas fa-chevron-left" style="font-size:20px;"></i></div>
            <div class="swiper-button-next" style="color: rgba(255,255,255,.6);background-image: none;"><i
                        class="fas fa-chevron-right" style="font-size:20px;"></i></div>
        </div>
    </div>
</section>

<section class="download-section" class="bg-white">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-7">
                <h2>{$i18n->get('index-section-6-title')}</h2>
                <p class="lead">{$i18n->get('index-section-6-subtitle')}</p>
            </div>
            <div class="col-md-5 text-right">
                <a href="/auth/register" class="btn btn-primary btn-lg">{$i18n->get('start-now')}</a>
            </div>
        </div>
    </div>
</section>

<section id="contact-support" class="before-footer">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="card long-shadow">
                    <div class="card-body d-flex p-45">
                        <div class="card-icon bg-primary text-white">
                            <i class="fas fa-headset"></i>
                        </div>
                        <div>
                            <h5>{$i18n->get('index-section-6-card-1-title')}</h5>
                            <p class="lh-sm">{$i18n->get('index-section-6-card-1-desc')}</p>
                            <div class="mt-4 text-right">
                                <a href="/" class="link-icon">{$i18n->get('contact-us')} <i
                                            class="fas fa-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card long-shadow">
                    <div class="card-body p-45 d-flex">
                        <div class="card-icon bg-primary text-white">
                            <i class="far fa-life-ring"></i>
                        </div>
                        <div>
                            <h5>{$i18n->get('index-section-6-card-2-title')}</h5>
                            <p>{$i18n->get('index-section-6-card-2-desc')}</p>
                            <div class="mt-4 text-right">
                                <a href="/" class="link-icon">{$i18n->get('contact-us')} <i
                                            class="fas fa-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <h3 class="text-capitalize">{$config['appName']}</h3>
                <div class="pr-lg-5">
                    <p>{$i18n->get('index-footer-slogan')}</p>
                    <p>&copy; {$config['appName']}</p>
                    <div class="mt-4 social-links">
                        <a href="/"><i class="fab fa-github"></i></a>
                        <a href="/"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="row">
                    <div class="col-md-4">
                        <h4>{$i18n->get('dashboard')}</h4>
                        <ul>
                            <li><a href="/" data-i18n="dashboard">商店</a></li>
                            <li><a href="/" data-i18n="dashboard">节点列表</a></li>
                            <li><a href="/" data-i18n="dashboard">邀请注册</a></li>
                            <li><a href="/" data-i18n="dashboard">下载和使用</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h4>{$i18n->get('support')}</h4>
                        <ul>
                            <li><a href="/" data-i18n="dashboard">联系我们</a></li>
                            <li><a href="/" data-i18n="dashboard">新建工单</a></li>
                            <li><a href="/" data-i18n="dashboard">常见问题</a></li>
                            <li><a href="/" data-i18n="dashboard">加入 Telegram 群组</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<script src="/theme/malio/index/js/jquery.min.js"></script>
<script src="/theme/malio/index/js/popper.js"></script>
<script src="/theme/malio/index/js/tooltip.js"></script>
<script src="/theme/malio/index/js/bootstrap.min.js"></script>
<script src="/theme/malio/index/js/prism.js"></script>
<script src="/theme/malio/index/js/stisla.js"></script>
<script src="/theme/malio/index/js/script.js"></script>


<!--End mc_embed_signup-->
<script src="https://cdn.jsdelivr.net/npm/swiper@4.5.0/dist/js/swiper.min.js"></script>

<script>
    var mySwiper = new Swiper('.swiper-container', {
        direction: 'horizontal',
        loop: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        autoplay: {
            delay: 5000,
            disableOnInteraction: true,
        },
    })
</script>

<script>
    var code = "UG93ZXJlZCBieSA8YSBocmVmPSIvc3RhZmYiPlNTUEFORUw8L2E+Jm5ic3A7JmJ1bGw7Jm5ic3A7VGhlbWUgYnkgPGEgaHJlZj0iaHR0cHM6Ly90Lm1lL2VkaXRYWSIgdGFyZ2V0PSJibGFuayI+ZWRpdFhZPC9hPg==";
    $('#copyright').html(atob(code));

    function changeLang(lang) {
        document.cookie = "lang=" + lang;
        location.reload();
    }
</script>

</body>
</html>
