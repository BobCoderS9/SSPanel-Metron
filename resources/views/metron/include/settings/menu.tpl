                                <div class="d-flex align-items-center">
                                    <button class="btn {$style[$theme_style]['global']['btn_subheader']} font-weight-bold mr-4 d-inline-block d-lg-none" id="user_profile_mobile_toggle">菜单</button>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex flex-column-fluid">
                            <div class="container">
                                <div class="d-flex flex-row">
                                    <div class="flex-row-auto offcanvas-mobile w-300px w-xl-350px" id="user_profile_list">
                                        <div class="card card-custom {$metron['style_shadow']}">
                                            <div class="card-body pt-4">
                                                <div class="d-flex justify-content-end pt-8">
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <div class="symbol symbol-60 symbol-xxl-100 mr-5 align-self-start align-self-xxl-center">
                                                        <div class="symbol-label" style="background-image:url({$user->gravatar})"></div>
                                                        <i class="symbol-badge bg-success"></i>
                                                    </div>
                                                    <div>
                                                        <a href="#" class="font-weight-bolder font-size-h5 text-dark-75 text-hover-primary">{$user->user_name}</a>
                                                        <div class="text-muted">这个家伙很懒，什么都没有留下。</div>
                                                    </div>
                                                </div>
                                                <div class="py-9">
                                                    <div class="d-flex align-items-center justify-content-between mb-2">
                                                        <span class="font-weight-bold mr-2">邮箱地址:</span>
                                                        <span class="text-muted">{$user->email}</span>
                                                    </div>
                                                    <div class="d-flex align-items-center justify-content-between mb-2">
                                                        <span class="font-weight-bold mr-2">注册时间:</span>
                                                        <span class="text-muted">{$user->reg_date}</span>
                                                    </div>
                                                    <div class="d-flex align-items-center justify-content-between">
                                                        <span class="font-weight-bold mr-2">账户过期:</span>
                                                        <span class="text-muted">{$user->expire_in}</span>
                                                    </div>
                                                </div>
                                                <div class="navi navi-bold navi-hover navi-active navi-link-rounded">
                                                    <div class="navi-item mb-2">
                                                        <a href="/user/setting/logs" class="navi-link py-4">
                                                            <span class="navi-icon mr-2">
                                                                <span class="svg-icon">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
                                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                            <rect x="0" y="0" width="24" height="24" />
                                                                            <path d="M17,2 L19,2 C20.6568542,2 22,3.34314575 22,5 L22,19 C22,20.6568542 20.6568542,22 19,22 L17,22 L17,2 Z" fill="#000000" opacity="0.3" />
                                                                            <path d="M4,2 L16,2 C17.6568542,2 19,3.34314575 19,5 L19,19 C19,20.6568542 17.6568542,22 16,22 L4,22 C3.44771525,22 3,21.5522847 3,21 L3,3 C3,2.44771525 3.44771525,2 4,2 Z M11.1176481,13.709585 C10.6725287,14.1547043 9.99251947,14.2650547 9.42948307,13.9835365 C8.86644666,13.7020183 8.18643739,13.8123686 7.74131803,14.2574879 L6.2303083,15.7684977 C6.17542087,15.8233851 6.13406645,15.8902979 6.10952004,15.9639372 C6.02219616,16.2259088 6.16377615,16.5090688 6.42574781,16.5963927 L7.77956724,17.0476658 C9.07965249,17.4810276 10.5130001,17.1426601 11.4820264,16.1736338 L15.4812434,12.1744168 C16.3714821,11.2841781 16.5921828,9.92415954 16.0291464,8.79808673 L15.3965752,7.53294436 C15.3725414,7.48487691 15.3409156,7.44099843 15.302915,7.40299777 C15.1076528,7.20773562 14.7910703,7.20773562 14.5958082,7.40299777 L13.0032662,8.99553978 C12.5581468,9.44065914 12.4477965,10.1206684 12.7293147,10.6837048 C13.0108329,11.2467412 12.9004826,11.9267505 12.4553632,12.3718698 L11.1176481,13.709585 Z" fill="#000000" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="navi-text font-size-lg">账号记录</span>
                                                        </a>
                                                    </div>
                                                    <div class="navi-item mb-2">
                                                        <a href="/user/setting/traffic_log" class="navi-link py-4">
                                                            <span class="navi-icon mr-2">
                                                                <span class="svg-icon">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                            <rect x="0" y="0" width="24" height="24"/>
                                                                            <path d="M5,5 L5,15 C5,15.5948613 5.25970314,16.1290656 5.6719139,16.4954176 C5.71978107,16.5379595 5.76682388,16.5788906 5.81365532,16.6178662 C5.82524933,16.6294602 15,7.45470952 15,7.45470952 C15,6.9962515 15,6.17801499 15,5 L5,5 Z M5,3 L15,3 C16.1045695,3 17,3.8954305 17,5 L17,15 C17,17.209139 15.209139,19 13,19 L7,19 C4.790861,19 3,17.209139 3,15 L3,5 C3,3.8954305 3.8954305,3 5,3 Z" fill="#000000" fill-rule="nonzero" transform="translate(10.000000, 11.000000) rotate(-315.000000) translate(-10.000000, -11.000000) "/>
                                                                            <path d="M20,22 C21.6568542,22 23,20.6568542 23,19 C23,17.8954305 22,16.2287638 20,14 C18,16.2287638 17,17.8954305 17,19 C17,20.6568542 18.3431458,22 20,22 Z" fill="#000000" opacity="0.3"/>
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="navi-text font-size-lg">流量记录</span>
                                                        </a>
                                                    </div>
                                                    <div class="navi-item mb-2">
                                                        <a href="/user/setting/profile" class="navi-link py-4">
                                                            <span class="navi-icon mr-2">
                                                                <span class="svg-icon">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
                                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                            <rect x="0" y="0" width="24" height="24" />
                                                                            <path d="M6,2 L18,2 C19.6568542,2 21,3.34314575 21,5 L21,19 C21,20.6568542 19.6568542,22 18,22 L6,22 C4.34314575,22 3,20.6568542 3,19 L3,5 C3,3.34314575 4.34314575,2 6,2 Z M12,11 C13.1045695,11 14,10.1045695 14,9 C14,7.8954305 13.1045695,7 12,7 C10.8954305,7 10,7.8954305 10,9 C10,10.1045695 10.8954305,11 12,11 Z M7.00036205,16.4995035 C6.98863236,16.6619875 7.26484009,17 7.4041679,17 C11.463736,17 14.5228466,17 16.5815,17 C16.9988413,17 17.0053266,16.6221713 16.9988413,16.5 C16.8360465,13.4332455 14.6506758,12 11.9907452,12 C9.36772908,12 7.21569918,13.5165724 7.00036205,16.4995035 Z" fill="#000000" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="navi-text font-size-lg">资料编辑</span>
                                                        </a>
                                                    </div>
                                                    <div class="navi-item mb-2">
                                                        <a href="/user/setting/safe" class="navi-link py-4">
                                                            <span class="navi-icon mr-2">
                                                                <span class="svg-icon">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                            <rect x="0" y="0" width="24" height="24"/>
                                                                            <path d="M4,4 L11.6314229,2.5691082 C11.8750185,2.52343403 12.1249815,2.52343403 12.3685771,2.5691082 L20,4 L20,13.2830094 C20,16.2173861 18.4883464,18.9447835 16,20.5 L12.5299989,22.6687507 C12.2057287,22.8714196 11.7942713,22.8714196 11.4700011,22.6687507 L8,20.5 C5.51165358,18.9447835 4,16.2173861 4,13.2830094 L4,4 Z" fill="#000000" opacity="0.3"/>
                                                                            <path d="M14.5,11 C15.0522847,11 15.5,11.4477153 15.5,12 L15.5,15 C15.5,15.5522847 15.0522847,16 14.5,16 L9.5,16 C8.94771525,16 8.5,15.5522847 8.5,15 L8.5,12 C8.5,11.4477153 8.94771525,11 9.5,11 L9.5,10.5 C9.5,9.11928813 10.6192881,8 12,8 C13.3807119,8 14.5,9.11928813 14.5,10.5 L14.5,11 Z M12,9 C11.1715729,9 10.5,9.67157288 10.5,10.5 L10.5,11 L13.5,11 L13.5,10.5 C13.5,9.67157288 12.8284271,9 12,9 Z" fill="#000000"/>
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="navi-text font-size-lg">账号安全</span>
                                                        </a>
                                                    </div>
                                                    <div class="navi-item mb-2">
                                                        <a href="/user/setting/detect" class="navi-link py-4">
                                                            <span class="navi-icon mr-2">
                                                                <span class="svg-icon">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                            <rect x="0" y="0" width="24" height="24"/>
                                                                            <path d="M4,4 L11.6314229,2.5691082 C11.8750185,2.52343403 12.1249815,2.52343403 12.3685771,2.5691082 L20,4 L20,13.2830094 C20,16.2173861 18.4883464,18.9447835 16,20.5 L12.5299989,22.6687507 C12.2057287,22.8714196 11.7942713,22.8714196 11.4700011,22.6687507 L8,20.5 C5.51165358,18.9447835 4,16.2173861 4,13.2830094 L4,4 Z" fill="#000000" opacity="0.3"/>
                                                                            <path d="M10.5857864,12 L9.17157288,10.5857864 C8.78104858,10.1952621 8.78104858,9.56209717 9.17157288,9.17157288 C9.56209717,8.78104858 10.1952621,8.78104858 10.5857864,9.17157288 L12,10.5857864 L13.4142136,9.17157288 C13.8047379,8.78104858 14.4379028,8.78104858 14.8284271,9.17157288 C15.2189514,9.56209717 15.2189514,10.1952621 14.8284271,10.5857864 L13.4142136,12 L14.8284271,13.4142136 C15.2189514,13.8047379 15.2189514,14.4379028 14.8284271,14.8284271 C14.4379028,15.2189514 13.8047379,15.2189514 13.4142136,14.8284271 L12,13.4142136 L10.5857864,14.8284271 C10.1952621,15.2189514 9.56209717,15.2189514 9.17157288,14.8284271 C8.78104858,14.4379028 8.78104858,13.8047379 9.17157288,13.4142136 L10.5857864,12 Z" fill="#000000"/>
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="navi-text font-size-lg">审计封禁</span>
                                                        </a>
                                                    </div>
                                                    <div class="navi-item mb-2">
                                                        <a href="/user/setting/sublink" class="navi-link py-4">
                                                            <span class="navi-icon mr-2">
                                                                <span class="svg-icon">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                            <rect x="0" y="0" width="24" height="24"/>
                                                                            <path d="M14,16 L12,16 L12,12.5 C12,11.6715729 11.3284271,11 10.5,11 C9.67157288,11 9,11.6715729 9,12.5 L9,17.5 C9,19.4329966 10.5670034,21 12.5,21 C14.4329966,21 16,19.4329966 16,17.5 L16,7.5 C16,5.56700338 14.4329966,4 12.5,4 L12,4 C10.3431458,4 9,5.34314575 9,7 L7,7 C7,4.23857625 9.23857625,2 12,2 L12.5,2 C15.5375661,2 18,4.46243388 18,7.5 L18,17.5 C18,20.5375661 15.5375661,23 12.5,23 C9.46243388,23 7,20.5375661 7,17.5 L7,12.5 C7,10.5670034 8.56700338,9 10.5,9 C12.4329966,9 14,10.5670034 14,12.5 L14,16 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.500000, 12.500000) rotate(-315.000000) translate(-12.500000, -12.500000) "/>
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="navi-text">订阅设置</span>
                                                        </a>
                                                    </div>
                                                    {if $metron['node_relay_enable'] === true}
                                                    <div class="navi-item mb-2">
                                                        <a href="/user/setting/relay" class="navi-link py-4">
                                                            <span class="navi-icon mr-2">
                                                                <span class="svg-icon">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                            <rect x="0" y="0" width="24" height="24"/>
                                                                            <path d="M6,7 C7.1045695,7 8,6.1045695 8,5 C8,3.8954305 7.1045695,3 6,3 C4.8954305,3 4,3.8954305 4,5 C4,6.1045695 4.8954305,7 6,7 Z M6,9 C3.790861,9 2,7.209139 2,5 C2,2.790861 3.790861,1 6,1 C8.209139,1 10,2.790861 10,5 C10,7.209139 8.209139,9 6,9 Z" fill="#000000" fill-rule="nonzero"/>
                                                                            <path d="M7,11.4648712 L7,17 C7,18.1045695 7.8954305,19 9,19 L15,19 L15,21 L9,21 C6.790861,21 5,19.209139 5,17 L5,8 L5,7 L7,7 L7,8 C7,9.1045695 7.8954305,10 9,10 L15,10 L15,12 L9,12 C8.27142571,12 7.58834673,11.8052114 7,11.4648712 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"/>
                                                                            <path d="M18,22 C19.1045695,22 20,21.1045695 20,20 C20,18.8954305 19.1045695,18 18,18 C16.8954305,18 16,18.8954305 16,20 C16,21.1045695 16.8954305,22 18,22 Z M18,24 C15.790861,24 14,22.209139 14,20 C14,17.790861 15.790861,16 18,16 C20.209139,16 22,17.790861 22,20 C22,22.209139 20.209139,24 18,24 Z" fill="#000000" fill-rule="nonzero"/>
                                                                            <path d="M18,13 C19.1045695,13 20,12.1045695 20,11 C20,9.8954305 19.1045695,9 18,9 C16.8954305,9 16,9.8954305 16,11 C16,12.1045695 16.8954305,13 18,13 Z M18,15 C15.790861,15 14,13.209139 14,11 C14,8.790861 15.790861,7 18,7 C20.209139,7 22,8.790861 22,11 C22,13.209139 20.209139,15 18,15 Z" fill="#000000" fill-rule="nonzero"/>
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="navi-text">节点中转</span>
                                                        </a>
                                                    </div>
                                                    {/if}
                                                    <div class="navi-item mb-2">
                                                        <a href="/user/setting/invite" class="navi-link py-4">
                                                            <span class="navi-icon mr-2">
                                                                <span class="svg-icon">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
                                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                            <rect x="0" y="0" width="24" height="24" />
                                                                            <path d="M6,2 L18,2 C18.5522847,2 19,2.44771525 19,3 L19,12 C19,12.5522847 18.5522847,13 18,13 L6,13 C5.44771525,13 5,12.5522847 5,12 L5,3 C5,2.44771525 5.44771525,2 6,2 Z M7.5,5 C7.22385763,5 7,5.22385763 7,5.5 C7,5.77614237 7.22385763,6 7.5,6 L13.5,6 C13.7761424,6 14,5.77614237 14,5.5 C14,5.22385763 13.7761424,5 13.5,5 L7.5,5 Z M7.5,7 C7.22385763,7 7,7.22385763 7,7.5 C7,7.77614237 7.22385763,8 7.5,8 L10.5,8 C10.7761424,8 11,7.77614237 11,7.5 C11,7.22385763 10.7761424,7 10.5,7 L7.5,7 Z" fill="#000000" opacity="0.3" />
                                                                            <path d="M3.79274528,6.57253826 L12,12.5 L20.2072547,6.57253826 C20.4311176,6.4108595 20.7436609,6.46126971 20.9053396,6.68513259 C20.9668779,6.77033951 21,6.87277228 21,6.97787787 L21,17 C21,18.1045695 20.1045695,19 19,19 L5,19 C3.8954305,19 3,18.1045695 3,17 L3,6.97787787 C3,6.70173549 3.22385763,6.47787787 3.5,6.47787787 C3.60510559,6.47787787 3.70753836,6.51099993 3.79274528,6.57253826 Z" fill="#000000" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="navi-text">邀请注册</span>
                                                        </a>
                                                    </div>
                                                    <div class="navi-item mb-2">
                                                        <a href="/user/setting/telegram" class="navi-link py-4">
                                                            <span class="navi-icon mr-2">
                                                                <span class="svg-icon">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                            <rect x="0" y="0" width="24" height="24"/>
                                                                            <path d="M3,13.5 L19,12 L3,10.5 L3,3.7732928 C3,3.70255344 3.01501031,3.63261921 3.04403925,3.56811047 C3.15735832,3.3162903 3.45336217,3.20401298 3.70518234,3.31733205 L21.9867539,11.5440392 C22.098181,11.5941815 22.1873901,11.6833905 22.2375323,11.7948177 C22.3508514,12.0466378 22.2385741,12.3426417 21.9867539,12.4559608 L3.70518234,20.6826679 C3.64067359,20.7116969 3.57073936,20.7267072 3.5,20.7267072 C3.22385763,20.7267072 3,20.5028496 3,20.2267072 L3,13.5 Z" fill="#000000"/>
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="navi-text font-size-lg">Telegram 设置</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>