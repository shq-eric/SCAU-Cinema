<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String basePath = basePath1 + "jsp/";
%>
<%
	String is_null = (String) session.getAttribute("administratorName");
	if (is_null == null) {
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
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome **-->
<link href="<%=basePath%>css/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<!-- Datatables -->
<link
	href="<%=basePath%>css/datatables.net-bs/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=basePath%>css/datatables.net-buttons-bs/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=basePath%>css/datatables.net-fixedheader-bs/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=basePath%>css/datatables.net-responsive-bs/responsive.bootstrap.min.css"
	rel="stylesheet">
<!--<link href="<%=basePath%>css/datatables.net-scroller-bs/scroller.bootstrap.min.css" rel="stylesheet">-->

<!-- Custom Theme Style -->
<link href="<%=basePath%>build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">

	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.html" class="site_title"><i class="fa fa-paw"></i>
							<span>Scau Cinema!</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img src="<%=basePath%>images/user.png" alt="..."
								class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2><%=session.getAttribute("administratorName")%></h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<h3>日常业务</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-bookmark"></i>基本信息管理 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: block;">
										<li><a href="<%=basePath1%>hall/showhall.do">影厅设置</a></li>
										<li><a href="<%=basePath1%>movie/showmovie.do">电影管理</a></li>
										<li class="current-page"><a
											href="<%=basePath1%>schedule/showschedule.do">放映管理</a></li>
									</ul></li>
								<li><a><i class="fa fa-search"></i> 信息查询 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="<%=basePath1%>order/showmovieorder.do">售票订单</a></li>
										<li><a
											href="<%=basePath1%>refundorder/showrefundorder.do">退票订单</a></li>
										<!-- <li><a href="index3.html">放映查询</a></li> -->
									</ul></li>
								<!--  <li><a><i class="fa fa-bar-chart-o"></i> 信息统计 <span class="fa fa-chevron-down"></span></a>
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
									<li><a><i class="fa fa-user"></i>用户管理<span
											class="fa fa-chevron-down"></span></a>
										<ul class="nav child_menu">
											<li class="sub_menu"><a
												href="<%=basePath1%>administrator/addadmin.do">添加管理员</a></li>
											<li><a
												href="<%=basePath1%>administrator/showadministrator.do">修改管理员</a></li>
										</ul></li>
									<li><a href="<%=basePath1%>administrator/logout.do"><i
											class="fa fa-sign-out"></i> 系统退出 </a></li>
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
							<li class=""><a href="javascript:;"
								class="user-profile dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"> <img
									src="<%=basePath%>images/user.png" alt=""><%=session.getAttribute("administratorName")%>
									<span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="javascript:;"> 简介</a></li>
									<li><a href="javascript:;"> <span
											class="badge bg-red pull-right">50%</span> <span> 设置</span>
									</a></li>
									<li><a href="javascript:;">帮助</a></li>
									<li><a href="<%=basePath1%>administrator/logout.do"><i
											class="fa fa-sign-out pull-right"></i> 登出</a></li>
								</ul></li>


						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">

				<!-- 模态框示例（Modal） -->

				<div class="">
					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h1>统计信息</h1>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="col-md-9 col-sm-12 col-xs-12">
										<div class="demo-container" style="height:280px">
											<div id="chart_plot_02" class="demo-placeholder"
												style="padding: 0px; position: relative;">
												<canvas class="flot-base" width="1170" height="480"
													style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 1170px; height: 280px;"></canvas>
												<div class="flot-text"
													style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: bigger; color: rgb(84, 84, 84);">
													<div class="flot-x-axis flot-x1-axis xAxis x1Axis"
														style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
														<c:forEach items="${lists }" var="list">
															<div class="flot-tick-label tickLabel"
															style="position: absolute; max-width: 97px; 
															top: 263px; left: ${increase - 20}px ; text-align: center;">${list.getMovieName()}
															</div>
															<span hidden>${increase = increase +200 }</span>
														</c:forEach>
													</div>
													<div class="flot-y-axis flot-y1-axis yAxis y1Axis"
														style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
														<div class="flot-tick-label tickLabel"
															style="position: absolute; top: 245px; left: 13px; text-align: right;">0</div>
														<div class="flot-tick-label tickLabel"
															style="position: absolute; top: 190px; left: 7px; text-align: right;">1K</div>
														<div class="flot-tick-label tickLabel"
															style="position: absolute; top: 20px; left: 7px; text-align: right;">1w</div>
													</div>
													
												</div>
												<canvas class="flot-overlay" width="1170" height="280"
													style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 1170px; height: 480px;"></canvas>
												<div class="legend">
													<div
														style="position: absolute; width: 77px; height: 17px; top: -16px; right: 24px; background-color: rgb(255, 255, 255); opacity: 0.85;">
													</div>
													
												</div>
											</div>
										</div>
									</div>
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
	<script src="<%=basePath%>js/jquery/jquery.min.js"></script>
	<!-- Bootstrap **-->
	<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

	<!-- Datatables -->
	<script src="<%=basePath%>js/datatables.net/jquery.dataTables.min.js"></script>
	<script
		src="<%=basePath%>js/datatables.net-bs/dataTables.bootstrap.min.js"></script>
	<script
		src="<%=basePath%>js/datatables.net-buttons/dataTables.buttons.min.js"></script>
	<script
		src="<%=basePath%>js/datatables.net-buttons-bs/buttons.bootstrap.min.js"></script>
	<script
		src="<%=basePath%>js/datatables.net-buttons/buttons.flash.min.js"></script>
	<script
		src="<%=basePath%>js/datatables.net-buttons/buttons.html5.min.js"></script>
	<script
		src="<%=basePath%>js/datatables.net-buttons/buttons.print.min.js"></script>
	<script
		src="<%=basePath%>js/datatables.net-fixedheader/dataTables.fixedHeader.min.js"></script>
	<script
		src="<%=basePath%>js/datatables.net-responsive/dataTables.responsive.min.js"></script>
	<script
		src="<%=basePath%>js/datatables.net-responsive-bs/responsive.bootstrap.js"></script>
	<script
		src="<%=basePath%>js/datatables.net-scroller/dataTables.scroller.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="<%=basePath%>build/js/custom.min.js"></script>
</body>
</html>