 <script>
    function countTime(endTime, day, hour, min, second) {
				var date = new Date();
				var now = date.getTime();				
				var endDate = new Date(endTime);//设置截止时间
				var end = endDate.getTime();
				var leftTime = end - now; //时间差
				var d = h = m = s = ms = 0;
				if(leftTime >= 0) {
					d = Math.floor(leftTime / 1000 / 60 / 60 / 24);
					h = Math.floor(leftTime / 1000 / 60 / 60 % 24);
					m = Math.floor(leftTime / 1000 / 60 % 60);
					s = Math.floor(leftTime / 1000 % 60);
					if(s < 10) {
						s = "0" + s;
					}
					if(m < 10) {
						m = "0" + m;
					}
					if(h < 10) {
						h = "0" + h;
					}
				} else {
				    $('.mt-4').hide('500');
				    return;
				}
				//将倒计时赋值到div中
				
				var curDay = document.getElementById(day);
				var curHour = document.getElementById(hour);
				var curMin = document.getElementById(min);
				var curSecond = document.getElementById(second);
				
				if (!curDay || !curHour || !curMin || !curSecond) return;
				
				document.getElementById(day).innerHTML = d + "天";
				document.getElementById(hour).innerHTML = h + "时";
				document.getElementById(min).innerHTML = m + "分";
				document.getElementById(second).innerHTML = s + "秒";
				//递归每秒调用countTime方法，显示动态时间效果
				setTimeout(() => countTime(endTime, day, hour, min, second), 50);
			}
			
	    countTime("{$metron['coupons_time']}", '_d1', '_h1', '_m1', '_s1');
	    countTime("{$metron['coupons_time']}", '_d2', '_h2', '_m2', '_s2');
	    countTime("{$metron['coupons_time']}", '_d3', '_h3', '_m3', '_s3');
	    countTime("{$metron['coupons_time']}", '_d4', '_h4', '_m4', '_s4');
	    countTime("{$metron['shop_activity_buy_time']}", '_d', '_h', '_m', '_s');

  </script>
