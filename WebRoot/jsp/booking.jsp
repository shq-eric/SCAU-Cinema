<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String basePath = basePath1 + "jsp/";
%>
<head>
<title>SCAU电影 -打尽好电影</title>
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
	cid = "c_pffcmyp6";
	ci = 20;
	window.system = {
		"user" : {
			"id" : 263386164,
			"token" : "BWtTiEPTJLcg-4ZdompvEY3NgaAAAAAAKQYAAAKEELQ-P5tbIF6FDA-ltaKg3YdgoaRyn6adk0Ks9ZCs9jLAERFur3_T212USJwcow",
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
		"uid" : 263386164
	};

	window.openPlatform = '';
	window.openPlatformSub = '';
</script>
<link rel="stylesheet" href="<%=basePath%>css/maoyan1.css" />
<link rel="stylesheet" href="<%=basePath%>css/maoyan2.css" />
<script src="<%=basePath%>js/maoyan1.js"></script>
<script>if (window.devicePixelRatio >= 2) {
		document.write('<link rel="stylesheet" href="//ms0.meituan.net/mywww/image-2x.8ba7074d.css"/>')
	}
</script>
<style>
@font-face {
	font-family: stonefont;
	src:
		url('//vfile.meituan.net/colorstone/2563072452f761ab919415dee3c6a2d33168.eot');
	src:
		url('//vfile.meituan.net/colorstone/2563072452f761ab919415dee3c6a2d33168.eot?#iefix')
		format('embedded-opentype'),
		url('//vfile.meituan.net/colorstone/5b3b6a2ad32449731591a28f7bd4aac02076.woff')
		format('woff');
}

.stonefont {
	font-family: stonefont;
}
</style>

<script type="text/javascript">
function deleteTicket(){
var a=document.getElementById("deleteTicketBtn").value;
console.log(a);

$.ajax({    
		         type : "post",    
		         async:false,    
		         url : "<%=basePath1%>movie/deleteTicket.do",
		         dataType:"jsonp", 
		         jsonp:"callback",
				 data: "ticketId="+a,
		         success:function(data){    
		         
				  	if(data.t=="true"){
						
						//alert("删除成功");
						$("#"+a).remove();
						
					}
					else{
					    alert("删除失败");
					}
				   
		         },    
		         error:function(){ 
					alert("提交失败");
		         }    
		     });   
}


function setTicketId(ticketId){
    var a=document.getElementsByName("deleteTicket").value;
    console.log(ticketId);
    document.getElementById("deleteTicketBtn").value=ticketId;
}
</script>
</head>
<body>


	<div class="header-placeholder"></div>


	<div class="container" id="app" class="page-profile/profile">
		<div class="content">
			<div class="main">
				<div class="info-content clearfix">
					<div class="user-profile-nav">
						<h1>个人中心</h1>
						<a href="<%=basePath1%>movie/sumbooking.do" class="orders active">我的订单</a>
						<a href="<%=basePath1%>customer/personalinformation.do"
							class="profile ">基本信息</a>
					</div>

					<div class="orders-container">
						<div id="ticketList" class="profile-title">我的订单</div>

						<ul>
							<c:forEach var="ticketItem" items="${movieTicket}">
								<li>

									<div id="${ticketItem.ticketId }" class="order-box" data-orderid="376693002">
										<div class="order-header">
											<span class="order-date">${ticketItem.scheduleBegin }</span>
											<span class="order-id">电影订单号:${ticketItem.ticketId }</span> <a
												class="del-order" data-orderid="376693002"  onclick="setTicketId(${ticketItem.ticketId})"></a>
										</div>

										<div  class="order-body">
											<div class="poster imgdiv">
												<img src="<%=basePath%>images/${ticketItem.movieId}.jpg">
											</div>

											<div class="order-content">
												<div class="movie-name">《${ticketItem.movieName }》</div>
												<div class="cinema-name">${ticketItem.cinemaAddress }</div>
												<div class="hall-ticket">
													<span>${customer_cinema.cinemaName}</span> <span>${ticketItem.hallId}号厅${fn:substringBefore(ticketItem.ticketSeat, "-")}排${fn:substringAfter(ticketItem.ticketSeat, "-")}座</span>
												</div>
												<div class="show-time">
													<fmt:formatDate value="${ticketItem.scheduleBegin}"
														type="date" dateStyle="full" />${fn:substring(ticketItem.beginTime, 0, 5)}
												</div>
											</div>

											<div class="order-price">￥${ticketItem.schedulePrice}</div>

											<div class="order-status">已完成</div>

											<div class="actions">
												<!-- <div>
													<a href="<%=basePath%>paymentResult.jsp"
														class="order-detail" data-act="orders-detail-click"
														data-bid="b_y190atas">查看详情</a>
												</div>  -->
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>

						<div class="orders-pager"></div>
					</div>
				</div>
			</div>


		</div>

		<div class="mask3">
			<div class="modal-container" style="display:none">
				<div class="modal">
					<span class="icon"></span>

					<p class="tip">您确定要删除该订单嘛？删除后，不可恢复～</p>

					<button id="deleteTicketBtn" class="short btn cancel-btn" onclick="deleteTicket()" value="">确定</button>
					<button class="short btn cancel-btn">取消</button>
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

					<div class="short btn ok-btn" >确定</div>
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
