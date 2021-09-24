<script> var ThemeStyle = JSON.parse('{$style[$theme_style]['JavaScript']}'); </script>
<script> var ASSETS_URL = "{$metron['assets_url']}"; </script>
<script src="{$metron['assets_url']}/plugins/global/plugins.bundle.js"></script>
<script src="{$metron['assets_url']}/js/metron-plugin.js"></script>
<script src="{$metron['assets_url']}/js/scripts.js"></script>
<script src="{$metron['assets_url']}/js/metron.js"></script>

{if $metron['enable_cust'] === 'crisp' && $metron['crisp_id'] != ''}
    {include file='include/global/crisp.tpl'}
{elseif $metron['enable_cust'] === 'chatra' && $metron['chatra_id'] != ''}
    {include file='include/global/chatra.tpl'}
{/if}
