webpackJsonp([ 18 ], {
	0 : function(e, t, n) {
		"use strict";
		function o(e) {
			return e && e.__esModule ? e : {
				default : e
			}
		}
		function a() {
			(0, u.checkLogin)(function() {
				$.ajax({
					method : "GET",
					url : "/ajax/orderDetail/" + system.orderId,
					cache : !1,
					success : function(e) {
						e.order.fixStatus && (clearInterval(v), location.href = "/order/detail/" + system.orderId)
					}
				})
			})()
		}
		function i(e) {
			f.find(".tip").text(e), f.show()
		}
		function r() {
			if (m > 0) {
				var e = Math.floor(m / 60),
					t = m % 60;
				d.text(e), l.text(t), m--
			} else clearInterval(p), i("֧����ʱ���ö�����ʧЧ�������¹���")
		}
		var c = n(1452),
			s = o(c),
			u = n(1176),
			d = $(".time-left .minute"),
			l = $(".time-left .second"),
			f = $(".modal-container"),
			m = $(".count-down").data("payleftseconds"),
			p = void 0,
			v = void 0;
		f.on("click", ".ok-btn", function() {
			location.href = "/cinema/" + window.system.cinemaId
		}), v = setInterval(a, 2e3), r(), p = setInterval(r, 1e3), $(".pay-btn").on("click", function() {
			var e = $(this).data("orderId");
			(0, s.default)(e, i)
		}), n(1453)
	},
	1452 : function(e, t) {
		"use strict";
		function n(e, t) {
			var n = location.origin + "/order/result/" + e;
			$.post({
				url : "/ajax/submitpay",
				data : {
					orderId : e,
					channelId : 2,
					clientType : "ios",
					priceType : 0,
					mobile : system.mobilePhone,
					couponList : [],
					callbackUrl : n
				},
				success : function(e) {
					if (e) {
						if (e.message) return t(e.message);
						var o = $(document.forms.cashierForm);
						o.find("input[name=token]").val(system.user.token), o.find("input[name=tradeno]").val(e.tradeNo), o.find("input[name=pay_token]").val(e.payToken), o.find("input[name=pay_success_url]").val(n), o.submit()
					}
				}
			})
		}
		t.__esModule = !0, t.default = n
	},
	1453 : 1283
});