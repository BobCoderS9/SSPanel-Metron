        <script>
            function importSublink(client) {
            if (client == 'ssr') {
                index.oneclickImport('ssr', '{$subInfo["ssr"]}');
            };
            if (client == 'clash') {
                index.oneclickImport('clash','{$subInfo["clash"]}')
            };
            if (client == 'clashr') {
                index.oneclickImport('clashr','{$subInfo["clashr"]}')
            };
            if (client == 'shadowrocket') {
                index.oneclickImport('shadowrocket','{$subInfo["shadowrocket"]}')
            };
            if (client == 'quantumult') {
                index.oneclickImport('quantumult','{$subInfo["ssr"]}')
            };
            if (client == 'quantumult_v2') {
                index.oneclickImport('quantumult_v2','{$subInfo["quantumult_v2"]}')
            };
            }
            function qrcodeSublink(client) {
                if (client == 'shadowrocket') {
                    index.qrcodeImport('shadowrocket', '{$subInfo["shadowrocket"]}');
                }
            }
        </script>