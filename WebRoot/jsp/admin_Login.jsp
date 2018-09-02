<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath1=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String basePath = basePath1+"jsp/";
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Scau Cinema Admin Login</title>

        <!-- CSS -->
        <!-- <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500"> -->
        <link rel="stylesheet" href="<%=basePath %>css/bootstrap.css">
        <link rel="stylesheet" href="<%=basePath %>css/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=basePath %>css/admin_login_form-elements.css">
        <link rel="stylesheet" href="<%=basePath %>css/admin_login_style.css">
    </head>

    <body>

		<!-- Top menu -->
		<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.html">Bootstrap Flat Registration Form Template</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="top-navbar-1">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<span class="li-text">
								Put some text or
							</span> 
							<a href="#"><strong>links</strong></a> 
							<span class="li-text">
								here, or some icons: 
							</span> 
							<span class="li-social">
								<a href="#"><i class="fa fa-facebook"></i></a> 
								<a href="#"><i class="fa fa-twitter"></i></a> 
								<a href="#"><i class="fa fa-envelope"></i></a> 
								<a href="#"><i class="fa fa-skype"></i></a>
							</span>
						</li>
					</ul>
				</div>
			</div>
		</nav>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>SCAU Cinema</strong> is Welcome to you</h1>
                            <div class="description">
                            	<p>
	                            	This is a form that provides registration for the administrator
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    	<div class="col-sm-6 book">
                    		<img src="<%=basePath %>images/ecinema.jpg" alt="">
                    	</div>
                        <div class="col-sm-5 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Get your account</h3>
                            		<p>Fill in the form below to get access:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-pencil"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="" method="post" class="registration-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-first-name">AdminName</label>
			                        	<input type="text" name="adminname" placeholder="username..." class="form-first-name form-control" id="adminname">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-last-name">AdminPassword</label>
			                        	<input type="password" name="adminpassword" placeholder="password..." class="form-last-name form-control" id="adminpassword">
			                        </div>
			                        <button type="button" class="btn" onclick="login()">Sign In!</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- Javascript -->
        <script src="<%=basePath %>js/jquery-1.11.1.min.js"></script>
        <script src="<%=basePath %>js/bootstrap.min.js"></script>
        <script src="<%=basePath %>js/jquery.backstretch.min.js"></script>
        <script src="<%=basePath %>js/retina-1.1.0.min.js"></script>
        <script src="<%=basePath %>js/scripts.js"></script>
        <script type="text/javascript">
        	function login(){
        	var adminname = $(" #adminname ").val();
        	var password = $(" #adminpassword ").val();
        		$.ajax({
        			url :"/se37/administrator/checklogin.do",
        			type : "post",
        			data : {"adminname" : adminname, "password" : password},
        			success : function(data){
        				if(data=="success"){
        					location.href= "/se37/movie/showmovie.do";
        				} else{
        					alert("用户名或密码出错！");
        				}
        			},
        			error: function(e){
        				alert("数据传输失败！");
        			}
        		});
        	};
        </script>
    </body>

</html>