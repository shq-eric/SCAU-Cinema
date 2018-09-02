<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath1=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String basePath = basePath1+"jsp/";
%>
<% String is_null = (String)session.getAttribute("administratorName");
	if(is_null == null){
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>ScauCinema | Manage</title>

    <!-- Bootstrap **-->
    <link href="<%=basePath %>bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome **-->
    <link href="<%=basePath %>css/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Datatables -->
    <link href="<%=basePath %>css/datatables.net-bs/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/datatables.net-buttons-bs/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/datatables.net-fixedheader-bs/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/datatables.net-responsive-bs/responsive.bootstrap.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="<%=basePath %>build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    
     <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Scau Cinema!</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="<%=basePath %>images/user.png" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2><%=session.getAttribute("administratorName")%></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>日常业务</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-bookmark"></i>基本信息管理 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li ><a href="<%=basePath1 %>hall/showhall.do">影厅设置</a></li>
                      <li><a href="<%=basePath1 %>movie/showmovie.do">电影管理</a></li>
                      <li><a href="<%=basePath1 %>schedule/showschedule.do">放映管理</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-search"></i> 信息查询 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" >
                      <li ><a href="<%=basePath1 %>order/showmovieorder.do">售票订单</a></li>
                      <li><a href="<%=basePath1 %>refundorder/showrefundorder.do">退票订单</a></li>
                      <!-- <li><a href="index3.html">放映查询</a></li> -->
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i> 信息统计 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="index.html">票房统计</a></li>
                      <li><a href="index2.html">销售情况统计</a></li>
                      <li><a href="index3.html">Dashboard3</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
              <div class="menu_section">
                <h3>系统设置</h3>  
                <ul class="nav side-menu">
                    <li><a><i class="fa fa-user"></i>用户管理<span class="fa fa-chevron-down"></span></a>
                      <ul class="nav child_menu" style="display: block;">
                        <li class="sub_menu current-page"><a href="<%=basePath1 %>administrator/addadmin.do">添加管理员</a></li>
                        <li><a href="<%=basePath1 %>administrator/showadministrator.do">修改管理员</a></li>
                      </ul>
                    </li>
                  <li><a href="<%=basePath1 %>administrator/logout.do"><i class="fa fa-sign-out"></i> 系统退出 </a></li>
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <!-- 左栏底部功能框 -->
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="<%=basePath %>images/user.png" alt=""><%=session.getAttribute("administratorName")%>
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> 简介</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span> 设置</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">帮助</a></li>
                    <li><a href="<%=basePath1 %>administrator/logout.do"><i class="fa fa-sign-out pull-right"></i> 登出</a></li>
                  </ul>
                </li>

                
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">

          <!-- 模态框示例（Modal） -->
          

          <div class="">
            <div class="clearfix">
            </div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_content">

                    <form method="post"  class="form-horizontal form-label-left" novalidate="">
                      <span class="section"><h1>Administrator Info</h1></span>

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="Administrator_Name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6"  name="administratorName" placeholder="both name(s) e.g John" required="required" type="text">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email 
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="email" id="Administrator_Email" name="administratorEmail" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="password" class="control-label col-md-3">Password</label> <span class="required">*</span>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="Adminstrator_Password" type="password" name="password" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="password2" class="control-label col-md-3 col-sm-3 col-xs-12">Repeat Password</label> 
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="Adminstrator_Password2" type="password" name="password2" data-validate-linked="password" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="telephone">Telephone <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="tel" id="Administrator_Phone" name="administratorPhone" required="required" data-validate-length-range="8,20" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3" style="text-align:center">
                          <button type="reset" class="btn btn-primary">Reset</button>
                          <button type="button" id="send" class="btn btn-success" onclick="add()">Submit</button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Scau Cinema - System Design by <a href="https://baidu.com">SHQ</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery **-->
    <script src="<%=basePath %>js/jquery/jquery.min.js"></script>
    <!-- Bootstrap **-->
    <script src="<%=basePath %>bootstrap/js/bootstrap.min.js"></script>

    <!-- Datatables 
    <script src="<%=basePath %>js/datatables.net/jquery.dataTables.min.js"></script>
    <script src="<%=basePath %>js/datatables.net-bs/dataTables.bootstrap.min.js"></script>
    <script src="<%=basePath %>js/datatables.net-buttons/dataTables.buttons.min.js"></script>
    <script src="<%=basePath %>js/datatables.net-buttons-bs/buttons.bootstrap.min.js"></script>
    <script src="<%=basePath %>js/datatables.net-buttons/buttons.flash.min.js"></script>
    <script src="<%=basePath %>js/datatables.net-buttons/buttons.html5.min.js"></script>
    <script src="<%=basePath %>js/datatables.net-buttons/buttons.print.min.js"></script>
    <script src="<%=basePath %>js/datatables.net-fixedheader/dataTables.fixedHeader.min.js"></script>
    <script src="<%=basePath %>js/datatables.net-responsive/dataTables.responsive.min.js"></script>
    <script src="<%=basePath %>js/datatables.net-responsive-bs/responsive.bootstrap.js"></script>
    <script src="<%=basePath %>js/datatables.net-scroller/dataTables.scroller.min.js"></script>
    -->
    <!-- iCheck -->
    <script src="<%=basePath %>js/validator/validator.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="<%=basePath %>build/js/custom.min.js"></script>
		
	<script type="text/javascript">
		function add(){
		var adminname = $(" #Administrator_Name").val();
		var adminemail = $(" #Administrator_Email").val();
		var adminpassword = $(" #Adminstrator_Password").val();
		var admintel = $(" #Administrator_Phone").val();
			$.ajax({
				url :"/se37/administrator/addadministrator.do", 
              type : "post",
              data : {"adminname":adminname, "adminemail":adminemail, "adminpassword":adminpassword, "admintel":admintel},
              success : function (data){
                  //返回空值
                  if(data == "success"){
                      	location.href= "/se37/administrator/showadministrator.do";
                  } else if(data == "adminname is exist"){ 
                  		alert("用户名已被注册");
                  } else{
                  		alert("添加失败");
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