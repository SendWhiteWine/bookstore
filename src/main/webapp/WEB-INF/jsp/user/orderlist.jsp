<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/main.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.js"></script>
</head>

<body class="main" style="margin: 0; padding: 0px; background-image: url('${pageContext.request.contextPath }/static/images/b2.jpg');">
<div id="wrapper">
<div id="kuang" style="width: 1200px; border-left: 1px solid #000; margin: 0 auto; border-right: 1px solid #000; height: 919px;position: relative; background-color: #fff;">
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%"><table width="100%" border="0" cellspacing="0"
						style="margin-top:30px">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						<tr>
							<td class="listtd"><img src="${pageContext.request.contextPath }/static/images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/pro/modifyuserinfo">用户信息修改</a>
							</td>
						</tr>

						<tr>
							<td class="listtd"><img src="${pageContext.request.contextPath }/static/images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/book/orderShow">订单查询</a>
							</td>
						</tr>
						<tr>
							<td class="listtd"><img src="${pageContext.request.contextPath }/static/images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">用戶退出</a></td>
						</tr>




					</table>
				</td>
				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="myAccount">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单查询
					</div>


					<table cellspacing="0" class="infocontent">
						<tr>
							<td style="padding:20px"><p>欢迎${user.uname }光临商城！</p>
								<p>
									您有<font style="color:#FF0000">${fn:length(orders) }</font>个订单
								</p>
								<table width="100%" border="0" cellspacing="0" class="tableopen">
									<tr>
										<td bgcolor="#A3E6DF" class="tableopentd01">订单号</td>
										<td bgcolor="#A3D7E6" class="tableopentd01">收件人</td>
										<td bgcolor="#A3CCE6" class="tableopentd01">订单时间</td>
										<td bgcolor="#A3B6E6" class="tableopentd01">状态</td>
										<td bgcolor="#A3E2E6" class="tableopentd01">操作</td>
									</tr>
									
									<c:forEach items="${orders }" var="v" varStatus="vs">
										<tr>
											<td class="tableopentd02">${vs.count }</td>
											<td class="tableopentd02">${v.name }</td>
											<td class="tableopentd02">${v.ordertime }</td>
											<td class="tableopentd02">${v.state==0?'未支付':'已支付' }</td>
											<td class="tableopentd03">
												<a href="${pageContext.request.contextPath }/book/orderInfo?oid=${v.oid }">查看</a>
												&nbsp;&nbsp;
												<a href="#">刪除</a>
											</td>
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
						<tr><td>
							<c:if test="${pb.pages>1 }">
								<%--总页数大于1 --%>
								<%--第一页 currentPage==1 --%>
								<a href="${uri }currentPage=1">首页</a>
								<c:if test="${pb.hasPreviousPage}">
									<a href="${uri }currentPage=${pb.pageNum-1 }">上一页</a>
								</c:if>
								<c:forEach items="${pb.navigatepageNums }" var="index">
									<c:choose>
										<c:when test="${pb.pageNum==index }">
											<a style="color:red;" href="${uri }currentPage=${index }">${index }</a>
										</c:when>
										<c:otherwise>
											<a href="${uri }currentPage=${index }">${index }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${pb.hasNextPage }">
									<a href="${uri }currentPage=${pb.pageNum+1 }">下一页</a>
								</c:if>
								<a href="${uri }currentPage=${pb.pages }">尾页</a>
							</c:if>
						</td></tr>
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
</html>
