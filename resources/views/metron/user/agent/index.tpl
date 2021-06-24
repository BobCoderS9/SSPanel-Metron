<!DOCTYPE html>
<html lang="en">
    <head>
        <title>代理中心 &mdash; {$config["appName"]}</title>
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
                                        <h2 class="text-white font-weight-bold my-2 mr-5">代理中心</h2>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                </div>
                            </div>
                        </div>

                        <div class="d-flex flex-column-fluid">
                            <div class="container">

                                <div class="row">
									<div class="col-xl-4">
										<div class="card card-custom gutter-b card-stretch {$metron['style_shadow']}">
											<div class="card-header border-0 pt-5">
												<div class="card-title">
													<div class="card-label">
														<div class="font-weight-bolder text-primary">最新返利和统计</div>
														<div class="font-size-sm text-muted mt-2">最近获取返利的记录和每日返利总计</div>
													</div>
												</div>
											</div>
											<div class="card-body d-flex flex-column px-0 pb-0">
												<div id="kt_tiles_widget_1_chart" data-color="danger" style="height: 150px"></div>
												<div class="flex-grow-1 card-spacer-x mt-3">
													{foreach $back_news as $back_new}
													<div class="d-flex align-items-center justify-content-between mt-8 mb-8 ">
														<div class="d-flex align-items-center mr-2">
															<div class="symbol symbol-50 symbol-light mr-3 flex-shrink-0">
																<div class="symbol-label">
																	<img src="{$back_new['avatar']}" alt="" class="h-50" />
																</div>
															</div>
															<div>
																<span class="font-size-h6 {$style[$theme_style]['global']['text']} font-weight-bolder">{$back_new['name']}</span>
																<div class="font-size-sm text-muted font-weight-bold mt-1">{$back_new['time']}</div>
															</div>
														</div>
														<div class="label label-light label-inline font-weight-bold text-dark-50 py-4 px-3 font-size-base">+ ¥{$back_new['ref_get']}</div>
													</div>
                                                    {/foreach}
												</div>
											</div>
										</div>
									</div>
									<div class="col-xl-8">
										<div class="row">
											<div class="col-xl-6">
												<div class="card card-custom bgi-no-repeat gutter-b {$metron['style_shadow']}" style="height: 175px; background-color: #663259; background-position: calc(100% + 0.5rem) 100%; background-size: 100% auto; background-image: url({$metron['assets_url']}/media/svg/patterns/taieri.svg)">
													<div class="card-body d-flex align-items-center">
														<div>
															<h3 class="text-white font-weight-bolder line-height-lg mb-5">可提金额
															<br>¥ {$user->back_money}</h3>
															<a href="#" class="btn btn-success font-weight-bold px-6 py-3" data-toggle="modal" data-target="#take_money_modal">申请提现</a>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<div class="card card-custom bg-primary gutter-b {$metron['style_shadow']}" style="height: 150px">
															<div class="card-body">
																<span class="svg-icon svg-icon-3x svg-icon-white ml-n2">
																	<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<rect fill="#000000" x="4" y="4" width="7" height="7" rx="1.5"></rect>
																			<path d="M5.5,13 L9.5,13 C10.3284271,13 11,13.6715729 11,14.5 L11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L5.5,20 C4.67157288,20 4,19.3284271 4,18.5 L4,14.5 C4,13.6715729 4.67157288,13 5.5,13 Z M14.5,4 L18.5,4 C19.3284271,4 20,4.67157288 20,5.5 L20,9.5 C20,10.3284271 19.3284271,11 18.5,11 L14.5,11 C13.6715729,11 13,10.3284271 13,9.5 L13,5.5 C13,4.67157288 13.6715729,4 14.5,4 Z M14.5,13 L18.5,13 C19.3284271,13 20,13.6715729 20,14.5 L20,18.5 C20,19.3284271 19.3284271,20 18.5,20 L14.5,20 C13.6715729,20 13,19.3284271 13,18.5 L13,14.5 C13,13.6715729 13.6715729,13 14.5,13 Z" fill="#000000" opacity="0.3"></path>
																		</g>
																	</svg>
																</span>
																<div class="text-inverse-primary font-weight-bolder font-size-h2 mt-3">¥ {$today_back}</div>
																<span class="text-inverse-primary font-weight-bold font-size-lg mt-1">今日返利</span>
															</div>
														</div>
													</div>
													<div class="col-6">
														<div class="card card-custom gutter-b {$metron['style_shadow']}" style="height: 150px">
															<div class="card-body">
																<span class="svg-icon svg-icon-3x svg-icon-success">
																	<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24"></polygon>
																			<path d="M18,14 C16.3431458,14 15,12.6568542 15,11 C15,9.34314575 16.3431458,8 18,8 C19.6568542,8 21,9.34314575 21,11 C21,12.6568542 19.6568542,14 18,14 Z M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<path d="M17.6011961,15.0006174 C21.0077043,15.0378534 23.7891749,16.7601418 23.9984937,20.4 C24.0069246,20.5466056 23.9984937,21 23.4559499,21 L19.6,21 C19.6,18.7490654 18.8562935,16.6718327 17.6011961,15.0006174 Z M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z" fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg>
																</span>
																<div class="{$style[$theme_style]['global']['text']} font-weight-bolder font-size-h2 mt-3">{$today_user} 个</div>
																<span class="text-muted font-weight-bold font-size-lg mt-1">今日客户</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<div class="card card-custom gutter-b {$metron['style_shadow']}" style="height: 150px">
															<div class="card-body">
																<span class="svg-icon svg-icon-3x svg-icon-success">
																	<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24"></polygon>
																			<path d="M18,14 C16.3431458,14 15,12.6568542 15,11 C15,9.34314575 16.3431458,8 18,8 C19.6568542,8 21,9.34314575 21,11 C21,12.6568542 19.6568542,14 18,14 Z M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<path d="M17.6011961,15.0006174 C21.0077043,15.0378534 23.7891749,16.7601418 23.9984937,20.4 C24.0069246,20.5466056 23.9984937,21 23.4559499,21 L19.6,21 C19.6,18.7490654 18.8562935,16.6718327 17.6011961,15.0006174 Z M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z" fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg>
																</span>
																<div class="{$style[$theme_style]['global']['text']} font-weight-bolder font-size-h2 mt-3">{$user_num} 个</div>
																<span class="text-muted font-weight-bold font-size-lg mt-1">累计客户</span>
															</div>
														</div>
													</div>
													<div class="col-6">
														<div class="card card-custom bg-primary gutter-b {$metron['style_shadow']}" style="height: 150px">
															<div class="card-body">
																<span class="svg-icon svg-icon-3x svg-icon-white ml-n2">
																	<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<rect fill="#000000" x="4" y="4" width="7" height="7" rx="1.5"></rect>
																			<path d="M5.5,13 L9.5,13 C10.3284271,13 11,13.6715729 11,14.5 L11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L5.5,20 C4.67157288,20 4,19.3284271 4,18.5 L4,14.5 C4,13.6715729 4.67157288,13 5.5,13 Z M14.5,4 L18.5,4 C19.3284271,4 20,4.67157288 20,5.5 L20,9.5 C20,10.3284271 19.3284271,11 18.5,11 L14.5,11 C13.6715729,11 13,10.3284271 13,9.5 L13,5.5 C13,4.67157288 13.6715729,4 14.5,4 Z M14.5,13 L18.5,13 C19.3284271,13 20,13.6715729 20,14.5 L20,18.5 C20,19.3284271 19.3284271,20 18.5,20 L14.5,20 C13.6715729,20 13,19.3284271 13,18.5 L13,14.5 C13,13.6715729 13.6715729,13 14.5,13 Z" fill="#000000" opacity="0.3"></path>
																		</g>
																	</svg>
																</span>
																<div class="text-inverse-primary font-weight-bolder font-size-h2 mt-3">¥ {$back_sum}</div>
																<span class="text-inverse-primary font-weight-bold font-size-lg mt-1">累计返利</span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-6">
												<div class="card card-custom bgi-no-repeat bgi-size-cover gutter-b card-stretch {$metron['style_shadow']}" style="background-image: url({$metron['assets_url']}/media/stock-600x600/img-16.jpg)">
													<div class="card-body d-flex flex-column align-items-start justify-content-start">
														<div class="p-1 flex-grow-1">
															<h3 class="text-white font-weight-bolder line-height-lg mb-5">代理商详情
														</div>
                                                        <div class="body">
                                                            <p class="text-white"><strong>抽成比例：{if $user->rebate === -1}{$config['code_payback']}{else}{$user->rebate}{/if} %</strong></p>
                                                            {if $take_total !== 0}
                                                            <p class="text-white"><strong>您有 ¥ {$take_total} 正在提现处理中</strong></p>
                                                            {/if}
                                                        </div>
														<a href="#" class="btn btn-link btn-link-warning font-weight-bold" data-toggle="modal" data-target="#agent_setting_modal">提现账号设置
														<span class="svg-icon svg-icon-lg svg-icon-warning">
															<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																	<polygon points="0 0 24 0 24 24 0 24"></polygon>
																	<rect fill="#000000" opacity="0.3" transform="translate(12.000000, 12.000000) rotate(-90.000000) translate(-12.000000, -12.000000)" x="11" y="5" width="2" height="14" rx="1"></rect>
																	<path d="M9.70710318,15.7071045 C9.31657888,16.0976288 8.68341391,16.0976288 8.29288961,15.7071045 C7.90236532,15.3165802 7.90236532,14.6834152 8.29288961,14.2928909 L14.2928896,8.29289093 C14.6714686,7.914312 15.281055,7.90106637 15.675721,8.26284357 L21.675721,13.7628436 C22.08284,14.136036 22.1103429,14.7686034 21.7371505,15.1757223 C21.3639581,15.5828413 20.7313908,15.6103443 20.3242718,15.2371519 L15.0300721,10.3841355 L9.70710318,15.7071045 Z" fill="#000000" fill-rule="nonzero" transform="translate(14.999999, 11.999997) scale(1, -1) rotate(90.000000) translate(-14.999999, -11.999997)"></path>
																</g>
															</svg>
														</span></a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

                                <div class="row">
                                    <div class="col-12">
                                        <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                            <div class="card-header flex-wrap border-0 pt-6">
                                                <div class="card-title">
                                                    <h3 class="card-label text-primary"><strong>提现记录</strong>
                                                    <span class="d-block text-muted pt-2 font-size-sm">提取返利金额的记录</span></h3>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="mb-7">
                                                    <div class="row align-items-center">
                                                        <div class="col-lg-9 col-xl-8">
                                                            <div class="row align-items-center">
                                                                <div class="col-md-4 my-2 my-md-0">
                                                                    <div class="d-flex align-items-center">
                                                                        <label class="mr-3 mb-0 d-none d-md-block">状态</label>
                                                                        <select class="form-control" id="agent_take_log_query_status">
                                                                            <option value="">全部</option>
                                                                            <option value="1">已处理</option>
                                                                            <option value="0">处理中</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="datatable datatable-bordered datatable-head-custom" id="ajax_agent_take_log_data"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12">
                                        <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                            <div class="card-header flex-wrap border-0 pt-6">
                                                <div class="card-title">
                                                    <h3 class="card-label text-primary"><strong>客户列表</strong>
                                                    <span class="d-block text-muted pt-2 font-size-sm">您账户下邀请的用户列表</span></h3>
                                                </div>
                                                <div class="card-toolbar">
                                                    <a href="/user/agent/adduser" class="btn btn-primary font-weight-bolder">
                                                    <span class="svg-icon svg-icon-md">
                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                <rect x="0" y="0" width="24" height="24"></rect>
                                                                <circle fill="#000000" cx="9" cy="15" r="6"></circle>
                                                                <path d="M8.8012943,7.00241953 C9.83837775,5.20768121 11.7781543,4 14,4 C17.3137085,4 20,6.6862915 20,10 C20,12.2218457 18.7923188,14.1616223 16.9975805,15.1987057 C16.9991904,15.1326658 17,15.0664274 17,15 C17,10.581722 13.418278,7 9,7 C8.93357256,7 8.86733422,7.00080962 8.8012943,7.00241953 Z" fill="#000000" opacity="0.3"></path>
                                                            </g>
                                                        </svg>
                                                    </span>创建新客户</a>
                                                </div>

                                            </div>
                                            <div class="card-body">
                                                <div class="mb-7">
                                                    <div class="row align-items-center">
                                                        <div class="col-lg-9 col-xl-8">
                                                            <div class="row align-items-center">
                                                                <div class="col-md-4 my-2 my-md-0">
                                                                    <div class="input-icon">
                                                                        <input type="text" class="form-control" placeholder="搜索..." id="agent_user_search_query" />
                                                                        <span>
                                                                            <i class="flaticon2-search-1 text-muted"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 my-2 my-md-0">
                                                                    <div class="d-flex align-items-center">
                                                                        <label class="mr-3 mb-0 d-none d-md-block">等级</label>
                                                                        <select class="form-control" id="agent_user_query_class">
                                                                            <option value="">全部客户</option>
                                                                            {foreach $metron['user_level'] as $level => $levelName}
                                                                                <option value="{$level}">{$levelName}</option>
                                                                            {/foreach}
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="datatable datatable-bordered datatable-head-custom" id="ajax_agent_user_data"></div>
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

<div class="modal fade" id="take_money_modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong>提现申请</strong></h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="col-form-label text-lg-right text-left">输入金额：</label>
                    <div class="input-group input-group-solid">
                        <input type="number" class="form-control" placeholder="输入要提取的金额" name="take_money"/>
                    </div>
                </div>
                <label class="col-form-label text-lg-right text-left">提取方式：</label>
                <ul class="dashboard-tabs nav nav-pills row nav-primary row-paddingless m-0 p-0" role="tablist">
                    <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                        <a class="nav-link border py-5 d-flex flex-grow-1 rounded flex-column align-items-center active" data-toggle="pill" data-metron="1">
                            <span class="nav-icon py-2 w-auto">
                                <i class="fab fas fa-wallet icon-2x"></i>
                            </span>
                            <span class="nav-text font-size-lg py-2 font-weight-bold text-center">转到余额<br/>
                            <small>0 元 起提</small></span>
                        </a>
                    </li>
                    <li class="nav-item d-flex col flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0 cursor_onclick">
                        <a class="nav-link border py-5 d-flex flex-grow-1 rounded flex-column align-items-center" data-toggle="pill" data-metron="2">
                            <span class="nav-icon py-2 w-auto">
                                <i class="fab fas fa-people-arrows icon-2x"></i>
                            </span>
                            <span class="nav-text font-size-lg py-2 font-weight-bold text-center">申请提现<br />
                            <small>{$metron['take_back_total']} 元 起提</small></span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary buyTrafficPackage" type="button" onclick="agent.take_total();">确认</button>
                <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="agent_setting_modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title {$style[$theme_style]['modal']['text_title']}"><strong>提现设置</strong></h4>
            </div>
            <div class="modal-body">
                <p class="text-danger">务必检查账号是否填写正确, 因账号设置错误导致没有到账, 本站概不负责! </p>
                <div class="form-group">
                    <label class="col-form-label text-lg-right text-left">账号类型：</label>
                    <select class="form-control" id="take_account_type" data-style="btn-primary">
                        {foreach $metron['take_account_type'] as $acctype}
                            <option value="{$acctype}" {if isset($user->config['take_account']) && $acctype == $user->config['take_account']['type']}selected="selected"{/if}>{$acctype}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="form-group">
                    <label class="col-form-label text-lg-right text-left">提现账号：</label>
                    <div class="input-group input-group-solid">
                        {if isset($user->config['take_account']) && $user->config['take_account']['acc']}
                            <input type="text" class="form-control" placeholder="输入提现账号" value="{$user->config['take_account']['acc']}" name="take_account_value"/>
                        {else}
                            <input type="text" class="form-control" placeholder="输入提现账号" value="" name="take_account_value"/>
                        {/if}                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary buyTrafficPackage" type="button" onclick="agent.take_account_setting();">确认</button>
                <button type="button" class="btn {$style[$theme_style]['modal']['btn_close']} font-weight-bold" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

        {include file='include/global/scripts.tpl'}
    </body>
</html>
