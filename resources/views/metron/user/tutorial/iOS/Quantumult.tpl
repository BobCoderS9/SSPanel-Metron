<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Quantumult 使用教程 &mdash; {$config["appName"]}</title>
        <link href="{$metron['assets_url']}/css/client/metron-icon.css" rel="stylesheet" type="text/css" />
        <link href="{$metron['assets_url']}/plugins/tutorial/lightbox/lightbox.min.css" rel="stylesheet" >
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
                                        <h2 class="text-white font-weight-bold my-2 mr-5">Quantumult 使用教程</h2>
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
                                            <div class="card-header">
                                                <div class="card-title">
                                                </div>
                                            </div>
                                            <div class="card-body">

                                                <div class="row p-5">
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <p class="font-size-h1 pb-5"><strong>0. 简介</strong></p>
                                                        <div class="example-preview">
                                                            <p>quantumult（俗称 “圈”）与 shadowrocket（俗称 “小火箭”）一样，是 iOS 平台的 SS/SSR/V2Ray 扶墙软件。</p>
                                                            <p>由于App Store中国区禁止上架VPN类所有软件，所以该软件仅在美区、港区等非国区App Store可下载，并且该软件是收费软件，为开发者收取。</p>
                                                            {if $metron['ios_account'] != ''}
                                                            <p>本站对符合要求的会员提供已购买该软件的Apple ID共享账号进行下载，有条件建议自行搜索相关教程注册非国区账号购买该软件以支持开发者。</p>
                                                            {/if}
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/ios/quantumult/quantumult.jpg" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/ios/quantumult/quantumult.jpg"/></a>
                                                    </div>
                                                </div>

                                                <div class="separator separator-dashed separator-border-4"></div>

                                                <div class="row p-5">
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                    <p class="font-size-h1 pb-5"><strong>1. 通过 App Store 安装客户端</strong></p>
                                                        {if $metron['ios_account'] != ''}
                                                        {if $user->class >= $metron['ios_class'] && $user->class != 10}
                                                        <div class="input-group mb-3 col-md-8 col-lg-8">
                                                            <input type="text" class="form-control" value="{$metron['ios_account']}" disabled="disabled">
                                                            <div class="input-group-append">
                                                                <button class="btn btn-primary copy-text" type="button" data-clipboard-text="{$metron['ios_account']}">复制账号</button>
                                                            </div>
                                                        </div>
                                                        <div class="input-group mb-3 col-md-8 col-lg-8">
                                                            <input type="text" class="form-control" value="{$metron['ios_password']}" disabled="disabled">
                                                            <div class="input-group-append">
                                                                <button class="btn btn-primary copy-text" type="button" data-clipboard-text="{$metron['ios_password']}">复制密码</button>
                                                            </div>
                                                        </div>
                                                        <p class="mb-2">如果账号被锁定，可联系管理员等待解锁，也可自行从其他渠道获取</p>
                                                        {else}
                                                        <div class="alert alert-primary" role="alert">
                                                            <div class="alert-text mt-3">
                                                                <h4 class="alert-heading">您的等级不支持查看共享账号</h4>
                                                                <hr>
                                                                <p class="mb-2">quantumult为App Store商店付费软件，为防止频繁登录而导致被封号，共享账号仅对 <code>Lv.{$metron['ios_class']}及以上会员</code> 提供。<br>
                                                                当您成为 <code>Lv.{$metron['ios_class']}及以上会员</code> 时(不包括试用会员)，该页面会自动显示共享账号。<br>
                                                                您可通过其他渠道进行安装下载quantumult，具体可至搜索引擎搜索资源。</p>
                                                            </div>
                                                        </div>
                                                        {/if}
                                                        {else}
                                                        <div class="alert alert-primary" role="alert">
                                                            <div class="alert-text mt-3">
                                                                <h4 class="alert-heading">您需要持有非国区Apple ID</h4>
                                                                <hr>
                                                                <p class="mb-2">
                                                                    quantumult为App Store商店付费软件，并且是非中国区的 Apple ID 才可以下载.<br />
                                                                    您需要拥有非中国区的Apple ID并购买过quantumult的账号。<br />
                                                                    本站未提供相关账号，您需要自行解决。(网上搜索相关注册非国区ID的教程, 然后在某宝购买礼品卡充值并购买软件)
                                                                </p>
                                                            </div>
                                                        </div>
                                                        {/if}
                                                        <br />
                                                        <p class="mb-2">打开手机<code>设置</code> -> <code>iTunes Store 与 App Store</code> ->使用 <code>非国区 Apple ID </code>登录</p>
                                                        <p class="mb-2">登录成功后 App Store 会切换对应的语言，在搜索框输入 <code>quantumult</code> 进行安装</p>
                                                        <p class="mb-2">安装完成可正常打开app后 打开手机<code>设置</code> -> <code>iTunes Store 与 App Store</code> 退出共享账号，安装完成后不再需要Appe ID，所以请不要保留在手机登录。</p>
                                                    </div>
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/ios/quantumult/quantumult.jpg" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/ios/quantumult/quantumult.jpg"/></a>
                                                    </div>
                                                </div>

                                                <div class="separator separator-dashed separator-border-4"></div>

                                                <div class="row p-5">
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <p class="font-size-h1 pb-5"><strong>2. 设置订阅地址</strong></p>
                                                        <div class="btn-group mb-3 mr-3">
                                                            <button type="button" class="btn btn-pill btn-quantumult dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;<i class="metron-quantumult"></i>Quantumult 订阅&nbsp;&nbsp;</button>
                                                            <div class="dropdown-menu">
                                                                <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["ssr"]}">复制 SSR 节点订阅</button>
                                                                <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["quantumult_v2"]}">复制 V2ray 节点订阅</button>
                                                                <div class="dropdown-divider"></div>
                                                                <button type="button" class="dropdown-item" href="##" onclick="importSublink('quantumult')">一键导入 SSR 节点订阅</button>
                                                                <button type="button" class="dropdown-item" href="##" onclick="importSublink('quantumult_v2')">一键导入 V2Ray 节点订阅</button>
                                                            </div>
                                                        </div>
                                                        <p class="mb-2">点击上方按钮一键导入节点配置到quantumult</p>
                                                        <p class="mb-2">如果导入后没有显示节点，请重启quantumult</p>
                                                        <br />

                                                        <div class="alert alert-custom alert-outline-primary fade show mb-5" role="alert">
                                                            <div class="alert-icon">
                                                                <i class="flaticon-warning"></i>
                                                            </div>
                                                            <div class="alert-text">
                                                                <p class="mb-2">依次点击 <code>设置</code> - <code>订阅</code> - 右上角 <code>+</code>号 - <code>服务器</code></p>
                                                                <p class="mb-2">名称随意填写 - 订阅地址粘贴到<code>链接</code>一栏后保存</p>
                                                                <p class="mb-2">向左滑动刚刚添加的订阅, 点击更新</p>
                                                            </div>
                                                            <div class="alert-close">
                                                                <button type="button" class="close" data-dismiss="alert" aria-label="关">
                                                                    <span aria-hidden="true">
                                                                        <i class="ki ki-close"></i>
                                                                    </span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/ios/quantumult/quantumult.jpg" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/ios/quantumult/quantumult.jpg"/></a>
                                                    </div>
                                                </div>

                                                <div class="separator separator-dashed separator-border-4"></div>

                                                <div class="row p-5">
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <p class="font-size-h1 pb-5"><strong>3. 添加规则配置</strong></p>
                                                        <button type="button" class="btn btn-pill btn-quantumult copy-text mb-4" data-clipboard-text="{$subInfo["quantumult_conf"]}"><i class="fa fa-copy text-white"></i>&nbsp;&nbsp;复制配置链接</button>
                                                        <p class="mb-2">同样在<code>设置</code> - <code>订阅</code> - 右上角 <code>+</code>号 - <code>分流</code></p>
                                                        <p class="mb-2">名称随意填写 - 配置地址粘贴到<code>链接</code>一栏后保存</p>
                                                        <p class="mb-2">向左滑动刚刚添加的分流配置, 点击增加或者替换</p>
                                                    </div>
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/ios/quantumult/quantumult.jpg" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/ios/quantumult/quantumult.jpg"/></a>
                                                    </div>
                                                </div>

                                                <div class="separator separator-dashed separator-border-4"></div>

                                                <div class="row p-5">
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <p class="font-size-h1 pb-5"><strong>4. 开启代理</strong></p>
                                                        <p class="mb-2"><code>回到主页</code>，点击右下角四方形图标, 选择 <code>自动分流</code></p>
                                                        <p class="mb-2">点击中间APP的Logo图标打开节点列表选择节点(左下按钮可测试节点)</p>
                                                        <p class="mb-2">选择节点后点击空白处返回, 并开启顶部 Quantumult 右边的开关</p>
                                                        <p>如果是首次开启会弹出VPN文件的应用，务必点击<code>Allow</code>并验证</p>
                                                    </div>
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/ios/quantumult/quantumult.jpg" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/ios/quantumult/quantumult.jpg"/></a>
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
        {include file='include/global/import_sublink.tpl'}
        <script src="{$metron['assets_url']}/plugins/tutorial/lightbox/lightbox.min.js" type="text/javascript"></script>
    </body>
</html>