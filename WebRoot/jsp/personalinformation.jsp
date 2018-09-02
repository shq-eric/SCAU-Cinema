<!DOCTYPE html>
<%@ page language="java" import="java.util.*,scau.se37.entity.Customer"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String basePath = basePath1 + "jsp/";
	Customer cus = (Customer) session.getAttribute("customer");
%>
<!--[if IE 8]><html class="ie8"><![endif]-->
<!--[if IE 9]><html class="ie9"><![endif]-->
<!--[if gt IE 9]><!-->
<html>
<!--<![endif]-->
<head>
<title>SCAU电影 - 一网打尽好电影</title>

<link rel="dns-prefetch" href="//p0.meituan.net" />
<link rel="dns-prefetch" href="//p1.meituan.net" />
<link rel="dns-prefetch" href="//ms0.meituan.net" />
<link rel="dns-prefetch" href="//ms1.meituan.net" />
<link rel="dns-prefetch" href="//analytics.meituan.com" />
<link rel="dns-prefetch" href="//report.meituan.com" />
<link rel="dns-prefetch" href="//frep.meituan.com" />


<meta charset="utf-8">
<meta name="keywords" content="">
<meta name="description" content="">
<meta http-equiv="cleartype" content="yes" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="renderer" content="webkit" />

<meta name="HandheldFriendly" content="true" />
<meta name="format-detection" content="email=no" />
<meta name="format-detection" content="telephone=no" />
<meta name="viewport" content="width=device-width, initial-scale=1">


<script>
	cid = "c_dxfehttw";
	ci = 20;
	window.system = {
		"user" : {
			"id" : 263386164,
			"token" : "rxPuIeqRB0JL-3iyHxJJSApk_C8AAAAAKQYAAHMYoI93bF9YiJaZplgrdMH-CXfBY91Vo3j-_UmCZrC95icK8pfAAl8p7_kSt2o_bQ",
			"username" : "",
			"profile" : {
				"age" : "25",
				"avatarType" : 0,
				"avatarurl" : "",
				"birthday" : 631123200000,
				"currentExp" : 0,
				"gender" : 0,
				"id" : 263386164,
				"juryLevel" : 0,
				"maoyanAge" : "2.5",
				"nextTitle" : "",
				"nickName" : "",
				"nickNameStatus" : 0,
				"registerTime" : 1443504900000,
				"roleType" : 0,
				"signatureStatus" : 0,
				"ticketCount" : 1,
				"title" : "青铜会员",
				"topicCount" : 0,
				"totalExp" : 130,
				"uid" : 1245678438,
				"userLevel" : 1,
				"userNextLevel" : 2,
				"username" : " ",
				"vipType" : 0,
				"visitorCount" : 0,
				"year" : 1990,
				"month" : 1,
				"day" : 1,
				"currentYear" : 2018,
				"birthDayMonthDays" : 31,
				"occupation" : "",
				"job" : "",
				"subjob" : ""
			}
		},
		"uid" : 263386164
	};

	window.openPlatform = '';
	window.openPlatformSub = '';
</script>
<link rel="stylesheet" href="<%=basePath %>css/personinformation1.css" />
<link rel="stylesheet" href="<%=basePath %>css/personinformation2.css" />
<script type="text/javascript"
	src="<%=basePath %>js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath %>js/personinformation1.js"></script>
<script>if (window.devicePixelRatio >= 2) {
		document.write('<link rel="stylesheet" href="//ms0.meituan.net/mywww/image-2x.8ba7074d.css"/>')
	}
</script>
<style>
@font-face {
	font-family: stonefont;
	src:
		url('//vfile.meituan.net/colorstone/999c81be79e94b9a076eb4d1c92b38bf3168.eot');
	src:
		url('//vfile.meituan.net/colorstone/999c81be79e94b9a076eb4d1c92b38bf3168.eot?#iefix')
		format('embedded-opentype'),
		url('//vfile.meituan.net/colorstone/f921dd87aa946ccbdf7bad4dde7209b12088.woff')
		format('woff');
}

.stonefont {
	font-family: stonefont;
}
</style>
<script type="text/javascript">
	function checkUsername() {
		var customUsername = document.getElementById("userexinfo-form-nickname").value;
		var cusName = "<%=cus.getCustomUsername()%>";
		$.ajax({
			type : "post",
			async : false,
			url : "<%=basePath1%>customer/checkUsername.do",
			dataType : "jsonp",
			jsonp : "callback1",
			data : "username=" + customUsername,
			success : function(data) {
				console.log(data.t);
				if (data.t == "false") {
					if (customUsername != cusName) {
						document.getElementById("usernameTips").innerHTML = "<font color='red'>用户名已存在</font>";
						document.getElementById("doSubmit").disabled = true;
					} else {
						document.getElementById("usernameTips").innerHTML = "";
						document.getElementById("doSubmit").disabled = false;
					}

				} else {
					if (customUsername != "") {
						document.getElementById("usernameTips").innerHTML = "<font color='gray'>新用户名</font>";
						document.getElementById("doSubmit").disabled = false;
					}

				}
			},
			error : function() {
				alert("fail!");
			}
		});
	}

	function checkCustomInfo() {
		var customUsername = document.getElementById("userexinfo-form-nickname").value;
		var pwd = document.getElementById("password").value;
		if (customUsername == "" || pwd == "") {
			alert("用户名和密码不能为空！");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="header"></div>
	<div class="header-placeholder"></div>


	<div class="container" id="app" class="page-profile/profile">
		<div class="content">
			<div class="main">
				<div class="info-content clearfix">
					<div class="user-profile-nav">
						<h1>个人中心</h1>
						<a href="<%=basePath1%>movie/sumbooking.do" class="orders ">我的订单</a> <a
							href="<%=basePath1%>customer/personalinformation.do"
							class="profile active">基本信息</a>
					</div>

					<div class="profile-container">
						<div class="profile-title">基本信息</div>

						<form class="userexinfo-form"
							action="<%=basePath1%>customer/updateCustomer.do" method="post"
							onsubmit="return checkCustomInfo()">
							<div class="userexinfo-form-section">
								<p>ID：</p>
								<span> <input type="text" name="customId"
									value="<%=cus.getCustomId()%>" readonly="true">
								</span>
							</div>
							<div class="userexinfo-form-section">
								<p>用户名：</p>
								<span> <input type="text" name="customUsername"
									id="userexinfo-form-nickname" class="ui-checkbox"
									onchange="checkUsername()" value="<%=cus.getCustomUsername()%>">
								</span> <span id="usernameTips"></span>
							</div>
							<div class="userexinfo-form-section">
								<p>密码：</p>
								<span> <input type="text" id="password"
									name="customPassword" class="ui-checkbox"
									value="<%=cus.getCustomPassword()%>">
								</span>
							</div>
							<div class="userexinfo-form-section">
								<p>电话：</p>
								<span> <input type="text" name="customTel"
									class="ui-checkbox" value="<%=cus.getCustomTel()%>">
								</span>
							</div>

							<div>

								<input id="doSubmit" type="submit" class="form-save-btn"
									value="保存">
							</div>

						</form>
					</div>

				</div>

			</div>

			<div class="body-mask"></div>
			<div id="img-cropper" class="img-cropper"></div>
			<script>
				var occupation = {
					"信息技术" : [ "互联网", "IT", "通信", "电子", "游戏" ],
					"金融保险" : [ "投资", "股票基金", "保险", "银行", "信托担保" ],
					"商业服务" : [ "资讯", "贸易", "美容保健", "家政服务", "旅游", "餐饮酒店", "娱乐休闲", "批发零售", "汽车" ],
					"建筑地产" : [ "房地产", "建筑", "物业", "装修" ],
					"工程制造" : [ "机械制造", "生物医药", "食品", "服装", "能源", "化工" ],
					"交通运输" : [ "航空", "铁路", "航运船舶", "公共交通", "物流运输" ],
					"文化传媒" : [ "媒体出版", "设计", "广告创意", "动漫", "公关会展", "摄影" ],
					"娱乐体育" : [ "影视", "运动体育", "音乐", "模特" ],
					"公共事业" : [ "医疗", "教育", "政府机关", "科研", "公益机构", "农林牧渔" ],
					"学生" : [ "学生" ],
					"其他" : [ "其他" ]
				};
			</script>

		</div>

		<div class="mask3">
			<div class="modal-container" style="display:none">
				<div class="modal">
					<span class="icon"></span>

					<p class="tip">您确定要删除该订单嘛？删除后，不可恢复～</p>

					<div class="short btn ok-btn">确定</div>
					<div class="short btn cancel-btn">取消</div>
				</div>
			</div>

		</div>

		<div class='mask1'>
			<div class="modal-container" style="display:none">
				<div class="modal">
					<span class="icon"></span>

					<p class="tip">
						请注意，注销账号会清空所有订单信息、影评、积分、<br>账户余额等信息且无法找回，是否继续？
					</p>

					<div class="short btn ok-btn">确定</div>
					<div class="short btn cancel-btn">取消</div>
				</div>
			</div>

		</div>

		<div class='mask2'>
			<div class="modal-container" style="display:none">
				<div class="modal">
					<span class="icon"></span>

					<p class="tip">请联系客服10105335</p>

					<div class="ok-btn btn">我知道了</div>
				</div>
			</div>

		</div>
		</div>
		<!--[if IE 8]><script src="//ms0.meituan.net/mywww/es5-shim.bbad933f.js"></script><![endif]-->
		<!--[if IE 8]><script src="//ms0.meituan.net/mywww/es5-sham.d6ea26f4.js"></script><![endif]-->
		<script src="//ms0.meituan.net/mywww/common.dc33ab40.js"></script>
		<script src="//ms0.meituan.net/mywww/profile-profile.be74a9c6.js"></script>
</body>
</html>
