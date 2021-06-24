<!DOCTYPE html>
<html lang="en">
    <head>
        <title>SSTap 使用教程 &mdash; {$config["appName"]}</title>
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
                                        <h2 class="text-white font-weight-bold my-2 mr-5">SSTap for Windows 使用教程</h2>
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
                                                            <p>SSTap是SocksCap64作者新开发的一款利用虚拟网卡实现的网络层代理。</p>
                                                            <p>SSTap能在网络层拦截所有连接并转发给HTTP，SOCKS4，5，SHADOWSOCKS代理, 而无需对被代理的应用程序做任何修改或设置。</p>
                                                            <p>它能同时转发TCP, UDP数据包。它非常适合于游戏玩家使用。</p>
                                                            <p>享受你的游戏时光！请使用SSTap！</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/windows/sstap/sstap.jpg" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/windows/sstap/sstap.jpg"/></a>
                                                    </div>
                                                </div>

                                                <div class="separator separator-dashed separator-border-4"></div>

                                                <div class="row p-5">
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <p class="font-size-h1 pb-5"><strong>1. 下载客户端</strong></p>
                                                        <a href="{$metron['client_windows']['sstap']['down']}" class="btn btn-pill btn-sstap mb-4" target="_blank">&nbsp;&nbsp;<i class="metron-sstap text-white"></i>下载 SSTap 客户端</a>
                                                        <p class="mb-2">右键以管理员身份运行这个文件</p>
                                                        <p class="mb-2">会提示你选择安装语言，默认中文，一路下一步即可，然后就会进入安装进度条步骤</p>
                                                        <p class="mb-2">因为SSTAP想要拦截网络上的所有流量，就必须建立一个虚拟网卡，以此让所有网络流量都经过虚拟网卡，这样才能实现“真 · 全局代理”。</p>
                                                        <p class="mb-2">所以 按下图所示，勾选 始终信任来自….的软件，并点击 安装 按钮安装虚拟网卡 。</p>
                                                    </div>
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/windows/sstap/2018020309355115.png" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/windows/sstap/2018020309355115.png"/></a>
                                                    </div>
                                                </div>

                                                <div class="separator separator-dashed separator-border-4"></div>

                                                <div class="row p-5">
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <p class="font-size-h1 pb-5"><strong>2. 设置订阅地址</strong></p>
                                                        <div class="btn-group mb-3 mr-3">
                                                            <button type="button" class="btn btn-pill btn-sstap copy-text" data-clipboard-text="{$subInfo["ssr"]}">&nbsp;&nbsp;<i class="metron-ssr1 text-white"></i>复制 SSTap 订阅&nbsp;&nbsp;</button>
                                                        </div>
                                                        <p class="mb-2">右键任务栏图标 <code>SSR订阅</code> - <code>SSR订阅管理</code></p>
                                                        <p class="mb-2">将订阅地址粘贴到 <code>URL</code> 一栏, 并点击 <code>添加</code></p>
                                                        <p class="mb-2">然后直接右上角点 <code>X</code> 关闭后会自动刷新节点</p>
                                                    </div>
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/windows/sstap/20200330195059.png" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/windows/sstap/20200330195059.png"/></a>
                                                    </div>
                                                </div>

                                                <div class="separator separator-dashed separator-border-4"></div>

                                                <div class="row p-5">
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <p class="font-size-h1 pb-5"><strong>3. 选择节点并开启代理</strong></p>
                                                        <p class="mb-2">点击代理一栏下拉选择节点, 再点击右侧闪电标志测试节点的可用性</code> </p>
                                                        <p class="mb-2">点击模式一栏. 直接选择 <code>不代理中国IP</code></p>
                                                        <p class="mb-2">点击 <code>连接</code> 开启代理</p>
                                                    </div>
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/windows/sstap/20200330195447.jpg" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/windows/sstap/20200330195447.jpg"/></a>
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
        <script src="{$metron['assets_url']}/plugins/tutorial/lightbox/lightbox.min.js" type="text/javascript"></script>
    </body>
</html>