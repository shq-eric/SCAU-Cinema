<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*,scau.se37.entity.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     String path = request.getContextPath();
     String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String basePath = basePath1+ "jsp/";
	Movie movie=(Movie)session.getAttribute("movie");
	String customId=(String)session.getAttribute("customId");
	String login="Login";
	String modal="#";
	String datatoggle="#";
	String loginPath = basePath + "login.jsp";
	String logoutPath = "#";
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
 %>

<html>
<head>
<title>The details of Movie</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Movie_store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<link href="<%=basePath%>css/bootstrap.css" rel='stylesheet'
	type='text/css' />
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
 <script type="text/javascript">
    function checkUser(){
        var customId=<%=customId%>;
        if(customId==null){
            alert("您还没有登录，买票请先登录");
        }
        else{
            location.href="<%=basePath1%>movie/loadBookingInfo.do";
        }
    }
    
    function personInfo(){
	
	    var customId="<%=session.getAttribute("customId")%>";
	    
	    var customUsrname="<%=session.getAttribute("customUsername")%>";
	    var customTel1="<%=session.getAttribute("customTel")%>";
	    document.getElementById("customId").value=customId;
	    document.getElementById("customId").readOnly="true";
	    document.getElementById("usrname").value=customUsrname;
	    document.getElementById("usrname").readOnly="true";
	    document.getElementById("cuspho").value=customTel1;
	    document.getElementById("cuspho").readOnly="true";
	   
	   
	    if(customId==null)
	    document.getElementById("btn1").disabled=true;
	}
	
	function gotoPersonInfo(){
	     location.href="<%=basePath1%>customer/personalinformation.do";
	
	}

</script>
</head>
<body>
<div class="container">

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
					  <label style="width:70px">ID:</label><input type="text" id="customId" ></input><br><br>
					  <label style="width:70px">用户名:</label>  <input type="text" id="usrname" name="cusname"></input><br><br>
					  <label style="width:70px">电话:</label>   <input type="text" id="cuspho" name="custelephone"></input>
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

	<div class="container_wrap">
		<div class="header_top">
		    <div class="col-sm-3 logo"><a href="<%=basePath1 %>movie/loadMovie.do"><img src="images/logo.png" alt=""/></a></div>
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
			   <ul class="header_right_box">
				 <li><img src="images/p2.png" alt=""/></li>
				 <li><p><a href="<%=loginPath %>" <%=datatoggle %>="<%=modal %>" onclick="personInfo()"><%=login%></a></p></li>
				 <li class="last"><i class="edit"> </i></li>
				 <li><p>
								<a href="<%=logoutPath%>">Logout</a>
							</p></li>
				 <div class="clearfix"> </div>
			   </ul>
			</div>
			<div class="clearfix"> </div>
	      </div>
	   <div class="content">
      	   <div class="movie_top">
      	         <div class="col-md-9 movie_box">
                        <div class="grid images_3_of_2 ">
                        	<div class="movie_image">
                                
                                <img src="images/${movie.movieId}.jpg" class="img-responsive" alt=""/>
                            </div>
                              <div class="movie_rate">
                          	
                            	
							 <!--     <fieldset>					
								   <section>
								     <div class="rating">
										<input type="radio" name="stars-rating" id="stars-rating-5">
										<label for="stars-rating-5"><i class="icon-star"></i></label>
										<input type="radio" name="stars-rating" id="stars-rating-4">
										<label for="stars-rating-4"><i class="icon-star"></i></label>
										<input type="radio" name="stars-rating" id="stars-rating-3">
										<label for="stars-rating-3"><i class="icon-star"></i></label>
										<input type="radio" name="stars-rating" id="stars-rating-2">
										<label for="stars-rating-2"><i class="icon-star"></i></label>
										<input type="radio" name="stars-rating" id="stars-rating-1">
										<label for="stars-rating-1"><i class="icon-star"></i></label>
									 </div>
								  </section>
							    </fieldset> -->
							       
							    <label> ${movie.movieName} </label>
						  	   </form>
						  	  
						  	   <div class="clearfix"> </div>
                            </div> 
                        </div>
                       
						<!--è¿éæ¯çµå½±ä¿¡æ¯-->
                        <div class="desc1 span_3_of_2">
                        	<p class="movie_option"><strong>片名 </strong>${movie.movieName }</p>
                        	<p class="movie_option"><strong>主演: </strong>${movie.movieMainActor }</p>
                        	<p class="movie_option"><strong>导演： </strong>${movie.movieDirector }</p>
                        	<p class="movie_option"><strong>时长: </strong>${movie.movieDuration}分钟</p>
                        	<p class="movie_option"><strong>状态: </strong>${movie.movieStatus}</p>
                            <div class="down_btn" ><a class="btn1" href="#" onclick="checkUser()"><span> </span>Buy it</a></div>
                         </div>
                        <div class="clearfix"> </div>
                       <div class="clearfix"> </div>
                       <div class="clearfix"> </div>
                        
		                
                      </div>
                      <div class="col-md-3">
                      	<div class="movie_img"><div class="grid_2">
							<img src="images/pic6.jpg" class="img-responsive" alt="">
							<div class="caption1">
						<!-- 
									<ul class="list_5 list_7">
							    		<li><i class="icon5"> </i><p>3,548</p></li>
							    	</ul>
					      -->
							<!--     	<i class="icon4 icon6 icon7"> </i>--> 
							    	<p class="m_3">美国队长1</p>
							</div>
						    </div>
						   </div>
                      	  <div class="grid_2 col_1">
							<img src="images/pic2.jpg" class="img-responsive" alt="">
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
							<img src="images/pic9.jpg" class="img-responsive" alt="">
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
                      <div class="clearfix"> </div>
                  </div>
           </div>
    </div>
</div>
<div class="container"> 
 <footer id="footer">
 	<div id="footer-3d">
		<div class="gp-container">
			<span class="first-widget-bend"> </span>
		</div>		
	</div>
    <div id="footer-widgets" class="gp-footer-larger-first-col">
		<div class="gp-container">
            <div class="footer-widget footer-1">
            	<div class="wpb_wrapper">
					<img src="images/f_logo_2.png" alt=""/>
				</div> 
	          <br>
	          <p>You can find the other things what you want to find here.</p>
			  <p class="text">What a wonderful world! </p>
			  <p class="text">You should go and have a try it!</p>
			  <p class="text">But don't forget us! </p>
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
					<h3>   </h3>
					<ul class="first">
						<li><a href="#">   </a></li>
						<li><a href="#">   </a></li>
						<li><a href="#">   </a></li>
					</ul>
		     </div> 
		    <div class="col_1_of_3 span_1_of_3">
					<h3>Follow Us</h3>
					<ul class="first">
						<li><a href="http://maoyan.com/">MaoYan</a></li>
						<li><a href="https://dianying.taobao.com/">TaoPiaopiao</a></li>
						<li><a href="http://www.utubechinese.com.tw/">Youtube</a></li>
					</ul>
					<div class="copy">
				      
			        </div>
		     </div>
		    <div class="clearfix"> </div>
	        </div>
	        <div class="clearfix"> </div>
		</div>
	</div>
  </footer>
</div>		
</body>
</html>