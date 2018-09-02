<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*,scau.se37.entity.Movie"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
     String path = request.getContextPath();
     String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String basePath = basePath1+ "jsp/";
	Movie movie = (Movie) session.getAttribute("movie");
	request.setAttribute("movie", movie);
	
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<title>电影选购</title>

<link href="<%=basePath %>css/tickets.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%=basePath %>js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/phone.js"></script>
<!-- <script type="text/javascript" src="<%=basePath %>js/menu_x.js"></script>  -->

<script type="text/javascript">

function chooseSeat(scheduleId){
    console.log(scheduleId);
    
    location.href="<%=basePath1%>movie/chooseSeat.do?scheduleId="+scheduleId;
}

function changeColor(){
    var sDate="${customer_scheduleList[0].scheduleBegin}";
    document.getElementById(sDate).style.color='blue';
}


</script>

</head>

<body onload="changeColor()">
	<div class="whole">

		<header class="header">
			<a href="javascript:history.back(-1)" class="fa fa-angle-left"></a> <span
				class="names"> ${customer_cinema.cinemaName} </span> <span class="collect"> <i
				class="fa fa-star-o"></i>
			</span>
		</header>

		<div class="film-length">
			<span>片长：${movie.movieDuration}分钟 </span> 
		</div>

		<div class="tips">温馨提示：电影开场前30分钟关闭在线售票</div>

		<div class="tab date">
			<!---tab日期标签滑动--->
			<div id="J_MenuX">
				<div class="xs-container">
				    
					<ul class="xs-content nav nav-pills nav-justified" >
						<c:forEach var="bookingTimeItem" items="${bookingTime}">   
                       <a  href="<%=basePath1 %>movie/loadBookingInfo.do?selectedDate=${bookingTimeItem }"> <li> <div id="${bookingTimeItem }"> ${fn:substring(bookingTimeItem, 5, 10)}</div> </li> </a> 
                        </c:forEach>
					<!--  	<a href="#"><li>(今天)</li></a>
						<a href="#"><li>08-10</li></a>
						<a href="#"><li>08-11</li></a>
						<a href="#"><li>08-12</li></a> -->

					</ul>
					
				</div>
			</div>
			<!---tab标签滑动END--->
		</div>

		<div class="tickets-list">
			<ul>
			<c:forEach var="scheduleItem" items="${customer_scheduleList}">   
               <li>
					<div class="ticket-info">
						<span class="start">${fn:substring(scheduleItem.beginTime, 0, 5) }</span> <span class="styles">${customer_hallList[scheduleItem.hallId-1].hallType} </span>
						<span>${fn:substring(scheduleItem.endTime, 0, 5) }(结束)</span> <span>${scheduleItem.hallId}号厅</span>
					</div>
					<div class="buy-btn">
						<span>${scheduleItem.schedulePrice}<b>元</b></span> <button id="${scheduleItem.scheduleId}" onclick="chooseSeat(id)">选座购票</button>
					</div>
				</li>          
             </c:forEach>
				

			<!--  	<li>
					<div class="ticket-info">
						<span class="start">15:20</span> <span class="styles">原版3D</span>
						<span>17:50(结束)</span> <span>5号厅</span>
					</div>
					<div class="buy-btn">
						<span>40<b>元</b></span> <a href="<%=basePath %>choose_seat.jsp">选座购票</a>
					</div>
				</li>

				<li>
					<div class="ticket-info">
						<span class="start">16:20</span> <span class="styles">原版3D</span>
						<span>18:50(结束)</span> <span>6号厅</span>
					</div>
					<div class="buy-btn">
						<span>40<b>元</b></span> <a href="<%=basePath %>choose_seat.jsp">选座购票</a>
					</div>
				</li>

				<li>
					<div class="ticket-info">
						<span class="start">17:20</span> <span class="styles">原版3D</span>
						<span>19:50(结束)</span> <span>7号厅</span>
					</div>
					<div class="buy-btn">
						<span>40<b>元</b></span> <a href="<%=basePath %>choose_seat.jsp">选座购票</a>
					</div>
				</li>

				<li>
					<div class="ticket-info">
						<span class="start">18:20</span> <span class="styles">原版3D</span>
						<span>20:50(结束)</span> <span>8号厅</span>
					</div>
					<div class="buy-btn">
						<span>40<b>元</b></span> <a href="<%=basePath %>choose_seat.jsp">选座购票</a>
					</div>
				</li>

				<li>
					<div class="ticket-info">
						<span class="start">19:20</span> <span class="styles">原版3D</span>
						<span>21:50(结束)</span> <span>9号厅</span>
					</div>
					<div class="buy-btn">
						<span>40<b>元</b></span> <a href="<%=basePath %>choose_seat.jsp">选座购票</a>
					</div>
				</li>

				<li>
					<div class="ticket-info">
						<span class="start">20:20</span> <span class="styles">原版3D</span>
						<span>22:50(结束)</span> <span>1号厅</span>
					</div>
					<div class="buy-btn">
						<span>40<b>元</b></span> <a href="<%=basePath %>choose_seat.jsp">选座购票</a>
					</div>
				</li>

				<li>
					<div class="ticket-info">
						<span class="start">21:20</span> <span class="styles">原版3D</span>
						<span>23:50(结束)</span> <span>2号厅</span>
					</div>
					<div class="buy-btn">
						<span>40<b>元</b></span> <a href="<%=basePath %>choose_seat.jsp">选座购票</a>
					</div>
				</li> -->

			</ul>
		</div>

	</div>

	<script type="text/javascript">
		//var menux = new menuX("#J_MenuX", 0);
	</script>

	<script type="text/javascript">
		$(function() {
	
			$('.collect .fa').click(function() {
				if ($(this).hasClass('fa-star-o')) {
					$(this).removeClass('fa-star-o').addClass('fa-star');
				} else {
					$(this).removeClass('fa-star').addClass('fa-star-o');
				}
			});
	
		})
	</script>

</body>
</html>
