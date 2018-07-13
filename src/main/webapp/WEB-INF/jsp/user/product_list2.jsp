<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>bookStore列表</title>
<%--导入css --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
</head>

<body class="main">

	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />

	<div id="divpagecontent">
		<table width="900px" border="0" cellspacing="0">
			<tr>

				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;计算机&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;商品列表
					</div>

					<table cellspacing="0" class="listcontent" >
						<tr>
							<td>
								<h1>商品目录</h1>
								<hr />
								<h1>计算机</h1>&nbsp;&nbsp;&nbsp;&nbsp;共100种商品
								<hr />
								<div style="margin-top:20px; margin-bottom:5px">
									<img src="${pageContext.request.contextPath }/images/productlist.gif" width="100%" height="38" />
								</div>
								<table cellspacing="0" class="booklist">
									
									
									
									<tr>
							<c:forEach items="${pb.list }" var="p">

										<td>
											<div class="divbookpic">
												<p>
													<a href="product_info.jsp"><img src="${pageContext.request.contextPath}/${p.pimage}" width="115"
														height="129" border="0" /> </a>
												</p>
											</div>

											<div class="divlisttitle">
												<a href="product_info.jsp">商品名:${p.pname }<br />售价:${p.shop_price} </a>
											</div>
											</td>
							</c:forEach>

									</tr>
								</table>

							

								<div class="pagination">
									<ul>
									
								<c:if test="${pb.totalPage>1 }"><%--总页数大于1 --%>
								
								
									
									
									
						<%--第一页 currentPage==1 --%>
						<c:if test="${pb.currentPage==1 }">
							
							<li class="nextpage"><a href="${pageContext.request.contextPath}/productServlet?action=showProductByPage&currentPage=${pb.currentPage+1 }&cid=${cid}">下一页&gt;&gt;</a></li>	
							<li class="nextpage"><a href="${pageContext.request.contextPath}/productServlet?action=showProductByPage&currentPage=${pb.totalPage }&cid=${cid}">尾页&gt;&gt;&gt;</a></li>								
						
						</c:if>		
						
						<%--最后一页 只有上一页和首页显示--%> 
						
						<c:if test="${pb.currentPage==pb.totalPage }">
							<li class="nextpage"><a href="${pageContext.request.contextPath}/productServlet?action=showProductByPage&currentPage=1&cid=${cid}">首页&lt;&lt;&lt;</a>
										</li>
										<li class="nextpage"><a href="${pageContext.request.contextPath}/productServlet?action=showProductByPage&currentPage=${pb.currentPage-1 }&cid=${cid}">上一页&lt;&lt;</a>
										</li>
						</c:if>	
						
						
						<%--中间页--%> 
						<c:if test="${pb.currentPage>1 && pb.currentPage<pb.totalPage }">
							<li class="nextpage"><a href="${pageContext.request.contextPath}/productServlet?action=showProductByPage&currentPage=1&cid=${cid}">首页&lt;&lt;&lt;</a>
										</li>
										<li class="nextpage"><a href="${pageContext.request.contextPath}/productServlet?action=showProductByPage&currentPage=${pb.currentPage-1 }&cid=${cid}">上一页&lt;&lt;</a>
										</li>
										
										
										<li class="nextpage"><a href="${pageContext.request.contextPath}/productServlet?action=showProductByPage&currentPage=${pb.currentPage+1 }&cid=${cid}">下一页&gt;&gt;</a></li>	
										<li class="nextpage"><a href="${pageContext.request.contextPath}/productServlet?action=showProductByPage&currentPage=${pb.totalPage }&cid=${cid}">尾页&gt;&gt;&gt;</a></li>	
									
						</c:if>			
</c:if>	
									<li><span>当前页${pb.currentPage }/${pb.totalPage }总页数&nbsp;总条数${pb.totalCount }&nbsp;</span></li>
									
										

									</ul>
									
								</div>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />


</body>
</html>
