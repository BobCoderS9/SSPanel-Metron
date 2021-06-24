<!DOCTYPE html>
<html lang="en">
    <head>
        <title>订单检测 &mdash; {$config["appName"]}</title>
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
                                        <h2 class="text-white font-weight-bold my-2 mr-5">支付订单检测</h2>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                </div>
                            </div>
                        </div>

                        <div class="d-flex flex-column-fluid">
                            <div class="container">

                                <div class="row">
                                    <div class="col-12">

                                        <div class="card card-custom gutter-b {$metron['style_shadow']}">
											<div class="card-body p-10 text-center">
												<img style="width: 40%" src="{$metron['assets_url']}/media/bg/pay_success_500x.png">
											</div>
                                            <div class="pb-20 pt-10 text-center">
													{if $result['status'] === 1}

														{if $result['shop_status'] === 1}
															<h3 class="display-4 text-center font-weight-bolder">{$result['shop_name']} 购买成功</h3>
														{else if $result['shop_status'] === 0}
															<h3 class="display-4 text-center font-weight-bolder">正在处理，请稍候&nbsp;<span class="spinner spinner-darker-primary spinner-lg spinner-right ml-12"></span></h3>
                                                            <script>setTimeout('window.location.reload()', 5000);</script>
														{else if !$result['shop_status']}
															<h3 class="display-4 text-center font-weight-bolder">成功充值 {$result['money']} 元</h3>
														{else}
															<h3 class="display-4 text-center font-weight-bolder">购买失败：{$result['shop_status']}</h3><br /><p class="text-center font-weight-bolder">充值的金额将退还到钱包<br />您可前往商店重新购买并使用余额支付</p>{/if}

													{else}

														<h3 class="display-4 text-center font-weight-bolder">正在处理，请稍等&nbsp;<span class="spinner spinner-darker-primary spinner-lg spinner-right ml-12"></span></h3>
														<script>setTimeout('window.location.reload()', 5000);</script>

													{/if}
                                                    <a href="/user" type="button" class="btn btn-primary mt-5">返回主页</a>
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
    </body>
</html>
