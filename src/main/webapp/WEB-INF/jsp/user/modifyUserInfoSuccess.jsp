<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/main.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/my.js">
	
</script>
</head>

<body class="main" onload="startSecond()" style="margin: 0; padding: 0px; background-image: url('${pageContext.request.contextPath }/static/images/b2.jpg');">
<div id="wrapper">
<div id="kuang" style="width: 1200px; border-left: 1px solid #000; margin: 0 auto; border-right: 1px solid #000; height: 919px;position: relative; background-color: #fff;">
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center"><table width="60%"
						border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<td style="width:98"><img
								src="${pageContext.request.contextPath }/static/images/IconTexto_WebDev_009.jpg" width="128" height="128" />
							</td>
							<td style="padding-top:30px"><font
								style="font-weight:bold; color:#FF0000">用户信息修改成功，请重新登录</font><br /> <br />
								<a href="index"><span id="second">5</span>秒后自动为您转跳回首页</a></td>
						</tr>
					</table>
					<h1>&nbsp;</h1></td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />
</div>
	<canvas id="canvas" width="1950px" height="900px"></canvas>
    <canvas id="canvasbg" width="1950px" height="900px"></canvas>
</div>
</body>
<script src="${pageContext.request.contextPath }/static/js/beijing.js"></script>
</html>
