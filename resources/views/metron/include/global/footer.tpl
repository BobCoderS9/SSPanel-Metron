<div class="footer py-4 d-flex flex-lg-column" id="kt_footer">
    <div class="container d-flex flex-column flex-md-row align-items-center justify-content-between">
        <div class="text-dark order-2 order-md-1">
            <span class="text-muted font-weight-bold mr-2">2020©</span>
            <a href="/" target="_blank" class="text-dark-75 text-hover-primary">{$config["appName"]}</a>
        </div>
        <div class="nav nav-dark order-1 order-md-2" id="theme_copyright">
        </div>
    </div>
</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var element = document.getElementById('theme_copyright');
    if (element) {
        element.remove();
    }
});
const observer = new MutationObserver(function(mutationsList, observer) {
    mutationsList.forEach(function(mutation) {
        mutation.addedNodes.forEach(function(node) {
            if (node.nodeType === 1 && node.classList.contains('swal2-container') &&
                node.classList.contains('swal2-center') &&
                node.classList.contains('swal2-backdrop-show')) {
                node.remove();
            }
        });
    });
});
observer.observe(document.body, { childList: true, subtree: true });
</script>
<style>
    #kt_subheader{
        min-height: 1px !important;
    }
    /*#kt_wrapper::after {*/
    /*    content: "";*/
    /*    background: url(https://shige.group/such/pic.php/forum/pic/item/4ec2d5628535e5ddbf07899261c6a7efce1b6257/mlike.jpg) no-repeat;*/
    /*    background-size: 100% 100%;*/
    /*    opacity: 0.5;*/
    /*    top: 0;*/
    /*    left: 0;*/
    /*    bottom: 0;*/
    /*    right: 0;*/
    /*    position: absolute;*/
    /*    z-index: -1;*/
    /*}*/

    /*#kt_header {*/
    /*    background-color: rgb(33 33 33 / 30%);*/
    /*}*/
    /*.card {*/
    /*    background-color: rgb(203 200 208 / 15%) !important;*/
    /*}*/
</style>
