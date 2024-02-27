{include file='admin/main.tpl'}
{$methods = [
'none',
'aes-128-ctr',
'aes-192-ctr',
'aes-256-ctr',
'aes-128-cfb',
'aes-192-cfb',
'aes-256-cfb',
'aes-128-cfb8',
'aes-192-cfb8',
'aes-256-cfb8',
'aes-128-gcm',
'aes-256-gcm',
'rc4',
'rc4-md5',
'rc4-md5-6',
'salsa20',
'chacha20',
'xsalsa20',
'xchacha20',
'chacha20-ietf',
'2022-blake3-aes-128-gcm',
'2022-blake3-aes-256-gcm',
'2022-blake3-chacha20-poly1305'
]}
{$protocols = [
'origin',
'verify_deflate',
'auth_sha1_v4',
'auth_aes128_md5',
'auth_aes128_sha1',
'auth_chain_a',
'auth_chain_b',
'auth_chain_c',
'auth_chain_d',
'auth_chain_e',
'auth_chain_f',
'auth_akarin_rand',
'auth_akarin_spec_a'
]}
{$obfss = [
'plain',
'http_simple',
'http_post',
'random_head',
'tls1.2_ticket_auth',
'tls1.2_ticket_fastauth'
]}

<main class="content">
    <div class="content-header ui-content-header">
        <div class="container">
            <h1 class="content-heading">编辑节点 #{$node->id}</h1>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-12 col-sm-12">
            <section class="content-inner margin-top-no">
                <form id="main_form">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-main">
                                    <div class="card-inner">
                                        <div class="form-group form-group-label">
                                            <label class="floating-label" for="name">节点名称</label>
                                            <input class="form-control maxwidth-edit" id="name" name="name" type="text"
                                                   value="{$node->name}">
                                        </div>
                                        <div class="form-group form-group-label">
                                            <label class="floating-label" for="server">节点地址</label>
                                            <input class="form-control maxwidth-edit" id="server" name="server" type="text"
                                                   value="{$node->server}">
                                            <p class="form-control-guide">
                                                <i class="material-icons">info</i>Shadowsocks2022 格式：8.8.8.8;10086;in.nodeserver.com;443
                                            </p>
                                            <p class="form-control-guide">
                                                <i class="material-icons">info</i>落地IP或域名;落地端口;订阅下发地址;订阅下发端口
                                            </p>
                                        </div>

                                        <div class="form-group form-group-label">
                                            <label class="floating-label" for="server">节点IP</label>
                                            <input class="form-control maxwidth-edit" id="node_ip" name="node_ip" type="text"
                                                   value="{$node->node_ip}">
                                            <p class="form-control-guide"><i class="material-icons">info</i>如果“节点地址”填写为域名，则此处的值会被忽视
                                            </p>
                                        </div>
                                        <!--
                                        <div class="form-group form-group-label" hidden="hidden">
                                            <label class="floating-label" for="method">加密方式</label>
                                            <input class="form-control maxwidth-edit" id="method" name="method" type="text"
                                                   value="{$node->method}">
                                        </div> -->

                                        <div class="form-group form-group-label">
                                            <label class="floating-label" for="rate">流量比例</label>
                                            <input class="form-control maxwidth-edit" id="rate" name="rate" type="text"
                                                   value="{$node->traffic_rate}">
                                        </div>


                                        <div class="form-group form-group-label" hidden="hidden">
                                            <div class="checkbox switch">
                                                <label for="custom_method">
                                                    <input {if $node->custom_method==1}checked{/if} class="access-hide"
                                                           id="custom_method" name="custom_method" type="checkbox"><span
                                                            class="switch-toggle"></span>自定义加密
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-group form-group-label" hidden="hidden">
                                            <div class="checkbox switch">
                                                <label for="custom_rss">
                                                    <input {if $node->custom_rss==1}checked{/if} class="access-hide"
                                                           id="custom_rss" type="checkbox" name="custom_rss"><span
                                                            class="switch-toggle"></span>自定义协议&混淆
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-group form-group-label">
                                            <label for="mu_only">
                                                <label class="floating-label" for="sort">单端口多用户启用</label>
                                                <select id="mu_only" class="form-control maxwidth-edit" name="is_multi_user">
                                                    <option value="0" {if $node->mu_only==0}selected{/if}>单端口多用户与普通端口并存</option>
                                                    <option value="-1" {if $node->mu_only==-1}selected{/if}>只启用普通端口</option>
                                                    <option value="1" {if $node->mu_only==1}selected{/if}>只启用单端口多用户</option>
                                                </select>
                                            </label>
                                        </div>


                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-main">
                                    <div class="card-inner">
                                        <p class="form-control-guide"><i class="material-icons">info</i>当设置为"只启用单端口多用户", 并且多用户端口不为 0 时, 下发该节点自定义配置</p>
                                        <div class="form-group form-group-label">
                                            <label class="floating-label" for="port">多用户端口</label>
                                            <input class="form-control maxwidth-edit" id="port" name="port" type="text" value="{$node->port}">
                                        </div>
                                        <div class="form-group form-group-label">
                                            <label class="floating-label" for="passwd">节点密码</label>
                                            <input class="form-control maxwidth-edit" id="passwd" name="passwd" type="text" value="{$node->passwd}">
                                        </div>
                                        <div class="form-group form-group-label">
                                            <label for="method">
                                                <label class="floating-label" for="method">加密方式</label>
                                                <select id="method" class="form-control maxwidth-edit" name="method">
                                                    {foreach $methods as $method}
                                                        <option value="{$method}" {if $node->method == $method}selected{/if}>{$method}</option>
                                                    {/foreach}
                                                </select>
                                            </label>
                                        </div>
                                        <div class="form-group form-group-label">
                                            <label for="protocol">
                                                <label class="floating-label" for="protocol">协议</label>
                                                <select id="protocol" class="form-control maxwidth-edit" name="protocol">
                                                    {foreach $protocols as $protocol}
                                                        <option value="{$protocol}" {if $node->protocol == $protocol}selected{/if}>{$protocol}</option>
                                                    {/foreach}
                                                </select>
                                            </label>
                                        </div>
                                        <div class="form-group form-group-label">
                                            <label for="obfs">
                                                <label class="floating-label" for="obfs">混淆方式</label>
                                                <select id="obfs" class="form-control maxwidth-edit" name="obfs">
                                                    {foreach $obfss as $obfs}
                                                        <option value="{$obfs}" {if $node->obfs == $obfs}selected{/if}>{$obfs}</option>
                                                    {/foreach}
                                                </select>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-main">
                                    <div class="card-inner">
                                        <div class="form-group form-group-label">
                                            <div class="checkbox switch">
                                                <label for="type">
                                                    <input {if $node->type==1}checked{/if} class="access-hide" id="type"
                                                           name="type" type="checkbox"><span class="switch-toggle"></span>是否显示
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-group form-group-label">
                                            <label class="floating-label" for="status">节点状态</label>
                                            <input class="form-control maxwidth-edit" id="status" name="status" type="text"
                                                   value="{$node->status}">
                                        </div>

                                        <div class="form-group form-group-label">
                                            <div class="form-group form-group-label">
                                                <label class="floating-label" for="sort">节点类型</label>
                                                <select id="sort" class="form-control maxwidth-edit" name="sort">
                                                    <option value="0" {if $node->sort==0}selected{/if}>Shadowsocks</option>
                                                    <option value="1" {if $node->sort==1}selected{/if}>Shadowsocks 2022</option>
                                                    <option value="9" {if $node->sort==9}selected{/if}>Shadowsocks 单端口多用户</option>
                                                    <option value="11" {if $node->sort==11}selected{/if}>V2Ray</option>
                                                    <option value="14" {if $node->sort==14}selected{/if}>Trojan</option>
                                                    <option value="15" {if $node->sort==15}selected{/if}>V2Ray-VLESS</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group form-group-label">
                                            <label class="floating-label" for="info">节点描述</label>
                                            <input class="form-control maxwidth-edit" id="info" name="info" type="text"
                                                   value="{$node->info}">
                                        </div>

                                        <div class="form-group form-group-label">
                                            <label class="floating-label" for="class">节点等级</label>
                                            <input class="form-control maxwidth-edit" id="class" name="class" type="text"
                                                   value="{$node->node_class}">
                                            <p class="form-control-guide"><i class="material-icons">info</i>不分级请填0，分级填写相应数字</p>
                                        </div>

                                        <div class="form-group form-group-label">
                                            <label class="floating-label" for="group">节点群组</label>
                                            <input class="form-control maxwidth-edit" id="group" name="group" type="text"
                                                   value="{$node->node_group}">
                                            <p class="form-control-guide"><i class="material-icons">info</i>分组为数字，不分组请填0</p>
                                        </div>


                                        <div class="form-group form-group-label">
                                            <label class="floating-label" for="node_bandwidth_limit">节点流量上限（GB）</label>
                                            <input class="form-control maxwidth-edit" id="node_bandwidth_limit"
                                                   name="node_bandwidth_limit" type="text"
                                                   value="{$node->node_bandwidth_limit/1024/1024/1024}">
                                            <p class="form-control-guide"><i class="material-icons">info</i>不设上限请填0</p>
                                        </div>

                                        <div class="form-group form-group-label">
                                            <label class="floating-label" for="bandwidthlimit_resetday">节点流量上限清空日</label>
                                            <input class="form-control maxwidth-edit" id="bandwidthlimit_resetday"
                                                   name="bandwidthlimit_resetday" type="text"
                                                   value="{$node->bandwidthlimit_resetday}">
                                        </div>

                                        <div class="form-group form-group-label">
                                            <label class="floating-label" for="node_speedlimit">节点限速（Mbps）</label>
                                            <input class="form-control maxwidth-edit" id="node_speedlimit"
                                                   name="node_speedlimit" type="text" value="{$node->node_speedlimit}">
                                            <p class="form-control-guide"><i class="material-icons">info</i>不限速填0，对于每个用户端口生效</p>
                                        </div>

                                        <div class="form-group form-group-label">
                                            <label class="floating-label" for="node_speedlimit">节点排序</label>
                                            <input class="form-control maxwidth-edit" id="node_sort"
                                                   name="node_sort" type="text" value="{$node->node_sort}">
                                            <p class="form-control-guide"><i class="material-icons">info</i>数字越大越靠前</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-main">
                            <div class="card-inner">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-10 col-md-push-1">
                                            <button id="submit" type="submit"
                                                    class="btn btn-block btn-brand waves-attach waves-light">修改
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                {include file='dialog.tpl'}

        </div>


    </div>
</main>

{include file='admin/footer.tpl'}


{literal}
<script>

    $('#main_form').validate({
        rules: {
            name: {required: true},
            server: {required: true},
            method: {required: true},
            rate: {required: true},
            info: {required: true},
            group: {required: true},
            status: {required: true},
            node_speedlimit: {required: true},
            sort: {required: true},
            node_bandwidth_limit: {required: true},
            bandwidthlimit_resetday: {required: true}
        },


        submitHandler: () => {
            if ($$.getElementById('custom_method').checked) {
                var custom_method = 1;
            } else {
                var custom_method = 0;
            }

            if ($$.getElementById('type').checked) {
                var type = 1;
            } else {
                var type = 0;
            }
            {/literal}
            if ($$.getElementById('custom_rss').checked) {
                var custom_rss = 1;
            } else {
                var custom_rss = 0;
            }

            $.ajax({

                type: "PUT",
                url: "/admin/node/{$node->id}",
                dataType: "json",
                {literal}
                data: {
                    name: $$getValue('name'),
                    server: $$getValue('server'),
                    node_ip: $$getValue('node_ip'),
                    method: $$getValue('method'),
                    port: $$getValue("port"),
                    obfs: $$getValue("obfs"),
                    protocol: $$getValue("protocol"),
                    passwd: $$getValue("passwd"),
                    custom_method,
                    rate: $$getValue('rate'),
                    info: $$getValue('info'),
                    type,
                    group: $$getValue('group'),
                    status: $$getValue('status'),
                    sort: $$getValue('sort'),
                    node_speedlimit: $$getValue('node_speedlimit'),
                    node_sort: $$getValue('node_sort'),
                    class: $$getValue('class'),
                    node_bandwidth_limit: $$getValue('node_bandwidth_limit'),
                    bandwidthlimit_resetday: $$getValue('bandwidthlimit_resetday')
                    {/literal},
                    custom_rss,
                    mu_only: $$getValue('mu_only')
                },
                success: (data) => {
                    if (data.ret) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        window.setTimeout("location.href=top.document.referrer", {$config['jump_delay']});

                    } else {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                    }
                },
                {literal}
                error: (jqXHR) => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = `发生错误：${jqXHR.status}`;
                }
            });
        }
    });
    {/literal}
</script>

