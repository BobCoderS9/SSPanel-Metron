{include file='admin/main.tpl'}

<main class="content">
    <div class="content-header ui-content-header">
        <div class="container">
            <h1 class="content-heading">汇总</h1>
        </div>
    </div>
    <div class="container">
        <section class="content-inner margin-top-no">
            <div class="row">
                <div class="col-xx-12">
                    <div class="card margin-bottom-no">
                        <div class="card-main">
                            <div class="card-inner">
                                <p>下面是系统运行情况简报。</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui-card-wrap">
                <div class="row">

                    <div class="col-xx-12 col-sm-6">


                        <div class="card">
                            <div class="card-main">
                                <div class="card-inner">
                                    <h5>收入情况</h5>
                                    {foreach $days as $day}
                                    <button class="mdl-button mdl-js-button mdl-button--raised" onclick="getIncome('{$day}')">{$day}</button>
                                    {/foreach}
                                    <p id="income_text" style="margin-top: 10px;">loading</p>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-main">
                                <div class="card-inner">

                                    <div id="check_chart" style="height: 300px; width: 100%;"></div>

                                    <script src="//cdn.jsdelivr.net/gh/SuicidalCat/canvasjs.js@v2.3.1/canvasjs.min.js"></script>
                                    <script>
                                        var chart = new CanvasJS.Chart("check_chart",
                                                {
                                                    title: {
                                                        text: "用户签到情况(总用户 {$sts->getTotalUser()}人)",
                                                        fontFamily: "Impact",
                                                        fontWeight: "normal"
                                                    },

                                                    legend: {
                                                        verticalAlign: "bottom",
                                                        horizontalAlign: "center"
                                                    },
                                                    data: [
                                                        {
                                                            //startAngle: 45,
                                                            indexLabelFontSize: 20,
                                                            indexLabelFontFamily: "Garamond",
                                                            indexLabelFontColor: "darkgrey",
                                                            indexLabelLineColor: "darkgrey",
                                                            indexLabelPlacement: "outside",
                                                            type: "doughnut",
                                                            showInLegend: true,
                                                            dataPoints: [
                                                                {
                                                                    y: {(1-($sts->getCheckinUser()/$sts->getTotalUser()))*100},
                                                                    legendText: "没有签到过的用户 {number_format((1-($sts->getCheckinUser()/$sts->getTotalUser()))*100,2)}% {$sts->getTotalUser()-$sts->getCheckinUser()}人",
                                                                    indexLabel: "没有签到过的用户 {number_format((1-($sts->getCheckinUser()/$sts->getTotalUser()))*100,2)}% {$sts->getTotalUser()-$sts->getCheckinUser()}人"
                                                                },
                                                                {
                                                                    y: {(($sts->getCheckinUser()-$sts->getTodayCheckinUser())/$sts->getTotalUser())*100},
                                                                    legendText: "曾经签到过的用户 {number_format((($sts->getCheckinUser()-$sts->getTodayCheckinUser())/$sts->getTotalUser())*100,2)}% {$sts->getCheckinUser()-$sts->getTodayCheckinUser()}人",
                                                                    indexLabel: "曾经签到过的用户 {number_format((($sts->getCheckinUser()-$sts->getTodayCheckinUser())/$sts->getTotalUser())*100,2)}% {$sts->getCheckinUser()-$sts->getTodayCheckinUser()}人"
                                                                },
                                                                {
                                                                    y: {$sts->getTodayCheckinUser()/$sts->getTotalUser()*100},
                                                                    legendText: "今日签到用户 {number_format($sts->getTodayCheckinUser()/$sts->getTotalUser()*100,2)}% {$sts->getTodayCheckinUser()}人",
                                                                    indexLabel: "今日签到用户 {number_format($sts->getTodayCheckinUser()/$sts->getTotalUser()*100,2)}% {$sts->getTodayCheckinUser()}人"
                                                                }
                                                            ]
                                                        }
                                                    ]
                                                });

                                        chart.render();

                                        function chartRender(chart) {
                                            chart.render();
                                            chart.ctx.shadowBlur = 8;
                                            chart.ctx.shadowOffsetX = 4;
                                            chart.ctx.shadowColor = "black";

                                            for (let i in chart.plotInfo.plotTypes) {
                                                let plotType = chart.plotInfo.plotTypes[i];
                                                for (let j in plotType.plotUnits) {
                                                    let plotUnit = plotType.plotUnits[j];
                                                    if (plotUnit.type === "doughnut") {
                                                        // For Column Chart
                                                        chart.renderDoughnut(plotUnit);
                                                    } else if (plotUnit.type === "bar") {
                                                        // For Bar Chart
                                                        chart.renderBar(plotUnit);
                                                    }
                                                }
                                            }
                                            chart.ctx.shadowBlur = 0;
                                            chart.ctx.shadowOffsetX = 0;
                                            chart.ctx.shadowColor = "transparent";
                                        }
                                    </script>

                                </div>

                            </div>
                        </div>


                        <div class="card">
                            <div class="card-main">
                                <div class="card-inner">

                                    <div id="alive_chart" style="height: 300px; width: 100%;"></div>

                                    <script src="//cdn.jsdelivr.net/gh/YihanH/canvasjs.js@v2.2/canvasjs.min.js"></script>
                                    <script type="text/javascript">
                                        var chart = new CanvasJS.Chart("alive_chart",
                                                {
                                                    title: {
                                                        text: "用户在线情况(总用户 {$sts->getTotalUser()}人)",
                                                        fontFamily: "Impact",
                                                        fontWeight: "normal"
                                                    },

                                                    legend: {
                                                        verticalAlign: "bottom",
                                                        horizontalAlign: "center"
                                                    },
                                                    data: [
                                                        {
                                                            //startAngle: 45,
                                                            indexLabelFontSize: 20,
                                                            indexLabelFontFamily: "Garamond",
                                                            indexLabelFontColor: "darkgrey",
                                                            indexLabelLineColor: "darkgrey",
                                                            indexLabelPlacement: "outside",
                                                            type: "doughnut",
                                                            showInLegend: true,
                                                            dataPoints: [
                                                                {
                                                                    y: {(($sts->getUnusedUser()/$sts->getTotalUser()))*100},
                                                                    legendText: "从未在线的用户 {number_format((($sts->getUnusedUser()/$sts->getTotalUser()))*100,2)}% {(($sts->getUnusedUser()))}人",
                                                                    indexLabel: "从未在线的用户 {number_format((($sts->getUnusedUser()/$sts->getTotalUser()))*100,2)}% {(($sts->getUnusedUser()))}人"
                                                                },
                                                                {
                                                                    y: {(($sts->getTotalUser()-$sts->getOnlineUser(86400)-$sts->getUnusedUser())/$sts->getTotalUser())*100},
                                                                    legendText: "一天以前在线的用户 {number_format((($sts->getTotalUser()-$sts->getOnlineUser(86400)-$sts->getUnusedUser())/$sts->getTotalUser())*100,2)}% {($sts->getTotalUser()-$sts->getOnlineUser(86400)-$sts->getUnusedUser())}人",
                                                                    indexLabel: "一天以前在线的用户 {number_format((($sts->getTotalUser()-$sts->getOnlineUser(86400)-$sts->getUnusedUser())/$sts->getTotalUser())*100,2)}% {($sts->getTotalUser()-$sts->getOnlineUser(86400)-$sts->getUnusedUser())}人"
                                                                },
                                                                {
                                                                    y: {($sts->getOnlineUser(86400)-$sts->getOnlineUser(3600))/$sts->getTotalUser()*100},
                                                                    legendText: "一天内在线的用户 {number_format(($sts->getOnlineUser(86400)-$sts->getOnlineUser(3600))/$sts->getTotalUser()*100,2)}% {($sts->getOnlineUser(86400)-$sts->getOnlineUser(3600))}人",
                                                                    indexLabel: "一天内在线的用户 {number_format(($sts->getOnlineUser(86400)-$sts->getOnlineUser(3600))/$sts->getTotalUser()*100,2)}% {($sts->getOnlineUser(86400)-$sts->getOnlineUser(3600))}人"
                                                                },
                                                                {
                                                                    y: {($sts->getOnlineUser(3600)-$sts->getOnlineUser(60))/$sts->getTotalUser()*100},
                                                                    legendText: "一小时内在线的用户 {number_format(($sts->getOnlineUser(3600)-$sts->getOnlineUser(60))/$sts->getTotalUser()*100,2)}% {($sts->getOnlineUser(3600)-$sts->getOnlineUser(60))}人",
                                                                    indexLabel: "一小时内在线的用户 {number_format(($sts->getOnlineUser(3600)-$sts->getOnlineUser(60))/$sts->getTotalUser()*100,2)}% {($sts->getOnlineUser(3600)-$sts->getOnlineUser(60))}人"
                                                                },
                                                                {
                                                                    y: {($sts->getOnlineUser(60))/$sts->getTotalUser()*100},
                                                                    legendText: "一分钟内在线的用户 {number_format(($sts->getOnlineUser(60))/$sts->getTotalUser()*100,2)}% {($sts->getOnlineUser(60))}人",
                                                                    indexLabel: "一分钟内在线的用户 {number_format(($sts->getOnlineUser(60))/$sts->getTotalUser()*100,2)}% {($sts->getOnlineUser(60))}人"
                                                                }
                                                            ]
                                                        }
                                                    ]
                                                });

                                        chart.render();
                                    </script>

                                </div>

                            </div>
                        </div>


                    </div>


                    <div class="col-xx-12 col-sm-6">

                        <div class="card">
                            <div class="card-main">
                                <div class="card-inner">
                                    <h5>注册新用户</h5>
                                    {foreach $days as $day}
                                    <button class="mdl-button mdl-js-button mdl-button--raised" onclick="getNewUsers('{$day}')">{$day}</button>
                                    {/foreach}
                                    <p id="newusers_text" style="margin-top: 10px;">loading</p>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-main">
                                <div class="card-inner">

                                    <div id="node_chart" style="height: 300px; width: 100%;"></div>

                                    <script src="//cdn.jsdelivr.net/gh/YihanH/canvasjs.js@v2.2/canvasjs.min.js"></script>
                                    <script type="text/javascript">
                                        var chart = new CanvasJS.Chart("node_chart",
                                                {
                                                    title: {
                                                        text: "节点在线情况(节点数 {$sts->getTotalNodes()}个)",
                                                        fontFamily: "Impact",
                                                        fontWeight: "normal"
                                                    },

                                                    legend: {
                                                        verticalAlign: "bottom",
                                                        horizontalAlign: "center"
                                                    },
                                                    data: [
                                                        {
                                                            //startAngle: 45,
                                                            indexLabelFontSize: 20,
                                                            indexLabelFontFamily: "Garamond",
                                                            indexLabelFontColor: "darkgrey",
                                                            indexLabelLineColor: "darkgrey",
                                                            indexLabelPlacement: "outside",
                                                            type: "doughnut",
                                                            showInLegend: true,
                                                            dataPoints: [
                                                                {if $sts->getTotalNodes()!=0}
                                                                {
                                                                    y: {(1-($sts->getAliveNodes()/$sts->getTotalNodes()))*100},
                                                                    legendText: "离线节点 {number_format((1-($sts->getAliveNodes()/$sts->getTotalNodes()))*100,2)}% {$sts->getTotalNodes()-$sts->getAliveNodes()}个",
                                                                    indexLabel: "离线节点 {number_format((1-($sts->getAliveNodes()/$sts->getTotalNodes()))*100,2)}% {$sts->getTotalNodes()-$sts->getAliveNodes()}个"
                                                                },
                                                                {
                                                                    y: {(($sts->getAliveNodes()/$sts->getTotalNodes()))*100},
                                                                    legendText: "在线节点 {number_format((($sts->getAliveNodes()/$sts->getTotalNodes()))*100,2)}% {$sts->getAliveNodes()}个",
                                                                    indexLabel: "在线节点 {number_format((($sts->getAliveNodes()/$sts->getTotalNodes()))*100,2)}% {$sts->getAliveNodes()}个"
                                                                }
                                                                {/if}
                                                            ]
                                                        }
                                                    ]
                                                });

                                        chart.render();
                                    </script>

                                </div>

                            </div>
                        </div>


                        <div class="card">
                            <div class="card-main">
                                <div class="card-inner">

                                    <div id="traffic_chart" style="height: 300px; width: 100%;"></div>

                                    <script src="//cdn.jsdelivr.net/gh/YihanH/canvasjs.js@v2.2/canvasjs.min.js"></script>
                                    <script type="text/javascript">
                                        var chart = new CanvasJS.Chart("traffic_chart",
                                                {
                                                    title: {
                                                        text: "流量使用情况(总分配流量 {$sts->getTotalTraffic()})",
                                                        fontFamily: "Impact",
                                                        fontWeight: "normal"
                                                    },

                                                    legend: {
                                                        verticalAlign: "bottom",
                                                        horizontalAlign: "center"
                                                    },
                                                    data: [
                                                        {
                                                            //startAngle: 45,
                                                            indexLabelFontSize: 20,
                                                            indexLabelFontFamily: "Garamond",
                                                            indexLabelFontColor: "darkgrey",
                                                            indexLabelLineColor: "darkgrey",
                                                            indexLabelPlacement: "outside",
                                                            type: "doughnut",
                                                            showInLegend: true,
                                                            dataPoints: [
                                                                {if $sts->getRawTotalTraffic()!=0}
                                                                {
                                                                    y: {(($sts->getRawUnusedTrafficUsage()/$sts->getRawTotalTraffic()))*100},
                                                                    label: "总剩余可用",
                                                                    legendText: "总剩余可用 {number_format((($sts->getRawUnusedTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)}% {(($sts->getUnusedTrafficUsage()))}",
                                                                    indexLabel: "总剩余可用 {number_format((($sts->getRawUnusedTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)}% {(($sts->getUnusedTrafficUsage()))}"
                                                                },
                                                                {
                                                                    y: {(($sts->getRawLastTrafficUsage()/$sts->getRawTotalTraffic()))*100},
                                                                    label: "总过去已用",
                                                                    legendText: "总过去已用 {number_format((($sts->getRawLastTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)}% {(($sts->getLastTrafficUsage()))}",
                                                                    indexLabel: "总过去已用 {number_format((($sts->getRawLastTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)}% {(($sts->getLastTrafficUsage()))}"
                                                                },
                                                                {
                                                                    y: {(($sts->getRawTodayTrafficUsage()/$sts->getRawTotalTraffic()))*100},
                                                                    label: "总今日已用",
                                                                    legendText: "总今日已用 {number_format((($sts->getRawTodayTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)}% {(($sts->getTodayTrafficUsage()))}",
                                                                    indexLabel: "总今日已用 {number_format((($sts->getRawTodayTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)}% {(($sts->getTodayTrafficUsage()))}"
                                                                }
                                                                {/if}
                                                            ]
                                                        }
                                                    ]
                                                });

                                        chart.render();
                                    </script>

                                </div>

                            </div>
                        </div>


                    </div>

                </div>
            </div>
        </section>
    </div>
</main>


{include file='admin/footer.tpl'}

{literal}
<script>
    function getIncome(date) {
        $.ajax({
            type: "GET",
            url: "/admin/api/analytics/income",
            dataType: "json",
            data: {
                date: date,
            },
            success: function (data) {
                console.log(data.ret);
                if (data.success) {
                    data = data.data;
                    var html_text = `<h6>${data.date}的数据</h6>今日收入：${data.todayIncome}<br>昨日收入：${data.yesterdayIncome}<br>本周收入：${data.thisWeekIncome}<br>上周收入：${data.lastWeekIncome}<br>本月收入：${data.thisMonthIncome}<br>上月收入：${data.lastMonthIncome}`;
                    $('#income_text').html(html_text);
                } else {
                    console.log(data.error)
                }
            }
        })
    }

    function getNewUsers(date) {
        $.ajax({
            type: "GET",
            url: "/admin/api/analytics/new-users",
            dataType: "json",
            data: {
                date: date,
            },
            success: function (data) {
                console.log(data.ret);
                if (data.success) {
                    data = data.data;
                    var html_text = `<h6>${data.date}的数据</h6>今日新用户：${data.today}<br>昨日新用户：${data.yesterday}<br>本周新用户：${data.thisWeek}<br>上周新用户：${data.lastWeek}<br>本月新用户：${data.thisMonth}<br>上月新用户：${data.lastMonth}`;
                    $('#newusers_text').html(html_text);
                } else {
                    console.log(data.error)
                }
            }
        })
    }

    String.prototype.replaceAll = function (stringToFind, stringToReplace) {
        if (stringToFind === stringToReplace) return this;
        var temp = this;
        var index = temp.indexOf(stringToFind);
        while (index != -1) {
            temp = temp.replace(stringToFind, stringToReplace);
            index = temp.indexOf(stringToFind);
        }
        return temp;
    };

    var date = new Date();
    date = date.toLocaleDateString();
    date = date.replaceAll('/','-');
    getIncome(date);
    getNewUsers(date);
</script>
{/literal}
