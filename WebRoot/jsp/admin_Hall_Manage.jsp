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
                    <ul class="nav child_menu" style="display: block;">
                      <li class="current-page"><a href="<%=basePath1 %>hall/showhall.do">影厅设置</a></li>
                      <li><a href="<%=basePath1 %>movie/showmovie.do">电影管理</a></li>
                      <li><a href="<%=basePath1 %>schedule/showschedule.do">放映管理</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-search"></i> 信息查询 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<%=basePath1 %>order/showmovieorder.do">售票订单</a></li>
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
                  </li>-->
                </ul>
              </div>
              
              <c:if test="${sessionScope.administratorLevel >0 }">
              <div class="menu_section">
                <h3>系统设置</h3>  
                <ul class="nav side-menu">
                    <li><a><i class="fa fa-user"></i>用户管理<span class="fa fa-chevron-down"></span></a>
                      <ul class="nav child_menu">
                        <li class="sub_menu"><a href="<%=basePath1 %>administrator/addadmin.do">添加管理员</a></li>
                        <li><a href="<%=basePath1 %>administrator/showadministrator.do">修改管理员</a></li>
                      </ul>
                    </li>
                  <li><a href="<%=basePath1 %>administrator/logout.do"><i class="fa fa-sign-out"></i> 系统退出 </a></li>
                </ul>
              </div>
			  </c:if>
			  
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
          <!--修改的from(updateHallModel)-->
          <form method="post" action="<%=basePath1 %>hall/updatehall.do" class="form-horizontal" role="form" id="form_data" onsubmit="return check_form()" style="margin: 20px;">
            <div class="modal fade" id="updateHallModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            电影厅信息
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" role="form">
                        	<div class="form-group">
                                <label for="Hall_Id" class="col-sm-3 control-label">电影厅ID</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="hallId" value="{Hall_Id}" id="Insert_Hall_Id" Readonly="true">
                                </div>
                            </div>
                        
                            <div class="form-group">
                                <label for="Hall_Name" class="col-sm-3 control-label">电影厅名</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="hallName" value="{Hall_Name}" id="Insert_Hall_Name"
                                           placeholder="请输入电影厅名">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="Cinema_Id" class="col-sm-3 control-label">电影院ID</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="cinemaId" value="{Cinema_Id}" id="Insert_Cinema_Id"
                                           placeholder="请输入电影院ID">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="Hall_Seats" class="col-sm-3 control-label">座位数</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="hallSeats" value="{Hall_Seats}" id="Insert_Hall_Seats"
                                           placeholder="请输入座位数">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="Hall_Type" class="col-sm-3 control-label">影厅类型</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="hallType" value="{Hall_Type}" id="Insert_Hall_Type"
                                           placeholder="请输入影厅类型">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="Hall_Description" class="col-sm-3 control-label">简述</label>
                                <div class="col-sm-9">
                                    <textarea type="text" class="form-control" name="hallDescription" value="{Hall_Description}" id="Insert_Hall_Description"
                                           placeholder="请输入简述">
                                    </textarea>
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

		  <!--增加的from(addHallModel)-->
		  <form method="post" action="<%=basePath1 %>hall/addhall.do" class="form-horizontal" role="form" id="form_data" onsubmit="return check_form()" style="margin: 20px;">
            <div class="modal fade" id="addHallModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            电影厅信息
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="Hall_Name" class="col-sm-3 control-label">电影厅名</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="hallName"  id="Add_Hall_Name"
                                           placeholder="请输入电影厅名">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="Cinema_Id" class="col-sm-3 control-label">电影院ID</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="cinemaId" id="Add_Cinema_Id"
                                           placeholder="请输入电影院ID">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="Hall_Seats" class="col-sm-3 control-label">座位数</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="hallSeats"  id="Add_Hall_Seats"
                                           placeholder="请输入座位数">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="Hall_Type" class="col-sm-3 control-label">影厅类型</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="hallType"  id="Add_Hall_Type"
                                           placeholder="请输入影厅类型">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="Hall_Description" class="col-sm-3 control-label">简述</label>
                                <div class="col-sm-9">
                                    <textarea type="text" class="form-control" name="hallDescription"  id="Add_Hall_Description"
                                           placeholder="请输入简述">
                                    </textarea>
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
			
		  <!--增加的from(addHallModel)-->
		  <form method="post" action="<%=basePath1 %>seat/alladdseat.do" class="form-horizontal" role="form" id="form_data" onsubmit="return check_form()" style="margin: 20px;">
            <div class="modal fade" id="addSeatModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            座位添加
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="hallId" class="col-sm-3 control-label">电影厅ID</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="hallId"  id="hallId"
                                           placeholder="请输入电影厅ID">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="row" class="col-sm-3 control-label">行数</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="row"  id="row"
                                           placeholder="请输入行数">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="col" class="col-sm-3 control-label">列数</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="col"  id="col"
                                           placeholder="请输入列数">
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
                    <h1>Hall 
                    <input type="button" data-toggle="modal" class="btn btn-primary" value="影厅增加" data-target="#addHallModel">
                    <input type="button" data-toggle="modal" class="btn btn-primary" value="座位增加" data-target="#addSeatModel">
                    </h1>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>Hall_Id</th>
                          <th>Hall_Name</th>
                          <th>Hall_Seats</th>
                          <th>Hall_Type</th>
                          <th>Hall_Description</th>
                          <th data-sortable="false"></th>
                        </tr>
                      </thead>

					  <tbody>
					  <c:forEach items="${halls }" var="hall">   
                        <tr>
                          <!-- 字体大小 -->
                          <th style="font-size:20px;">${hall.getHallId()}</th>
                          <th style="font-size:15px;">${hall.getHallName()}</th>
                          <th width="12%" style="font-size:15px;">${hall.getHallSeats()}</th>
                          <th width="12%" style="font-size:15px;">${hall.getHallType()}</th>
                          <th style="font-size:15px;">${hall.getHallDescription()}</th>
                          <th width="132px">
                            <button type="button" id="${hall.getHallId()}" data-toggle="modal" class="btn btn-info btn-sm" 
                            onclick="updateHall(this.id)" data-target="#updateHallModel">
                              <i class="fa fa-pencil"> 修改 </i>
                            </button>
                            <button type="button" id="${hall.getHallId()}" class="btn btn-danger btn-sm" onclick="deleteHall(this.id)">
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
    
    <!-- Custom Theme Scripts -->
    <script src="<%=basePath %>build/js/custom.min.js"></script>
	
	<script type="text/javascript">
		function deleteHall(hallid){
			$.ajax({
              url :"/se37/hall/deletehall.do", 
              type : "post",
              data : {"id":hallid},
              success : function (data){
                  //返回空值
                  if(data == "ok"){
                      //刷新
                      location.href= "/se37/hall/showhall.do";
                  } else if(data == "schedule exit"){  
                  	alert("该影厅存在排片！！")
                  		}
                  	else{
                  	alert("删除失败");
                  	}       	
               },
               error:function(e){
                    alert("数据传输失败！");                   
                }
           });
		};
		
		function updateHall(hallid){
		//console.log(hallid)
		$.ajax({
              url :"/se37/hall/updatebinddata.do", 
              type : "post",
              data : {"id":hallid},
              success : function (data){
                  //返回空值
                  if(data==null){
                      alert("不存在该Hall！");
                  } else{  //存在该Hall
                  console.log(data);
                  		$("#Insert_Hall_Id").val(data.hallId);
                  		$("#Insert_Hall_Name").val(data.hallName);
                  		$("#Insert_Cinema_Id").val(data.cinemaId);
                  		$("#Insert_Hall_Seats").val(data.hallSeats);
                  		$("#Insert_Hall_Type").val(data.hallType);
                  		$("#Insert_Hall_Descrition").val(data.hallDescription);
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