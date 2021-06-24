{include file='admin/main.tpl'}
<main class="content">
    <div class="content-header ui-content-header">
        <div class="container">
            <h1 class="content-heading"> Bob客户端</h1>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-12 col-md-12">
            <section class="content-inner margin-top-no">
                <div class="card">
                    <div class="card-main">
                        <div class="card-inner">
                            <div class="form-group form-group-label">
                                <label class="floating-label" for="content">配置文件</label>
                                <textarea class="form-control maxwidth-edit" id="content" rows="20">
                                    {json_encode($config)}
                                </textarea>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>

</main>

{include file='admin/footer.tpl'}


<script>
    {literal}
    $('#main_form').validate({
        rules: {
            name: {required: true},
            method: {required: true},
            rate: {required: true},
            info: {required: true},
            group: {required: true},
            status: {required: true},
            node_speedlimit: {required: true},
            sort: {required: true},
            node_bandwidth_limit: {required: true},
            bandwidthlimit_resetday: {required: true}
        },

        submitHandler: () => {
            if ($$.getElementById('custom_method').checked) {
                var custom_method = 1;
            } else {
                var custom_method = 0;
            }

            if ($$.getElementById('type').checked) {
                var type = 1;
            } else {
                var type = 0;
            }
            {/literal}
            if ($$.getElementById('custom_rss').checked) {
                var custom_rss = 1;
            } else {
                var custom_rss = 0;
            }

            $.ajax({
                type: "POST",
                url: "/admin/node",
                dataType: "json",
                data: {
                    name: $$getValue('name'),
                    server: $$getValue('server'),
                    node_ip: $$getValue('node_ip'),
                    method: $$getValue('method'),
                    port: $$getValue("port"),
                    obfs: $$getValue("obfs"),
                    protocol: $$getValue("protocol"),
                    passwd: $$getValue("passwd"),
                    custom_method,
                    rate: $$getValue('rate'),
                    info: $$getValue('info'),
                    type,
                    group: $$getValue('group'),
                    status: $$getValue('status'),
                    node_speedlimit: $$getValue('node_speedlimit'),
                    sort: $$getValue('sort'),
                    class: $$getValue('class'),
                    node_bandwidth_limit: $$getValue('node_bandwidth_limit'),
                    bandwidthlimit_resetday: $$getValue('bandwidthlimit_resetday'),
                    custom_rss,
                    mu_only: $$getValue('mu_only')
                },
                success: data => {
                    if (data.ret) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        window.setTimeout("location.href=top.document.referrer", {$config['jump_delay']});
                    } else {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                    }
                },
                error: (jqXHR) => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = `发生错误：${
                            jqXHR.status
                    }`;
                }
            });
        }
    });

</script>
