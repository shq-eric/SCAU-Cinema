<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*,scau.se37.entity.Movie,scau.se37.entity.Customer" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	String basePath = basePath1 + "jsp/";
	String modal="#";
	String datatoggle="#";
	String loginPath = basePath + "login.jsp";
	String logoutPath = "#";
	String login = "Login";
	String login1 = (String) session.getAttribute("customUsername");
	if (login1 != null) {
		login = "Welcome! " + login1;
		loginPath = "#myModal";
		logoutPath = basePath1 + "customer/logout.do";
		modal="modal";
		datatoggle="data-toggle";
	}
	if (login1 == null) {
		login = "Login";
		logoutPath = "#";
		modal="modal";
		datatoggle="#";
	}
	String test="";
	Customer cus=(Customer)session.getAttribute("customer");
	if(cus==null){
	    cus=new Customer();
	    cus.setCustomId(0);
	    cus.setCustomUsername("");
	    cus.setCustomPassword("");
	    cus.setCustomTel("");
	}
	//List<Movie> movieList=(List<Movie>)session.getAttribute("movieList");
%>

<html>
<head>
<title>SCAU-Main</title>
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

<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="<%=basePath%>css/bootstrap.css" rel='stylesheet'
	type='text/css' />
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
	
<!-- start plugins -->

<link
	href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
<script src="<%=basePath%>js/responsiveslides.min.js"></script>


<script type="text/javascript">
	$(function() {
		$("#slider").responsiveSlides({
			auto : true,
			nav : true,
			speed : 500,
			namespace : "callbacks",
			pager : true,
		});
	});
	
	function getMovieInfo(){

	    if(${movieList[0].movieId==null})
	    location.href="<%=basePath1%>movie/loadMovie.do";
	}
</script>


</head>


<body onload="getMovieInfo()">

<script type="text/javascript">
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


	<div class="container">





		<div class="container_wrap">
			<div class="header_top">
				<div class="col-sm-3 logo">
					<a href="<%=basePath1%>movie/loadMovie.do"><img
						src="<%=basePath%>images/logo.png" alt="" /></a>
				</div>
				<div class="col-sm-6 nav">
					<ul>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="comic"><a href="<%=basePath1%>movie/lMovie.do">
							</a></span></li>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="movie"><a href="<%=basePath1%>movie/lMovie.do">
							</a> </span></li>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="video"><a href="<%=basePath1%>movie/lMovie.do">
							</a></span></li>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="game"><a href="<%=basePath1%>movie/lMovie.do">
							</a></span></li>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="tv"><a href="<%=basePath1%>movie/lMovie.do"> </a></span></li>
						<li><span class="simptip-position-bottom simptip-movable"
							data-tooltip="more"><a href="<%=basePath1%>movie/lMovie.do">
							</a></span></li>
					</ul>
				</div>
				<div class="col-sm-3 header_right">
					<ul class="header_right_box " id="hello">
						<li><img src="<%=basePath%>images/p2.png" alt="" /></li>
						<li><p>
								<a href="<%=loginPath %>" <%=datatoggle %>="<%=modal %>" onclick="personInfo()"><%=login%></a>
							</p></li>

                  



						<div class="clearfix"></div>
						<li><p>
								<a href="<%=logoutPath%>">Logout</a>
							</p></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="slider">
				<div class="callbacks_container">
					<ul class="rslides" id="slider">
						<li><img src="<%=basePath%>images/banner.jpg"
							class="img-responsive" alt="" />
							
								<!--  <a href="#" class="hvr-shutter-out-horizontal">Watch Now</a>-->
							</li>
						<li><img src="<%=basePath%>images/banner1.jpg"
							class="img-responsive" alt="" />
							
							<!--	<a href="#" class="hvr-shutter-out-horizontal">Watch Now</a>-->
							</li>
						<li><img src="<%=basePath%>images/banner2.jpg"
							class="img-responsive" alt="" />
							
							<!--	<a href="#" class="hvr-shutter-out-horizontal">Watch Now</a> -->
							</li>
					</ul>
				</div>
				<div class="">
				<!--	<div class="col-md-9">
						<ul class="list_1">
							<li>Published <span class="m_1">June 20, 2018</span></li>
							<li>Updated <span class="m_1">June 21 2018</span></li>
							<li>Rating <span class="m_1">
							<img src="<%=basePath%>images/rating.png" alt="" /></span>  </li>
						</ul> 
					</div> -->
					<div class="col-md-3 grid_1">
						<ul class="list_1 list_2">
						<!--	<li><i class="icon1"> </i>
								<p>2,548</p></li>
							<li><i class="icon2"> </i>
								<p>215</p></li> -->

						</ul>
					</div>
				</div>
			</div>
			<div class="content">
				<div class="box_1">
					<h1 class="m_2">Featurd Movies</h1>
					<!--  <div class="search">
						<form>
							<input type="text" value="Search..." onfocus="this.value='';"
								onblur="if (this.value == '') {this.value ='';}"> <input
								type="submit" value="">
						</form>
					</div> -->
					<div class="clearfix"></div>
				</div>
				<div class="box_2">
					<div class="col-md-5 grid_3">
						<div class="row_1">
							<div class="col-md-6 grid_4">
								<a href="#">
									<div class="grid_2">
										<img src="<%=basePath%>images/pic1.jpg" class="img-responsive"
											alt="" />
										<div class="caption1">
								<!-- 			<ul class="list_3">
											<li><i class="icon5"> </i> 
													<p>3,848</p></li>
											</ul>
											 -->
	
											<p class="m_3">Guardians of the Galaxy</p>
										</div>
									</div>
									<div class="grid_2 col_1">
										 <a href="<%=basePath1%>movie/single.do?movieId=${movieList[3].movieId}" > <img id="${movieList[3].movieId}" src="<%=basePath%>images/${movieList[3].movieId}.jpg" class="img-responsive"
											alt="/"  > </a>  
										<div class="caption1">
										<!-- 
											<ul class="list_3">
												<li><i class="icon5"> </i>
													<p>3,348</p></li>
											</ul>
											 -->
											<i class=" "> </i>
											<p class="m_3">${movieList[3].movieName}</p>
										</div>
									</div>
								</a>
							</div>
							<div class="col-md-6 grid_7">
								<div class="col_2">
								 
									<ul class="list_4">
								<!-- 		<li><i class="icon1"> </i> -->
								<li>&nbsp;&nbsp;
											<p> ${movieList[4].movieName}</p>
											</li>
								<!--		<li><i class="icon2"> </i>-->
								<li>&nbsp;&nbsp;
											<p>主演：${movieList[4].movieMainActor}</p></li>
                                     </li>
										<li> &nbsp;&nbsp;时长 : &nbsp;&nbsp;
											<p>
												${movieList[4].movieDuration}分钟
											</p>
										</li>
								<!--  		<li>Release Date : &nbsp;<span class="m_4">June
												25, 2018</span>
										</li>
										-->
										<div class="clearfix"></div>
									</ul>
									
									<div class="m_5">
										<a href="<%=basePath1 %>movie/single.do?movieId=${movieList[4].movieId}" ><img id="${movieList[4].movieId}"
											src="<%=basePath%>images/${movieList[4].movieId}.jpg" class="img-responsive"
											alt="" /></a>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="row_2">
							<a href="<%=basePath1 %>movie/single.do?movieId=${movieList[7].movieId}"><img id="${movieList[7].movieId}"
								src="<%=basePath%>images/${movieList[7].movieId}.jpg" class="img-responsive" alt="" /></a>
								
								<div class="caption1">
								<!-- 
											<ul class="list_5">
												<li><i class="icon5"> </i>
													<p>3,048</p></li>
											</ul>
								 -->
											<i class=" icon6"> </i>
											<p class="m_3">${movieList[7].movieName}</p>
										</div>
						</div>
					</div>
					<div class="col-md-5 content_right">
						<div class="row_3">
							<div class="col-md-6 content_right-box">
								<a href="<%=basePath1 %>movie/single.do?movieId=${movieList[0].movieId}">
									<div class="grid_2">
									
										<img  id="${movieList[0].movieId}" src="<%=basePath%>images/${movieList[0].movieId}.jpg" class="img-responsive"
											alt="" />
										<div class="caption1">
								<!-- 
											<ul class="list_5">
												<li><i class="icon5"> </i>
													<p>3,048</p></li>
											</ul>
								 -->
											<i class=" icon6"> </i>
											<p class="m_3">${movieList[0].movieName}</p>
										</div>
									</div>
								</a>
							</div>
							<div class="col-md-6 grid_5">
								<a href="<%=basePath1 %>movie/single.do?movieId=${movieList[1].movieId}">
									<div class="grid_2">
										<img id="${movieList[1].movieId}" src="<%=basePath%>images/${movieList[1].movieId}.jpg" class="img-responsive"
											alt="" />
										<div class="caption1">
									<!--  
											<ul class="list_5">
												<li><i class="icon5"> </i>
													<p>3,500</p></li>
											</ul>
										-->
											<i class="  icon6"> </i>
											<p class="m_3">${movieList[1].movieName}</p>
										</div>
									</div>
								</a>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="video">
							<iframe width="100%" height=""
								src="https://www.youtube.com/embed/s1QeoSedWmM" frameborder="0"
								allowfullscreen></iframe>
						</div>
						<div class="row_5">
							<div class="col-md-6">
								<div class="col_2">
									<ul class="list_4">
								<!--  		<li><i class="icon1"> </i> -->
								<li> &nbsp;&nbsp;
											<p>${movieList[6].movieName}</p></li>
								<!--  	<li><i class="icon2"> </i>-->
								<li> &nbsp;&nbsp;
											<p>主演：${movieList[6].movieMainActor}</p></li>

										<li>&nbsp;&nbsp;时长 : &nbsp;&nbsp;
											<p>
												${movieList[6].movieDuration}分钟
											</p>
										</li>
										<div class="clearfix"></div>
									</ul>

								</div>
							</div>
							<div class="col-md-6 m_6">
								<a href="<%=basePath1 %>movie/single.do?movieId=${movieList[6].movieId}"> <img id="${movieList[6].movieId}"
									src="<%=basePath%>images/${movieList[6].movieId}.jpg" class="img-responsive"
									alt="" />
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-2 grid_6">
						<div class="m_7">
							<a href="<%=basePath1 %>movie/single.do?movieId=${movieList[2].movieId}"><img id="${movieList[2].movieId}"
								src="<%=basePath%>images/${movieList[2].movieId}.jpg" class="img-responsive" alt="" /></a>
						</div>
						<div class="caption1">
						<!--  
							<ul class="list_5">
								<li><i class="icon5"> </i>
									<p>3,600</p></li>
							</ul>
							-->
							<i class="  icon6"> </i>
							<p class="m_3">${movieList[2].movieName}</p>
						</div>
						<div class="col_2 col_3">
							<ul class="list_4">
							<!--  	<li><i class="icon1"> </i> -->
							<li> &nbsp;&nbsp;
									<p>${movieList[5].movieName}</p></li>
							<!--	<li><i class="icon2"> </i> -->
							<li> &nbsp;&nbsp;
									<p>主演：${movieList[5].movieMainActor}</p></li>

								<li>&nbsp;&nbsp;时长 &nbsp;&nbsp;
									<p>
										${movieList[5].movieDuration}分钟
									</p>
					<!-- 			</li>
								<li>Release : &nbsp;<span class="m_4">June 25, 2018</span>
								</li>
								 -->
								<div class="clearfix"></div>
							</ul>
							<div class="m_8">
								<a href="<%=basePath1 %>movie/single.do?movieId=${movieList[5].movieId}"><img id="${movieList[5].movieId}"
									src="<%=basePath%>images/${movieList[5].movieId}.jpg" class="img-responsive"
									alt="" /></a>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
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
					<div >
					  <label style="width:70px">ID:</label><input type="text" id="customId"  value="<%=cus.getCustomId() %>" readonly="true"></input><br><br>
					  <label style="width:70px">用户名:</label>  <input type="text" id="usrname" name="cusname" value="<%=cus.getCustomUsername() %>" readonly="true"></input><br><br>
					    
					  <label style="width:70px">电话:</label>   <input type="text" id="cuspho" name="custelephone" value="<%=cus.getCustomTel() %>" readonly="true"></input>
					</div>
					</div>
					<div class="modal-footer">
						
						<button id="btn1" type="button" class="btn btn-primary" onclick="gotoPersonInfo()">个人中心</button>
						<button id="btn2" type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
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
							<img src="<%=basePath%>images/f_logo_2.png" alt="" />
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