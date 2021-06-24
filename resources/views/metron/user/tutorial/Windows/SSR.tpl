<!DOCTYPE html>
<html lang="en">
    <head>
        <title>SSR 使用教程 &mdash; {$config["appName"]}</title>
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
                                        <h2 class="text-white font-weight-bold my-2 mr-5">SSR for Windows 使用教程</h2>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                </div>
                            </div>
                        </div>

                        <div class="d-flex flex-column-fluid">
                            <div class="container">

                                <!-- 开始 :: 教程内容 -->
                                <div class="row">
                                    <div class="col-12">
                                        <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                            <div class="card-header">
                                                <div class="card-title">
                                                </div>
                                            </div>
                                            <div class="card-body">

<!-- 开始 :: 内容段落 1 -->
                                                <div class="row p-5">

                                                    <!-- 开始 :: 段落文本区 -->
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <!-- 开始 :: 段落标题 -->
                                                        <p class="font-size-h1 pb-5"><strong>0. 简介</strong></p>
                                                        <!-- 结束 :: 段落标题 -->
                                                        <div class="example-preview">
                                                            <p>ShadowsocksR常被称为SSR、酸酸乳、小飞机（粉色）、纸飞机（粉色）</p>
                                                            <p>是由“破娃酱”发起的一个项目，也是目前热门的科学上网技术之一。</p>
                                                            <p>SSR没有官方网站，项目代码托管在Github上，目前已经停止开发，客户端由志愿者维护。</p>
                                                        </div>
                                                    </div>
                                                    <!-- 结束 :: 段落文本区 -->

                                                    <!-- 开始 :: 图片 -->
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <!-- 图片点击打开的灯箱高清图 -->
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/windows/ssr/ssr.jpg" data-lightbox="images">
                                                        <!-- 页面显示的图片缩略图 -->
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/windows/ssr/ssr.jpg"/></a>
                                                    </div>
                                                    <!-- 结束 :: 图片 -->

                                                </div>
<!-- 结束 :: 内容段落 1 -->

                                                <!-- 开始 :: 分割线 -->
                                                <div class="separator separator-dashed separator-border-4"></div>
                                                <!-- 结束 :: 分割线 -->

<!-- 开始 :: 内容段落 2 -->
                                                <div class="row p-5">
                                                    <!-- 段落内容 -->
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <!-- 开始 :: 段落标题 -->
                                                        <p class="font-size-h1 pb-5"><strong>1. 下载客户端</strong></p>
                                                        <!-- 结束 :: 段落标题 -->
                                                        <a href="{$metron['client_windows']['ssr']['down']}" class="btn btn-pill btn-ssr mb-4" target="_blank">&nbsp;&nbsp;<i class="metron-ssr1 text-white"></i>下载 SSR 客户端</a>
                                                        <p class="mb-2">下载后解压到任意目录下</p>
                                                        <p class="mb-2">在目录中打开运行 <code>exe</code> 后缀的文件</p>
                                                    </div>
                                                    <!-- 开始 :: 图片 -->
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/windows/ssr/ssr.jpg" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/windows/ssr/ssr.jpg"/></a>
                                                    </div>
                                                    <!-- 结束 :: 图片 -->
                                                </div>
<!-- 结束 :: 内容段落 2 -->

                                                <!-- 开始 :: 分割线 -->
                                                <div class="separator separator-dashed separator-border-4"></div>
                                                <!-- 结束 :: 分割线 -->

<!-- 开始 :: 内容段落 3 -->
                                                <div class="row p-5">
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <!-- 开始 :: 段落标题 -->
                                                        <p class="font-size-h1 pb-5"><strong>2. 设置订阅地址</strong></p>
                                                        <!-- 结束 :: 段落标题 -->
                                                        <div class="btn-group mb-3 mr-3">
                                                            <button type="button" class="btn btn-pill btn-ssr dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;<i class="metron-ssr1 text-white"></i>SSR 订阅&nbsp;&nbsp;</button>
                                                            <div class="dropdown-menu">
                                                                <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["ssr"]}">复制 SSR 订阅</button>
                                                                <div class="dropdown-divider">
                                                                </div>
                                                                <button type="button" class="dropdown-item" href="##" onclick="importSublink('ssr')">一键导入 SSR</button>
                                                            </div>
                                                        </div>
                                                        <p class="mb-2">点击上方按钮一键导入节点订阅到SSR (先开启SSR客户端)</p>
                                                        <p class="mb-2">勾选 <code>自动更新</code> 并点击 <code>保存并更新</code> , 提示成功后点击确定</p>
                                                        <br />
                                                        <div class="alert alert-custom alert-outline-primary fade show mb-5" role="alert">
                                                            <div class="alert-icon">
                                                                <i class="flaticon-warning"></i>
                                                            </div>
                                                            <div class="alert-text">
                                                                <p class="mb-2">无法一键导入? 试试手动设置订阅</p>
                                                                <p class="mb-2">复制 SSR 订阅地址</p>
                                                                <p class="mb-2">右键点击 纸飞机图标, 选择 <code>订阅</code> - <code>设置</code> </p>
                                                                <p class="mb-2">点击 <code>添加</code>, 将订阅地址粘贴到 <code>网址</code> 一栏后点击 <code>保存并更新</code> </p>
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
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/windows/ssr/ssr.jpg" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/windows/ssr/ssr.jpg"/></a>
                                                    </div>
                                                </div>
<!-- 结束 :: 内容段落 3 -->

                                                <!-- 开始 :: 分割线 -->
                                                <div class="separator separator-dashed separator-border-4"></div>
                                                <!-- 结束 :: 分割线 -->

<!-- 开始 :: 内容段落 4 -->
                                                <div class="row p-5">
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <!-- 开始 :: 段落标题 -->
                                                        <p class="font-size-h1 pb-5"><strong>3. 选择节点</strong></p>
                                                        <!-- 结束 :: 段落标题 -->
                                                        <p class="mb-2">右键点击 纸飞机图标, 选择 <code>服务器</code> - <code>{$config["appName"]}</code> </p>
                                                        <p class="mb-2">选择适合您的节点</p>
                                                    </div>
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/windows/ssr/ssr.jpg" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/windows/ssr/ssr.jpg"/></a>
                                                    </div>
                                                </div>
<!-- 结束 :: 内容段落 4 -->

                                                <!-- 开始 :: 分割线 -->
                                                <div class="separator separator-dashed separator-border-4"></div>
                                                <!-- 结束 :: 分割线 -->

<!-- 开始 :: 内容段落 5 -->
                                                <div class="row p-5">
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <!-- 开始 :: 段落标题 -->
                                                        <p class="font-size-h1 pb-5"><strong>4. 开启代理</strong></p>
                                                        <!-- 结束 :: 段落标题 -->
                                                        <p class="mb-2">默认情况下只需要代理一些被墙的国外网站即可</p>
                                                        <p class="mb-2">点击 <code>系统代理</code> 设置为 <code>PAC</code></p>
                                                        <p class="mb-2">点击 <code>规则设置</code> - <code>PAC</code> - <code>更新 PAC 为 GFWList</code></p>
                                                        <p class="mb-2">点击 <code>规则设置</code> - <code>代理规则</code> - 勾选 <code>绕过局域网和大陆</code></p>
                                                        <p class="mb-2">一切准备就绪~~~</p>
                                                    </div>
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/windows/ssr/ssr.jpg" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/windows/ssr/ssr.jpg"/></a>
                                                    </div>
                                                </div>
<!-- 结束 :: 内容段落 5 -->

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 结束 :: 教程内容 -->
                                
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