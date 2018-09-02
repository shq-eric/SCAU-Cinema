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
    <!--<link href="<%=basePath %>css/datatables.net-scroller-bs/scroller.bootstrap.min.css" rel="stylesheet">-->

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
                      <li><a href="<%=basePath1 %>hall/showhall.do">影厅设置</a></li>
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
                  <!-- <li><a><i class="fa fa-bar-chart-o"></i> 信息统计 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="index.html">票房统计</a></li>
                      <li><a href="index2.html">销售情况统计</a></li>
                      <li><a href="index3.html">Dashboard3</a></li>
                    </ul>
                  </li> -->
                </ul>
              </div>
              <div class="menu_section">
                <h3>系统设置</h3>  
                <ul class="nav side-menu">
                    <li><a><i class="fa fa-user"></i>用户管理<span class="fa fa-chevron-down"></span></a>
                      <ul class="nav child_menu" style="display: block;">
                        <li ><a href="<%=basePath1 %>administrator/addadmin.do">添加管理员</a></li>
                        <li class="sub_menu current-page"><a href="<%=basePath1 %>administrator/showadministrator.do">修改管理员</a></li>
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
          
          <form method="post" action="<%=basePath1 %>administrator/updateadministrator.do" class="form-horizontal" role="form" id="form_data" onsubmit="return check_form()" style="margin: 20px;">
            <div class="modal fade" id="updateManagerModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            员工信息
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" role="form">
                        	<div class="form-group">
                                <label for="Administrator_Id" class="col-sm-3 control-label">员工ID</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="administratorId" value="{Administrator_Id}" id="Administrator_Id"
                                           readonly="true">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="Administrator_Name" class="col-sm-3 control-label">员工名</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="administratorName" value="{Administrator_Name}" id="Administrator_Name"
                                           placeholder="请输入员工名">
                                </div>
                            </div>

							<div class="form-group">
                                <label for="Administrator_Password" class="col-sm-3 control-label">员工密码</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="administratorPassword" value="{Administrator_Password}" id="Administrator_Password"
                                           placeholder="请输入员工密码">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="Administrator_Phone" class="col-sm-3 control-label">员工电话</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="administratorPhone" value="{Administrator_Phone}" id="Administrator_Phone"
                                           placeholder="请输入员工电话">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="Administrator_Email" class="col-sm-3 control-label">员工邮箱</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="administratorEmail" value="{Administrator_Email}" id="Administrator_Email"
                                           placeholder="请输入员工邮箱">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="Cinema_Id" class="col-sm-3 control-label">所在电影院ID</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="cinemaId" value="{Cinema_Id}" id="Cinema_Id"
                                           placeholder="所在电影院ID">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                      <button type="submit" class="btn btn-primary">提交</button><span id="tip"> </span>
                    </div>
                </div><!-- /.modal-content -->
        
              </div><!-- /.modal -->
            </div>
          </form>

          <div class="">
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h1>Administrator  </h1>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>Cinema_Id</th>
                          <th>Administrator_Id</th>
                          <th>Administrator_Name</th>
                          <th>Administrator_Phone</th>
                          <th>Administrator_Email</th>
                          <th>Administrator_Level</th>
                          <th data-sortable="false"></th>
                        </tr>
                      </thead>


                      <tbody>
                      <c:forEach items="${administrators}" var="administrator">
                        <tr>
                          <!-- 字体大小 -->
                          <th width="15%" style="font-size:20px;">${administrator.getCinemaId()}</th>
                          <th width="15%" style="font-size:20px;">${administrator.getAdministratorId()}</th>
                          <th style="font-size:15px;">${administrator.getAdministratorName()}</th>
                          <th style="font-size:15px;">${administrator.getAdministratorPhone()}</th>
                          <th style="font-size:15px;">${administrator.getAdministratorEmail()}</th>
                          <th width="5%" style="font-size:15px;">${administrator.getAdministratorLevel()}</th>
                          <th width="150px">
                            <button type="button" id="${administrator.getAdministratorId()}" data-toggle="modal" class="btn btn-info btn-sm" onclick="updateAdmin(this.id)" data-target="#updateManagerModel">
                              <i class="fa fa-pencil"> 修改 </i>
                            </button>
                            <button type="button" id="${administrator.getAdministratorId()}" class="btn btn-danger btn-sm" onclick="deleteAdmin(this.id)">
                              <i class="fa fa-trash-o"> 删除 </i>
                            </button>
                            <!-- <input type="button" class="btn btn-danger btn-sm" value="删除"> -->
                          </th>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
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
    
    <!-- Datatables -->
    
    <!-- Custom Theme Scripts -->
    <script src="<%=basePath %>build/js/custom.min.js"></script>

  	<script type="text/javascript">
		function deleteAdmin(adminid){
			$.ajax({
              url :"/se37/administrator/deleteadministrator.do", 
              type : "post",
              data : {"id":adminid},
              success : function (data){
                  //返回空值
                  if(data){
                      //刷新
                      location.href= "/se37/administrator/showadministrator.do";
                  } else{  
                  	alert("删除失败")
                  		}       	
               },
               error:function(e){
                    alert("数据传输失败！");                   
                }
           });
		};
		
		function updateAdmin(adminid){
		$.ajax({
              url :"/se37/administrator/updatebinddata.do", 
              type : "post",
              data : {"id":adminid},
              success : function (data){
                  //返回空值
                  if(data==null){
                      alert("不存在该Admin！");
                  } else{  //存在该Hall
                  console.log(data);
                  		$("#Administrator_Id").val(data.administratorId);
                  		$("#Administrator_Name").val(data.administratorName);
                  		$("#Cinema_Id").val(data.cinemaId);
                  		$("#Administrator_Email").val(data.administratorEmail);
                  		$("#Administrator_Phone").val(data.administratorPhone);
                  		$("#Administrator_Password").val(data.administratorPassword);
                  		}       	
               },
               error:function(e){
                    alert("数据传输失败！");                   
                }
           });
		};	
	</script>

  </body>
</html>