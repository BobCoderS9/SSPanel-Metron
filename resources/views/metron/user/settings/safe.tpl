<!DOCTYPE html>
<html lang="en">
    <head>
        <title>安全设置 &mdash; {$config["appName"]}</title>
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
                                        <h2 class="text-white font-weight-bold my-2 mr-5">安全设置</h2>
                                    </div>
                                </div>
                                {include file='include/settings/menu.tpl'}
                                    
                                    <div class="flex-row-fluid ml-lg-8">
                                        <div class="card card-custom {$metron['style_shadow']}">
                                            <div class="card-header py-3">
                                                <div class="card-title align-items-start flex-column">
                                                    <h3 class="card-label font-weight-bolder text-primary">资料编辑</h3>
                                                    <span class="text-muted font-weight-bold font-size-sm mt-1">更新您的个人资料信息</span>
                                                </div>
                                                <div class="card-toolbar">
                                                    <button type="reset" class="btn btn-success mr-2" id="safe_save_submit">保存更改</button>
                                                </div>
                                            </div>
                                            <form class="form" id="safe_form">
                                                <div class="card-body">

                                                    <div class="row">
                                                        <label class="col-3 col-xl-3"></label>
                                                        <div class="col-9 col-lg-9 col-xl-6">
                                                            <h5 class="font-weight-bold mb-6">登录密码</h5>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-3 col-xl-3 col-lg-3 col-form-label text-right">旧密码</label>
                                                        <div class="col-9 col-md-6 col-lg-9 col-xl-6">
                                                            <div class="input-group input-group-lg input-group-solid">
                                                                <input class="form-control" type="password" value="" name="old_passwd" oldvalue="" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-3 col-xl-3 col-lg-3 col-form-label text-right">新密码</label>
                                                        <div class="col-9 col-md-6 col-lg-9 col-xl-6">
                                                            <div class="input-group input-group-lg input-group-solid">
                                                                <input class="form-control" type="password" value="" name="new_passwd" oldvalue="" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-3 col-xl-3 col-lg-3 col-form-label text-right">确认密码</label>
                                                        <div class="col-9 col-md-6 col-lg-9 col-xl-6">
                                                            <div class="input-group input-group-lg input-group-solid">
                                                                <input class="form-control" type="password" value="" name="ret_passwd" oldvalue="" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <label class="col-3 col-xl-3"></label>
                                                        <div class="col-9 col-md-6 col-lg-9 col-xl-6">
                                                            <h5 class="font-weight-bold mt-10 mb-6">账户安全</h5>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-3 col-xl-3 col-lg-3 col-form-label text-right">二步验证</label>
                                                        <div class="col-9 col-md-6 col-lg-9 col-xl-6">
                                                            {if $user->ga_enable==1}
                                                            <button type="button" class="btn btn-primary font-weight-bold btn-sm" data-toggle="modal" data-target="#step2-false-modal">关闭验证</button>
                                                            {else}
                                                            <button type="button" class="btn btn-primary font-weight-bold btn-sm" data-toggle="modal" data-target="#step2-modal">启用验证</button>
                                                            {/if}
                                                            <p class="form-text text-muted pt-2">登录账号时要求验证动态码, 以确认您的身份并保护您的帐户免遭破坏</p>
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-3 col-xl-3 col-lg-3 col-form-label text-right"> </label>
                                                        <div class="col-9 col-md-6 col-lg-9 col-xl-6">
                                                            <button type="button" class="btn btn-danger font-weight-bold btn-sm" data-toggle="modal" data-target="#delete-account-modal">删除账号 !</button>
                                                            <p class="form-text text-muted pt-2">永久注销清除该账户所有信息 !</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
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

<!-- 二步验证 modal -->
<div class="modal fade" id="step2-modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong>启用二步验证</strong></h5>
            </div>
            <div class="modal-body text-center">
                <code>请使用二步验证APP扫描二维码</code><br />
                <code>推荐使用 Google Authenticator</code>
                <div class="pt-6 pb-2" id="ga-qr" safe-url="{$user->getGAurl()}"></div>
                <p>密钥：{$user->ga_token}</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" href="#step2-2-modal">下一步</button>
                <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="step2-2-modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong>验证动态码</strong></h5>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>确认动态码</label>
                    <input class="form-control" type="number" id="ga-code" name="ga-code">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="ga-enable-true" onclick="setting.safe('step2', true);">保存更改</button>
                <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="step2-false-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong>关闭二步验证</strong></h5>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <code>关闭二步验证后，登录账号不再验证动态码，您的账号安全性将下降。</code>
                </div>
                <div class="form-group mt-3">
                    <label>账户登录密码</label>
                    <div class="input-group">
                        <input class="form-control" type="password" id="ga-passwd" name="ga_passwd">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="ga-enable-false" onclick="setting.safe('step2', false);">保存更改</button>
                <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- 删除账号 modal -->
<div class="modal fade" id="delete-account-modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong>删除账号</strong></h5>
            </div>
            <form class="kt-form" id="user_profile_delete_account">
            <div class="modal-body">
                <p class="text-danger">注意：您的所有数据都会被永久删除，并且无法找回。</p>
                <p class="text-danger">请谨慎操作！请谨慎操作！请谨慎操作！</p>
                <div class="form-group">
                    <label>账户登录密码</label>
                    <div class="input-group">
                        <input class="form-control" type="password" id="delete_passwd" name="delete_passwd">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" id="kill" onclick="setting.safe('kill', true);">确定删除</button>
                <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold" data-dismiss="modal">关闭</button>
            </div>
            </form>
        </div>
    </div>
</div>

    </body>
</html>