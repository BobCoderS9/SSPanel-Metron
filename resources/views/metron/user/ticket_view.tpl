<!DOCTYPE html>
<html lang="en">
    <head>
        <title>工单系统 &mdash; {$config["appName"]}</title>
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
                                        <h2 class="text-white font-weight-bold my-2 mr-5">工单 #{$id}</h2>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    <a href="/user/ticket" class="btn btn-white font-weight-bold py-3 px-6">返回工单列表</a>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex flex-column-fluid" id="ticket_view" data-ticketid="{$id}">

                            <div class="container">

                                <div class="row">
                                    <div class="col-12">

                                        <div class="card card-custom {$metron['style_shadow']}">
                                            <div class="card-header align-items-center flex-wrap justify-content-between py-5 h-auto">
                                                <div class="d-flex align-items-center my-2">
                                                    <a href="/user/ticket" class="btn btn-clean btn-icon btn-sm mr-6" data-inbox="back">
                                                        <i class="flaticon2-left-arrow-1"></i>
                                                    </a>
                                                    <div class="font-weight-bold font-size-h3 text-primary mr-3"><strong>{$title}</strong></div>
                                                    <!--<span class="label label-light-primary font-weight-bold label-inline mr-2">处理中</span>-->
                                                </div>
                                                <!--
                                                <div class="d-flex align-items-center justify-content-end text-right my-2">
                                                    <span class="text-muted font-weight-bold mr-4" data-toggle="dropdown"> </span>
                                                    <span class="btn btn-default btn-icon btn-sm mr-2" data-toggle="tooltip" title="上一页">
                                                        <i class="ki ki-bold-arrow-back icon-sm"></i>
                                                    </span>
                                                    <span class="btn btn-default btn-icon btn-sm mr-2" data-toggle="tooltip" title="下一页">
                                                        <i class="ki ki-bold-arrow-next icon-sm"></i>
                                                    </span>
                                                </div>-->
                                            </div>

                                            <div class="card-body p-0">
                                                <div class="card-spacer mb-3" id="ticket_reply">
                                                    <div class="card card-custom shadow-sm">
                                                        <div class="card-body p-0">
                                                            <form id="ticket_reply_form">
                                                                <div class="d-block">
                                                                    <div id="ticket_reply_editor" class="border-0" style="height: 150px"></div>
                                                                    <div class="dropzone dropzone-multi px-8 py-4" id="ticket_reply_attachments">
                                                                        <div class="dropzone-items">
                                                                            <div class="dropzone-item" style="display:none">
                                                                                <div class="dropzone-file">
                                                                                    <div class="dropzone-filename" title="some_image_file_name.jpg">
                                                                                        <span data-dz-name="">some_image_file_name.jpg</span>
                                                                                        <strong>(
                                                                                        <span data-dz-size="">340kb</span>)</strong>
                                                                                    </div>
                                                                                    <div class="dropzone-error" data-dz-errormessage=""></div>
                                                                                </div>
                                                                                <div class="dropzone-progress">
                                                                                    <div class="progress">
                                                                                        <div class="progress-bar bg-primary" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" data-dz-uploadprogress=""></div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="dropzone-toolbar">
                                                                                    <span class="dropzone-delete" data-dz-remove="">
                                                                                        <i class="flaticon2-cross"></i>
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="d-flex align-items-center justify-content-between py-5 pl-8 pr-5 border-top">
                                                                    <div class="d-flex align-items-center mr-3">
                                                                        <div class="btn-group mr-4">
                                                                            <span class="btn btn-primary font-weight-bold px-6" id="ticket_reply_submit" onclick="ticket.reply();">回复工单</span>
                                                                        </div>
                                                                        <!--<span class="btn btn-icon btn-sm btn-clean mr-2" id="ticket_reply_attachments_select">
                                                                            <i class="flaticon2-clip-symbol"></i>
                                                                        </span>-->
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    {foreach $ticketset as $ticket}
                                                    <div class="cursor-pointer shadow-xs toggle-on" data-inbox="message">
                                                        <div class="d-flex align-items-center card-spacer-x py-6">
                                                            <span class="symbol symbol-50 mr-4">
                                                                <span class="symbol-label" style="background-image: url('{$ticket->User()->gravatar}')"></span>
                                                            </span>
                                                            <div class="d-flex flex-column flex-grow-1 flex-wrap mr-2">
                                                                <div class="d-flex">
                                                                    <a href="#" class="font-size-lg font-weight-bolder {$style[$theme_style]['global']['text']} text-hover-primary mr-2">{$ticket->User()->user_name}</a>
                                                                    <div class="font-weight-bold text-muted">
                                                                        {if $ticket->User()->isAdmin()}
                                                                        <span class="label label-success label-dot mr-2"></span>客服回复
                                                                        {else}
                                                                        <span class="label label-primary label-dot mr-2"></span>用户回复
                                                                        {/if}
                                                                    </div>
                                                                </div>
                                                                <div class="d-flex flex-column">
                                                                    <div class="toggle-off-item">
                                                                        <span class="font-weight-bold text-muted cursor-pointer" data-toggle="dropdown">内容已展开
                                                                        <i class="flaticon2-down icon-xs ml-1 text-dark-50"></i></span>
                                                                    </div>
                                                                    <div class="text-muted font-weight-bold toggle-on-item" data-inbox="toggle">内容已折叠</div>
                                                                </div>
                                                            </div>
                                                            <div class="d-flex align-items-center">
                                                                <div class="font-weight-bold text-muted mr-2">{date('Y-m-d H:i:s', $ticket->datetime)}</div>
                                                            </div>
                                                        </div>
                                                        <div class="card-spacer-x py-3 toggle-off-item">
                                                            {if $ticket->User()->isAdmin()}
                                                            <p>您好，{$user->user_name}</p>
                                                            {/if}
                                                            <p>{$ticket->content}</p>
                                                        </div>
                                                    </div>
                                                    {/foreach}
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
    </body>
</html>