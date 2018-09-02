<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*,scau.se37.entity.Movie"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
     String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String basePath = basePath1+ "jsp/";
	Movie movie=(Movie)session.getAttribute("movie");
	if(movie.getMovieName()==null)
	movie.setMovieName("hello");
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>详情</title>
<link href="<%=basePath %>css/seat.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath %>font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath %>js/layer-v3.0.3/layer/mobile/need/layer.css"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath %>js/layer-v3.0.3/layer/mobile/need/layer.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=basePath %>js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/phone.js"></script>
<script type="text/javascript"
	src="<%=basePath %>js/layer-v3.0.3/layer/mobile/layer.js"></script>
<script type="text/javascript">
function giveMoney(){
    var s=document.getElementsByName('cusSeat');
    var v=new Array();
    var t=0;
    var d=0;
   
    for(var i=0;i<s.length;i++){
        if(s[i].checked==true){
        v.push(s[i].value);
        d++;
        }
        
    }
    console.log(v[1]);
    if(d==0){
    alert("您没有选择座位！");
    }
    else if(d==1){
    location.href="<%=basePath1%>movie/giveMoney.do?scheduleId="+${customer_schedule.scheduleId}+"&&seat1="+v[0]+"&&seat2="+t;
    }
    else if(d==2){
     location.href="<%=basePath1%>movie/giveMoney.do?scheduleId="+${customer_schedule.scheduleId}+"&&seat1="+v[0]+"&&seat2="+v[1];
     }
     
}
</script>
</head>
<body>
	<div class="whole">

		<header class="header">
			<a href="javascript:history.back(-1)" class="fa fa-angle-left"></a> <span
				class="names"><%=movie.getMovieName()%> </span>
		</header>

		<div class="seat_head">
			<h3>${customer_cinema.cinemaName}</h3>
			<span> <a>${fn:substring(customer_schedule.scheduleBegin, 5, 10)}
			</a> <a>${fn:substring(customer_schedule.beginTime, 0, 5)}</a> <a>${customer_hall.hallType}</a>
			</span>
		</div>

		<div class="seat_show">
			<ul>
				<li><i></i> <span>可选</span></li>
				<li><i></i> <span>已售</span></li>
				<li><i></i> <span>已选</span></li>
				<li><i></i> <span>最佳区域</span></li>
			</ul>
		</div>

		<div class="seat_choose">
			<div class="number" id="num"></div>
			<div class="seats" id="seats"></div>

		</div>
		<div class="buttons">
			<a href="#"
				onclick="giveMoney()">确认选择</a>
		</div>


	</div>

	<script>

$(function(){
	var html='';
		html+='<ul class="touchs" id="touchs"><div class="screen">大厅屏幕</div>';
		
		
		var lSize=${fn:length(seatPostionList)};
		var sArray=new Array();
		var sA=new Array();
		sArray[0]=0;
		var t=0;
		<c:forEach var="s" items="${seatPostionList}">
		    sA.push(${s});
		</c:forEach>
		for(var i=0;i<sA.length;i++){
		    t=sA[i];
		    console.log(sA[i]);
		    sArray[t]=1;
		}
		//for(var i=0;i<listSize;i++){
		 //   var selected = (i>91&&i<98 ? 'selected' : '');
	//	}
		for(var i=1; i<=204; i++){
		var selected;
		//j=${seatPostionList[i]};
		  // if(i==j){
		    //j=${seatPostionList[i]};
		    //selected = 'selected';
		    //}
		    //else{
		    selected='';
		    if(sArray[i]==1)
		    selected = 'selected';
		 //  if(sArray[i]==1){
		   //     selected = 'selected';
		    //}
		    //else 
		      //  selected='';
			
			//}
			//for(var i=0;i<listSize;i++){
		    //var selected = (i>91&&i<98 ? 'selected' : '');
		//}
			html+='<li class="'+selected+'">';
			html+='<input type="checkbox" name="cusSeat" id="seat-'+i+'" value="'+i+'"/>';
			
			html+='<label for="seat-'+i+'"></label>';
			html+='</li>';
		}
		html+='<div class="the_best"></div><div class="crossnum" id="crossnum" ></div></ul>';
		$('#seats').html(html);
		
	
	$('.selected').children('input').attr({'disabled':'disabled'});
	
		
	$('.seats li input').on('click',function(){
		var checklen = $('.seats li').not('.selected').children('input:checked').length;
		console.log(checklen);
		if(checklen>2){
			popu('最多只能选择两个座位');
			return false;
		}
	});
	
	
	//公用弹出层
	function popu(content){
		layer.open({
			content: content
			,skin: 'msg'
			,time: 3
		});	
	}
	
	
	var num='';
		num+='<ul>';
		for(var i=1; i<=12; i++){
			num+='<li>'+i+'</li>';
		}
		html+='</ul>';
		$('#num').html(num);
		
	var crossnum='';
		crossnum+='<ul>';
		for(var j=1; j<=17; j++){
			crossnum+='<li>'+j+'</li>';
		}
		html+='</ul>';
		$('#crossnum').html(crossnum);
	
	
	
})
</script>

	<!---拖拽js--->
	<script>
		$(function() {
			var flag = false;
			var cur = {
				x : 0,
				y : 0
			}
			var nx,
				ny,
				dx,
				dy,
				x,
				y;
			function down() {
				flag = true;
				var touch;
				if (event.touches) {
					touch = event.touches[0];
				} else {
					touch = event;
				}
				cur.x = touch.clientX;
				cur.y = touch.clientY;
				dx = div2.offsetLeft;
				dy = div2.offsetTop;
			}
			function move() {
				if (flag) {
					var touch;
					if (event.touches) {
						touch = event.touches[0];
					} else {
						touch = event;
					}
					nx = touch.clientX - cur.x;
					ny = touch.clientY - cur.y;
					x = dx + nx;
					y = dy + ny;
					div2.style.left = x + "px";
					//div2.style.top = y +"px";
	
	
					//阻止页面的滑动默认事件
					document.addEventListener("touchmove", function() {
						//event.preventDefault();
					}, false);
				}
			}
			//鼠标释放时候的函数
			function end() {
				flag = false;
			}
			var div2 = document.getElementById("touchs");
			div2.addEventListener("mousedown", function() {
				down();
			}, false);
			div2.addEventListener("touchstart", function() {
				down();
			}, false)
			div2.addEventListener("mousemove", function() {
				move();
			}, false);
			div2.addEventListener("touchmove", function() {
				move();
			}, false)
			document.body.addEventListener("mouseup", function() {
				end();
			}, false);
			div2.addEventListener("touchend", function() {
				end();
			}, false);
	
		});
	</script>

</body>
</html>
