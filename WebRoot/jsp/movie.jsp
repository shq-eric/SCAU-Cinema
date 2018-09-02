<!DOCTYPE HTML>
<%@ page language="java"
	import="java.util.*,scau.se37.entity.Movie,scau.se37.entity.Customer"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String basePath = basePath1 + "jsp/";
	String modal = "#";
	String datatoggle = "#";
	String loginPath = basePath + "login.jsp";
	String logoutPath = "#";
	String login = "Login";
	String login1 = (String) session.getAttribute("customUsername");
	if (login1 != null) {
		login = "Welcome! " + login1;
		loginPath = "#myModal";
		logoutPath = basePath1 + "customer/logout.do";
		modal = "modal";
		datatoggle = "data-toggle";
	}
	if (login1 == null) {
		login = "Login";
		logoutPath = "#";
		modal = "modal";
		datatoggle = "#";
	}
	String test = "";
	Customer cus = (Customer) session.getAttribute("customer");
	if (cus == null) {
		cus = new Customer();
		cus.setCustomId(0);
		cus.setCustomUsername("");
		cus.setCustomPassword("");
		cus.setCustomTel("");
	}
	//List<Movie> movieList=(List<Movie>)session.getAttribute("movieList");
%>

<html>
<head>
<title>More Movies</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Movie_store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>

<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<link
	href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
<link href="<%=basePath %>css/bootstrap.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src="<%=basePath %>js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>


<script type="text/javascript">
function getMovieInfo(){

	    if(${movieList[0].movieId==null})
	    location.href="<%=basePath1%>movie/lMovie.do";
	}
	
function personInfo(){
	    var customId="<%=cus.getCustomId()%>";
	    var customUsrname="<%=cus.getCustomUsername()%>";
	    var customTel1="<%=cus.getCustomTel()%>";
	    document.getElementById("customId").value=customId;
	    document.getElementById("customId").readonly="true";
	    document.getElementById("usrname").value=customUsrname;
	    document.getElementById("usrname").readonly="true";
	    document.getElementById("cuspho").value=customTel1;
	    document.getElementById("cuspho").readonly="true";	    
	}

    function gotoPersonInfo(){
        location.href="<%=basePath1%>customer/personalinformation.do";
    
    }
</script>

</head>
<body onload="getMovieInfo()">

	<!-- 模态框 -->
	<div class="modal hide fade in" id="myModal" tabindex="-1"
		role="document" aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none; ">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">用户信息</h4>
				</div>
				<div class="modal-body">
					<div>
						<label style="width:70px">ID:</label><input type="text"
							id="customId" value="<%=cus.getCustomId()%>" readonly="true"></input><br>
						<br> <label style="width:70px">用户名:</label> <input
							type="text" id="usrname" name="cusname"
							value="<%=cus.getCustomUsername()%>" readonly="true"></input><br>
						<br> <label style="width:70px">电话:</label> <input type="text"
							id="cuspho" name="custelephone" value="<%=cus.getCustomTel()%>"
							readonly="true"></input>
					</div>
				</div>
				<div class="modal-footer">

					<button id="btn1" type="button" class="btn btn-primary"
						onclick="gotoPersonInfo()">个人中心</button>
					<button id="btn2" type="button" class="btn btn-default"
						data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<div class="container">
		<div class="container_wrap">
			<div class="header_top">
				<div class="col-sm-3 logo">
					<a href="<%=basePath1 %>movie/loadMovie.do"><img src="<%=basePath %>images/logo.png" alt="" /></a>
				</div>
				<div class="col-sm-6 nav">
					<ul>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="comic"><a href="<%=basePath1 %>movie/lMovie.do"> </a></span></li>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="movie"><a href="<%=basePath1 %>movie/lMovie.do"> </a> </span></li>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="video"><a href="<%=basePath1 %>movie/lMovie.do"> </a></span></li>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="game"><a href="<%=basePath1 %>movie/lMovie.do"> </a></span></li>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="tv"><a href="<%=basePath1 %>movie/lMovie.do"> </a></span></li>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="more"><a href="<%=basePath1 %>movie/lMovie.do"> </a></span></li>
					</ul>
				</div>
				<div class="col-sm-3 header_right">
					<ul class="header_right_box">
						<li><img src="<%=basePath %>images/p2.png" alt="" /></li>
						<li><p>
								<a href="<%=loginPath%>" <%=datatoggle%>="<%=modal%>"
									onclick="personInfo()"><%=login%></a>
							</p></li>

						<div class="clearfix"></div>
						<li><p>
								<a href="<%=logoutPath%>">Logout</a>
							</p></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="content">
				<h2 class="m_3">
					Now in the Movie
					</h1>
					<div class="movie_top">
						<div class="col-md-9 movie_box">
                         
							<!-- Movie variant with time -->
							<div class="movie movie-test movie-test-dark movie-test-left">
								<div class="movie__images">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[0].movieId}" class="movie-beta__link"> <img alt=""
										src="<%=basePath %>images/${mList[0].movieId}.jpg"
										class="img-responsive" alt="" />
									</a>
								</div>
								<div class="movie__info">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[0].movieId}" class="movie__title">${mList[0].movieName} </a> <br>
									<a class="movie__time">时长：${mList[0].movieDuration} min</a> <br> <a
										class="movie__option">主演：${mList[0].movieMainActor}</a>
									<!--  
                                    <ul class="list_6">
						    			<li><i class="icon1"> </i><p>2,548</p></li>
						    		-->
									<!--  		    			
				<li>Rating : &nbsp;&nbsp;<p><img src="<%=basePath %>images/rating1.png" alt=""></p></li>
				-->
									<div class="clearfix"></div>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
							
							<!-- Movie variant with time -->
							<!-- Movie variant with time -->
						 	<div class="movie movie-test movie-test-dark movie-test-left">
								<div class="movie__images">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[1].movieId}" class="movie-beta__link"> <img alt=""
										src="<%=basePath %>images/${mList[1].movieId}.jpg" class="img-responsive" alt="" />
									</a>
								</div>
								<div class="movie__info">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[1].movieId}" class="movie__title">${mList[1].movieName}</a> <br> <a class="movie__time">时长：${mList[1].movieDuration} min</a> <br>
									<a class="movie__option">主演：${mList[1].movieMainActor}</a>
									<!-- 
                                    <ul class="list_6">
						    			<li><i class="icon1"> </i><p>2,548</p></li>
						    			  
						    			<li>Rating : &nbsp;&nbsp;<p><img src="<%=basePath %>images/rating1.png" alt=""></p></li>
						    			 -->
									<div class="clearfix"></div>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="movie movie-test movie-test-light movie-test-right">
								<div class="movie__images">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[2].movieId}" class="movie-beta__link"> <img alt=""
										src="<%=basePath %>images/${mList[2].movieId}.jpg" class="img-responsive" alt="" />
									</a>
								</div>
								<div class="movie__info">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[2].movieId}" class="movie__title">${mList[2].movieName} </a> <br>
									<a class="movie__time">时长：${mList[2].movieDuration} min</a> <br> <a
										class="movie__option">演员：${mList[2].movieMainActor}</a>
									<ul class="list_6">
										<br>
										<br>
										<br>
										<br>
										
										<!--  	<li><i class="icon1"> </i><p>2,548</p></li>-->

										<!--  		<li>Rating : &nbsp;&nbsp;<p><img src="<%=basePath %>images/rating1.png" alt=""></p></li>-->
										<div class="clearfix"></div>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="movie movie-test movie-test-light movie-test-right">
								<div class="movie__images">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[3].movieId}" class="movie-beta__link"> <img alt=""
										src="<%=basePath %>images/${mList[3].movieId}.jpg" class="img-responsive" alt="" />
									</a>
								</div>
								<div class="movie__info">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[3].movieId}" class="movie__title">${mList[3].movieName} </a> <br> <a class="movie__time">时长：${mList[3].movieDuration}
										min</a> <br> <a class="movie__option">演员：${mList[3].movieMainActor}</a>
									<!--            <ul class="list_6">
						    			<li><i class="icon1"> </i><p>2,548</p></li>
						    			  
						    			<li>Rating : &nbsp;&nbsp;<p><img src="<%=basePath %>images/rating1.png" alt=""></p></li>
						    			 -->
									<br>
									<br>
									<br>
									<div class="clearfix"></div>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="movie movie-test movie-test-dark movie-test-left">
								<div class="movie__images">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[4].movieId}" class="movie-beta__link"> <img alt=""
										src="<%=basePath %>images/${mList[4].movieId}.jpg" class="img-responsive" alt="" />
									</a>
								</div>
								<div class="movie__info">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[4].movieId}" class="movie__title">${mList[4].movieName}
										 </a> <br> <a class="movie__time">时长：${mList[4].movieDuration}
										min</a> <br> <a class="movie__option">主演：${mList[4].movieMainActor}</a>
									<!-- 
                                    <ul class="list_6">
						    			<li><i class="icon1"> </i><p>2,548</p></li>
						    			  
						    			<li>Rating : &nbsp;&nbsp;<p><img src="<%=basePath %>images/rating1.png" alt=""></p></li>
						    			 -->
									<div class="clearfix"></div>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="movie movie-test movie-test-dark movie-test-left">
								<div class="movie__images">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[5].movieId}" class="movie-beta__link"> <img alt=""
										src="<%=basePath %>images/${mList[5].movieId}.jpg" class="img-responsive" alt="" />
									</a>
								</div>
								<div class="movie__info">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[5].movieId}" class="movie__title">${mList[5].movieName}</a> <br>
									<a class="movie__time">时长：${mList[5].movieDuration} min</a> <br> <a
										class="movie__option">主演：${mList[5].movieMainActor}</a>
									<!--  
                                    <ul class="list_6">
						    			<li><i class="icon1"> </i><p>2,548</p></li>
						    			  
						    			<li>Rating : &nbsp;&nbsp;<p><img src="<%=basePath %>images/rating1.png" alt=""></p></li>
				  -->
									<div class="clearfix"></div>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="movie movie-test movie-test-light movie-test-right">
								<div class="movie__images">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[6].movieId}" class="movie-beta__link"> <img alt=""
										src="<%=basePath %>images/${mList[6].movieId}.jpg" class="img-responsive" alt="" />
									</a>
								</div>
								<div class="movie__info">
									<a href="#" class="movie__title">${mList[6].movieName}</a> <br> <a
										class="movie__time">时长：${mList[6].movieDuration} min</a> <br> <a
										class="movie__option">主演：${mList[6].movieMainActor}</a>
									<!-- 
                                    <ul class="list_6">
						    			<li><i class="icon1"> </i><p>2,548</p></li>
						    			  
						    			<li>Rating : &nbsp;&nbsp;<p><img src="<%=basePath %>images/rating1.png" alt=""></p></li>
			      -->
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<div class="clearfix"></div>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="movie movie-test movie-test-light movie-test-right">
								<div class="movie__images">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[7].movieId}" class="movie-beta__link"> <img alt=""
										src="<%=basePath %>images/${mList[7].movieId}.jpg" class="img-responsive" alt="" />
									</a>
								</div>
								<div class="movie__info">
									<a href="<%=basePath1 %>movie/single.do?movieId=${mList[7].movieId}" class="movie__title">${mList[7].movieName}</a><br>
									 <a class="movie__time">时长：${mList[7].movieDuration} min</a> <br><a
										class="movie__option">主演：${mList[7].movieMainActor}</a>
									<!--  
                                    <ul class="list_6">
						    			<li><i class="icon1"> </i><p>2,548</p></li>
						    			  
						    			<li>Rating : &nbsp;&nbsp;<p><img src="<%=basePath %>images/rating1.png" alt=""></p></li>
						    			-->
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<div class="clearfix"></div>

									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="clearfix"></div> 
							
							<!-- Movie variant with time -->
						</div>
						<div class="col-md-3">
							<div class="movie_img">
								<div class="grid_2">
									<img src="<%=basePath %>images/pic6.jpg" class="img-responsive" alt="">

									<div class="caption1">
										<!-- 
									<ul class="list_5 list_7">
							    		<li><i class="icon5"> </i><p>3,548</p></li>
							    	</ul>
							    	<i class="icon4 icon6 icon7"> </i>
				    -->
										<p class="m_3">美国队长</p>
									</div>
								</div>
							</div>
							<div class="grid_2 col_1">
								<img src="<%=basePath %>images/pic2.jpg" class="img-responsive" alt="">
								<div class="caption1">
									<!-- 
								<ul class="list_3 list_7">
						    		<li><i class="icon5"> </i><p>3,548</p></li>
						    	</ul>
						    	<i class="icon4 icon7"> </i>
						  -->
									<p class="m_3">美国队长3</p>
								</div>
							</div>
							<div class="grid_2 col_1">
								<img src="<%=basePath %>images/pic9.jpg" class="img-responsive" alt="">
								<div class="caption1">
									<!-- 
								<ul class="list_3 list_7">
						    		<li><i class="icon5"> </i><p>3,548</p></li>
						    	</ul>
						     
						    	<i class="icon4 icon7"> </i>
						    	-->
									<p class="m_3">绿巨人</p>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<h1 class="recent">
						Recently Viewed
						</h3>
						<ul id="flexiselDemo3">
							<li><img src="<%=basePath %>images/${mList[0].movieId}.jpg" class="img-responsive" />
							<div class="grid-flex">
									<a href="#">${mList[0].movieName}</a>
									<p>${mList[0].movieStatus}</p>
								</div></li>
							<li><img src="<%=basePath %>images/${mList[1].movieId}.jpg" class="img-responsive" />
							<div class="grid-flex">
									<a href="#">${mList[1].movieName}</a>
									<p>${mList[1].movieStatus}</p>
								</div></li>
							<li><img src="<%=basePath %>images/${mList[2].movieId}.jpg" class="img-responsive" />
							<div class="grid-flex">
									<a href="#">${mList[2].movieName}</a>
									<p>${mList[2].movieStatus}</p>
								</div></li>
							<li><img src="<%=basePath %>images/${mList[3].movieId}.jpg" class="img-responsive" />
							<div class="grid-flex">
									<a href="#">${mList[3].movieName}</a>
									<p>${mList[3].movieStatus}</p>
								</div></li>
							<li><img src="<%=basePath %>images/${mList[4].movieId}.jpg" class="img-responsive" />
							<div class="grid-flex">
									<a href="#">${mList[4].movieName}</a>
									<p>${mList[4].movieStatus}</p>
								</div></li>
						</ul>
						<script type="text/javascript">
							$(window).load(function() {
								$("#flexiselDemo3").flexisel({
									visibleItems : 4,
									animationSpeed : 1000,
									autoPlay : true,
									autoPlaySpeed : 3000,
									pauseOnHover : true,
									enableResponsiveBreakpoints : true,
									responsiveBreakpoints : {
										portrait : {
											changePoint : 480,
											visibleItems : 1
										},
										landscape : {
											changePoint : 640,
											visibleItems : 2
										},
										tablet : {
											changePoint : 768,
											visibleItems : 3
										}
									}
								});
						
							});
						</script>
						<script type="text/javascript" src="<%=basePath %>js/jquery.flexisel.js"></script>
						<ul id="flexiselDemo1">
							<li><img src="<%=basePath %>images/${mList[7].movieId}.jpg" class="img-responsive" />
							<div class="grid-flex">
									<a href="#">${mList[7].movieName}</a>
									<p>${mList[7].movieStatus}</p>
								</div></li>
							<li><img src="<%=basePath %>images/${mList[6].movieId}.jpg" class="img-responsive" />
							<div class="grid-flex">
									<a href="#">${mList[6].movieName}</a>
									<p>${mList[6].movieStatus}</p>
								</div></li>
							<li><img src="<%=basePath %>images/${mList[5].movieId}.jpg" class="img-responsive" />
							<div class="grid-flex">
									<a href="#">${mList[5].movieName}</a>
									<p>${mList[5].movieStatus}</p>
								</div></li>
							<li><img src="<%=basePath %>images/${mList[0].movieId}.jpg" class="img-responsive" />
							<div class="grid-flex">
									<a href="#">${mList[0].movieName}</a>
									<p>${mList[0].movieStatus}</p>
								</div></li>
							<li><img src="<%=basePath %>images/${mList[1].movieId}.jpg" class="img-responsive" />
							<div class="grid-flex">
									<a href="#">${mList[1].movieName}</a>
									<p>${mList[1].movieStatus}</p>
								</div></li>
						</ul>
						<script type="text/javascript">
							$(window).load(function() {
								$("#flexiselDemo1").flexisel({
									visibleItems : 4, //一行显数的个数
									animationSpeed : 1000, //动画时间
									autoPlay : true, //自动播放
									autoPlaySpeed : 3000, //播放间隔时间  		
									pauseOnHover : true, //鼠标悬浮是否停止播放
									enableResponsiveBreakpoints : true, //是否开启响应式
									responsiveBreakpoints : { //项目名，可随意命名
										portrait : {
											changePoint : 480, //屏幕最大像素，意思为当屏幕最大像素为480时，只显示一个Item，即例子只显示一张图片。
											visibleItems : 1 //只显示一个Item，下面的雷同
										},
										landscape : {
											changePoint : 640,
											visibleItems : 2
										},
										tablet : {
											changePoint : 768,
											visibleItems : 3
										}
									}
								});
						
							});
						</script>
			</div>
		</div>
	</div>
	<div class="container">
		<footer id="footer">
			<div id="footer-3d">
				<div class="gp-container">
					<span class="first-widget-bend"></span>
				</div>
			</div>
			<div id="footer-widgets" class="gp-footer-larger-first-col">
				<div class="gp-container">
					<div class="footer-widget footer-1">
						<div class="wpb_wrapper">
							<img src="<%=basePath %>images/f_logo_2.png" alt="" />
						</div>
						<br>
						<p>You can find the other things what you want to find here.</p>
						<p class="text">What a wonderful world!</p>
						<p class="text">You should go and have a try it!</p>
						<p class="text">But don't forget us!</p>
						<p class="text">We will stay here and wait for you forever!</p>
					</div>
					<div class="footer_box">
						<!--  <div class="col_1_of_3 span_1_of_3">
					<h3>Categories</h3>
					<ul class="first">
						<li><a href="#">Dance</a></li>
						<li><a href="#">History</a></li>
						<li><a href="#">Specials</a></li>
					</ul>
		     </div>-->
						<div class="col_1_of_3 span_1_of_3">
							<h3>Information</h3>
							<ul class="first">
								<li><a href="#">New products</a></li>
								<li><a href="#">top sellers</a></li>
								<li><a href="#">Specials</a></li>
							</ul>
						</div>
						<div class="col_1_of_3 span_1_of_3">
							<h3></h3>
							<ul class="first">
								<li><a href="#"> </a></li>
								<li><a href="#"> </a></li>
								<li><a href="#"> </a></li>
							</ul>
						</div>
						<div class="col_1_of_3 span_1_of_3">
							<h3>Follow Us</h3>
							<ul class="first">
								<li><a href="http://maoyan.com/">MaoYan</a></li>
								<li><a href="https://dianying.taobao.com/">TaoPiaopiao</a></li>
								<li><a href="http://www.utubechinese.com.tw/">Youtube</a></li>
							</ul>
							<div class="copy"></div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>