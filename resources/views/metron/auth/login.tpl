<!DOCTYPE html>
<html lang="en">
    <head>
        <title>登录 &mdash; {$config["appName"]}</title>
        {include file='include/auth/head.tpl'}

                        <div class="login-signin">
                            <div class="mb-10">
                                <h3>登录用户中心</h3>
                            </div>
                            <form class="form" id="login_form">
                                <div id="login_form_1">
                                    <div class="form-group mt-5">
                                        <input class="form-control h-auto text-white placeholder-white opacity-70 bg-dark-o-70 rounded-pill border-0 py-4 px-8" type="text" placeholder="邮箱地址" name="email" id="email" autocomplete="new-password" required />
                                    </div>
                                    <div class="form-group mt-5">
                                        <input class="form-control h-auto text-white placeholder-white opacity-70 bg-dark-o-70 rounded-pill border-0 py-4 px-8" type="password" placeholder="密码" name="password" id="password" autocomplete="new-password" required/>
                                    </div>
                                </div>
                                <div id="login_form_2" style="display: none;">
                                    <div class="form-group mt-5">
                                        <input class="form-control h-auto text-white placeholder-white opacity-70 bg-dark-o-70 rounded-pill border-0 py-4 px-8" type="number" placeholder="二步验证动态码" name="code_2fa" id="2fa-code" autocomplete="new-password" />
                                        <a href="JavaScript:;" id="reset_acc" class="text-white font-weight-bold">返回输入账号</a>
                                    </div>
                                </div>
                                {if $geetest_html != null}
                                <div class="form-group">
                                    <div class="embed-captcha"></div>
                                </div>
                                {/if}
                                {if $recaptcha_sitekey != null}
                                    <div class="form-group">
                                    <div class="g-recaptcha" data-sitekey="{$recaptcha_sitekey}"></div>
                                    </div>
                                {/if}
                                <div class="form-group d-flex flex-wrap justify-content-between align-items-center px-8">
                                    <label class="checkbox checkbox-outline checkbox-white text-white m-0">
                                        <input type="checkbox" name="remember" id="remember-me" checked="checked"/>记住我
                                        <span></span>
                                    </label>
                                    <a href="/password/reset" class="text-white font-weight-bold">忘记密码 ?</a>
                                </div>
                                <div class="form-group text-center mt-10" style="white-space:nowrap;">
                                    <button type="button" id="login_submit" class="btn btn-pill btn-outline-white font-weight-bold opacity-90 px-15 py-3">登录</button>
                                    <span class="m-3">或</span>
                                    <a class="btn btn-pill btn-outline-white font-weight-bold opacity-90 px-15 py-3" data-toggle="modal" data-target="#telegram-login-modal">使用 Telegram 登录</a>
                                </div>
                            </form>
                            <div class="mt-10">
                                <span class="opacity-70 mr-4">还没有账号 ?</span>
                                <a href="/auth/register" class="text-white font-weight-bold">立即注册</a>
                            </div>
                        </div>

                        <div class="modal fade" id="telegram-login-modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content shadow-lg">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-primary"><strong>Telegram 一键登录</strong></h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="text-center mt-4" id="telegram-login-box">
                                        </div>
                                        <div class="text-center mt-4 mb-3">
                                            <div class="text-job text-muted">或者添加机器人账号 <a href="https://t.me/{$telegram_bot}"  target="_blank">@{$telegram_bot}</a>，发送下面的数字给它
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <h1><code id="code_number" style="color: #6777ef">{$login_number}</code></h1>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">取消</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        {include file='include/auth/scripts.tpl'}
    </body>
</html>