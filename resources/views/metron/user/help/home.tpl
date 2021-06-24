                                {include file='user/help/head.tpl'}

                                <div class="row">
                                    {$num = count($classList_L2)}
                                    {if $num % 2 != 0}
                                    {$dan = 1}
                                    {else}
                                    {$dan = 0}
                                    {/if}
                                    {foreach $classList_L2 as $list_L2}
                                    {if isset($dan) && $dan && $dan === $num}
                                    <div class="col-lg-12">
                                    {else}
                                    <div class="col-lg-6">
                                    {$dan=$dan+1}
                                    {/if}
                                        <div class="card card-custom mb-8 gutter-b card-stretch {$metron['style_shadow']}">
                                            <div class="card-body">
                                                <div class="p-6">
                                                    <h2 class="text-primary mb-8">{if $list_L2->li != null}<li class="{$list_L2->li}" style="float: left;list-style: none;"></li>&nbsp;{/if}{$list_L2->name}
                                                    {if $list_L2->url}
                                                    <div class="card-toolbar pull-r">
                                                        <a href="{$list_L2->url}" class="btn btn-primary font-weight-bold mr-2">安装教程</a>
                                                    </div>
                                                    {/if}
                                                    </h2>
                                                    <div class="accordion accordion-light accordion-light-borderless accordion-svg-toggle" id="tab-help-{$list_L2->id}">

                                                        {foreach $pageDoc as $doc}
                                                        {if $doc->class == $list_L2->id}
                                                        <div class="card">
                                                            <div class="card-header" id="a-{$doc->id}">
                                                                <div class="card-title {if $doc->ontop != 1}collapsed{/if}" data-toggle="collapse" data-target="#b-{$doc->id}" aria-expanded="false" aria-controls="b-{$doc->id}">
                                                                    <span class="svg-icon svg-icon-primary">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
                                                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                                <polygon points="0 0 24 0 24 24 0 24" />
                                                                                <path d="M12.2928955,6.70710318 C11.9023712,6.31657888 11.9023712,5.68341391 12.2928955,5.29288961 C12.6834198,4.90236532 13.3165848,4.90236532 13.7071091,5.29288961 L19.7071091,11.2928896 C20.085688,11.6714686 20.0989336,12.281055 19.7371564,12.675721 L14.2371564,18.675721 C13.863964,19.08284 13.2313966,19.1103429 12.8242777,18.7371505 C12.4171587,18.3639581 12.3896557,17.7313908 12.7628481,17.3242718 L17.6158645,12.0300721 L12.2928955,6.70710318 Z" fill="#000000" fill-rule="nonzero" />
                                                                                <path d="M3.70710678,15.7071068 C3.31658249,16.0976311 2.68341751,16.0976311 2.29289322,15.7071068 C1.90236893,15.3165825 1.90236893,14.6834175 2.29289322,14.2928932 L8.29289322,8.29289322 C8.67147216,7.91431428 9.28105859,7.90106866 9.67572463,8.26284586 L15.6757246,13.7628459 C16.0828436,14.1360383 16.1103465,14.7686056 15.7371541,15.1757246 C15.3639617,15.5828436 14.7313944,15.6103465 14.3242754,15.2371541 L9.03007575,10.3841378 L3.70710678,15.7071068 Z" fill="#000000" fill-rule="nonzero" opacity="0.3" transform="translate(9.000003, 11.999999) rotate(-270.000000) translate(-9.000003, -11.999999) " />
                                                                            </g>
                                                                        </svg>
                                                                    </span>
                                                                    <div class="card-label  {$style[$theme_style]['global']['text']} pl-4">{$doc->title}</div>
                                                                </div>
                                                            </div>
                                                            <div id="b-{$doc->id}" class="collapse {if $doc->ontop == 1}show{/if}" aria-labelledby="a-{$doc->id}" data-parent="#tab-help-{$list_L2->id}">
                                                                <div class="card-body text-dark-50 font-size-lg pl-12">
                                                                    {$doc->content}
                                                                </div>
                                                            </div>
                                                        </div>
                                                        {/if}
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
