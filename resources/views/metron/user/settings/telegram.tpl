<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Telegram设置 &mdash; {$config["appName"]}</title>
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
                                        <h2 class="text-white font-weight-bold my-2 mr-5">Telegram设置</h2>
                                    </div>
                                </div>
                                {include file='include/settings/menu.tpl'}
                                    
                                    <div class="flex-row-fluid ml-lg-8">
                                        <div class="card card-custom {$metron['style_shadow']}">
                                            <div class="card-header py-3">
                                                <div class="card-title align-items-start flex-column">
                                                    <h3 class="card-label font-weight-bolder text-primary">Telgegram 设置</h3>
                                                    <span class="text-muted font-weight-bold font-size-sm mt-1">更新您的Telegram信息</span>
                                                </div>
                                                <div class="card-toolbar">
                                                    
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <label class="col-3 col-xl-3"></label>
                                                    <div class="col-9 col-lg-9 col-xl-6">
                                                        <h5 class="font-weight-bold mb-6">Telegram 信息</h5>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-3 col-xl-3 col-lg-3 col-form-label text-right">当前绑定</label>
                                                    <div class="col-9 col-md-6 col-lg-9 col-xl-6">
                                                        <p class="pt-3">{if $user->telegram_id == 0}未绑定账号{else}<a href="https://t.me/{$user->im_value}" target="blank"> @{$user->im_value}</a>{/if}</p>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-3 col-xl-3 col-lg-3 col-form-label text-right"> </label>
                                                    <div class="col-9 col-md-6 col-lg-9 col-xl-6">
                                                        {if $user->telegram_id == 0}
                                                        <button type="button" class="btn btn-primary font-weight-bold btn-sm" data-toggle="modal" data-target="#bind-telegram-modal">开始绑定</button>
                                                        <p class="form-text text-muted pt-2">Telegram 需要通过代理才可访问</p>
                                                        {else}
                                                        <button type="button" class="btn btn-danger font-weight-bold btn-sm" onclick="setting.telegram('unbind');">解除绑定</button>
                                                        <p class="form-text text-muted pt-2">解除绑定后, 该 Telegram 账号将被移除对应群组并封禁</p>
                                                        {/if}
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-3 col-xl-3 col-lg-3 col-form-label text-right">群组链接</label>
                                                    <div class="col-9 col-md-6 col-lg-9 col-xl-6">
                                                        {if $user->telegram_id == 0}
                                                        <button type="button" class="btn btn-primary font-weight-bold btn-sm disabled" disabled="disabled">请先绑定账号</button>
                                                        {else}
                                                        <a href="{$config['telegram_group_link']}" target="_blank" class="btn btn-primary font-weight-bold btn-sm">加入群组</a>
                                                        <p class="form-text text-muted pt-2">如果无法加入群组请与 <a href="https://t.me/{$telegram_bot}" target="_blank">@{$telegram_bot}</a> 申请群组解封</p>
                                                        {/if}
                                                    </div>
                                                </div>
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

<div class="modal fade" id="bind-telegram-modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong>绑定 Telegram 账号</strong></h5>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <a href="https://t.me/{$telegram_bot}?start={$bind_token}" target="_blank" class="btn btn-primary font-weight-bold btn-sm"><i class="fab fa-telegram-plane"></i>一键绑定 Telegram</a>
                </div>
                <p class="font-size-h5 pt-5">一键绑定过程中如遇到问题, 可尝试手动绑定：</p>
                <span class="kt-font-bolder">1. 在 Telegram 添加机器人账号 <a href="https://t.me/{$telegram_bot}" target="_blank">@{$telegram_bot}</a></span><br>
                <span class="kt-font-bolder pt-2">2. 发送命令 <code class="cursor_onclick copy-modal" data-clipboard-text="/start {$bind_token}">/start {$bind_token}</code> (点击复制) 给机器人</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="window.location.reload();">我已绑定</button>
                <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

    </body>
</html>