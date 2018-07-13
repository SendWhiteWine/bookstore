<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>bookStore列表</title>
<%--导入css --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.js"></script>
</head>

<body class="main" style="margin: 0; padding: 0px; background-image: url('${pageContext.request.contextPath }/static/images/b2.jpg');">
<div id="wrapper">
<div id="kuang" style="width: 1200px; border-left: 1px solid #000; margin: 0 auto; border-right: 1px solid #000; height: 919px;position: relative; background-color: #fff;">
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />

	<div id="divpagecontent">
		<table width="900px" border="0" cellspacing="0">
			<tr>

				<td>
					<div style="text-align: right; margin: 5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath}/pro/index">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;计算机&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;商品列表
					</div>

					<table cellspacing="0" class="listcontent">
						<tr>
							<td>
								<h1>商品目录</h1>
								<hr />
								<h1>计算机</h1>&nbsp;&nbsp;&nbsp;&nbsp;共100种商品
								<hr />
								<div style="margin-top: 20px; margin-bottom: 5px">
									<img
										src="${pageContext.request.contextPath}/static/images/productlist.gif"
										width="100%" height="38" />
								</div>
								<table cellspacing="0" class="booklist">
									<tr>

										<c:forEach items="${pro }" var="p">
											<td>

												<div class="divbookpic">
													<p>
														<a
															href="${pageContext.request.contextPath }/book/productDetails?pid=${p.pid}"><img
															src="${pageContext.request.contextPath}/static/${p.pimage }" width="115" height="129" border="0" />
														</a>
													</p>
												</div>

												<div class="divlisttitle">
													<a
														href="${pageContext.request.contextPath }/productServlet?action=productDetail&pid=${p.pid}">商品名:${p.pname }<br />售价:${p.shopPrice }
													</a>
												</div>
											</td>
										</c:forEach>
									</tr>
								</table>




								<div class="pagination" style="width: 100%;">
									<ul>
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
														<a style="color: red;" href="${uri }currentPage=${index }">${index }</a>
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
										<br />
										<li style="margin-top: 15px; display: block;"><span>当前页${pb.pageNum }/${pb.pages }总页数&nbsp;总条数${pb.pages }&nbsp;</span></li>
									</ul>
								</div>
							</td>
						</tr>
					</table>
				</td>
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
