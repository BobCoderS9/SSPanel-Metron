<html lang="en"><head>
    <meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" id="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.png">
    <title>{$config['appName']}</title>
    <meta name="description" content="畅享全球无限制的访问！">
    <meta name="keywords" content="{$config['appName']} 翻墙软件 V2ray SSR trojan 留学生回国上网课必备"><link rel="apple-touch-icon-precomposed" href="images/avatar.bab2b7d4.jpeg">
    <link rel="stylesheet" type="text/css" href="/theme/tudou/css/h.9c69ed6c.css">
    <link rel="stylesheet" type="text/css" href="/theme/tudou/css/nekotora.99cf6f8c.css">
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-137340638-1"></script>
</head>
<body oncontextmenu="alert('禁止查看源代码，您的行为已记录。'); return false" noop="if (window.event != null &amp;&amp; window.event.button == 2) alert ('Thanks...');" data-phone-cc-input="1">
<nav>
    <a href="/" class="active">Index</a> <a class="clip"></a>
    <a href="/auth/register">注册</a>
    <a href="/auth/login">登入</a>
    <a href="/password/reset">找回密码</a>
    <a class="clip"></a> <a href="/staff">STAFF</a>
</nav>
<link href="/theme/tudou/css/toastr.css" rel="stylesheet">
<link href="/theme/tudou/css/style.css" rel="stylesheet">
<link href="/theme/tudou/css/toastr.min.css" rel="stylesheet">
<script src="/theme/tudou/js/toastr.min.js"></script>
<style>
    .toast-bottom-center {
        position: absolute;
        left: 30px;
        right:10px;
        top: 20px;
    }
    .container{
        height: 100%;
    }
</style>

<div class="background">
    <canvas id="startrack" width="1920" height="699"></canvas>
    <div class="cover"></div> </div>
<div class="main"> <div class="ch intro">
        <div class="container"> <div class="hello">
                <h1 id="slogan">优秀的全球网络中继服务</h1>
                <h2> <div class="circle"> <span></span> <span></span>
                        <span></span> </div>{$config['appName']} </h2> </div> </div> </div>
    <div class="ch about"> <div class="container">
            <h2 class="chtitle">Who is <span>{$config['appName']}</span>？</h2>
            <div class="clear"> <div class="introduct">
                    <img class="avatar" src="images/zhaoxi.jpg"> <p>我们是在VPN中排名靠前的值得信赖的领导者。</p>
                    <p style="padding-bottom:1em;">How lucky to meet you!</p>
                    <p>您好，我们是 <sup>{$config['appName']}</sup>，我们来自于Canada Toronto，旨在为您提供稳定，可靠，便捷，快速的网络中继服务。</p>
                    <p>希望您有个畅快的使用体验！</p>
                    <div class="chatbox">   <div class="line loading"> <span></span>
                            <span></span> <span></span> </div> </div> </div>
                <ul class="skill clear"> <li> <p>高速稳定</p>
                        <div class="progress"> <div style="width:78%;"></div>
                            <span>体验宛若身在海外的访问速度</span> </div> </li>
                    <li> <p>便携设置</p>
                        <div class="progress"> <div style="width:55%;"></div>
                            <span>我们的服务适用于 macOS、iOS、Android、Windows 和 Linux</span>
                        </div> </li> <li> <p>节省成本</p>
                        <div class="progress"> <div style="width:60%;"></div>
                            <span>相比自托管服务可节省大量费用</span> </div> </li>
                    <li> <p>全球互联</p>
                        <div class="progress">
                            <div style="width:65%;">
                            </div><span>通过 IXP 连接至全球内容提供商，更加快速</span> </div> </li>
                    <li> <p>运营商友好</p> <div class="progress">
                            <div style="width:90%;"></div>
                            <span>我们的产品和您的当地运营商兼容，适用于您的固网与移动网络</span> </div> </li>
                    <li> <p>全平台兼容</p> <div class="progress">
                            <div style="width:82%;"></div>
                            <span>提供全面且可靠的官方一键式应用程序兼容</span> </div> </li>
                    <li> <p>魔法</p> <div class="progress">
                            <div style="width:12%;"></div>
                            <span>和普通人相同程度的能力</span> </div> </li>
                    <li> <p>MoePower</p>
                        <div class="progress">
                            <div style="width:99%;"></div>
                            <span>成为萌二程度的能力</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="find ch"> <div class="container links">
            <h2 class="chtitle">开始使用<span>{$config['appName']}</span></h2>
            <div class="clear col-3">
                <a href="/auth/register" target="_blank">
                    <div class="item">
                        <div class="bg" style="background-color:#28a9e0"></div>
                        <div class="inner"> <span>注册</span> </div> </div> </a>
                <a href="/auth/login" target="_blank">
                    <div class="item"> <div class="bg" style="background-color:#28a9e0"></div>
                        <div class="inner"> <span>登入</span> </div> </div> </a>
                <a href="/password/reset" target="_blank">
                    <div class="item">
                        <div class="bg" style="background-color:#28a9e0"></div>
                        <div class="inner"> <span>忘记密码？</span> </div> </div> </a> </div>
            <div class="clear">
                <a href="/" target="_blank"></a> </div> </div> </div>
    <div class="gate ch"> <div class="container links">
            <h2 class="chtitle">我们的<span>节点</span></h2>
            <div class="clear"> <a href="/" target="_blank">
                    <div class="item">
                        <div class="avatar"> <img src="https://cdn.jsdelivr.net/gh/mt-theme/metron-assets@3.0.2/metron/media/flags/1x1_zh_cn/新加坡.svg"> </div>
                        <div class="inner"> <h5>新加坡 01</h5> <p>多线中转</p> </div> </div> </a>
                <a href="/" target="_blank">
                    <div class="item akarin"> <div class="avatar"> <img src="https://cdn.jsdelivr.net/gh/mt-theme/metron-assets@3.0.2/metron/media/flags/1x1_zh_cn/新加坡.svg"> </div>
                        <div class="inner"> <h5>新加坡 02</h5> <p>多线中转</p> </div> </div> </a>
                <a href="/" target="_blank">
                    <div class="item"> <div class="avatar"> <img src="https://cdn.jsdelivr.net/gh/mt-theme/metron-assets@3.0.2/metron/media/flags/1x1_zh_cn/新加坡.svg"> </div>
                        <div class="inner"> <h5>新加坡 03</h5><p>多线中转</p> </div> </div> </a>
                <a href="/" target="_blank"> <div class="item">
                        <div class="avatar"> <img src="https://cdn.jsdelivr.net/gh/mt-theme/metron-assets@3.0.2/metron/media/flags/1x1_zh_cn/日本.svg"> </div>
                        <div class="inner"> <h5>日本 01</h5> <p>多线中转</p> </div> </div> </a>
                <a href="/" target="_blank">
                    <div class="item"> <div class="avatar"> <img src="https://cdn.jsdelivr.net/gh/mt-theme/metron-assets@3.0.2/metron/media/flags/1x1_zh_cn/美国.svg"> </div>
                        <div class="inner"> <h5>美国 01</h5> <p>多线中转</p> </div> </div> </a>
                <a href="/" target="_blank">
                    <div class="item"> <div class="avatar"> <img src="https://cdn.jsdelivr.net/gh/mt-theme/metron-assets@3.0.2/metron/media/flags/1x1_zh_cn/美国.svg"> </div>
                        <div class="inner"> <h5>美国 02 | Netflix</h5> <p>多线中转</p> </div> </div> </a>
                <a href="/" target="_blank">
                    <div class="item"> <div class="avatar"> <img src="https://cdn.jsdelivr.net/gh/mt-theme/metron-assets@3.0.2/metron/media/flags/1x1_zh_cn/美国.svg"> </div>
                        <div class="inner"> <h5>美国 03 | Netflix</h5> <p>多线中转</p> </div> </div> </a>
                <a href="/" target="_blank">
                    <div class="item"> <div class="avatar"> <img src="https://cdn.jsdelivr.net/gh/mt-theme/metron-assets@3.0.2/metron/media/flags/1x1_zh_cn/阿根廷.svg"> </div>
                        <div class="inner"> <h5>阿根廷 01 | Netflix</h5> <p>多线中转 | Steam购物</p> </div> </div> </a>
                <a href="/" target="_blank">
                    <div class="item"> <div class="avatar"> <img src="https://cdn.jsdelivr.net/gh/mt-theme/metron-assets@3.0.2/metron/media/flags/1x1_zh_cn/韩国.svg"> </div>
                        <div class="inner"> <h5>韩国 01</h5> <p>多线中转</p> </div> </div> </a>
                <a href="/" target="_blank">
                    <div class="item"> <div class="avatar"> <img src="https://cdn.jsdelivr.net/gh/mt-theme/metron-assets@3.0.2/metron/media/flags/1x1_zh_cn/香港.svg"> </div>
                        <div class="inner"> <h5>香港 01</h5> <p>多线中转</p> </div> </div> </a>
                <a href="/" target="_blank"> <div class="item">
                        <div class="avatar"> <img src="https://cdn.jsdelivr.net/gh/mt-theme/metron-assets@3.0.2/metron/media/flags/1x1_zh_cn/香港.svg"> </div>
                        <div class="inner"> <h5>香港 02</h5> <p>多线中转</p> </div> </div> </a>
                <a href="/" target="_blank">
                    <div class="item"> <div class="avatar"> <img src="https://cdn.jsdelivr.net/gh/mt-theme/metron-assets@3.0.2/metron/media/flags/1x1_zh_cn/香港.svg"> </div>
                        <div class="inner"> <h5>香港 01 | Free</h5> <p>直连</p> </div> </div> </a>
                <a href="/" target="_blank">
                </a></div><a href="/" target="_blank">
            </a></div></div><a href="/" target="_blank"> </a></div><a href="/" target="_blank">
</a><div class="footer ch"><a href="/" target="_blank"> </a><div class="container" style="height: 10px"><a href="/" target="_blank"> <h3>{$config['appName']}</h3>
            <p>蘑菇森林的尽头，新世界的起点</p>
        </a><p class="c"><a href="/" target="_blank"></a><a href="/">Say hello to me @ 2021</a></p>
    </div>
</div>
<script src="/theme/tudou/js/page.3a0791a3.js"></script>
<script type="text/javascript" src="/theme/tudou/js/stats.js" charset="UTF-8">
</script>
<style>

</style>
<audio autoplay="">
    <source src="https://api.uomg.com/api/rand.music?sort=热歌榜" type="audio/mpeg">
</audio>


</body></html>
