<!DOCTYPE html>
<html lang="en">
    <head>
        <title>登录 &mdash; {$config["appName"]}</title>
        {include file='include/auth/head.tpl'}

                        <div class="login-signin">
                            <div class="mb-10">
                                <h3>账号密码找回</h3>
                            </div>
                            <form class="form" id="reset_form">
                                <div class="form-group">
                                    <input class="form-control h-auto text-white placeholder-white opacity-70 bg-dark-o-70 rounded-pill border-0 py-4 px-8" type="text" placeholder="邮箱地址" name="email" id="email" autocomplete="new-password" required />
                                </div>
                                <div class="form-group text-center mt-10" style="white-space:nowrap;">
                                    <button type="button" id="reset_submit" class="btn btn-pill btn-outline-white btn-block font-weight-bold opacity-90 px-15 py-3">发送密码重置邮件</button>
                                </div>
                            </form>
                            <div class="mt-10">
                                <span class="opacity-70 mr-4">还没有账号 ?</span>
                                <a href="/auth/register" class="text-white font-weight-bold">立即注册</a>
                                <span class="mr-2 ml-2"> | </span>
                                <a href="/auth/login" class="text-white font-weight-bold">返回登录</a>
                            </div>
                        </div>

                        {include file='include/auth/scripts.tpl'}
    </body>
</html>