{include file='admin/main.tpl'}

<main class="content">
    <div class="content-header ui-content-header">
        <div class="container">
            <h1 class="content-heading">修改优惠码</h1>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-12 col-md-12">
            <section class="content-inner margin-top-no">
                <div class="card">
                    <div class="card-main">
                        <div class="card-inner">
                            <div class="form-group form-group-label">
                                <label class="floating-label" for="code">优惠码</label>
                                <input class="form-control maxwidth-edit" id="code" type="text"
                                       value="{$coupon->code}">
                                <p class="form-control-guide"><i class="material-icons">info</i>生成随机优惠码不填
                                </p>
                            </div>

                            <div class="form-group form-group-label">
                                <label class="floating-label" for="credit">优惠码额度</label>
                                <input class="form-control maxwidth-edit" id="credit" type="text"
                                       value="{$coupon->credit}">
                                <p class="form-control-guide"><i class="material-icons">info</i>百分比，九折就填 10
                                </p>
                            </div>

                            <div class="form-group form-group-label">
                                <label class="floating-label" for="expire">优惠码有效期</label>
                                <input class="form-control maxwidth-edit" id="expire" type="text"
                                       value="{$coupon->expire()}">
                            </div>

                            <div class="form-group form-group-label">
                                <label class="floating-label" for="shop">优惠码可用商品ID</label>
                                <input class="form-control maxwidth-edit" id="shop" type="text"
                                       value="{$coupon->shop}">
                                <p class="form-control-guide"><i class="material-icons">info</i>不填即为所有商品可用，多个的话用英文半角逗号分割
                                </p>
                            </div>

                            <div class="form-group form-group-label">
                                <label class="floating-label" for="shop">优惠码每个用户可用次数，-1为无限次</label>
                                <input class="form-control maxwidth-edit" id="onetime" type="number"
                                       value="{$coupon->onetime}">
                            </div>

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

                {include file='dialog.tpl'}

        </div>


    </div>
</main>


{include file='admin/footer.tpl'}

<script>
    window.addEventListener('load', () => {
        function submit() {
            $.ajax({
                type: "PUT",
                url: "/admin/coupon/{$coupon->id}",
                dataType: "json",
                data: {
                    code: $("#code").val(),
                    onetime: $("#onetime").val(),
                    expire: $("#expire").val(),
                    shop: $("#shop").val(),
                    credit: $("#credit").val(),
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
                error: (jqXHR) => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = `发生错误：` + jqXHR.status;
                }
            });
        }

        $$.getElementById('submit').addEventListener('click', submit);
    })
</script>
