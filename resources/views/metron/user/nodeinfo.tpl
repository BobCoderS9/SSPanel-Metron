<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <title>节点配置 &mdash; {$config["appName"]}</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- 字体 -->
        <link href="{if $metron['assets_true']===true}{$metron['assets_url']}{else}/theme{/if}/metron/css/fonts.css?family=Poppins:300,400,500,600,700" rel="stylesheet" >
        <!-- 全局样式 -->
        <link href="{if $metron['assets_true']===true}{$metron['assets_url']}{else}/theme{/if}/metron/css/plugins.css" rel="stylesheet" type="text/css" />
        <link href="{if $metron['assets_true']===true}{$metron['assets_url']}{else}/theme{/if}/metron/css/style.css" rel="stylesheet" type="text/css" />
        <!-- ico -->
        <link rel="shortcut icon" href="/favicon.ico" />
        <style>
        body {
            background: #fff;
            font-family: "Poppins", sans-serif;
            margin: 0;
            overflow-x: hidden;
            color: #000000;
            font-weight: 300
        }
        </style>
</head>

<!-- 页面内容 开始 -->
<div class="fix-header card-no-border logo-center" id="nodeinfo-ssr">
    <!-- 节点配置选项列表 开始 -->
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="nav-wrapper">
                <ul class="nav nav-pills nav-fill flex-md-row" id="tabs-text" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link mb-sm-3 mb-md-0 active" id="qr-card" data-toggle="tab" href="#node-qr-card" role="tab" aria-controls="all" aria-selected="true">二维码</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mb-sm-3 mb-md-0" id="detail-card" data-toggle="tab" href="#node-detail-card" role="tab" aria-controls="all" aria-selected="true">手动配置</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mb-sm-3 mb-md-0" id="json-card" data-toggle="tab" href="#node-json-card" role="tab" aria-controls="all" aria-selected="true">Json</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 节点配置选项列表 结束 -->
    <!-- 节点配置选项内容 开始 -->
    <div class="tab-content br-n pn">
        <!-- 二维码 开始 -->
        <div class="tab-pane fade active show" id="node-qr-card" role="tabpanel" aria-labelledby="all-tab">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card-body">
                        <div class="text-center">
                            {$ssr_item = $node->getItem($user, $mu, $relay_rule_id, 0)}
                            <p style="color:red">{$node->name}</p>
                            <div class="text-center">
                                <a href="{URL::getItemUrl($ssr_item, 0)}">
                                    <div id="ss-qr-n">
                                    </div>
                                </a>
                            </div>
                            <p>手机点击二维码即可跳转APP导入</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 二维码 结束 -->
        <!-- 手动配置 开始 -->
        <div class="tab-pane fade" id="node-detail-card" role="tabpanel" aria-labelledby="all-tab">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card-body">
                        <div class="text-center">
                            <p style="color:red">{$node->name}</p>
                            {$ssr_item = $node->getItem($user, $mu, $relay_rule_id, 0)}
                            <p align="left">
                                服务器地址：<code>{$ssr_item['address']}</code><br>
                                服务器端口：<code>{$ssr_item['port']}</code><br>
                                加密方式：<code>{$ssr_item['method']}</code><br>
                                密码：<code>{$ssr_item['passwd']}</code><br>
                                协议：<code>{$ssr_item['protocol']}</code><br>
                                协议参数：<code>{$ssr_item['protocol_param']}</code><br>
                                混淆：<code>{$ssr_item['obfs']}</code><br>
                                混淆参数：<code>{$ssr_item['obfs_param']}</code>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 手动配置 结束 -->
        <!-- json配置 开始 -->
        <div class="tab-pane fade" id="node-json-card" role="tabpanel" aria-labelledby="all-tab">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card-body">
                        <div class="card-main">
                            <div class="card-inner">
                                <pre style="color:#e83e8c">
{
"server": "{$ssr_item['address']}",
"local_address": "127.0.0.1",
"local_port": 1080,
"timeout": 300,
"workers": 1,
"server_port": {$ssr_item['port']},
"password": "{$ssr_item['passwd']}",
"method": "{$ssr_item['method']}",
"obfs": "{$ssr_item['obfs']}",
"obfs_param": "{$ssr_item['obfs_param']}",
"protocol": "{$ssr_item['protocol']}",
"protocol_param": "{$ssr_item['protocol_param']}"
}
                                </pre>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- json配置 结束 -->
    </div>
    <!-- 节点配置选项内容 结束 -->
    <!-- 引入script 开始 -->
	<script src="{if $metron['assets_true']===true}{$metron['assets_url']}{else}/theme{/if}/metron/js/plugins.js" type="text/javascript"></script>
	<!-- <script src="{if $metron['assets_true']===true}{$metron['assets_url']}{else}/theme{/if}/metron/js/scripts.js" type="text/javascript"></script> -->
    <script src="{if $metron['assets_true']===true}{$metron['assets_url']}{else}/theme{/if}/metron/plugins/jQuery-qrcode/jquery.qrcode.min.js"></script>
    <script>
    var KTAppOptions = {
        "colors": {
            "state": {
                "brand": "#366cf3",
                "light": "#ffffff",
                "dark": "#282a3c",
                "primary": "#5867dd",
                "success": "#34bfa3",
                "info": "#36a3f7",
                "warning": "#ffb822",
                "danger": "#fd3995"
            },
            "base": {
                "label": ["#c5cbe3", "#a1a8c3", "#3d4465", "#3e4466"],
                "shape": ["#f0f3ff", "#d9dffa", "#afb4d4", "#646c9a"]
            }
        }
    };
    </script>
    <script>
    {if URL::SSRCanConnect($user, $mu)}
    var text_qrcode2 = '{URL::getItemUrl($ssr_item, 0)}';
    jQuery('#ss-qr-n').qrcode({
        "text": text_qrcode2
    });
    {/if}
    </script>
    <!-- 引入script 结束 -->
</div>

</html>