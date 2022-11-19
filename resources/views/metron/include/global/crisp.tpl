         <!-- crisp -->
        <script type="text/javascript">
        window.$crisp = [];
        window.CRISP_WEBSITE_ID = "{$metron['crisp_id']}";
        CRISP_TOKEN_ID = '{$user->uuid}';
        (function () {
            d = document;
            s = d.createElement("script");
            s.src = "https://client.crisp.chat/l.js";
            s.async = 1;
            d.getElementsByTagName("head")[0].appendChild(s);
        })();
        </script>
        <!-- crisp push -->
        <script>
            $crisp.push(
                ["set", "user:email", "{$user->email}"],
                ["set", "user:nickname", "{$user->user_name}"]
            );
            $crisp.push(
                ["set", "session:data", 
                    [
                        [
                            ["ID", "{$user->id}"],
                            ["VIP", "{$user->class}"],
                            ["VIP_Time", "{$user->class_expire}"],
                            ["Online", "{$user->online_ip_count()}"],
                            ["Money", "¥ "+"{$user->money}"],
                            ["Traffic", '{$user->unusedTraffic()}'],
                            ["Last_Time", '{$user->lastSsTime()}'],
                            ["Reg_Time", '{$user->reg_date}'],
                            ["Update_Time", '{date("Y-m-d H:i:s")}'],
                        ]
                    ]
                ]
            );
        </script>
