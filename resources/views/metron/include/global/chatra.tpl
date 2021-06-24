        <script>
            (function(d, w, c) {
                w.ChatraID = "{$metron['chatra_id']}";
                var s = d.createElement('script');
                w[c] = w[c] || function() {
                    (w[c].q = w[c].q || []).push(arguments);
                };
                s.async = true;
                s.src = 'https://call.chatra.io/chatra.js';
                if (d.head) d.head.appendChild(s);
            })(document, window, 'Chatra');
        </script>
        <script>
            window.ChatraIntegration = {
                name: '{$user->user_name}',
                email: '{$user->email}',
                'Class': '{$user->class}',
                'Class_Expire': '{$user->class_expire}',
                'Money': '{$user->money}',
                'Unused_Traffic': '{$user->unusedTraffic()}'
            };
            var userUUID = '{$user->uuid}';
        </script>