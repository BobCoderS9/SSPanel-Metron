<!DOCTYPE html>
<html lang="en">
<head>
    <title>套餐商店 &mdash; {$config["appName"]}</title>
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
                                    <h2 class="text-white font-weight-bold my-2 mr-5">套餐商店</h2>
                                </div>
                            </div>
                            <div class="d-flex align-items-center">
                                <a href="javascript:;"
                                   class="btn {$style[$theme_style]['global']['btn_subheader']} font-weight-bold py-3 px-6"
                                   data-toggle="modal" data-target="#traffic_package_modal">购买流量包</a>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex flex-column-fluid">
                        <div class="container">

                            <div class="row">

                                {if $metron['shop_pop_enable'] === true}
                                    <div class="col-12">
                                        <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                            <div class="card-body mt-4">
                                                {$metron['shop_pop_info']}
                                            </div>
                                        </div>
                                    </div>
                                {/if}

                                {if $metron['shop_activity_true'] === true && strtotime({$metron['shop_activity_buy_time']}) > time()}
                                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-4 col-xl-4 col-xxl-3">
                                        <div class="card card-custom {$style[$theme_style]['shop']['card_head']} gutter-b card-stretch {$metron['style_shadow']}"
                                             style="border-bottom-right-radius: 1.5rem;border-bottom-left-radius: 1.5rem;">
                                            <div class="card-header border-0" style="min-height: 50px;">
                                            </div>
                                            <div class="card-body d-flex flex-column p-0" style="position: relative;">
                                                <div class="" style="height: 100px; min-height: 100px;">
                                                    <h3 class="display-3 text-white text-center">
                                                        <strong>{$metron['shop_activity_name']}</strong></h3>
                                                </div>
                                                <div class="card-spacer {$style[$theme_style]['shop']['card_bg']} card-rounded flex-grow-1 {$metron['style_shadow']}">
                                                    <ul class="dashboard-tabs nav nav-pills row nav-primary row-paddingless m-0 p-0"
                                                        role="tablist">
                                                        <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 ml-1 mr-1 mb-0 cursor_onclick">
                                                            <a class="nav-link border d-flex flex-grow-1 rounded flex-column align-items-center p-1 active"
                                                               data-toggle="pill" href="#shop-activity">
                                                                <span class="nav-text font-size-lg py-2 font-weight-bold text-center">
                                                                    <span id="_t">倒计时：</span>
                                                                    <span id="_d"> </span>
                                                                    <span id="_h"> </span>
                                                                    <span id="_m"> </span>
                                                                    <span id="_s"> </span>
                                                                </span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content m-0 p-0">
                                                        <div class="tab-pane active show" id="shop-activity"
                                                             role="tabpanel">
                                                                <div class="row">
                                                                    <div class="col pl-6 pt-6 pb-0">
                                                                        <div class="display-3 text-primary font-weight-bolder">
                                                                            <small><i class="fa fa-yen-sign text-primary"></i></small>
                                                                            <strong>{$shop_activity->price}</strong></div>
                                                                    </div>
                                                                </div>
                                                                {$shopLt = $shop_activity->limitamount()}
                                                                {$shopBi = $shop_activity->limitamount('bi')}
                                                                {$shopCan = $shop_activity->limitamount('can')}
                                                                <div class="d-flex flex-column w-100 pl-2 pt-3">
                                                                <span class="font-size-sm text-muted font-weight-bold pb-3">
                                                                    {if $shopLt == 0}此商品无限制购买{else}<span
                                                                            class="{if $shopBi < 5}text-danger{else}text-primary{/if}">{if $shopCan === 0}此商品已售空, 可尝试购买其它时长{else}此商品限购剩余 {$shopCan} 份{/if}{/if}</span>
                                                                </span>
                                                                    <div class="progress progress-md w-100">
                                                                        <div class="progress-bar progress-bar-striped {if $shopBi < 5}bg-danger{else}bg-primary{/if}"
                                                                             role="progressbar"
                                                                             style="width: {$shopBi}%;"
                                                                             aria-valuenow="{$shopBi}" aria-valuemin="0"
                                                                             aria-valuemax="100">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row text-center {$style[$theme_style]['shop']['card_text']}">
                                                                    <div class="col pl-6 pt-6 pb-0">
                                                                        <div class="font-size-sm text-muted font-weight-bold">
                                                                            会员等级
                                                                        </div>
                                                                        <div class="font-size-h4 font-weight-bolder">{$metron['user_level'][$shop_activity->user_class()]}</div>
                                                                    </div>
                                                                    <div class="col pl-6 pt-6 pb-0">
                                                                        <div class="font-size-sm text-muted font-weight-bold">
                                                                            等级时长
                                                                        </div>
                                                                        <div class="font-size-h4 font-weight-bolder">{$shop_activity->class_expire()}
                                                                            天
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row text-center {$style[$theme_style]['shop']['card_text']}">
                                                                    <div class="col pl-6 pt-6 pb-0">
                                                                        <div class="font-size-sm text-muted font-weight-bold">
                                                                            添加流量
                                                                        </div>
                                                                        <div class="font-size-h4 font-weight-bolder">{$shop_activity->bandwidth()}
                                                                            GB
                                                                        </div>
                                                                    </div>
                                                                    <div class="col pl-6 pt-6 pb-0">
                                                                        <div class="font-size-sm text-muted font-weight-bold">
                                                                            重置周期
                                                                        </div>
                                                                        <div class="font-size-h4 font-weight-bolder">{if $shop_activity->reset()!=0}{$shop_activity->reset()}天重置{else}到期清零{/if}</div>
                                                                    </div>
                                                                </div>
                                                                <div class="row text-center {$style[$theme_style]['shop']['card_text']}">
                                                                    <div class="col pl-6 pt-6 pb-0">
                                                                        <div class="font-size-sm text-muted font-weight-bold">
                                                                            同时在线
                                                                        </div>
                                                                        <div class="font-size-h4 font-weight-bolder">{if {$shop_activity->connector()} == '0' }无限制{else}{$shop_activity->connector()}个设备{/if}</div>
                                                                    </div>
                                                                    <div class="col pl-6 pt-6 pb-0">
                                                                        <div class="font-size-sm text-muted font-weight-bold">
                                                                            峰值速率
                                                                        </div>
                                                                        <div class="font-size-h4 font-weight-bolder">{if {$shop_activity->speedlimit()} == '0' }无限制{else}{$shop_activity->speedlimit()}Mbps{/if}</div>
                                                                    </div>
                                                                </div>
                                                                {if $metron['shop_activity_text'] !== ''}
                                                                    <div class="row text-center">
                                                                        <div class="col pl-6 pt-4 pb-0">
                                                                            <div class="font-size-h4 font-weight-bolder {$style[$theme_style]['shop']['card_text']}">{$metron['shop_activity_text']}</div>
                                                                        </div>
                                                                    </div>
                                                                {/if}
                                                                {foreach $shop_activity->content_extra() as $service}
                                                                    <div class="row text-center">
                                                                        <div class="col pl-6 pt-4 pb-0">
                                                                            {if $service[0] === 'true'}
                                                                                <div class="font-size-h4 font-weight-bolder {$style[$theme_style]['shop']['card_text']}">{$service[1]}</div>
                                                                            {else}
                                                                                <div class="font-size-h4 font-weight-bolder text-dark-50">
                                                                                    <del>{$service[1]}</del>
                                                                                </div>
                                                                            {/if}
                                                                        </div>
                                                                    </div>
                                                                {/foreach}
                                                                <div class="pt-8">
                                                                    {if $shopLt != 0 && $shopCan <= 0}
                                                                        <button class="btn {$style[$theme_style]['shop']['card_btn']} btn-block btn-pill"
                                                                                href="javascript:void(0);" type="button"
                                                                                onClick="shop.metronBuy('{$shop_activity->id}',{$shop_activity->auto_renew});"
                                                                                id="buytext-{$shop_activity->id}"
                                                                                disabled="true">此商品已达到购买上限
                                                                        </button>
                                                                    {else}
                                                                        <button class="btn {$style[$theme_style]['shop']['card_btn']} btn-block btn-pill"
                                                                                href="javascript:void(0);" type="button"
                                                                                onClick="shop.metronBuy('{$shop_activity->id}',{$shop_activity->auto_renew});"
                                                                                id="buytext-{$shop_activity->id}">购买
                                                                        </button>
                                                                    {/if}
                                                                </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="resize-triggers">
                                                    <div class="expand-trigger">
                                                        <div style="width: 414px; height: 419px;"></div>
                                                    </div>
                                                    <div class="contract-trigger"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <script> var shop_activity_time = "{$metron['shop_activity_buy_time']}"; </script>
                                {/if}

                                {if $metron['shop_Experience_true'] === true && $user->class === -1 && $user->lastSsTime() == '从未使用喵' && $metron['shop_Experience_pos'] === 'top'}
                                    {include file='include/shop/Trial.tpl'}
                                {/if}

                                {foreach $shop_info as $shop_class_name => $shop_cate}
                                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-4 col-xl-4 col-xxl-3">
                                        <div class="card card-custom {$style[$theme_style]['shop']['card_head']} gutter-b card-stretch {$metron['style_shadow']}"
                                             style="border-bottom-right-radius: 1.5rem;border-bottom-left-radius: 1.5rem;">
                                            <div class="card-header border-0" style="min-height: 50px;">
                                            </div>
                                            <div class="card-body d-flex flex-column p-0" style="position: relative;">
                                                <div class="" style="height: 100px; min-height: 100px;">
                                                    <h3 class="display-3 text-white text-center"><strong>{$shop_class_name}</strong></h3>
                                                </div>
                                                <div class="card-spacer {$style[$theme_style]['shop']['card_bg']} card-rounded flex-grow-1 {$metron['style_shadow']}">
                                                    <ul class="dashboard-tabs nav nav-pills row nav-primary row-paddingless m-0 p-0" role="tablist">
                                                        {foreach $shop_cate as $key => $shop}
                                                            <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 ml-1 mr-1 mb-0 cursor_onclick">
                                                                <a class="nav-link border d-flex flex-grow-1 rounded flex-column align-items-center p-1 {if $shop@index === 0} active{/if}" data-toggle="pill" href="#tab-shop-{$shop->id}">
                                                                    <span class="nav-text font-size-lg py-2 font-weight-bold text-center">{$key}</span>
                                                                </a>
                                                            </li>
                                                        {/foreach}
                                                    </ul>
                                                    <div class="tab-content m-0 p-0">
                                                        {foreach $shop_cate as $key => $shop}
                                                        <div class="tab-pane {if $shop@index === 0} active {/if}" id="tab-shop-{$shop->id}" role="tabpanel">
                                                            <div class="row">
                                                                <div class="col pl-6 pt-6 pb-0">
                                                                    <div class="display-3 text-primary font-weight-bolder">
                                                                        <small><i class="fa fa-yen-sign text-primary"></i></small>
                                                                        <strong>{$shop->price}</strong></div>
                                                                </div>
                                                            </div>
                                                            {$shopLt = $shop->limitamount()}
                                                            {$shopBi = $shop->limitamount('bi')}
                                                            {$shopCan = $shop->limitamount('can')}
                                                            <div class="d-flex flex-column w-100 pl-2 pt-3">
                                                                <span class="font-size-sm text-muted font-weight-bold pb-3">
                                                                    {if $shopLt == 0}此商品无限制购买{else}<span class="{if $shopBi < 5}text-danger{else}text-primary{/if}">{if $shopCan === 0}此商品已售空, 可尝试购买其它时长{else}此商品限购剩余 {$shopCan} 份{/if}{/if}</span>
                                                                </span>
                                                                <div class="progress progress-md w-100">
                                                                    <div class="progress-bar progress-bar-striped {if $shopBi < 5}bg-danger{else}bg-primary{/if}" role="progressbar" style="width: {$shopBi}%;" aria-valuenow="{$shopBi}" aria-valuemin="0" aria-valuemax="100">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row text-center {$style[$theme_style]['shop']['card_text']}">
                                                                <div class="col pl-6 pt-6 pb-0">
                                                                    <div class="font-size-sm text-muted font-weight-bold">会员等级</div>
                                                                    <div class="font-size-h4 font-weight-bolder">{$metron['user_level'][$shop->user_class()]}</div>
                                                                </div>
                                                                <div class="col pl-6 pt-6 pb-0">
                                                                    <div class="font-size-sm text-muted font-weight-bold">等级时长</div>
                                                                    <div class="font-size-h4 font-weight-bolder">{$shop->class_expire()} 天</div>
                                                                </div>
                                                            </div>
                                                            <div class="row text-center {$style[$theme_style]['shop']['card_text']}">
                                                                <div class="col pl-6 pt-6 pb-0">
                                                                    <div class="font-size-sm text-muted font-weight-bold">添加流量</div>
                                                                    <div class="font-size-h4 font-weight-bolder">{$shop->bandwidth()} GB</div>
                                                                </div>
                                                                <div class="col pl-6 pt-6 pb-0">
                                                                    <div class="font-size-sm text-muted font-weight-bold">重置周期</div>
                                                                    <div class="font-size-h4 font-weight-bolder">{if $shop->reset()!=0}{$shop->reset()}天重置{else}到期清零{/if}</div>
                                                                </div>
                                                            </div>
                                                            <div class="row text-center {$style[$theme_style]['shop']['card_text']}">
                                                                <div class="col pl-6 pt-6 pb-0">
                                                                    <div class="font-size-sm text-muted font-weight-bold">同时在线</div>
                                                                    <div class="font-size-h4 font-weight-bolder">{if {$shop->connector()} == '0' }无限制{else}{$shop->connector()}个设备{/if}</div>
                                                                </div>
                                                                <div class="col pl-6 pt-6 pb-0">
                                                                    <div class="font-size-sm text-muted font-weight-bold">峰值速率</div>
                                                                    <div class="font-size-h4 font-weight-bolder">{if {$shop->speedlimit()} == '0' }无限制{else}{$shop->speedlimit()}Mbps{/if}</div>
                                                                </div>
                                                            </div>
                                                            {if $key !== ''}
                                                                <div class="row text-center">
                                                                    <div class="col pl-6 pt-4 pb-0">
                                                                        <div class="font-size-h4 font-weight-bolder {$style[$theme_style]['shop']['card_text']}">{$key}</div>
                                                                    </div>
                                                                </div>
                                                            {/if}
                                                            {foreach $shop->content_extra() as $service}
                                                                <div class="row text-center">
                                                                    <div class="col pl-6 pt-4 pb-0">
                                                                        {if $service[0] === 'true'}
                                                                            <div class="font-size-h4 font-weight-bolder {$style[$theme_style]['shop']['card_text']}">{$service[1]}</div>
                                                                        {else}
                                                                            <div class="font-size-h4 font-weight-bolder text-dark-50"><del>{$service[1]}</del></div>
                                                                        {/if}
                                                                    </div>
                                                                </div>
                                                            {/foreach}
                                                            <div class="pt-8">
                                                                {if $shopLt != 0 && $shopCan <= 0}
                                                                    <button class="btn {$style[$theme_style]['shop']['card_btn']} btn-block btn-pill" href="javascript:void(0);" type="button" onClick="shop.metronBuy('{$shop->id}',{$shop->auto_renew});" id="buytext-{$shop->id}" disabled="true">此商品已达到购买上限</button>
                                                                {else}
                                                                    <button class="btn {$style[$theme_style]['shop']['card_btn']} btn-block btn-pill" href="javascript:void(0);" type="button" onClick="shop.metronBuy('{$shop->id}',{$shop->auto_renew});" id="buytext-{$shop->id}">购买</button>
                                                                {/if}
                                                            </div>
                                                        </div>
                                                        {/foreach}
                                                    </div>
                                                </div>
                                                <div class="resize-triggers">
                                                    <div class="expand-trigger">
                                                        <div style="width: 414px; height: 419px;"></div>
                                                    </div>
                                                    <div class="contract-trigger"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}

                                {if $metron['shop_Experience_true'] === true && $user->class === -1 && $user->lastSsTime() == '从未使用喵' && $metron['shop_Experience_pos'] === 'bottom'}
                                    {include file='include/shop/Trial.tpl'}
                                {/if}

                            </div>

                        </div>
                    </div>
                </div>
                {include file='include/global/footer.tpl'}
            </div>
        </div>
    </div>
    {include file='include/global/scripts.tpl'}

    <!-- modal -->
    <div class="modal fade" id="buy_modal" data-backdrop="static" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content shadow-lg">
                <div class="modal-header">
                    <h4 class="modal-title {$style[$theme_style]['modal']['text_title']}" id="exampleModalLongTitle">
                        <strong>订单确认</strong></h4>
                </div>
                <div class="modal-body">
                    <label class="row col-12 col-form-label kt-font-boldest" id="shop_name">商品名称：</label>
                    <label class="row col-12 col-form-label kt-font-boldest" id="shop_credit" style="display: none">优惠额度：</label>
                    <label class="row col-12 col-form-label kt-font-boldest" id="shop_total">套餐金额：</label>
                    <label class="row col-12 col-form-label kt-font-boldest" id="shop_stneed">还需支付：</label>
                    <label class="row col-12 col-form-label kt-font-boldest kt-padding-b-0" id="autor"><span
                                class="kt-padding-t-5">到期时自动续费：</span>
                        <span class="kt-switch kt-switch--sm kt-switch--icon">
                    <label class="kt-padding-0">
                        <input type="checkbox" name="autorenew" id="autorenew">
                        <span></span>
                    </label>
                </span>
                    </label>
                    <div class="form-group row form-group-marginless" style="display: none" id="shop_payment">
                        <label class="col-lg-12 col-form-label kt-font-boldest">支付方式：</label>
                        <div class="col-lg-12">
                            <ul class="dashboard-tabs nav nav-pills row row-paddingless m-0 p-0" role="tablist"
                                id="pay_the">
                                {if $config['payment_system'] == 'metronpay'}
                                    {if $metron['pay_alipay'] != 'none' && $metron['pay_alipay'] != ''}
                                        <li class="nav-alipay nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                            <a class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center active"
                                               data-toggle="pill" data-name="pay_alipay">
                                    <span class="nav-icon py-2 w-auto">
                                        <i class="fab fa-alipay icon-2x"></i>
                                    </span>
                                                <span class="nav-text font-size-lg py-2 font-weight-bold text-center">支付宝</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if $metron['pay_alipay_2'] != 'none' && $metron['pay_alipay_2'] != ''}
                                        <li class="nav-alipay nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                            <a class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
                                               data-toggle="pill" data-name="pay_alipay_2">
                                    <span class="nav-icon py-2 w-auto">
                                        <i class="fab fa-alipay icon-2x"></i>
                                    </span>
                                                <span class="nav-text font-size-lg py-2 font-weight-bold text-center">支付宝</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if $metron['pay_alipay_3'] != 'none' && $metron['pay_alipay_3'] != ''}
                                        <li class="nav-alipay nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                            <a class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
                                               data-toggle="pill" data-name="pay_alipay_3">
                                    <span class="nav-icon py-2 w-auto">
                                        <i class="fab fa-alipay icon-2x"></i>
                                    </span>
                                                <span class="nav-text font-size-lg py-2 font-weight-bold text-center">支付宝</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if $metron['pay_wxpay'] != 'none' && $metron['pay_wxpay'] != ''}
                                        <li class="nav-wxpay nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                            <a class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
                                               data-toggle="pill" data-name="pay_wxpay">
                                    <span class="nav-icon py-2 w-auto">
                                        <i class="fab fa-weixin icon-2x"></i>
                                    </span>
                                                <span class="nav-text font-size-lg py-2 font-weight-bold text-center">微信支付</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if $metron['pay_wxpay_2'] != 'none' && $metron['pay_wxpay_2'] != ''}
                                        <li class="nav-wxpay nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                            <a class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
                                               data-toggle="pill" data-name="pay_wxpay_2">
                                    <span class="nav-icon py-2 w-auto">
                                        <i class="fab fa-weixin icon-2x"></i>
                                    </span>
                                                <span class="nav-text font-size-lg py-2 font-weight-bold text-center">微信支付</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if $metron['pay_wxpay_3'] != 'none' && $metron['pay_wxpay_3'] != ''}
                                        <li class="nav-wxpay nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                            <a class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
                                               data-toggle="pill" data-name="pay_wxpay_3">
                                    <span class="nav-icon py-2 w-auto">
                                        <i class="fab fa-weixin icon-2x"></i>
                                    </span>
                                                <span class="nav-text font-size-lg py-2 font-weight-bold text-center">微信支付</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if $metron['pay_qqpay'] != 'none' && $metron['pay_qqpay'] != ''}
                                        <li class="nav-qqpay nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                            <a class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center {if ($metron['pay_alipay'] == 'none' || $metron['pay_alipay'] == '') && ($metron['pay_wxpay'] == 'none' || $metron['pay_wxpay'] == '')}active{/if}"
                                               data-toggle="pill" data-name="pay_qqpay">
                                    <span class="nav-icon py-2 w-auto">
                                        <i class="fab fa-qq icon-2x"></i>
                                    </span>
                                                <span class="nav-text font-size-lg py-2 font-weight-bold text-center">QQ钱包</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if $metron['pay_crypto'] != 'none' && $metron['pay_crypto'] != ''}
                                        <li class="nav-crypto nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                            <a class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
                                               data-toggle="pill" data-name="pay_crypto">
                                    <span class="nav-icon py-2 w-auto">
                                        <i class="fab fa-bitcoin icon-2x"></i>
                                    </span>
                                                <span class="nav-text font-size-lg py-2 font-weight-bold text-center">数字货币</span>
                                            </a>
                                        </li>
                                    {/if}
                                {/if}
                            </ul>
                        </div>
                    </div>

                    <div class="pt-3" style="display: none" id="input_coupon_code">
                        <div class="input-group input-group-lg input-group-solid">
                            <input type="text" class="form-control" value="" name="shop_code" placeholder="请输入优惠码"
                                   id="coupon"/>
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button"
                                        onclick="shop.couponre('{$config['payment_system']}');">确定
                                </button>
                                <button class="btn btn-primary" type="button" onclick="shop.coupon('clear');">取消使用
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="use_coupon_code" onclick="shop.coupon();">
                        使用优惠码
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="order_input"
                            onclick="shop.buyok('{$config['payment_system']}');">确定购买
                    </button>
                    <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold"
                            data-dismiss="modal" onclick="shop.coupon('clear');">取消
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- 在线充值支付 -->
    <div class="modal fade" id="metronpay-modal" data-backdrop="static" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title {$style[$theme_style]['modal']['text_title']}" id="metronpay-title"><strong>支付确认</strong>
                    </h5>
                </div>
                <div class="modal-body kt-padding-t-30">
                    <p class="align-center pt-3" id="metronpay-modal-body-url" style="display: none;">点击打开新页面进行支付,
                        如果长时间未到账请联系客服</p>
                    <p id="metronpay-modal-body-qrcode" style="display: none;"></p>
                </div>
                <div class="modal-footer">
                    <a id="to-pay" href="##" class="btn btn-primary">前往支付</a>
                    <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold"
                            data-dismiss="modal">关闭
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- 流量包 -->
    <div class="modal fade" id="traffic_package_modal" data-backdrop="static" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title {$style[$theme_style]['modal']['text_title']}">
                        <strong>购买临时流量叠加包</strong></h4>
                </div>
                <div class="modal-body">
                    <code>流量叠加包在您套餐流量重置时会一起清零，请酌情购买</code>
                    <div class="pb-3"></div>
                    <ul class="dashboard-tabs nav nav-pills row nav-primary row-paddingless m-0 p-0" role="tablist"
                        id="traffic-package">
                        {foreach $shops as $traffic_shop}
                            {if $traffic_shop->traffic_package() != 0}
                                <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                    <a class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center {if $traffic_shop@index eq 1}active{/if}"
                                       data-toggle="pill" data-name="{$traffic_shop->id}">
                                        <span class="nav-text font-size-lg py-2 font-weight-bold text-center">¥ {$traffic_shop->price}</span>
                                        <span class="nav-text font-size-lg py-2 font-weight-bold text-center">{$traffic_shop->name}</span>
                                    </a>
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary buyTrafficPackage" type="button"
                            onclick="shop.buy_traffic();">购买
                    </button>
                    <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold"
                            data-dismiss="modal">取消
                    </button>
                </div>
            </div>
        </div>
    </div>

    </body>
</html>
