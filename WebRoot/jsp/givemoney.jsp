<!DOCTYPE html>
<%@ page language="java" import="java.util.*,scau.se37.entity.Movie"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String basePath = basePath1 + "jsp/";
	Movie movie = (Movie) session.getAttribute("movie");
%>
<head>
<title>支付 - SCAU电影 -打尽好电影</title>
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
	cid = "c_wmvmtivj";
	ci = 20;
	window.system = {
		"user" : {
			"id" : 263386164,
			"token" : "rxPuIeqRB0JL-3iyHxJJSApk_C8AAAAAKQYAAHMYoI93bF9YiJaZplgrdMH-CXfBY91Vo3j-_UmCZrC95icK8pfAAl8p7_kSt2o_bQ",
			"username" : "yMY202970664",
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
				"nickName" : "yMY202970664",
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
				"username" : "yMY202970664",
				"vipType" : 0,
				"visitorCount" : 0
			}
		},
		"uid" : 263386164,
		"cinemaId" : 207,
		"mobilePhone" : "13602805844",
		"orderId" : "3274163800"
	};

	window.openPlatform = '';
	window.openPlatformSub = '';
</script>
<link rel="stylesheet" href="<%=basePath%>css/SureToPay1.css" />
<link rel="stylesheet" href="<%=basePath%>css/SureToPay2.css" />
<script src="<%=basePath%>js/SureToPay1.js"></script>
<script>if (window.devicePixelRatio >= 2) {
		document.write('<link rel="stylesheet" href="//ms0.meituan.net/mywww/image-2x.8ba7074d.css"/>')
	}
</script>
<style>
@font-face {
	font-family: stonefont;
	src:
		url('//vfile.meituan.net/colorstone/1c65e270aa54909825a11197c646525a3168.eot');
	src:
		url('//vfile.meituan.net/colorstone/1c65e270aa54909825a11197c646525a3168.eot?#iefix')
		format('embedded-opentype'),
		url('//vfile.meituan.net/colorstone/d7e7ba1eec50dbca8d6bed84ab77a91f2084.woff')
		format('woff');
}

.stonefont {
	font-family: stonefont;
}
</style>
</head>
<body>
	<div class="header-placeholder"></div>


	<div class="container" id="app" class="page-order/confirm">
		<div class="order-progress-bar">
			<div class="step first done">
				<span class="step-num">1</span>
				<div class="bar"></div>
				<span class="step-text">选择影片场次</span>
			</div>
			<div class="step done">
				<span class="step-num">2</span>
				<div class="bar"></div>
				<span class="step-text">选择座位</span>
			</div>
			<div class="step done">
				<span class="step-num">3</span>
				<div class="bar"></div>
				<span class="step-text">14分钟内付款</span>
			</div>
			<div class="step last ">
				<span class="step-num">4</span>
				<div class="bar"></div>
				<span class="step-text">影院取票观影</span>
			</div>
		</div>


		<div class="count-down-wrapper">
			<div class="count-down" data-payleftseconds="839">
				<p class="time-left">
					请在 <span class="minute">13</span> 分钟 <span class="second">59</span>秒内完成支付
				</p>
				<p class="tip">超时订单会自动取消，如遇支付问题，请致电客服：1010-5335</p>
			</div>
		</div>

		<p class="warning">
			请仔细核对场次信息，出票后将<span class="attention">无法退票和改签</span>
		</p>

		<table class="order-table">
			<thead>
				<tr>
					<th>影片</th>
					<th>时间</th>
					<th>影院</th>
					<th>座位</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td class="movie-name"><%=movie.getMovieName()%></td>
					<td class="showtime"><fmt:formatDate
							value="${customer_schedule.scheduleBegin}" type="date"
							dateStyle="full" /></td>
					<td class="cinema-name">${customer_cinema.cinemaName}</td>
					<td><span class="hall">影院${customer_hall.hallId}厅</span>
						<div class="seats">
							<div>
								<c:forEach var="seatPositionItem"
									items="${customer_seatPosition}">
									<c:if test="${fn:substringBefore(seatPositionItem, '-') != '0'}">
										<span class=""><i>${fn:substringBefore(seatPositionItem, "-")} </i>排<i>${fn:substringAfter(seatPositionItem, "-")}</i>座</span>
										<!--   <span class="border"><i>7</i>排<i>04</i>座</span> -->
									</c:if>
								</c:forEach>
							</div>
							<div></div>
						</div></td>
				</tr>
			</tbody>
		</table>


		<div class="right">
			<div class="price-wrapper">		
				<span>实际支付 :</span> <span class="price">${customer_schedule.schedulePrice}</span>
			
			</div>
			<div>
				<div class="pay-btn" data-order-id="3274163800" data-act="pay-click"
					data-bid="b_u30afks6">
					<a href="<%=basePath1%>movie/booking.do?scheduleId=${customer_schedule.scheduleId}&&seat1=${customer_seatPosition[0]}&&
					seat2=${customer_seatPosition[1]}&&seatNum=${seatNum}">确认支付</a>
				</div>
			</div>
		</div>

		<form name="cashierForm" method="post"
			action="https://mpay.meituan.com/cashier/pc/index">
			<input type="hidden" name="token" value=""> <input
				type="hidden" name="tradeno" value=""> <input type="hidden"
				name="pay_token" value=""> <input type="hidden"
				name="website" value="mtmaoyan"> <input type="hidden"
				name="pay_success_url"
				value="http://www.maoyan.com/order/result/3274163800"> <input
				type="hidden" name="nb_platform" value="www"> <input
				type="hidden" name="nb_source" value="cashier-pcforcustomer">
		</form>


		<div class="modal-container" style="display:none">
			<div class="modal">
				<span class="icon"></span>

				<p>支付超时，该订单已失效，请重新购买</p>

				<div class="ok-btn btn">我知道了</div>
			</div>
		</div>

	</div>


	<!--[if IE 8]><script src="//ms0.meituan.net/mywww/es5-shim.bbad933f.js"></script><![endif]-->
	<!--[if IE 8]><script src="//ms0.meituan.net/mywww/es5-sham.d6ea26f4.js"></script><![endif]-->
	  <script src="<%=basePath%>js/SureToPay3.js"></script> 
	<script src="<%=basePath%>js/SureToPay2.js"></script>
</body>
</html>
