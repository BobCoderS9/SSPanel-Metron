<!DOCTYPE html>
<html lang="en">
    <head>
        <title>用户中心 &mdash; {$config["appName"]}</title>
        <link href="{$metron['assets_url']}/css/client/metron-icon.css" rel="stylesheet" type="text/css" />
        <link href="/assets/css/components.css" rel="stylesheet" type="text/css"/>
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
                                        <h2 class="text-white font-weight-bold my-2 mr-5">用户中心</h2>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    {if $user->isAbleToCheckin()}
                                    <a href="javascript:;" 
                                       class="btn {$style[$theme_style]['global']['btn_subheader']} font-weight-bold py-3 px-6" 
                                       id="checkin" onclick="index.checkin();">每日签到</a>
                                    {else}
                                    <a href="javascript:;" 
                                       class="btn btn-transparent-white font-weight-bold py-3 px-6 mr-2 disabled" 
                                       disabled="disabled">已签到</a>
                                    {/if}
                                </div>
                            </div>
                        </div>
                        {if $user->class != -1}
                        <div class="d-flex flex-column-fluid">
                            <div class="container">
                                <div id="index-alert">
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-lg-6 col-xl-3 ">
                                        <div class="card card-custom mb-8 {$style[$theme_style]['index']['dash1']['bg']} {$metron['style_shadow']}">
                                            <div class="card-body pt-6 pl-4 pb-0">
                                                <div class="d-flex pt-4 pl-4 pr-4 pb-0">
                                                    <span class="svg-icon svg-icon-4x {$style[$theme_style]['index']['dash1']['svg']}">
                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
                                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                <polygon points="0 0 24 0 24 24 0 24"></polygon>
                                                                <path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                                                                <path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" fill="#000000" fill-rule="nonzero"></path>
                                                            </g>
                                                        </svg>
                                                    </span>
                                                    <div class="d-flex flex-column ml-3 mr-5">
                                                        <div class="font-size-h4 {$style[$theme_style]['index']['text']} mb-2"><strong>{if $user->class_expire!="1989-06-04 00:05:00" && $user->class >= 1}<span class="counter">{$class_left_days}</span> 天{elseif $user->class <= 0}<span class="counter">已过期</span>{else}未知{/if}</strong></div>
                                                        <p class="text-dark-50">会员时长</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body pt-2 pl-5 pr-3 pb-1">
                                                <p class="text-dark-50">
                                                {foreach $metron['user_level'] as $user_level_class => $user_level_name}
                                                    {if $user->class == $user_level_class}{$user_level_name}{/if}
                                                {/foreach}
                                                : 
                                                {if $user->class_expire != "1989-06-04 00:05:00" && $user->class >= 1}
                                                {substr($user->class_expire, 0, 10)} 到期
                                                {elseif $user->class == 0}
                                                已过期
                                                {elseif $user->class == -1}
                                                请购买套餐激活账号
                                                {else}永久{/if}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-6 col-xl-3 ">
                                        <div class="card card-custom mb-8 {$style[$theme_style]['index']['dash2']['bg']} {$metron['style_shadow']}">
                                            <div class="card-body pt-6 pl-4 pb-0">
                                                <div class="d-flex pt-4 pl-4 pr-4 pb-0">
                                                    <span class="svg-icon svg-icon-4x {$style[$theme_style]['index']['dash2']['svg']}">
                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
                                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                <rect x="0" y="0" width="24" height="24"/>
                                                                <path d="M5,5 L5,15 C5,15.5948613 5.25970314,16.1290656 5.6719139,16.4954176 C5.71978107,16.5379595 5.76682388,16.5788906 5.81365532,16.6178662 C5.82524933,16.6294602 15,7.45470952 15,7.45470952 C15,6.9962515 15,6.17801499 15,5 L5,5 Z M5,3 L15,3 C16.1045695,3 17,3.8954305 17,5 L17,15 C17,17.209139 15.209139,19 13,19 L7,19 C4.790861,19 3,17.209139 3,15 L3,5 C3,3.8954305 3.8954305,3 5,3 Z" fill="#000000" fill-rule="nonzero" transform="translate(10.000000, 11.000000) rotate(-315.000000) translate(-10.000000, -11.000000) "/>
                                                                <path d="M20,22 C21.6568542,22 23,20.6568542 23,19 C23,17.8954305 22,16.2287638 20,14 C18,16.2287638 17,17.8954305 17,19 C17,20.6568542 18.3431458,22 20,22 Z" fill="#000000" opacity="0.3"/>
                                                            </g>
                                                        </svg>
                                                    </span>
                                                    <div class="d-flex flex-column ml-3 mr-5">
                                                        <div class="font-size-h4 {$style[$theme_style]['index']['text']} mb-2"><strong>{$user->unusedTraffic()}</strong></div>
                                                        <p class="text-dark-50">剩余流量</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body pt-2 pl-5 pr-3 pb-1">
                                                <p class="text-dark-50">下次重置：{$user->valid_use_loop()} 
                                                {if $metron['advanceResetFlow'] === true}
                                                    <span id="advance_reset_flow_onclick" class="label {$style[$theme_style]['index']['dash2']['btn']} label-inline font-weight-lighter ml-1 mr-2 cursor_onclick" onclick="index.advanceResetFlow('get');">提前重置</span>
                                                {/if}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-6 col-xl-3 ">
                                        <div class="card card-custom mb-8 {$style[$theme_style]['index']['dash3']['bg']} {$metron['style_shadow']}">
                                            <div class="card-body pt-6 pl-4 pb-0">
                                                <div class="d-flex pt-4 pl-4 pr-4 pb-0">
                                                    <span class="svg-icon svg-icon-4x {$style[$theme_style]['index']['dash3']['svg']}">
                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                <rect x="0" y="0" width="24" height="24"/>
                                                                <path d="M8,2.5 C7.30964406,2.5 6.75,3.05964406 6.75,3.75 L6.75,20.25 C6.75,20.9403559 7.30964406,21.5 8,21.5 L16,21.5 C16.6903559,21.5 17.25,20.9403559 17.25,20.25 L17.25,3.75 C17.25,3.05964406 16.6903559,2.5 16,2.5 L8,2.5 Z" fill="#000000" opacity="0.3"/>
                                                                <path d="M8,2.5 C7.30964406,2.5 6.75,3.05964406 6.75,3.75 L6.75,20.25 C6.75,20.9403559 7.30964406,21.5 8,21.5 L16,21.5 C16.6903559,21.5 17.25,20.9403559 17.25,20.25 L17.25,3.75 C17.25,3.05964406 16.6903559,2.5 16,2.5 L8,2.5 Z M8,1 L16,1 C17.5187831,1 18.75,2.23121694 18.75,3.75 L18.75,20.25 C18.75,21.7687831 17.5187831,23 16,23 L8,23 C6.48121694,23 5.25,21.7687831 5.25,20.25 L5.25,3.75 C5.25,2.23121694 6.48121694,1 8,1 Z M9.5,1.75 L14.5,1.75 C14.7761424,1.75 15,1.97385763 15,2.25 L15,3.25 C15,3.52614237 14.7761424,3.75 14.5,3.75 L9.5,3.75 C9.22385763,3.75 9,3.52614237 9,3.25 L9,2.25 C9,1.97385763 9.22385763,1.75 9.5,1.75 Z" fill="#000000" fill-rule="nonzero"/>
                                                            </g>
                                                        </svg>
                                                    </span>
                                                    <div class="d-flex flex-column ml-3 mr-5">
                                                        <div class="font-size-h4 {$style[$theme_style]['index']['text']} mb-2"><strong>{$user->online_ip_count()} / {if $user->node_connector == 0}无限制{else}{$user->node_connector}{/if}</strong></div>
                                                        <p class="text-dark-50">在线设备</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body pt-2 pl-5 pr-3 pb-1">
                                                <p class="text-dark-50">上次使用: {if $user->lastSsTime() == '从未使用喵'}从未使用过{else}{substr($user->lastSsTime(), 5)}{/if}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-6 col-xl-3 ">
                                        <div class="card card-custom mb-8 {$style[$theme_style]['index']['dash4']['bg']} {$metron['style_shadow']}">
                                            <div class="card-body pt-6 pl-4 pb-0">
                                                <div class="d-flex pt-4 pl-4 pr-4 pb-0">
                                                    <span class="svg-icon svg-icon-4x {$style[$theme_style]['index']['dash4']['svg']}">
                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                <rect x="0" y="0" width="24" height="24"/>
                                                                <circle fill="#000000" opacity="0.3" cx="20.5" cy="12.5" r="1.5"/>
                                                                <rect fill="#000000" opacity="0.3" transform="translate(12.000000, 6.500000) rotate(-15.000000) translate(-12.000000, -6.500000) " x="3" y="3" width="18" height="7" rx="1"/>
                                                                <path d="M22,9.33681558 C21.5453723,9.12084552 21.0367986,9 20.5,9 C18.5670034,9 17,10.5670034 17,12.5 C17,14.4329966 18.5670034,16 20.5,16 C21.0367986,16 21.5453723,15.8791545 22,15.6631844 L22,18 C22,19.1045695 21.1045695,20 20,20 L4,20 C2.8954305,20 2,19.1045695 2,18 L2,6 C2,4.8954305 2.8954305,4 4,4 L20,4 C21.1045695,4 22,4.8954305 22,6 L22,9.33681558 Z" fill="#000000"/>
                                                            </g>
                                                        </svg>
                                                    </span>
                                                    <div class="d-flex flex-column ml-3 mr-5">
                                                        <div class="font-size-h4 {$style[$theme_style]['index']['text']} mb-2"><strong>¥ {$user->money}</strong></div>
                                                        <p class="text-dark-50">钱包余额</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body pt-2 pl-5 pr-3 pb-1">
                                                <p class="text-dark-50">返利累计: ¥ {$paybacks_sum}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-7">
                                        <!-- 公告-->
                                        <div class="card card-custom bgi-no-repeat gutter-b {$metron['style_shadow']}" {if $theme_style !== 'dark'}style="background-position: right top; background-size: 30% auto; background-image: url({$metron['assets_url']}/media/svg/shapes/abstract-2.svg)" {/if}>
                                            <div class="card-header border-0 pt-5">
                                                <div class="card-title font-weight-bolder">
                                                    <div class="card-label {$style[$theme_style]['global']['title']} font-weight-bold font-size-h3">
                                                        <i class="fas fa-bullhorn icon-md {$style[$theme_style]['global']['title']}"></i><strong> 最新公告</strong>
                                                        <div class="font-size-sm text-muted mt-2">更新日期：{$ann->date}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="text-dark-50 font-weight-normal font-size-lg-h4 font-size-h5">
                                                    {if $ann->content_exp}
                                                        {$ann->content_exp}
                                                        <a href="JavaScript:;" class="text-hover-warning" data-toggle="modal" data-target="#fullann">点击查看完整公告内容</a>
                                                    {else}
                                                        {$ann->content}
                                                    {/if}
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 节点流量统计 
                                        <div class="card card-custom gutter-b {$metron['style_shadow']}" id="index-NodeTrafficChart-card">
                                            <div class="card-header border-0 pt-5">
                                                <div class="card-title font-weight-bolder">
                                                    <div class="card-label {$style[$theme_style]['global']['title']} font-weight-bold font-size-h3">
                                                        <i class="fa fa-fill-drip icon-md {$style[$theme_style]['global']['title']}"></i><strong> 流量统计</strong>
                                                        <div class="font-size-sm text-muted mt-2">72小时内产生流量超过 10 MB 的节点统计</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body pt-0">
                                                <div id="NodeTrafficChart"></div>
                                                <div id="NodeTrafficChart_null" class="text-center p-10" style="display: none;">
                                                    <h3 class="display-5 text-muted">暂无记录</h3>
                                                </div>
                                            </div>
                                            
                                        </div>-->
                                        <!-- 客户端下载 -->
                                        {include file='include/index/client.tpl'}

                                    </div>

                                    <div class="col-lg-5">
                                        <!-- 流量信息 -->
                                        <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                            <div class="card-header border-0 pt-5">
                                                <div class="card-title font-weight-bolder">
                                                    <div class="card-label {$style[$theme_style]['global']['title']} font-weight-bold font-size-h3">
                                                        <i class="fa fa-tint icon-md {$style[$theme_style]['global']['title']}"></i><strong> 流量信息</strong>
                                                        <div class="font-size-sm text-muted mt-2">峰值速率：{if $user->node_speedlimit!=0}{$user->node_speedlimit}Mbps{else}不限制{/if}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body pt-2">
                                                <div id="flowTiaoChart" style="height: 250px"></div>
                                                <div class="mt-n12 position-relative zindex-0">
                                                    <div class="row">
                                                        <div class="col-4 col-xs-4 col-sm-4 col-lg-12 col-xl-4">
                                                            <div class="d-flex align-items-center mb-8">
                                                                <div class="symbol symbol-circle symbol-40 symbol-light mr-3 flex-shrink-0">
                                                                    <div class="symbol-label">
                                                                        <span class="svg-icon svg-icon-lg svg-icon-gray-500">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                                    <rect x="0" y="0" width="24" height="24"/>
                                                                                    <path d="M5,5 L5,15 C5,15.5948613 5.25970314,16.1290656 5.6719139,16.4954176 C5.71978107,16.5379595 5.76682388,16.5788906 5.81365532,16.6178662 C5.82524933,16.6294602 15,7.45470952 15,7.45470952 C15,6.9962515 15,6.17801499 15,5 L5,5 Z M5,3 L15,3 C16.1045695,3 17,3.8954305 17,5 L17,15 C17,17.209139 15.209139,19 13,19 L7,19 C4.790861,19 3,17.209139 3,15 L3,5 C3,3.8954305 3.8954305,3 5,3 Z" fill="#000000" fill-rule="nonzero" transform="translate(10.000000, 11.000000) rotate(-315.000000) translate(-10.000000, -11.000000) "/>
                                                                                    <path d="M20,22 C21.6568542,22 23,20.6568542 23,19 C23,17.8954305 22,16.2287638 20,14 C18,16.2287638 17,17.8954305 17,19 C17,20.6568542 18.3431458,22 20,22 Z" fill="#000000" opacity="0.3"/>
                                                                                </g>
                                                                            </svg>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <div class="font-size-h6 {$style[$theme_style]['global']['text']} font-weight-bolder">{$user->unusedTraffic()}</div>
                                                                    <div class="font-size-sm text-muted font-weight-bold mt-1">剩余流量</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-4 col-xs-4 col-sm-4 col-lg-12 col-xl-4">
                                                            <div class="d-flex align-items-center mb-8">
                                                                <div class="symbol symbol-circle symbol-40 symbol-light mr-3 flex-shrink-0">
                                                                    <div class="symbol-label">
                                                                        <span class="svg-icon svg-icon-lg svg-icon-gray-500">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                                    <rect x="0" y="0" width="24" height="24" />
                                                                                    <path d="M4.00246329,12.2004927 L13,14 L13,4.06189375 C16.9463116,4.55399184 20,7.92038235 20,12 C20,16.418278 16.418278,20 12,20 C7.64874861,20 4.10886412,16.5261253 4.00246329,12.2004927 Z" fill="#000000" opacity="0.3" />
                                                                                    <path d="M3.0603968,10.0120794 C3.54712466,6.05992157 6.91622084,3 11,3 L11,11.6 L3.0603968,10.0120794 Z" fill="#000000" />
                                                                                </g>
                                                                            </svg>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <div class="font-size-h6 {$style[$theme_style]['global']['text']} font-weight-bolder">{$user->TodayusedTraffic()}</div>
                                                                    <div class="font-size-sm text-muted font-weight-bold mt-1">今日使用</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-4 col-xs-4 col-sm-4 col-lg-12 col-xl-4">
                                                            <div class="d-flex align-items-center">
                                                                <div class="symbol symbol-circle symbol-40 symbol-light mr-3 flex-shrink-0">
                                                                    <div class="symbol-label">
                                                                        <span class="svg-icon svg-icon-lg svg-icon-gray-500">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                                    <rect x="0" y="0" width="24" height="24"/>
                                                                                    <path d="M7.67514486,18.731359 C9.6803634,17.3851601 11,15.0966889 11,12.5 C11,9.58867922 9.34119765,7.06479249 6.91718054,5.82192739 C8.29918974,4.68360845 10.0697622,4 12,4 C16.418278,4 20,7.581722 20,12 C20,16.418278 16.418278,20 12,20 C10.4066753,20 8.92214267,19.5342055 7.67514486,18.731359 Z" fill="#000000" opacity="0.3"/>
                                                                                    <path d="M6.39268296,17.7059641 C4.91588435,16.254539 4,14.2342276 4,12 C4,10.0680854 4.68479668,8.29611365 5.82489501,6.91357974 C7.72637261,8.04773008 9,10.1251292 9,12.5 C9,14.6298467 7.97562469,16.5204376 6.39268296,17.7059641 Z" fill="#000000"/>
                                                                                </g>
                                                                            </svg>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <div class="font-size-h6 {$style[$theme_style]['global']['text']} font-weight-bolder">{$user->LastusedTraffic()}</div>
                                                                    <div class="font-size-sm text-muted font-weight-bold mt-1">历史使用</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 订阅地址 -->
                                        <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                            <div class="card-header border-0 pt-5">
                                                <div class="card-title font-weight-bolder">
                                                    <div class="card-label {$style[$theme_style]['global']['title']} font-weight-bold font-size-h3">
                                                        <i class="fa fa-magic icon-md {$style[$theme_style]['global']['title']}"></i><strong> 订阅地址</strong>
                                                        <div class="font-size-sm text-muted mt-2"> </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col">
                                                    {include file='include/index/sub_button.tpl'}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                        {else}
                        <div class="d-flex flex-column-fluid">
                            <div class="container">
                                <div id="index-alert">
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <h3 class="animated tada mt-5 text-center" style="color:#191d21;font-size: 2rem;">👋
                                                    Hi, {$user->user_name}</h3>
                                                <h5 class="mb-5 mt-2 text-center"
                                                    style="color:#191d21d5">按照下面步骤开始使用吧!</h5>
                                                <div class="row mt-4">
                                                    <div class="col-12 col-lg-8 offset-lg-2">
                                                        <div class="wizard-steps">
                                                            <div class="wizard-step wizard-step-active"
                                                                 onclick="location='/user/shop'">
                                                                <div class="wizard-step-icon">
                                                                    <i class="fas fa-shopping-cart" style="color: #fff;"></i>
                                                                </div>
                                                                <div class="wizard-step-label">
                                                                    前往商店购买会员订阅计划或免费试用
                                                                </div>
                                                            </div>
                                                            <div class="wizard-step wizard-step-active"
                                                                 onclick="location='/user/help'">
                                                                <div class="wizard-step-icon">
                                                                    <i class="fas fa-download" style="color: #fff;"></i>
                                                                </div>
                                                                <div class="wizard-step-label">
                                                                    下载客户端并按照教程安装
                                                                </div>
                                                            </div>
                                                            <div class="wizard-step wizard-step-success">
                                                                <div class="wizard-step-icon">
                                                                    <i class="fas fa-grin-squint" style="color: #fff;"></i>
                                                                </div>
                                                                <div class="wizard-step-label">
                                                                    开开心心看世界
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </section>
                            </div>
                        </div>
                    {/if}
                    </div>
                    {include file='include/global/footer.tpl'}
                </div>
            </div>
        </div>

<div class="modal fade" id="qrcode-sublink-modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="qrcode-sublink-modal-title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content shadow-lg">
            <div class="modal-header">
                <h4 class="modal-title {$style[$theme_style]['modal']['text_title']}" id="qrcode-sublink-modal-title"><strong>扫码二维码添加订阅</strong></h4>
            </div>
            <div class="modal-body" id="qrcode-sublink-content">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

{if $ann->content_exp}
<div class="modal fade" id="fullann" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content shadow-lg">
            <div class="modal-header">
                <h4 class="modal-title {$style[$theme_style]['modal']['text_title']}" id="fullann-modal-title"><strong>最新公告详情</strong></h4>
            </div>
            <div class="modal-body" id="fullann-modal-content">
                <div class="text-dark-50 font-weight-normal font-size-lg-h4 font-size-h5">
                {$ann->content}
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
{/if}

{if $metron['advanceResetFlow'] === true}
<div class="modal fade" id="advanceResetFlow-modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="advanceResetFlow-modal-title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content shadow-lg">
            <div class="modal-header">
                <h4 class="modal-title {$style[$theme_style]['modal']['text_title']}" id="advanceResetFlow-modal-title"><strong>流量重置确认</strong></h4>
            </div>
            <div class="modal-body">
                <label class="row col-12 col-form-label kt-font-boldest" >您的套餐重置日期为：<code>{$user->valid_use_loop()} 00:00 </code> </label>
                <label class="row col-12 col-form-label kt-font-boldest" id="ResetFlow_day"></label>
                <div class="kt-divider mt-4 mb-4"><span></span><span>根据距离下次重置的日期按比例为您重置流量</span><span></span></div>
                <label class="row col-12 col-form-label kt-font-boldest" id="ResetFlow_sub_time_day"></label>
                <label class="row col-12 col-form-label kt-font-boldest" id="ResetFlow_add_flow_gib"></label>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="advanceResetFlow-modal-ok" onclick="index.advanceResetFlow('set');">确定</button>
                <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold" data-dismiss="modal" onclick="">取消</button>
            </div>
        </div>
    </div>
</div>
{/if}

        {include file='include/global/scripts.tpl'}
        {include file='include/global/import_sublink.tpl'}

        {if $metron['enable_pop'] === true}
        <!-- 重要公告 -->
        {include file='include/index/pop.tpl'}
        <script> mt.pop('{$metron['pop_time']}') </script>
        {/if}

        <script>
            jQuery(document).ready(function() {
                index.flowTiaoChart('{$user->unusedTrafficPercent()}');
            });
        </script>

        <script>
            {if $user->class > 0 && substr($user->unusedTraffic(),0,-2) > 0 && ((substr($user->unusedTraffic(),0,-2) <= 5 && substr($user->unusedTraffic(),-2) == 'GB') || (substr($user->unusedTraffic(),0,-2) <= 1024 && substr($user->unusedTraffic(),-2) == 'MB'))}
            $('#index-alert').append('\
                <div class="alert alert-custom alert-white alert-shadow fade mb-8 show {$metron['style_shadow']}" role="alert">\
                    <div class="alert-icon">\
                        <i class="flaticon-warning"></i>\
                    </div>\
                    <div class="alert-text"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">您的流量已不足 5GB, 请注意使用! </font></font></div>\
                </div>\
            ');
            {/if}
            {if $user->class === -1}
            $('#index-alert').append('\
                <div class="alert alert-custom alert-danger alert-shadow fade mb-8 show {$metron['style_shadow']}" role="alert">\
                    <div class="alert-icon">\
                        <i class="flaticon-warning"></i>\
                    </div>\
                    <div class="alert-text"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">您的账号还未激活, 请前往商店购买套餐进行激活账号! </font></font></div>\
                </div>\
            ');
            {/if}
        </script>

    </body>
</html>
