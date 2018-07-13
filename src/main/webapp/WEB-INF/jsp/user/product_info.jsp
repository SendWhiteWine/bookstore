<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/main.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-2.1.0.js"></script>
<script type="text/javascript">
	$(function() {

		$("#buy").click(
			function() {
				var buyNum = $("#buyNum").val();
				window.location.href = "${pageContext.request.contextPath}/book/addToCart?pid=${p.pid}&buyNum=" + buyNum;
		});
	});
</script>
</head>


<body class="main" style="margin: 0; padding: 0px; background-image: url('${pageContext.request.contextPath }/static/images/b2.jpg');">
<div id="wrapper">
<div id="kuang" style="width: 1200px; border-left: 1px solid #000; margin: 0 auto; border-right: 1px solid #000; height: 919px;position: relative; background-color: #fff;">
	<jsp:include page="head.jsp" />

	<jsp:include page="menu_search.jsp" />


	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>

				<td><div style="text-align: right; margin: 5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/pro/index">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="${pageContext.request.contextPath }/book/productShow?cid=${p.cid }">&nbsp;${p.cname }</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${p.pname }
					</div>


					<table cellspacing="0" class="infocontent">
						<tr>
							<td><img src="${pageContext.request.contextPath }/static/ad/page_ad.jpg" width="645" height="84" />

								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td width="30%">

											<div class="divbookcover">
												<p>
													<img src="${pageContext.request.contextPath }/static/${p.pimage }"
														width="213" height="269" border="0" />
												</p>
											</div>

											<div style="text-align: center; margin-top: 25px">
												<a href="#" id="buy"> <img src="${pageContext.request.contextPath }/static/images/buybutton.gif"
													border="0" />
												</a>
											</div>
										</td>
										<td style="padding: 20px 5px 5px 5px"><img
											src="${pageContext.request.contextPath}/static/${p.pimage }"
											width="16" height="13" /><font class="bookname">&nbsp;&nbsp;Thinking
												in java</font>

											<hr />售价：<font color="#FF0000">￥${p.shop_price }</font>
											&nbsp;市场价<span style="text-decoration: line-through;">￥${p.market_price }</span>
											<hr /> 类别：${p.cname }

											<hr /> 购买数量：
												<input type="button" onclick="fnjian()" value='-' style="width: 20px; text-align: center;">
												<input name="buyNum" type="text" id="buyNum" value=1 style="width: 40px; text-align: center" />
												<input type="button" onclick="fnjia()" value='+' style="width: 20px; text-align: center;">
											<p>
												<b>内容简介：</b>
											</p> ${p.pdesc }</td>
									</tr>
								</table></td>
						</tr>
					</table></td>
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
<script type="text/javascript">
	
	function fnjia(){
		var num = $("#buyNum").val();
		$("#buyNum").val(num-1+2);
	}
	
	function fnjian(){
		var num = $("#buyNum").val();
		if(num>1){
			$("#buyNum").val(num-1);
		}
	}
	
	
	
</script>
</html>
