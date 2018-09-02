<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String basePath = basePath1+"jsp/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>SCAU LOGIN</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Movie_store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="<%=basePath %>css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<script type="text/javascript" src="<%=basePath %>js/jquery-2.1.1.min.js"></script>

<script src="<%=basePath %>js/jquery-migrate-1.2.1.js"></script>
<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<script type="text/javascript">
   
    function login(){
        var username=document.getElementById("username").value;
       var password=document.getElementById("password").value;
        var customerInfo={
            "customUsername":username,
            "customPassword":password
        };
      $.ajax({
            type:"post",
            async:false,
             url:"<%=basePath1%>customer/customerLogin.do",
             dataType:"jsonp",
             jsonp:"callback",
             data:customerInfo,
             success:function(data){
                 console.log("ok");
                 if(data.tf=="true"){
                document.getElementById("loginForm").action="<%=basePath1%>customer/success.do";
                document.getElementById("loginForm").submit();
                 }
                 else{
                 alert("用户名或密码出错");
                 document.getElementById("loginForm").action="<%=basePath%>login.jsp";
                document.getElementById("loginForm").submit();
                 }
             },
             error:function(){
                 alert("fail!");
             }
            
        });
    }
</script>
</head>
<body>

<div class="container">
	<div class="container_wrap">
		<div class="header_top">
		    <div class="col-sm-3 logo"><a href="<%=basePath1 %>movie/loadMovie.do"><img src="<%=basePath %>images/logo.png" alt=""/></a></div>
		    <div class="col-sm-6 nav">
			  <ul>
				 <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="comic"><a href="<%=basePath1%>movie/lMovie.do"> </a></span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="movie"><a href="<%=basePath1%>movie/lMovie.do"> </a> </span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="video"><a href="<%=basePath1%>movie/lMovie.do"> </a></span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="game"><a href="<%=basePath1%>movie/lMovie.do"> </a></span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="tv"><a href="<%=basePath1%>movie/lMovie.do"> </a></span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="more"><a href="<%=basePath1%>movie/lMovie.do"> </a></span></li>
			 </ul>
			</div>
			<div class="col-sm-3 header_right">
			   <ul class="header_right_box">
				 <li><img src="<%=basePath %>images/p2.png" alt=""/></li>
				 <li><p><a href="<%=basePath %>login.jsp">Login</a></p></li>
				 <li class="last"><i class="edit"> </i></li>
				 <div class="clearfix"> </div>
			   </ul>
			</div>
			<div class="clearfix"> </div>
	      </div>
	      <div class="content">
      	     <div class="register">
			   <div class="col-md-6 login-left">
			  	 <h3>New Customers</h3>
				 <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
				 <a class="acount-btn" href="<%=basePath %>register.jsp">Create an Account</a>
			   </div>
			   
			   <div class="col-md-6 login-right">
			  	<h3>Registered Customers</h3>
				<p>If you have an account with us, please log in.</p>
				<form id="loginForm" method="post">
				  <div>
					<span>Username<label>*</label></span>
					<input id="username" name="customUsername" type="text" > 
				  </div><div>
					<span>Password<label>*</label></span>
					<input id="password" name="customPassword" type="password"> 
				  </div>
				  <input type="submit" value="Login" onclick="login()">
				  
			    </form>
			    
			    
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
					<img src="<%=basePath %>images/f_logo_2.png" alt=""/>
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
		     </div> -->
			
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