                                        <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                            <div class="card-header border-0 pt-5">
                                                <div class="card-title font-weight-bolder">
                                                    <div class="card-label {$style[$theme_style]['global']['title']} font-weight-bold font-size-h3">
                                                        <i class="fas fa-leaf icon-md {$style[$theme_style]['global']['title']}"></i><strong> 客户端下载教程</strong>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body mt-3">
                                                <ul class="dashboard-tabs nav nav-pills row nav-primary row-paddingless m-0 p-0" role="tablist">
                                                    <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                                        <a class="nav-link border d-flex flex-grow-1 rounded flex-column align-items-center active" data-toggle="pill" href="#tab_windows">
                                                            <span class="nav-icon py-2 w-auto"><i class="fab la-windows icon-3x"></i></span>
                                                            <span class="nav-text font-size-lg py-2 font-weight-bold text-center">Windows</span>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                                        <a class="nav-link border d-flex flex-grow-1 rounded flex-column align-items-center" data-toggle="pill" href="#tab_android">
                                                            <span class="nav-icon py-2 w-auto"><i class="fab la-android icon-3x"></i></span>
                                                            <span class="nav-text font-size-lg py-2 font-weight-bold text-center">Android</span>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                                        <a class="nav-link border d-flex flex-grow-1 rounded flex-column align-items-center" data-toggle="pill" href="#tab_macos">
                                                            <span class="nav-icon py-2 w-auto"><i class="fab la-apple icon-3x"></i></span>
                                                            <span class="nav-text font-size-lg py-2 font-weight-bold text-center">Mac OS</span>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                                                        <a class="nav-link border d-flex flex-grow-1 rounded flex-column align-items-center" data-toggle="pill" href="#tab_ios">
                                                            <span class="nav-icon py-2 w-auto"><i class="fab la-apple icon-3x"></i></span>
                                                            <span class="nav-text font-size-lg py-2 font-weight-bold text-center">iPhone OS</span>
                                                        </a>
                                                    </li>
                                                </ul>

                                                <div class="separator separator-dashed separator-border-4 p-5"></div>
                                                <div class="tab-content m-0 p-0">
                                                    <div class="tab-pane active" id="tab_windows" role="tabpanel">
                                                        <div class="card-body pb-0 pl-0">
                                                            <div class="flex-grow-1 card-spacer-x">
                                                                {foreach $metron['client_windows'] as $c_w}
                                                                <div class="d-flex align-items-center justify-content-between mb-5">
                                                                    <div class="d-flex align-items-center mr-2">
                                                                        <div class="symbol symbol-60 symbol-light mr-3 flex-shrink-0">
                                                                            <div class="symbol-label">
                                                                                <img src="{$c_w['img']}" alt="" class="h-50">
                                                                            </div>
                                                                        </div>
                                                                        <div class="ml-3">
                                                                            <span class="font-size-h5 text-primary font-weight-bolder">{$c_w['name']}</span>
                                                                            <div class="font-size-sm text-muted font-weight-bold mt-1">{$c_w['vs']}</div>
                                                                        </div>
                                                                    </div>
                                                                    <a href="{$c_w['down']}" class="btn btn-primary font-weight-bold btn-pill">点击下载</a>
                                                                </div>
                                                                {if !$c_w@last}
                                                                <div class="separator separator-dashed mb-5"></div>
                                                                {/if}
                                                                {/foreach}
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane" id="tab_android" role="tabpanel">
                                                        <div class="card-body pb-0 pl-0">
                                                            <div class="flex-grow-1 card-spacer-x">
                                                                {foreach $metron['client_android'] as $c_w}
                                                                <div class="d-flex align-items-center justify-content-between mb-5">
                                                                    <div class="d-flex align-items-center mr-2">
                                                                        <div class="symbol symbol-60 symbol-light mr-3 flex-shrink-0">
                                                                            <div class="symbol-label">
                                                                                <img src="{$c_w['img']}" alt="" class="h-50">
                                                                            </div>
                                                                        </div>
                                                                        <div class="ml-3">
                                                                            <span class="font-size-h5 text-primary font-weight-bolder">{$c_w['name']}</span>
                                                                            <div class="font-size-sm text-muted font-weight-bold mt-1">{$c_w['vs']}</div>
                                                                        </div>
                                                                    </div>
                                                                    <a href="{$c_w['down']}" class="btn btn-primary font-weight-bold btn-pill" target="_blank">点击下载</a>
                                                                </div>
                                                                {if !$c_w@last}
                                                                <div class="separator separator-dashed mb-5"></div>
                                                                {/if}
                                                                {/foreach}
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane" id="tab_ios" role="tabpanel">
                                                        <div class="card-body pb-0 pl-0">
                                                            <div class="flex-grow-1 card-spacer-x">
                                                                {foreach $metron['client_ios'] as $c_w}
                                                                <div class="d-flex align-items-center justify-content-between mb-5">
                                                                    <div class="d-flex align-items-center mr-2">
                                                                        <div class="symbol symbol-60 symbol-light mr-3 flex-shrink-0">
                                                                            <div class="symbol-label">
                                                                                <img src="{$c_w['img']}" alt="" class="h-50">
                                                                            </div>
                                                                        </div>
                                                                        <div class="ml-3">
                                                                            <span class="font-size-h5 text-primary font-weight-bolder">{$c_w['name']}</span>
                                                                            <div class="font-size-sm text-muted font-weight-bold mt-1">{$c_w['vs']}</div>
                                                                        </div>
                                                                    </div>
                                                                    <a href="{$c_w['url']}" class="btn btn-primary font-weight-bold btn-pill">安装教程</a>
                                                                </div>
                                                                {if !$c_w@last}
                                                                <div class="separator separator-dashed mb-5"></div>
                                                                {/if}
                                                                {/foreach}
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane" id="tab_macos" role="tabpanel">
                                                        <div class="card-body pb-0 pl-0">
                                                            <div class="flex-grow-1 card-spacer-x">
                                                                {foreach $metron['client_macos'] as $c_w}
                                                                <div class="d-flex align-items-center justify-content-between mb-5">
                                                                    <div class="d-flex align-items-center mr-2">
                                                                        <div class="symbol symbol-60 symbol-light mr-3 flex-shrink-0">
                                                                            <div class="symbol-label">
                                                                                <img src="{$c_w['img']}" alt="" class="h-50">
                                                                            </div>
                                                                        </div>
                                                                        <div class="ml-3">
                                                                            <span class="font-size-h5 text-primary font-weight-bolder">{$c_w['name']}</span>
                                                                            <div class="font-size-sm text-muted font-weight-bold mt-1">{$c_w['vs']}</div>
                                                                        </div>
                                                                    </div>
                                                                    <a href="{$c_w['down']}" class="btn btn-primary font-weight-bold btn-pill">点击下载</a>
                                                                </div>
                                                                {if !$c_w@last}
                                                                <div class="separator separator-dashed mb-5"></div>
                                                                {/if}
                                                                {/foreach}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
