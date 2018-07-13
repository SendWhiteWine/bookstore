<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>bookStore首页</title>
<%--导入css --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/main.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css">
<style type="text/css">

</style>

</head>
<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-2.1.0.js"></script>
<script type="text/javascript">
	$(function fn(){
		$.ajax({
			async:true,
			type:"post",
			url:"${pageContext.request.contextPath }/book/showNotice",
			success:function(d){
				var str = "";
				for(var i = 0; i < d.length; i++){
					if(+d[i].title.length>30){
						str+="<tr><td><a href=\"#\" style=\"color:#000000\">"+d[i].title.substring(0,30)+"...</a></td></tr>";
					} else {
						str+="<tr><td><a href=\"#\" style=\"color:#000000\">"+d[i].title+"</a></td></tr>";
					}
				}
				$("#initNews").html(str);
			},
			error:function(){
				
			},
			dataType:"json",
		})
		
	});
	

</script>
<body class="main" >
<div id="wrapper">
    

<div id="kuang">
	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp" %>
	<div id="divad" style="text-align: left;">
<%-- 		<img src="${pageContext.request.contextPath }/static/ad/index_ad.jpg" /> --%>
		
		<div class='accrodion-group'>
		  	<div class='1-accordion' >
			</div>
		</div>
		
		
	</div>

	<div id="divcontent" style="margin-top: 30px;">
		<table width="900px" border="0" cellspacing="0">
			<tr>
				<td width="497"><img src="${pageContext.request.contextPath }/static/images/billboard.gif" width="497"
					height="38" />
					<table cellspacing="0" class="ctl" id="initNews">
					
						<tr>
							<td>&middot;<a href="news.html" style="color:#000000">Lonely
									Planet 已出版600多种旅行指南，几乎覆盖了全世界的每个角落。</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="news.html" style="color:#000000">2007年中旅游图书畅销榜速递
									中国游,世界游,旅游图书全部7折封顶</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="news.html" style="color:#000000">50万种图书3折,百货团购价热卖
									畅销榜新书速递,促销天天有</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="news.html" style="color:#000000">50万种图书3折,百货团购价热卖
									畅销榜新书速递,促销天天有</a></td>
						</tr> 
					</table></td>
				<td style="padding:5px 15px 10px 40px"><table width="100%"
						border="0" cellspacing="0">
						<tr>
							<td><span style="color:black;font-size:16px;font-weight: bold;">热门商品</span>
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0">
						<tr>
							<td style="width:50; text-align:center"><a href="info.html">
								<img src="${pageContext.request.contextPath }/static/bookcover/travelbook.jpg" width="102" height="130"
									border="0" /> </a><br /> <a href="info.html">TravelBook<br />
									作者:Lonley Plant</a></td>
							<td style="width:50; text-align:center"><a href="info.html"><img
									src="${pageContext.request.contextPath }/static/bookcover/java2.jpg" width="102" height="130" border="0" />
							</a><br /> <a href="info.html">Java2入门经典(JDK5) <br /> 作者:(美)霍顿</a>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp"/>

</div>
	<canvas id="canvas" width="1950px" height="900px"></canvas>
    <canvas id="canvasbg" width="1950px" height="900px"></canvas>
</div>
</body>
<script src="${pageContext.request.contextPath }/static/js/accordion.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/static/js/data.js"></script>
<script src="${pageContext.request.contextPath }/static/js/beijing.js"></script>
<script>
$(document).ready(function() {
  $('[class*="-accordion"]').not(':first').parents('.accordion-DIV').hide();
  $('.btn-group > button').on('click',  function(event) {
    event.preventDefault();
    var _index_ = $(this).index();
    $('[class*="-accordion"]').eq(_index_).parents('.accordion-DIV').show().siblings().hide();
  });
});
  $('.1-accordion').accordion({
    "imageObj": horiObj.imageObj,
    animateWidth  : 500,
    animateWidth : 467, //默认放大宽度
  });


</script>
</html>
