<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>扫码支付</title>
  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.8.2/css/all.min.css">
</head>
<body>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-6 offset-xl-3">
            <div class="login-brand">
              {$config['appName']}
            </div>
            <div class="card ">
              <div class="card-header" style="width: auto;margin-top: 1.2rem;">
                <h4 id='title' style="text-align: center !important;"></h4>
              </div>
              <div class="card-body">
                <div class="form-group text-center">
                  <div id="qrcode"></div>
                </div>
                <div class="form-group text-center">
                  <a href="#" class="btn btn-icon icon-left" style="color: #98a6ad;" onclick="window.close();"><i class="fas fa-arrow-left"></i> 关闭支付</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  <!-- General JS Scripts -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.2.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/tooltip.js@1.3.2/dist/umd/tooltip.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery.nicescroll@3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/moment@2.18.1/min/moment.min.js"></script>
  <!-- JS Libraies -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.25.6/dist/sweetalert2.all.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/clipboard@2/dist/clipboard.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bowser@1.9.4/bowser.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/kjua@0.1.2/dist/kjua.min.js"></script>
  <script>
    function getQueryParam(name) {
      var query = window.location.search.substring(1);
      var vars = query.split("&");
      for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == name) { return pair[1]; }
      }
      return (false);
    }

    function f() {
      $.ajax({
        type: "POST",
        url: "/api/v1/bob/payment/status",
        dataType: "json",
        data: {
          tradeno: tradeno,
          checkshop: 1
        },
        success: function (data) {
          if (data.result) {
            clearTimeout(tid);
            window.close();
          }
        },
        error: function (jqXHR) {
          console.log(jqXHR);
        }
      });
      tid = setTimeout(f, 1000);
    }

    var payment = getQueryParam('type');
    var price = getQueryParam('price');
    var tradeno = getQueryParam('tradeno');

    if (payment == 'alipay') {
        $('#title').text('打开支付宝，扫码支付'+price+'元');
    } else if (payment == 'wechat') {
        $('#title').text('打开微信，扫码支付'+price+'元');
    }

    var qrcode = decodeURIComponent(getQueryParam('qrcode'));
    $('#qrcode').html(
      kjua({
        text: qrcode,
        render: 'image',
        size: 256
      })
    );
    setTimeout(f, 1000);
  </script>
</body>

</html>
