<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String basePath1 = basePath+"jsp/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Movie_store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="<%=basePath1 %>css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="<%=basePath1 %>css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<script type="text/javascript" src="<%=basePath1 %>js/jquery-1.11.1.min.js"></script>



<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>

<script type="text/javascript">
 var t=0;
    function checkCustomInfo(){
        var customUsername=document.getElementById("username").value;
         var pwd1=document.getElementById("password1").value;
          var pwd2=document.getElementById("password2").value;
         if(customUsername=="" || pwd1=="" || pwd2==""){
           alert("用户名和密码不能为空！");
           return false;
         }
         return true;
    }
    
    function validate(){
        var pwd1=document.getElementById("password1").value;
        var pwd2=document.getElementById("password2").value;
        if(pwd1==pwd2){
            document.getElementById("tips").innerHTML="<font color='gray'>输入正确</font>";
            if(t==0)
            document.getElementById("doSubmit").disabled=false;
        }
        else{
            document.getElementById("tips").innerHTML="<font color='red'>密码不一致</font>";
            
             document.getElementById("doSubmit").disabled=true;
        }
    }
    
   function checkUsername(){
        var customUsername=document.getElementById("username").value;
       
        $.ajax({
             type:"post",
             async:false,
             url:"<%=basePath%>customer/checkUsername.do",
             dataType:"jsonp",
             jsonp:"callback1",
             data:"username="+customUsername,
             success:function(data){
                 console.log(data.t);
                 if(data.t=="false"){
                    
                     document.getElementById("usernameTips").innerHTML="<font color='red'>用户名已存在</font>";
                     t=1;
                     document.getElementById("doSubmit").disabled=true;
                     
                 }
                 else{
                     document.getElementById("usernameTips").innerHTML="<font color='gray'>新用户</font>";
                     t=0;
                     document.getElementById("doSubmit").disabled=false;
                     
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
		    <div class="col-sm-3 logo"><a href="<%=basePath %>movie/loadMovie.do"><img src="<%=basePath1 %>images/logo.png" alt=""/></a></div>
		    <div class="col-sm-6 nav">
			  <ul>
				 <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="comic"><a href="<%=basePath%>movie/lMovie.do"> </a></span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="movie"><a href="<%=basePath%>movie/lMovie.do"> </a> </span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="video"><a href="<%=basePath%>movie/lMovie.do"> </a></span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="game"><a href="<%=basePath%>movie/lMovie.do"> </a></span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="tv"><a href="<%=basePath%>movie/lMovie.do"> </a></span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="more"><a href="<%=basePath%>movie/lMovie.do"> </a></span></li>
			 </ul>
			</div>
			<div class="col-sm-3 header_right">
			   <ul class="header_right_box">
				 <li><img src="<%=basePath1 %>images/p2.png" alt=""/></li>
				 <li><p><a href="<%=basePath1 %>login.jsp">Login</a></p></li>
				 <li class="last"><i class="edit"> </i></li>
				 <div class="clearfix"> </div>
			   </ul>
			</div>
			<div class="clearfix"> </div>
	      </div>
	      <div class="content">
      	     <div class="register">
		  	  <form action="<%=basePath %>customer/saveCustomer.do" method="post" onsubmit="return checkCustomInfo()"> 
				 <div class="register-top-grid">
					<h3>Personal Information</h3>
					 <div>
						<span>Name<label>*</label></span>
						<input id="username" type="text" name="customUsername" onchange="checkUsername()"> 
						<span id="usernameTips" >
								</span>
					 </div>
					
					 <div>
						 <span>Phone Number<label>*</label></span>
						 <input id="tel" type="text" name="customTel"> 
					 </div>
					 <div class="clearfix"> </div>
					   <a class="news-letter" href="#">
						 <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Sign Up for Newsletter</label>
					   </a>
					 </div>
				     <div class="register-bottom-grid">
						    <h3>Login Information</h3>
							 <div>
								<span>Password<label>*</label></span>
								<input id="password1" type="password" name="customPassword">
							 </div>
							 <div>
								<span>Confirm Password<label>*</label></span>
								<input id="password2" type="password" onkeyup='validate()'>
								<span id="tips">
								</span>
							 </div>
							 <div class="clearfix"> </div>
					 </div>
				<div class="clearfix"> </div>
				<div class="register-but">
					   <input id="doSubmit" type="submit" value="submit">
					<div class="clearfix"> </div>  
				   </form>
				</div>
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
					<img src="<%=basePath1 %>images/f_logo_2.png" alt=""/>
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