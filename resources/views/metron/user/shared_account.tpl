<!DOCTYPE html>
<html lang="en">
    <head>
        <title>共享账号 &mdash; {$config["appName"]}</title>
        <link href="{$metron['assets_url']}/css/pages/users/shared_account.css" rel="stylesheet" type="text/css" />
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
                                        <h2 class="text-white font-weight-bold my-2 mr-5">共享账号</h2>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                
                                </div>
                            </div>
                        </div>

                        <div class="d-flex flex-column-fluid">
                            <div class="container">
                                {$css = [
                                    1 => 'primary', 
                                    2 => 'success', 
                                    3 => 'warning', 
                                    4 => 'danger', 
                                    5 => 'info']}
                                {$fornum = 0}
                                <div class="row">
                                    {foreach $metron['shared_account'] as $type}
                                    {if $type['show'] === false}
                                    {continue}
                                    {/if}
                                    {$fornum=$fornum+1}
                                    {$typeNum = count($type) - 1 }
                                    <div class="col-lg-12">
                                        <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                            <div class="card-header">
                                                <div class="card-title">
                                                    <h3 class="card-label text-{$css[$fornum]}"><strong>{$type@key}</strong></h3>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div>
                                                    <div class="kanban-container" style="width: 750px;">
                                                        {foreach $type as $acc}
                                                        {if is_bool($acc)}
                                                        {continue}
                                                        {/if}
                                                        <div data-id="_inprocess" data-order="1" class="kanban-board {if $typeNum===1}kanban-1{elseif $typeNum===2}kanban-2{elseif $typeNum===3}kanban-3{elseif $typeNum===4}kanban-4{elseif $typeNum >= 5}kanban-5{/if} " style="width: 250px; margin-left: 0px; margin-right: 0px;">
                                                            <header class="kanban-board-header light-{$css[$fornum]}">
                                                                <div class="kanban-title-board">{$acc['name']}&nbsp;&nbsp;&nbsp;{if $acc['class'] > 0}{$metron['user_level'][$acc['class']]}专享{/if}
                                                                    {if $user->class >= $acc['class'] && $acc['check'] === true}
                                                                    <span class="btn btn-primary font-weight-bold btn-sm pull-r cursor_onclick" onclick="shared_account.check('{$type@key}', '{$acc@key}');">检测账号</span>
                                                                    {/if}
                                                                </div>
                                                            </header>
                                                            <main class="kanban-drag">
                                                                {if $user->class >= $acc['class']}
                                                                <label>账号：</label>
                                                                <div class="{$style[$theme_style]['shared']['item']} kanban-item copy-text cursor_onclick" data-clipboard-text="{$acc['account']}">{$acc['account']}</div>
                                                                <label>密码：</label>
                                                                <div class="{$style[$theme_style]['shared']['item']} kanban-item copy-text cursor_onclick" data-clipboard-text="{$acc['passwd']}">{if $acc['hidepawd'] === true}点击复制后在密码框粘贴{else}{$acc['passwd']}{/if}</div>
                                                                {else}
                                                                <label>账号：</label>
                                                                <div class="{$style[$theme_style]['shared']['item']} kanban-item">该账号仅 <span class="text-{$css[$fornum]}">{$metron['user_level'][$acc['class']]}[LV.{$acc['class']}]</span> 及以上会员可用</div>
                                                                <label>密码：</label>
                                                                <div class="{$style[$theme_style]['shared']['item']} kanban-item">该账号仅 <span class="text-{$css[$fornum]}">{$metron['user_level'][$acc['class']]}[LV.{$acc['class']}]</span> 及以上会员可用</div>
                                                                {/if}
                                                            </main>
                                                            <footer></footer>
                                                        </div>
                                                        {/foreach}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    {/foreach}
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