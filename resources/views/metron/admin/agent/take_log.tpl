{include file='admin/main.tpl'}

<main class="content">
    <div class="content-header ui-content-header">
        <div class="container">
            <h1 class="content-heading">提现处理</h1>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-12 col-md-12">
            <section class="content-inner margin-top-no">

                <div class="card">
                    <div class="card-main">
                        <div class="card-inner">
                            <p>显示表项:
                                {include file='table/checkbox.tpl'}
                            </p>
                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                    {include file='table/table.tpl'}
                </div>

                <div class="fbtn-container">
                    <div class="fbtn-inner">
                        <a class="fbtn fbtn-lg fbtn-brand-accent waves-attach waves-circle waves-light"
                           href="/admin/help/document/create">+</a>

                    </div>
                </div>

                <div aria-hidden="true" class="modal modal-va-middle fade" id="mark_done_modal" role="dialog"
                     tabindex="-1">
                    <div class="modal-dialog modal-xs">
                        <div class="modal-content">
                            <div class="modal-heading">
                                <a class="modal-close" data-dismiss="modal">×</a>
                                <h2 class="modal-title">标记该申请为已完成？</h2>
                            </div>
                            <div class="modal-inner">
                                <p>请您确认。</p>
                            </div>
                            <div class="modal-footer">
                                <p class="text-right">
                                    <button class="btn btn-flat btn-brand-accent waves-attach waves-effect"
                                            data-dismiss="modal" type="button">取消
                                    </button>
                                    <button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal"
                                            id="mark_done_input" type="button">确定
                                    </button>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div aria-hidden="true" class="modal modal-va-middle fade" id="go_back_modal" role="dialog"
                     tabindex="-1">
                    <div class="modal-dialog modal-xs">
                        <div class="modal-content">
                            <div class="modal-heading">
                                <a class="modal-close" data-dismiss="modal">×</a>
                                <h2 class="modal-title">确认要拒绝申请？</h2>
                            </div>
                            <div class="modal-inner">
                                <p>拒绝后申请的金额原路退回申请者的返利余额</p>
                            </div>
                            <div class="modal-footer">
                                <p class="text-right">
                                    <button class="btn btn-flat btn-brand-accent waves-attach waves-effect"
                                            data-dismiss="modal" type="button">取消
                                    </button>
                                    <button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal"
                                            id="go_back_input" type="button">确定
                                    </button>
                                </p>
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
    function mark_done_modal_show(id) {
        markid = id;
        $("#mark_done_modal").modal();
    }

    function go_back_modal_show(id) {
        backid = id;
        $("#go_back_modal").modal();
    }

    {include file='table/js_1.tpl'}

    window.addEventListener('load', () => {

        {include file='table/js_2.tpl'}

        function mark_done() {
            $.ajax({
                type: "PUT",
                url: "/admin/agent/take_update/mark_done",
                dataType: "json",
                data: {
                    id: markid
                },
                success: data => {
                    if (data.ret) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        window.location.reload();
                    } else {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                    }
                },
                error: jqXHR => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = `${ldelim}data.msg{rdelim} 发生错误了。`;
                }
            });
        }

        function go_back() {
            $.ajax({
                type: "PUT",
                url: "/admin/agent/take_update/go_back",
                dataType: "json",
                data: {
                    id: backid
                },
                success: data => {
                    if (data.ret) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        window.location.reload();
                    } else {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                    }
                },
                error: jqXHR => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = `${ldelim}data.msg{rdelim} 发生错误了。`;
                }
            });
        }

        $$.getElementById('mark_done_input').addEventListener('click', mark_done);
        $$.getElementById('go_back_input').addEventListener('click', go_back);
    })

</script>
