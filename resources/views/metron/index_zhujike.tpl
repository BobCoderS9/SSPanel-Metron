<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>{$config['appName']}</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=1280">
    <link rel="stylesheet" href="/theme/zhujike/i.css">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <meta name="apple-mobile-web-app-title" content="Hostker">
    <meta name="google" value="notranslate">
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
          name="viewport">
</head>

<body class="">
<div id="stage">
    <article class="step-1">
        <div class="step-1-in">
            <div id="test" style="transform: rotateX(-1.445deg) rotateY(-1.815deg);">
                <header>
                    <div class="layout"><h1>{$config['appName']}</h1>
                        <nav>
                            <a href="/">首页</a>
                            {*                            <a href="https://www.hostker.com/about.html">文档</a>*}
                            {if $user->isLogin}
                                <a href="/user" class="login-link">用户中心</a>
                            {else}
                                <a href="/auth/login" class="login-link">登陆</a>
                            {/if}
                        </nav>
                    </div>
                </header>
                <h2><span class="line line-1">可能是<span class="moji-1">最萌</span>的</span> <span
                            class="line line-2">云计算服务商</span></h2><i class="bg"></i> <i class="hr"></i>
                <div class="shell-box"><i class="shell-shadow"></i> <i class="shell"><span></span></i></div>
                <a class="link-reg" href="/auth/register">开始使用</a><i class="light"></i></div>
        </div>
    </article>
    <span class="tip tip-1">向下滚动</span>
    <article class="step-2">
        <div class="content"><h3 class="ui-h ui-h-1">技术优势</h3>
            <ul>
                <li class="feature-1">
                    <div class="icon"><i></i><big>1</big><cite>Second</cite></div>
                    <h4>秒级状态监控</h4>
                    <p>感受云主机心跳，性能瓶颈秒定位</p></li>
                <li class="feature-2">
                    <div class="icon"><i></i><big>1</big><cite>Minute</cite></div>
                    <h4>50 秒即开即用</h4>
                    <p>分钟建好云主机，想码就码无压力</p></li>
                <li class="feature-3">
                    <div class="icon"><i></i><big>1</big><cite>Hour</cite></div>
                    <h4>颗粒化小时计费</h4>
                    <p>按需计费才是真正的云计算！</p></li>
                <li class="feature-4">
                    <div class="icon"><i></i><big>1000</big><cite>Mbps</cite></div>
                    <h4>千兆内网互联</h4>
                    <p>内部开源镜像站，升级无需再等待</p></li>
                <li class="feature-5">
                    <div class="icon"><i></i><big></big><cite>SmartQuota</cite></div>
                    <h4>动态资源配额</h4>
                    <p>大户邻居不可怕，智能配额控制它</p></li>
                <li class="feature-6">
                    <div class="icon"><i></i><cite>API</cite></div>
                    <h4>开放接口支持</h4>
                    <p>集群维护从此变得So Easy！</p></li>
            </ul>
        </div>
        <i class="after"></i></article>
    <article class="step-3"><h3 class="ui-h ui-h-2">服务购买</h3>
        <ul>
            {foreach $I18N['plans-info'][$i18n->lang] as $name => $plan}
                <li>
                    <div class="head"><h4 id="price-1"><big>{$plan['currency']}{$plan['price']}
                                元/{$plan['billing']}</big>
                            <small> {$plan['name']}</small></h4></div>
                    <ul>
                        {foreach $plan['features'] as $feature}
                            {if $feature['support'] == true}
                                <li><i>√</i> <b>{$feature['name']}</b></li>
                            {else}
                                <li><i>×</i> <b>{$feature['name']}</b></li>
                            {/if}
                        {/foreach}
                    </ul>
                    <a class="button" href="/user/shop">购买</a>
                </li>
            {/foreach}
        </ul>
        <div class="note layout" id="price-note"><p>※
                数据中心覆盖中国(香港)、日本(东京、大阪)、美国(洛杉矶、圣何塞)、新加坡、英国(伦敦)、德国(法兰克福)、荷兰(阿姆斯特丹)</p></div>
    </article>
    <article class="step-4">
        <div id="step4">
            <div class="content"><i></i>
                <h3 class="ui-h ui-h-3">硬件高防</h3>
                <div class="note layout"><p>采用金盾集群进行清洗</p>
                    <p>一分钟内自动检测 3-7 层攻击包特征启动防御方案</p></div>
                <a class="button" href="/user/shop" target="_blank">进入使用</a>
                <div class="note layout"><p class="op5">最高可定制升级至 200G 保护</p></div>
            </div>
            <i class="shell-2"></i></div>
    </article>
    <footer class="step-5">
        <div class="htko"><p>一切的开端，梦的延续</p></div>
        <div class="layout">
            <div class="l"><a href="/" target="_blank">@{$config['appName']}</a></div>
            <div class="r"><a href="https://90.cx/" target="_blank">{$config['appName']}</a></div>
        </div>
    </footer>
</div>
<script src="/theme/zhujike/hm.js"></script>
<script src="/theme/zhujike/c.js"></script>
<div style="display:none">
    <script type="text/javascript" src="/theme/zhujike/stats.js" charset="UTF-8"></script>
</div>
</body>
</html>
