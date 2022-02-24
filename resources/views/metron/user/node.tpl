<!DOCTYPE html>
<html lang="en">
<head>
    <title>节点列表 &mdash; {$config["appName"]}</title>
    {include file='include/global/head.tpl'}
    <div class="d-flex flex-column flex-root">
        <div class="d-flex flex-row flex-column-fluid page">
            <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
                {include file='include/global/menu.tpl'}
                <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                    <div class="subheader min-h-lg-175px pt-5 pb-7 subheader-transparent" id="kt_subheader">
                        <div class="container d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                            <div class="d-flex align-items-center flex-wrap mr-2">
                                <div class="d-flex flex-column">
                                    <h2 class="text-white font-weight-bold my-2 mr-5">节点列表</h2>
                                </div>
                            </div>
                            <div class="d-flex align-items-center">
                                {if $metron['nodes_filter'] === true}
                                    <a href="javascript:;"
                                       class="btn {$style[$theme_style]['global']['btn_subheader']} font-weight-bold py-3 px-6"
                                       data-toggle="modal" data-target="#nodes-filter-modal">订阅节点筛选</a>
                                {/if}
                            </div>
                        </div>
                    </div>

                    <div class="d-flex flex-column-fluid">
                        <div class="container">

                            {$class = -1} {$dom_head = 0}
                            {foreach $nodes as $node}

                            {if $node['class'] != $class}
                            {if $dom_head === 2}

                        </div>
                    </div>
                </div>
            </div>

            {/if}

            {$class = $node['class']} {$dom_head = 1} {$nodeClass[] = $node['class']}

            <div class="accordion accordion-solid accordion-panel accordion-svg-toggle" id="accordionExample-{$class}">
                <div class="card" style="width: 200px;">
                    <div class="card-header {$metron['style_shadow']}" id="headingThree-{$class}">
                        <div class="card-title" data-toggle="collapse" data-target="#collapseThree-{$class}"
                             aria-expanded="false" aria-controls="collapseThree-{$class}">
                            <div class="card-label"><strong>{$metron['node_class_name'][$class]}</strong></div>
                            <span class="svg-icon">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
                                     height="24px" viewBox="0 0 24 24" version="1.1">
                                    <g stroke="none" stroke-width="1" fill="none"
                                       fill-rule="evenodd">
                                        <polygon points="0 0 24 0 24 24 0 24"></polygon>
                                        <path d="M12.2928955,6.70710318 C11.9023712,6.31657888 11.9023712,5.68341391 12.2928955,5.29288961 C12.6834198,4.90236532 13.3165848,4.90236532 13.7071091,5.29288961 L19.7071091,11.2928896 C20.085688,11.6714686 20.0989336,12.281055 19.7371564,12.675721 L14.2371564,18.675721 C13.863964,19.08284 13.2313966,19.1103429 12.8242777,18.7371505 C12.4171587,18.3639581 12.3896557,17.7313908 12.7628481,17.3242718 L17.6158645,12.0300721 L12.2928955,6.70710318 Z"
                                              fill="#000000" fill-rule="nonzero"></path>
                                        <path d="M3.70710678,15.7071068 C3.31658249,16.0976311 2.68341751,16.0976311 2.29289322,15.7071068 C1.90236893,15.3165825 1.90236893,14.6834175 2.29289322,14.2928932 L8.29289322,8.29289322 C8.67147216,7.91431428 9.28105859,7.90106866 9.67572463,8.26284586 L15.6757246,13.7628459 C16.0828436,14.1360383 16.1103465,14.7686056 15.7371541,15.1757246 C15.3639617,15.5828436 14.7313944,15.6103465 14.3242754,15.2371541 L9.03007575,10.3841378 L3.70710678,15.7071068 Z"
                                              fill="#000000" fill-rule="nonzero"
                                              opacity="0.3"
                                              transform="translate(9.000003, 11.999999) rotate(-270.000000) translate(-9.000003, -11.999999)"></path>
                                    </g>
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>

                {/if}

                {if $dom_head === 1}
                {$dom_head = 2} {$dom_end = 1}

                <div id="collapseThree-{$class}" class="collapse show" aria-labelledby="headingThree-{$class}"
                     data-parent="#accordionExample-{$class}" style="">
                    <div class="card-body p-3">
                        <div class="row">
                            {/if}
                            <div class="col-sm-12 col-xl-6 mb-8">
                                <div class="card card-custom cursor_onclick {$metron['style_shadow']}"
                                        {if $user->class >= $node['class'] && $node['sort'] != 15 } onclick="node.NodeInfo({$node['id']})"
                                        {elseif $user->class >= $node['class'] && $node['sort'] == 15 } onclick="showVless({$node['id']})"
                                        {else} onclick="node.Classinsufficient()" {/if}>
                                    <div class="card-body pt-6 pl-4 pb-5">
                                        <ul class="list-unstyled user-details list-unstyled-border list-unstyled-noborder">
                                            <li class="media">
                                                {$region = substr($node['name'],0,6)}
                                                <img alt="image" class="mr-3 rounded-circle" width="50"
                                                     src="{$metron['assets_url']}/media/flags{if $metron['node_flag_mode'] == 'name'}/1x1_zh_cn/{$node['flag']}{else}/1x1/{$node['status']}{/if}.svg">
                                                <div class="media-body">
                                                    <div class="media-title"><span
                                                                class="label label-dot label-xl {if $node['online']=='1'}label-success{else}label-danger{/if}"></span> {$node['name']}
                                                    </div>
                                                    <div class=" text-job text-muted">
                                                        {$node['info']}
                                                    </div>
                                                </div>
                                                <div class="media-items">
                                                    {if $metron['enable_online_user'] == true}
                                                        <div class="media-item">
                                                            <div class="media-value">{if $node['online_user'] == -1} N/A{else} {$node['online_user']}{/if}</div>
                                                            <div class="media-label">在线</div>
                                                        </div>
                                                    {/if}
                                                    {if $metron['enable_node_traffic_rate'] == true}
                                                        <div class="media-item">
                                                            <div class="media-value">x{$node['traffic_rate']}</div>
                                                            <div class="media-label">倍率</div>
                                                        </div>
                                                    {/if}
                                                    {if $metron['enable_node_load'] == true}

                                                        {if $user->isAdmin()}
                                                            <div class="media-item">
                                                                <div class="media-value">{if $node['latest_load'] == -1}N/A{else}{$node['latest_load']}%{/if}</div>
                                                                <div class="media-label">负载</div>
                                                            </div>
                                                        {/if}

                                                    {/if}

                                                </div>
                                            </li>
                                        </ul>
                                        {if $node['unlock'] && $metron['show_stream_media'] === true}
                                            <div style="border-top: 2px dashed #ECF0F3;
                                        border-bottom-right-radius: 0.42rem;
                                        border-bottom-left-radius: 0.42rem;
                                        margin-top: 20px;
                                        margin-bottom: 10px;"></div>
                                            <div class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded" style="">
                                                <table id="node_unlocak"  class="datatable-table" style="display: block;">
                                                    <thead class="datatable-head">
                                                    <tr class="datatable-row" style="left: 0px;">
                                                        <th data-field="YouTube" class="datatable-cell"><span>YouTube</span></th>
                                                        <th data-field="Netflix" class="datatable-cell"><span>Netflix</span></th>
                                                        <th data-field="DisneyPlus" class="datatable-cell"><span>DisneyPlus</span></th>
                                                        <th data-field="港澳台B站" class="datatable-cell"><span>港澳台B站</span></th>
                                                        <th data-field="台湾B站" class="datatable-cell"><span>台湾B站</span></th>
                                                        <th data-field="MyTVSuper" class="datatable-cell"><span>MyTVSuper</span></th>
                                                        <th data-field="BBC" class="datatable-cell"><span>BBC</span></th>
                                                        <th data-field="Abema" class="datatable-cell"><span>Abema</span></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody style="" class="datatable-body">
                                                    <tr data-row="0" class="datatable-row" style="left: 0px;">
                                                        <td data-field="YouTube" style="width: 13%;" aria-label="{$node['unlock']['unlock_item']['YouTube']}" class="datatable-cell">
                                                            <span>{$node['unlock']['unlock_item']['YouTube']}</span>
                                                        </td>
                                                        <td data-field="Netflix" style="width: 13%;" aria-label="{$node['unlock']['unlock_item']['Netflix']}" class="datatable-cell">
                                                            <span>{$node['unlock']['unlock_item']['Netflix']}</span>
                                                        </td>
                                                        <td data-field="DisneyPlus" style="width: 13%;" aria-label="{$node['unlock']['unlock_item']['DisneyPlus']}" class="datatable-cell">
                                                            <span>{$node['unlock']['unlock_item']['DisneyPlus']}</span>
                                                        </td>
                                                        <td data-field="BilibiliHKMCTW" style="width: 13%;" aria-label="{$node['unlock']['unlock_item']['BilibiliHKMCTW']}" class="datatable-cell">
                                                            <span>{$node['unlock']['unlock_item']['BilibiliHKMCTW']}</span>
                                                        </td>
                                                        <td data-field="BilibiliTW" style="width: 13%;" aria-label="{$node['unlock']['unlock_item']['BilibiliTW']}" class="datatable-cell">
                                                            <span>{$node['unlock']['unlock_item']['BilibiliTW']}</span>
                                                        </td>
                                                        <td data-field="MyTVSuper" style="width: 13%;" aria-label="{$node['unlock']['unlock_item']['MyTVSuper']}" class="datatable-cell">
                                                            <span>{$node['unlock']['unlock_item']['MyTVSuper']}</span>
                                                        </td>
                                                        <td data-field="BBC" style="width: 13%;" aria-label="{$node['unlock']['unlock_item']['BBC']}" class="datatable-cell">
                                                            <span>{$node['unlock']['unlock_item']['BBC']}</span>
                                                        </td>
                                                        <td data-field="Abema" style="width: 13%;" aria-label="{$node['unlock']['unlock_item']['Abema']}" class="datatable-cell">
                                                            <span>{$node['unlock']['unlock_item']['Abema']}</span>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        {/if}
                                    </div>
                                </div>
                            </div>


                            {/foreach}
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    </div>
    {include file='include/global/footer.tpl'}
    </div>
    </div>
    </div>
    {include file='include/global/scripts.tpl'}

    <!-- SSR 节点 -->
    <div class="modal fade" id="nodeinfo-ssr-modal" data-backdrop="static" tabindex="-1" role="dialog"
         aria-labelledby="nodeinfo-ssr-modal-title" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content shadow-lg">
                <div class="modal-header">
                    <h4 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong
                                id="tab-ssr-modal-config-remark">节点名称</strong></h4>
                </div>
                <div class="modal-body" id="nodeinfo-ssr-modal-body">
                    <ul class="dashboard-tabs nav nav-pills row nav-primary row-paddingless m-0 p-0" role="tablist">
                        <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 ml-1 mr-1 mb-0 cursor_onclick">
                            <a class="nav-link border d-flex flex-grow-1 rounded flex-column align-items-center p-1 active"
                               data-toggle="pill" href="#tab-ssr-modal-qrcode">
                                <span class="nav-text font-size-lg py-2 font-weight-bold text-center">二维码</span>
                            </a>
                        </li>
                        <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 ml-1 mr-1 mb-0 cursor_onclick">
                            <a class="nav-link border d-flex flex-grow-1 rounded flex-column align-items-center p-1"
                               data-toggle="pill" href="#tab-ssr-modal-config">
                                <span class="nav-text font-size-lg py-2 font-weight-bold text-center">手动设置</span>
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content m-0 p-0">
                        <div class="tab-pane active show" id="tab-ssr-modal-qrcode">
                            <a href="#">
                                <div class="text-center pt-10" id="nodeinfo-ssr-qrcode">
                                </div>
                            </a>
                        </div>
                        <div class="tab-pane" id="tab-ssr-modal-config">
                            <div class="pt-10 pl-10">
                                <p>服务器地址：<code id="tab-ssr-modal-config-address"></code></p>
                                <p>服务器端口：<code id="tab-ssr-modal-config-port"></code></p>
                                <p>加密方式：<code id="tab-ssr-modal-config-method"></code></p>
                                <p>密码：<code id="tab-ssr-modal-config-passwd"></code></p>
                                <p>协议：<code id="tab-ssr-modal-config-protocol"></code></p>
                                <p>协议参数：<code id="tab-ssr-modal-config-protocol_param"></code></p>
                                <p>混淆：<code id="tab-ssr-modal-config-obfs"></code></p>
                                <p>混淆参数：<code id="tab-ssr-modal-config-obfs_param"></code></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold"
                            data-dismiss="modal">关闭
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- V2ray 节点 -->
    <div class="modal fade" id="nodeinfo-v2ray-modal" data-backdrop="static" tabindex="-1" role="dialog"
         aria-labelledby="nodeinfo-v2ray-modal-title" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content shadow-lg">
                <div class="modal-header">
                    <h4 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong
                                id="nodeinfo-v2ray-modal-remark">节点名称</strong></h4>
                </div>
                <div class="modal-body" id="nodeinfo-v2ray-modal-body">
                    <div class="pt-4 pl-10">
                        <p>地址：<code id="nodeinfo-v2ray-modal-add"></code></p>
                        <p>端口：<code id="nodeinfo-v2ray-modal-port"></code></p>
                        <p>Alter Id：<code id="nodeinfo-v2ray-modal-aid"></code></p>
                        <p>用户 UUID：<code id="nodeinfo-v2ray-modal-id"></code></p>
                        <p>传输协议：<code id="nodeinfo-v2ray-modal-net"></code></p>
                        <p>路径：<code id="nodeinfo-v2ray-modal-path"></code></p>
                        <p>伪装方式：<code id="nodeinfo-v2ray-modal-type"></code></p>
                        <p>TLS：<code id="nodeinfo-v2ray-modal-tls"></code></p>
                        <p>VMess 链接：<code class="cursor_onclick copy-modal" id="nodeinfo-v2ray-modal-url"
                                          data-clipboard-text="#">点击复制</code></p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold"
                            data-dismiss="modal">关闭
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- ss+ws 节点 -->
    <div class="modal fade" id="nodeinfo-v2rayPlug-modal" data-backdrop="static" tabindex="-1" role="dialog"
         aria-labelledby="nodeinfo-v2rayPlug-modal-title" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content shadow-lg">
                <div class="modal-header">
                    <h4 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong
                                id="nodeinfo-v2rayPlug-modal-remark">节点名称</strong></h4>
                </div>
                <div class="modal-body" id="nodeinfo-v2rayPlug-modal-body">
                    <div class="pt-4 pl-10">
                        <p>节点地址：<code id="nodeinfo-v2rayPlug-modal-address"></code></p>
                        <p>节点端口：<code id="nodeinfo-v2rayPlug-modal-port"></code></p>
                        <p>节点加密：<code id="nodeinfo-v2rayPlug-modal-method"></code></p>
                        <p>连接密码：<code id="nodeinfo-v2rayPlug-modal-passwd"></code></p>
                        <p>混淆方式：<code id="nodeinfo-v2rayPlug-modal-obfs"></code></p>
                        <p>混淆参数：<code id="nodeinfo-v2rayPlug-modal-obfs_param"></code></p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold"
                            data-dismiss="modal">关闭
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- trojan 节点 -->
    <div class="modal fade" id="nodeinfo-trojan-modal" data-backdrop="static" tabindex="-1" role="dialog"
         aria-labelledby="nodeinfo-trojan-modal-title" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content shadow-lg">
                <div class="modal-header">
                    <h4 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong
                                id="nodeinfo-trojan-modal-remark">节点配置信息</strong></h4>
                </div>
                <div class="modal-body" id="nodeinfo-trojan-modal-body">
                    <div class="pt-4 pl-10">
                        <p>节点地址：<code id="nodeinfo-trojan-modal-address"></code></p>
                        <p>节点Host：<code id="nodeinfo-trojan-modal-host"></code></p>
                        <p>节点端口：<code id="nodeinfo-trojan-modal-port"></code></p>
                        <p>节点密码：<code id="nodeinfo-trojan-modal-passwd"></code></p>
                        <p>Trojan链接：
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.6/clipboard.min.js"></script>
                            <a href="#" class="copy-text">点此复制</a>
                            <script>
                                var clipboard = new ClipboardJS('.copy-text', {
                                    text: function (trigger) {
                                        var address = document.querySelector('#nodeinfo-trojan-modal-address').innerText;
                                        var host = document.querySelector('#nodeinfo-trojan-modal-host').innerText;
                                        var port = document.querySelector('#nodeinfo-trojan-modal-port').innerText;
                                        var passwd = document.querySelector('#nodeinfo-trojan-modal-passwd').innerText;
                                        var nodename = document.querySelector('#nodeinfo-trojan-modal-remark').innerText;
                                        return "trojan://" + passwd + "@" + address + ":" + port + "?peer=" + host + "#" + nodename;
                                    }
                                });
                            </script>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold"
                            data-dismiss="modal">关闭
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- V2ray-VLESS 节点 -->
    <div class="modal fade" id="nodeinfo-v2ray-vless-modal" data-backdrop="static" tabindex="-1" role="dialog"
         aria-labelledby="nodeinfo-v2ray-modal-title" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content shadow-lg">
                <div class="modal-header">
                    <h4 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong
                                id="nodeinfo-v2ray-vless-modal-remark">节点名称</strong></h4>
                </div>
                <div class="modal-body" id="nodeinfo-v2ray-modal-body">
                    <div class="pt-4 pl-10">
                        <p>地址：<code id="nodeinfo-v2ray-vless-modal-add"></code></p>
                        <p>端口：<code id="nodeinfo-v2ray-vless-modal-port"></code></p>
                        <p>Alter Id：<code id="nodeinfo-v2ray-vless-modal-aid"></code></p>
                        <p>用户 UUID：<code id="nodeinfo-v2ray-vless-modal-id"></code></p>
                        <p>传输协议：<code id="nodeinfo-v2ray-vless-modal-net"></code></p>
                        <p>路径：<code id="nodeinfo-v2ray-modal-vless-path"></code></p>
                        <p>伪装方式：<code id="nodeinfo-v2ray-vless-modal-type"></code></p>
                        <p>TLS：<code id="nodeinfo-v2ray-vless-modal-tls"></code></p>
                        <p>流控(flow)：<code id="nodeinfo-v2ray-vless-modal-flow"></code></p>
                        <p>VLESS 链接：<code class="cursor_onclick copy-modal" id="nodeinfo-v2ray-vless-modal-url"
                                          data-clipboard-text="#">点击复制</code></p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold"
                            data-dismiss="modal">关闭
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- 订阅筛选 -->
    {if $metron['nodes_filter'] === true}
        <div class="modal fade" id="nodes-filter-modal" data-backdrop="static" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong> 订阅节点筛选 </strong>
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i
                                    aria-hidden="true" class="ki ki-close"></i></button>
                    </div>
                    <div class="modal-body">

                        <div class="row align-items-center">
                            <div class="col-xl-8 order-2 order-xl-1">
                                <div class="row align-items-center">
                                    <div class="col-md-3 kt-margin-b-20-tablet-and-mobile">
                                        <div class="kt-form__group kt-form__group--inline">
                                            <div class="kt-form__label">
                                                <label>节点订阅模式</label>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <select class="form-control" id="filter_mode" data-style="btn-danger">
                                                    <option value="all"
                                                            {if !$filter || $filter && $filter['mode']=='all'}selected="selected"{/if}>
                                                        默认获取全部
                                                    </option>
                                                    <option value="nodes_class"
                                                            {if $filter && $filter['mode']=='nodes_class'}selected="selected"{/if}>
                                                        按节点等级
                                                    </option>
                                                    <option value="nodes_id"
                                                            {if $filter && $filter['mode']=='nodes_id'}selected="selected"{/if}>
                                                        自定义获取节点
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 kt-margin-b-20-tablet-and-mobile">
                                        <div class="kt-form__group kt-form__group--inline">
                                            <div class="kt-form__label">
                                                <label>订阅节点排序</label>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <select class="form-control" id="filter_sort">
                                                    <option value="node_class-asc"
                                                            {if $filter['sort']['type']=='node_class' && $filter['sort']['value']=='asc'}selected="selected"{/if}>
                                                        按节点等级升序
                                                    </option>
                                                    <option value="node_class-desc"
                                                            {if $filter['sort']['type']=='node_class' && $filter['sort']['value']=='desc'}selected="selected"{/if}>
                                                        按节点等级降序
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    {if $metron['nodes_miniName'] === true}
                                        <div class="col-md-3 kt-margin-b-20-tablet-and-mobile">
                                            <div class="kt-form__group kt-form__group--inline">
                                                <div class="kt-form__label">
                                                    <label>简化节点名称</label>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <select class="form-control" id="filter_mininame">
                                                        <option value="1"
                                                                {if $filter['mininame']===1}selected="selected"{/if}>开启
                                                        </option>
                                                        <option value="0"
                                                                {if $filter['mininame']===0 || !$filter['mininame'] }selected="selected"{/if}>
                                                            关闭
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    {/if}
                                </div>
                            </div>

                            <div class="col-xl-4 order-1 order-xl-2 text-right" id="allcheck">
                                <div class="btn-group kt-padding-r-10"
                                     id="check-node_class" {if $filter['mode']!='nodes_id'} style="display: none" {/if}>
                                    <button type="button" class="btn btn-primary font-weight-bold dropdown-toggle"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">按节点等级选择
                                    </button>
                                    <div class="dropdown-menu">
                                        {foreach $metron['node_class_name'] as $nodeName}
                                            <button type="button" class="dropdown-item"
                                                    onclick="node.allCheck('nodes_id-filter', 'node_class', {$nodeName@key});">
                                                选择所有 Lv.{$nodeName@key} {$nodeName}</button>
                                        {/foreach}
                                    </div>
                                </div>
                                <div class="btn-group kt-padding-r-10"
                                     id="check-all" {if $filter['mode']!='nodes_id'} style="display: none" {/if}>
                                    <button type="button" class="btn btn-primary font-weight-bold dropdown-toggle"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">操作
                                    </button>
                                    <div class="dropdown-menu">
                                        <button type="button" class="dropdown-item"
                                                onclick="node.allCheck('nodes_id-filter', true);">全选
                                        </button>
                                        <button type="button" class="dropdown-item"
                                                onclick="node.allCheck('nodes_id-filter', false);">清空
                                        </button>
                                        <button type="button" class="dropdown-item"
                                                onclick="node.allCheck('nodes_id-filter', 'anti');">反选
                                        </button>
                                    </div>
                                </div>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-success" onclick="node.nodeFilterSave();"
                                            id="node_filter_save_up"><i class="fa fa-save"></i> <span
                                                id="node_filter_save_up_text">保存更改</span></button>
                                </div>
                                <div class="kt-separator kt-separator--border-dashed kt-separator--space-lg d-xl-none"></div>
                            </div>

                        </div>

                        <!-- mode: 默认获取全部 -->
                        <div class="row pt-10 pl-5 pr-5"
                             id="filter_mode-all" {if $filter && $filter['mode']!='all'} style="display: none" {/if}>
                            <div class="col-12 alert alert-custom alert-outline-2x alert-outline-primary fade show mb-5"
                                 role="alert">
                                <div class="alert-icon"><i class="flaticon-signs"></i></div>
                                <div class="alert-text">该模式下您可以订阅到所有可用节点</div>
                            </div>
                        </div>
                        <!-- mode: 按节点等级 -->
                        <div class="row kt-padding-t-30 kt-padding-l-30 kt-padding-r-30"
                             id="filter_mode-nodes_class" {if $filter['mode']!='nodes_class'} style="display: none" {/if}>
                            <div class="col-12 pt-8 text-center">
                                <h3 class="display-5 text-primary"><strong>节点等级条件 [二选一]</strong></h3>
                            </div>
                            <div class="col-12">
                                <p>获取<code>大于等于</code>指定等级的所有节点</p>
                                <p>例如选择 Lv.2 等级, 您将订阅到 Lv.2 和以上等级节点, 不会订阅到 Lv.1 节点<br></p>
                            </div>
                            <div class="col-12 pl-8 row">
                                {foreach $nodeClass as $class}
                                    <label class="col-6 col-sm-6 col-md-4 col-lg-3 col-xl-2 checkbox checkbox-primary {if $user->class < $class} disabled{/if}"
                                           {if $user->class >= $class}onclick="node.allCheck('checkbox-nodes_class-filter', false);"{/if}>
                                        <input class="mode-node_class-{$class}"
                                               type="radio" {if $user->class < $class} disabled="disabled" {/if}
                                               name="radio-nodes_class-filter"
                                               value="{$class}" {if $filter['nodes_class']['the'] == '>=' && $class == $filter['nodes_class']['value'] || !$filter['nodes_class']['the'] && $class==$user->class}checked="true"{/if}>
                                        <div class="label label-sm label-rounded label-primary mr-2">{$class}</div> {$metron['node_class_name'][$class]}
                                        <span></span>
                                    </label>
                                {/foreach}
                            </div>
                            <div class="col-12 pt-8 text-center">
                                <h3 class="display-5 text-primary"><strong>指定节点等级 [二选一]</strong></h3>
                            </div>
                            <div class="col-12">
                                <p>获取<code>所选指定</code>等级的所有节点</p>
                                <p>例如选择 Lv.2 等级, 您将只会订阅到 Lv.2 等级节点 (可多选)</p>
                            </div>
                            <div class="col-12 pl-8 row">
                                {foreach $nodeClass as $class}
                                    <label class="col-6 col-sm-6 col-md-4 col-lg-3 col-xl-2 checkbox checkbox-primary {if $user->class < $class} disabled{/if}"
                                           {if $user->class >= $class}onclick="node.allCheck('radio-nodes_class-filter', false);"{/if}>
                                        <input class="mode-node_class-{$class}"
                                               type="checkbox" {if $user->class < $class} disabled="disabled" {/if}
                                               name="checkbox-nodes_class-filter"
                                               value="{$class}" {if $filter['nodes_class']['the'] == '=' && in_array($class, $filter['nodes_class']['value'])}checked="true"{/if}>
                                        <div class="label label-sm label-rounded label-primary mr-2">{$class}</div> {$metron['node_class_name'][$class]}
                                        <span></span>
                                    </label>
                                {/foreach}
                            </div>
                        </div>
                        <!-- mode: 自定义获取节点 -->
                        <div class="row pt-5 pl-5"
                             id="filter_mode-nodes_id" {if $filter['mode']!='nodes_id'} style="display: none" {/if}>
                            {$filter_class = -1}
                            {foreach $nodes as $node}
                                {if $node['class'] != $filter_class}
                                    {$filter_class = $node['class']}
                                    <div class="col-12 pl-0 pt-5 pb-2 text-center">
                                        <h3 class="display-5 text-primary">
                                            <strong>{$metron['node_class_name'][$filter_class]}</strong>{if $user->class<$filter_class} [等级不足]{/if}
                                        </h3>
                                    </div>
                                {/if}
                                <label class="col-sm-12 col-md-6 col-lg-4 col-xl-3 checkbox checkbox-primary {if $user->class < $node['class']} disabled{/if}">
                                    <input class="node_class-{$node['class']} nation-{$node['status']} id-{$node['id']}"
                                           type="checkbox" {if $user->class < $node['class']} disabled="disabled" {/if}
                                           name="nodes_id-filter"
                                           value="{$node['id']}" {if isset($filter['nodes_id']) && in_array($node['id'], $filter['nodes_id']) || !$filter['nodes_id'] && $user->class >= $node['class']}checked="true"{/if} >{$node['name']}
                                    <span></span>
                                </label>
                            {/foreach}
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold"
                                data-dismiss="modal">取消
                        </button>
                        <button type="button" class="btn btn-success" onclick="node.nodeFilterSave();"
                                id="node_filter_save_down"><i class="fa fa-save"></i> <span
                                    id="node_filter_save_dowm_text">保存更改</span></button>
                    </div>
                </div>
            </div>
        </div>
    {/if}

    </body>
    <script>
        $("td span:contains('Yes')").addClass("text-success");
        $("td span:contains('No')").addClass("text-danger");
        $("td span:contains('Unknow')").addClass("text-warning");
        $("td span:contains('仅限自制')").addClass("text-info");
        //触发模态框的同时调用此方法
        function showVless(id) {
            $.get('/user/nodeinfo/' + id, function (res) {
                let data = JSON.parse(res)
                $("#nodeinfo-v2ray-vless-modal-remark").text(data.info.remark)
                $("#nodeinfo-v2ray-vless-modal-add").text(data.info.add)
                $("#nodeinfo-v2ray-vless-modal-port").text(data.info.port)
                $("#nodeinfo-v2ray-vless-modal-aid").text(data.info.aid)
                $("#nodeinfo-v2ray-vless-modal-id").text(data.info.id)
                $("#nodeinfo-v2ray-vless-modal-net").text(data.info.net)
                $("#nodeinfo-v2ray-vless-modal-path").text(data.info.path)
                $("#nodeinfo-v2ray-vless-modal-tls").text(data.info.security)
                $("#nodeinfo-v2ray-vless-modal-flow").text(data.info.flow)
                $("#nodeinfo-v2ray-vless-modal-url").attr('data-clipboard-text', data.url)
            });

            $('#nodeinfo-v2ray-vless-modal').modal('show');
        }
    </script>
</html>
