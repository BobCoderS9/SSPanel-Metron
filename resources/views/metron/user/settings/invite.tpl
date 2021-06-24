<!DOCTYPE html>
<html lang="en">
    <head>
        <title>邀请注册 &mdash; {$config["appName"]}</title>
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
                                        <h2 class="text-white font-weight-bold my-2 mr-5">邀请注册</h2>
                                    </div>
                                </div>
                                {include file='include/settings/menu.tpl'}

                                    <div class="flex-row-fluid ml-lg-8">
                                        <div class="row">
                                            <div class="col-md-5 col-lg-12 col-xl-5">
                                                <div class="card card-custom bgi-no-repeat gutter-b {$metron['style_shadow']}" style="min-height: 250px; background-position: calc(100% + 0.5rem) calc(100% + 0.5rem); background-size: 100% auto; background-image: url({$metron['assets_url']}/media/svg/patterns/rhone-2.svg)">
                                                    <div class="card-body">
                                                        <div class="p-4">
                                                            <h3 class="{$style[$theme_style]['global']['title']} font-weight-bolder">返利余额</h3>
                                                            <p class="{$style[$theme_style]['global']['title']} display-3 display1-lg pb-2" style="padding-top: 10px; padding-bottom: 10px"><span class="display-4"><strong>¥</strong> </span><strong>{$user->back_money}</strong></p>
                                                            <div class="pb-5">
                                                                <a href="Javascript:;" class="btn btn-danger font-weight-bold px-6 py-3" data-toggle="modal" data-target="#take_money_modal">提现</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card card-custom bgi-no-repeat gutter-b {$metron['style_shadow']}" style="min-height: 400px; background-position: right top; background-size: 30% auto; background-image: url({$metron['assets_url']}/media/svg/shapes/abstract-3.svg)">
                                                    <div class="card-header border-0 pt-5">
                                                        <div class="card-title font-weight-bolder">
                                                            <div class="card-label text-primary font-weight-bold font-size-h3">
                                                                <strong>&nbsp;&nbsp;邀请功能</strong>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-body pt-1">
                                                        <ul class="dashboard-tabs nav nav-pills row nav-primary row-paddingless m-0 p-0" role="tablist">
                                                            <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                                                <a class="nav-link border d-flex flex-grow-1 rounded flex-column align-items-center active" data-toggle="pill" href="#tab_invite_item">
                                                                    <span class="nav-text font-size-lg py-2 font-weight-bold text-center">详情</span>
                                                                </a>
                                                            </li>
                                                            <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                                                <a class="nav-link border d-flex flex-grow-1 rounded flex-column align-items-center" data-toggle="pill" href="#tab_invite_setting">
                                                                    <span class="nav-text font-size-lg py-2 font-weight-bold text-center">设置</span>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                        <div class="separator separator-dashed separator-border-4 p-5"></div>
                                                        <div class="tab-content m-0 p-0">
                                                            <div class="tab-pane active" id="tab_invite_item" role="tabpanel">
                                                                <div class="card-body pb-0 pl-0">
                                                                    <div class="h2"><strong>当您邀请朋友注册时</strong></div>
                                                                    {if $user->rebate != 0}
                                                                        <div class="h5 pt-1">您将获取对方<code>{if $user->c_rebate == 1 || $metron['c_rebate'] == true}每次{else}首次{/if}</code>充值金额的 <code>{if $user->rebate > 0}{$user->rebate}%{else}{$config["code_payback"]}%{/if}</code> 返利</div>
                                                                    {/if}
                                                                    {if $config['invite_gift'] > 0}
                                                                        <div class="h5 pt-1">您将一次性获得 <code>{$config["invite_gift"]}GB</code> 流量奖励</div>
                                                                    {/if}
                                                                    {if $config['invite_get_money'] > 0}
                                                                        <div class="h5 pt-1">TA将获得 <code>{$config["invite_get_money"]}</code> 元奖励作为初始资金</div>
                                                                    {/if}
                                                                    <div class="h6 pt-3" style="font-size: 0.8em">剩余 &nbsp;<code>{$user->invite_num}</code>&nbsp; 次邀请次数</div>
                                                                    <div class="pt-2">
                                                                        <button type="button" class="btn btn-primary btn-shadow btn-lg copy-text" data-clipboard-text="{$config["baseUrl"]}/auth/register?code={$code->code}">复制邀请链接</button>
                                                                        <button type="button" class="btn btn-primary btn-shadow btn-lg copy-text" data-clipboard-text="{$code->code}">复制邀请码</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="tab-pane" id="tab_invite_setting" role="tabpanel">
                                                                <div class="card-body pb-0">
                                                                    <div class="pb-5">
                                                                        <button class="btn btn-primary"  data-toggle="modal" id="reset-link" onclick="setting.invite('reset');">重置邀请码/链接</button>
                                                                    </div>
                                                                    {if $config['invite_price']>=0 && $user->invite_num >= 0}
                                                                    <div class="form-group" id="pay_code_form">
                                                                        <label>购买邀请次数  {$config['invite_price']}元/次</label>
                                                                        <div class="input-group input-group-solid">
                                                                            <input type="number" class="form-control" placeholder="输入次数" id="buy-invite-num"/>
                                                                            <div class="input-group-append">
                                                                                <button class="btn btn-primary" type="button" onclick="setting.invite('buynum');">购买</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    {/if}
                                                                    {if $config['custom_invite_price']>=0}
                                                                    <div class="form-group" id="pay_code_form">
                                                                        <label>定制邀请码  {$config['custom_invite_price']}元/次</label>
                                                                        <div class="input-group input-group-solid">
                                                                            <input type="text" class="form-control" placeholder="输入邀请码" id="custom-invite-link"/>
                                                                            <div class="input-group-append">
                                                                                <button class="btn btn-primary" type="button" onclick="setting.invite('custom');">确认</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    {/if}
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-7 col-lg-12 col-xl-7">
                                                <div class="card card-custom gutter-b card-stretch {$metron['style_shadow']}">
                                                    <div class="card-header flex-wrap border-0 pt-6">
                                                        <div class="card-title">
                                                            <h3 class="card-label text-primary"><strong>返利记录</strong>
                                                            <span class="d-block text-muted pt-2 font-size-sm">邀请用户给您带来的返利记录</span></h3>
                                                        </div>
                                                    </div>
                                                    <div class="card-body pt-0">
                                                        <div class="datatable datatable-bordered datatable-head-custom" id="ajax_invite_back_data"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        {if $metron['invite_user'] === true}
                                        {if $metron['invite_user_for'] !== true || $metron['invite_user_for'] === true && $user->c_rebate === 1}
                                        <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                            <div class="card-header flex-wrap border-0 pt-6">
                                                <div class="card-title">
                                                    <h3 class="card-label text-primary"><strong>邀请用户记录</strong>
                                                    <span class="d-block text-muted pt-2 font-size-sm">您邀请的所有用户列表</span></h3>
                                                </div>
                                            </div>
                                            <div class="card-body pt-0">
                                                <div class="mb-7">
                                                    <div class="row align-items-center">
                                                        <div class="col-lg-9 col-xl-8">
                                                            <div class="row align-items-center">
                                                                <div class="col-md-4 my-2 my-md-0">
                                                                    <div class="d-flex align-items-center">
                                                                        <label class="mr-3 mb-0 d-none d-md-block">状态:</label>
                                                                        <select class="form-control" id="invite_user_status">
                                                                            <option value="">全部</option>
                                                                            <option value="1">有充值的用户</option>
                                                                            <option value="0">无充值的用户</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="datatable datatable-bordered datatable-head-custom" id="ajax_invite_user_data"></div>
                                            </div>
                                        </div>
                                        {/if}
                                        {/if}

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                    {include file='include/global/footer.tpl'}
                </div>
            </div>
        </div>

<div class="modal fade" id="take_money_modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong>提现申请</strong></h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="col-form-label text-lg-right text-left">输入金额：</label>
                    <div class="input-group input-group-solid">
                        <input type="number" class="form-control" placeholder="输入要提取的金额" name="take_money"/>
                    </div>
                </div>
                <label class="col-form-label text-lg-right text-left">提取方式：</label>
                <ul class="dashboard-tabs nav nav-pills row nav-primary row-paddingless m-0 p-0" role="tablist">
                    <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                        <a class="nav-link border py-5 d-flex flex-grow-1 rounded flex-column align-items-center active" data-toggle="pill" data-metron="1">
                            <span class="nav-icon py-2 w-auto">
                                <i class="fab fas fa-wallet icon-2x"></i>
                            </span>
                            <span class="nav-text font-size-lg py-2 font-weight-bold text-center">转到余额<br/>
                            <small>0 元 起提</small></span>
                        </a>
                    </li>
                    {if $metron['take_cash_enable'] === true}
                    <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                        <a class="nav-link border py-5 d-flex flex-grow-1 rounded flex-column align-items-center" data-toggle="pill" data-metron="2">
                            <span class="nav-icon py-2 w-auto">
                                <i class="fab fas fa-people-arrows icon-2x"></i>
                            </span>
                            <span class="nav-text font-size-lg py-2 font-weight-bold text-center">申请提现<br />
                            <small>{$metron['take_back_total']} 元 起提</small></span>
                        </a>
                    </li>
                    {/if}
                </ul>
            </div>
            <div class="modal-footer">
                {if $metron['take_cash_enable'] === true}
                <a href="Javascript:;" class="btn btn-danger" data-toggle="modal" data-target="#agent_setting_modal">提现账号设置</a>
                {/if}
                <button type="button" class="btn btn-primary" type="button" onclick="setting.take_total();">确认</button>
                <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

{if $metron['take_cash_enable'] === true}
<div class="modal fade" id="agent_setting_modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong>提现设置</strong></h4>
            </div>
            <div class="modal-body">
                <p class="text-danger">务必检查账号是否填写正确, 因账号设置错误导致没有到账, 本站概不负责! </p>
                <div class="form-group">
                    <label class="col-form-label text-lg-right text-left">账号类型：</label>
                    <select class="form-control" id="take_account_type" data-style="btn-primary">
                        {foreach $metron['take_account_type'] as $acctype}
                        <option value="{$acctype}" {if isset($user->config['take_account']) && $acctype == $user->config['take_account']['type']}selected="selected"{/if}>{$acctype}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="form-group">
                    <label class="col-form-label text-lg-right text-left">提现账号：</label>
                    <div class="input-group input-group-solid">
                        {if isset($user->config['take_account']) && $user->config['take_account']['acc']}
                        <input type="text" class="form-control" placeholder="输入提现账号" value="{$user->config['take_account']['acc']}" name="take_account_value"/>
                        {else}
                        <input type="text" class="form-control" placeholder="输入提现账号" value="" name="take_account_value"/>
                        {/if}
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary buyTrafficPackage" type="button" onclick="setting.take_account_setting();">确认</button>
                <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
{/if}

        {include file='include/global/scripts.tpl'}
    </body>
</html>
