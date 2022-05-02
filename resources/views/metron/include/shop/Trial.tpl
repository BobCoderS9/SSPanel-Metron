<div class="col-xs-6 col-sm-6 col-md-6 col-lg-4 col-xl-4 col-xxl-3">
    <div class="card card-custom {$style[$theme_style]['shop']['card_head']} gutter-b card-stretch {$metron['style_shadow']}"
         style="border-bottom-right-radius: 1.5rem;border-bottom-left-radius: 1.5rem;">
        <div class="card-header border-0" style="min-height: 50px;">
        </div>
        <div class="card-body d-flex flex-column p-0" style="position: relative;">
            <div class="" style="height: 100px; min-height: 100px;">
                <h3 class="display-3 text-white text-center"><strong>试用计划</strong></h3>
            </div>
            <div class="card-spacer {$style[$theme_style]['shop']['card_bg']} card-rounded flex-grow-1 {$metron['style_shadow']}">

                <ul class="dashboard-tabs nav nav-pills row nav-primary row-paddingless m-0 p-0" role="tablist">
                    {foreach $metron['shop_Experience_plan'] as $exp_name => $exp_id}
                        <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 ml-1 mr-1 mb-0 cursor_onclick">
                            <a class="nav-link border d-flex flex-grow-1 rounded flex-column align-items-center p-1 {if $exp_id@index === 0} active{/if}"
                               data-toggle="pill" href="#tab-shop-{$exp_id}">
                                <span class="nav-text font-size-lg py-2 font-weight-bold text-center">{$exp_name}</span>
                            </a>
                        </li>
                    {/foreach}
                </ul>

                <div class="tab-content m-0 p-0">
                    {foreach $metron['shop_Experience_plan'] as $exp_name => $exp_id}
                        <div class="tab-pane {if $exp_id@index === 0} active show{/if}" id="tab-shop-{$exp_id}"
                             role="tabpanel">
                            {foreach $shops as $shop}
                                {if $shop->id !== $exp_id}{continue}{/if}
                                <div class="row">
                                    <div class="col pl-6 pt-6 pb-0">
                                        <div class="display-3 text-primary font-weight-bolder"><small><i
                                                        class="fa fa-yen-sign text-primary"></i></small>
                                            <strong>{$shop->price}</strong></div>
                                    </div>
                                </div>
                                {$shopLt = $shop->limitamount()}
                                {$shopBi = $shop->limitamount('bi')}
                                {$shopCan = $shop->limitamount('can')}
                                <div class="d-flex flex-column w-100 pl-2 pt-3">
																<span class="font-size-sm text-muted font-weight-bold pb-3">
																	{if $shopLt == 0}此商品无限制购买{else}<span
                                                                            class="{if $shopBi < 5}text-danger{else}text-primary{/if}">{if $shopCan === 0}此商品已售空, 可尝试购买其它时长{else}此商品限购剩余 {$shopCan} 份{/if}{/if}</span>
																</span>
                                    <div class="progress progress-md w-100">
                                        <div class="progress-bar progress-bar-striped {if $shopBi < 5}bg-danger{else}bg-primary{/if}"
                                             role="progressbar" style="width: {$shopBi}%;" aria-valuenow="{$shopBi}"
                                             aria-valuemin="0" aria-valuemax="100">
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
                                <div class="row text-center">
                                    <div class="col pl-6 pt-4 pb-0">
                                        <div class="font-size-h4 font-weight-bolder text-dark-75">描述</div>
                                    </div>
                                </div>
                                {if $shop_info !== ''}
                                    <div class="row text-center">
                                        <div class="col pl-6 pt-4 pb-0">
                                            <div class="font-size-h4 font-weight-bolder {$style[$theme_style]['shop']['card_text']}">{$shop_info}</div>
                                        </div>
                                    </div>
                                {/if}
                                {foreach $shop->content_extra() as $service}
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
                                                onClick="shop.metronBuy('{$shop->id}',{$shop->auto_renew});"
                                                id="buytext-{$shop->id}" disabled="true">此商品已达到购买上限
                                        </button>
                                    {else}
                                        <button class="btn {$style[$theme_style]['shop']['card_btn']} btn-block btn-pill"
                                                href="javascript:void(0);" type="button"
                                                onClick="shop.metronBuy('{$shop->id}',{$shop->auto_renew});"
                                                id="buytext-{$shop->id}">购买
                                        </button>
                                    {/if}
                                </div>
                            {/foreach}
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
