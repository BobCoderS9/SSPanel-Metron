{include file='admin/main.tpl'}

<main class="content">
    <div class="content-header ui-content-header">
        <div class="container">
            <h1 class="content-heading">创建分类</h1>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-12 col-md-12">
            <section class="content-inner margin-top-no">

                <div class="card">
                    <div class="card-main">
                        <div class="card-inner">

                            <div class="form-group form-group-label">
                                <label class="floating-label" for="title">分类名称</label>
                                <input class="form-control maxwidth-edit" id="title" name="title" type="text" value="">
                            </div>

                            <div class="form-group form-group-label">
                                <label class="floating-label" for="ico">图标</label>
                                <input class="form-control maxwidth-edit" id="ico" name="ico" type="text" value="">
                            </div>

                            <div class="form-group form-group-label">
                                <label class="floating-label" for="sort">排序</label>
                                <input class="form-control maxwidth-edit" id="sort" name="sort" type="text" value="0">
                            </div>
                            <p class="form-control-guide"><i class="material-icons">info</i>数组越大越靠前(最多5位数)</p>

                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-main">
                        <div class="card-inner">

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-10 col-md-push-1">

                                        <div class="form-group form-group-label">
                                            <div class="checkbox switch">
                                                <label for="is_1ji">
                                                    <input class="access-hide" id="is_1ji" type="radio" name="is_dji" value="1"><span class="switch-toggle"></span>设置为一级分类
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-group form-group-label">
                                            <div class="checkbox switch">
                                                <label for="is_2ji">
                                                    <input class="access-hide" id="is_2ji" type="radio" name="is_dji" value="2"><span class="switch-toggle"></span>设置为二级分类
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-group form-group-label" id="get1jiclass" style="display:none">
                                            <label for="class_1">
                                                <label class="floating-label" for="class_1">归属于哪个一级分类</label>
                                                <select id="class_1" class="form-control maxwidth-edit" name="class_1">
                                                        <option value="0">请选择一级分类</option>
                                                </select>
                                            </label>
                                            <p class="form-control-guide"><i class="material-icons">info</i>添加为二级分类时,需要为它指定关联的一级分类</p>
                                        </div>

                                        <div class="form-group form-group-label">
                                            <div class="checkbox switch">
                                                <label for="pageshow">
                                                    <input class="access-hide" id="pageshow" type="checkbox" checked='checked' name="pageshow"><span class="switch-toggle"></span>页面是否显示该分类以及文档
                                                </label>
                                                <p class="form-control-guide"><i class="material-icons">info</i>开启: 用户界面的文档中心会显示此分类以及此分类下的文档</p>
                                                <p class="form-control-guide"><i class="material-icons">info</i>关闭: 用户界面的文档中心隐藏此分类,包括此分类下的文档</p>
                                            </div>
                                        </div>

                                        <button id="submit" type="submit"
                                                class="btn btn-block btn-brand waves-attach waves-light">添加
                                        </button>
                                    </div>
                                </div>
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
$('input:radio[name="is_dji"]').click(function(){
	var checkValue = $('input:radio[name="is_dji"]:checked').val(); 
    var get1ji = document.getElementById("get1jiclass");
	if (checkValue == 2) {
        get1ji.style.display="block";
        getclass();
    } else {
        get1ji.style.display="none";
    }
});

function getclass() {
    $("#class_1").empty();
    $("#class_1").append("<option value='0'>正在获取分类...</option>");
    $.ajax({
        type: 'GET',
        url: '/admin/help/document/gethelpclass',
        dataType: "json",
        data: { },
        success: data => {
            $("#class_1").empty();
            if (data.ret === 0){
                $("#class_1").append("<option value='0'>"+data.msg+"</option>");
            } else {
                $("#class_1").append("<option value='0'>请选择一级分类</option>");
                for(var i=0; i<data.length; i++) {
                    $("#class_1").append('<option value='+data[i].id+'>#'+data[i].id + ' - '+data[i].name+'</option>');
                }
            }
        },
        error: jqXHR => {
            $("#result").modal();
            $$.getElementById('msg').innerHTML = `发生错误：${ jqXHR.status }`;
        }
    });
}
</script>
<script>
    window.addEventListener('load', () => {
        function submit() {

            if ($$.getElementById('pageshow').checked) {
                var pageshow = 1;
            } else {
                var pageshow = 0;
            }

            $.ajax({
                type: "POST",
                url: "/admin/help/class",
                dataType: "json",
                data: {
                    name: $$getValue('title'),
                    classji: $('input:radio[name="is_dji"]:checked').val(),
                    class1ji: $$getValue('class_1'),
                    pageshow: pageshow,
                    ico: $$getValue('ico'),
                    sort: $$getValue('sort'),
                },
                success: data => {
                    if (data.ret === 1) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        window.setTimeout("location.href=top.document.referrer", {$config['jump_delay']});
                    } else if (data.ret === 2) {
                        submit(data.msg);
                    } else {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                    }
                },
                error: jqXHR => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = `发生错误：${
                            jqXHR.status
                            }`;
                }
            });
        }

        $$.getElementById('submit').addEventListener('click', () => {
            submit();
        });
    });
    
    function getClass() {

    }

</script>
