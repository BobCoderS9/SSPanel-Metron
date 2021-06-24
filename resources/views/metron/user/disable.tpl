<!DOCTYPE html>
<html lang="en">
    <head>
        <title>小黑屋 &mdash; {$config["appName"]}</title>
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
                                        <h2 class="text-white font-weight-bold my-2 mr-5">账号已被封禁</h2>
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
                                                <span class="svg-icon svg-icon-primary svg-icon-10x">
                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                            <rect x="0" y="0" width="24" height="24"/>
                                                            <path d="M4,4 L11.6314229,2.5691082 C11.8750185,2.52343403 12.1249815,2.52343403 12.3685771,2.5691082 L20,4 L20,13.2830094 C20,16.2173861 18.4883464,18.9447835 16,20.5 L12.5299989,22.6687507 C12.2057287,22.8714196 11.7942713,22.8714196 11.4700011,22.6687507 L8,20.5 C5.51165358,18.9447835 4,16.2173861 4,13.2830094 L4,4 Z" fill="#000000" opacity="0.3"/>
                                                            <path d="M10.5857864,12 L9.17157288,10.5857864 C8.78104858,10.1952621 8.78104858,9.56209717 9.17157288,9.17157288 C9.56209717,8.78104858 10.1952621,8.78104858 10.5857864,9.17157288 L12,10.5857864 L13.4142136,9.17157288 C13.8047379,8.78104858 14.4379028,8.78104858 14.8284271,9.17157288 C15.2189514,9.56209717 15.2189514,10.1952621 14.8284271,10.5857864 L13.4142136,12 L14.8284271,13.4142136 C15.2189514,13.8047379 15.2189514,14.4379028 14.8284271,14.8284271 C14.4379028,15.2189514 13.8047379,15.2189514 13.4142136,14.8284271 L12,13.4142136 L10.5857864,14.8284271 C10.1952621,15.2189514 9.56209717,15.2189514 9.17157288,14.8284271 C8.78104858,14.4379028 8.78104858,13.8047379 9.17157288,13.4142136 L10.5857864,12 Z" fill="#000000"/>
                                                        </g>
                                                    </svg>
                                                </span>
											</div>
                                            <div class="pb-20 pt-10 text-center">
                                                <h3 class="display-4 text-center font-weight-bolder">您的账号已被封禁</h3>
                                                <h3 class="display-4 text-center font-weight-bolder">如有疑问请发送工单</h3>
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