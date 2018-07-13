<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/jsp/admin/css/Style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="${pageContext.request.contextPath}/jsp/admin/js/public.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/jsp/admin/js/jquery-2.1.0.js"></script>
<script type="text/javascript">
	function addProduct() {
		window.location.href = "${pageContext.request.contextPath}/adm/products/add";
	}
	$(function(){
		$.ajax({
			async:true,
			type:"post",
			cache:false,
			url:"${pageContext.request.contextPath}/book/findCategorys",
			success:function(data){
				var str="<option value=\"\" selected=\"selected\">--选择商品类加--</option>";
				for(var i=0;i<data.length;i++){
					str+="<option value=\""+data[i].cid+"\">"+data[i].cname+"</option>";							
				}
				$("#category").html(str);
				
			},
			error:function(){
				
			},
			dataType:"json",
		})
	});

</script>
<style type="text/css">
.page a{
	border: 1px solid black;
	font-size: 16px;
	padding: 10px 15px;
	margin: 5px;
}
.page a:hover{
	background-color: #666;
	color: white;
}
.page{
	margin-top: 30px;
}
#DataGrid1{
	width: 100%;
}
#DataGrid1 td{
	font-size: 14px;
	padding: 15px;
}

</style>
</HEAD>
<body>
	<br>
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>查询条件</strong>
					</td>
				</tr>
				<tr>
					<td>
					<form action="${pageContext.request.contextPath}/man/proSearch" method="post">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									商品编号</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="pid" size="15" value="${empty p ? '':p.pid }" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									类别：</td>
								<td class="ta_01" bgColor="#ffffff">
								<select name="cid" id="category">
										<option value="" selected="selected">--选择商品类加--</option>
										<option value="文学">文学</option>
										<option value="生活">生活</option>
										<option value="计算机">计算机</option>
										<option value="外语">外语</option>
										<option value="经营">经营</option>
										<option value="励志">励志</option>
										<option value="社科">社科</option>
										<option value="学术">学术</option>
										<option value="少儿">少儿</option>
										<option value="艺术">艺术</option>
										<option value="原版">原版</option>
										<option value="科技">科技</option>
										<option value="考试">考试</option>
										<option value="生活百科">生活百科</option>
								</select>
								</td>
							</tr>

							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									商品名称：</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="pname" size="15" value="${empty p ? '':p.pname }" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									价格区间(元)：</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="minprice" size="10" value="${empty min ? '0':min }" />
									-
									<input type="text" name="maxprice" size="10" value="${empty max ? '0':max }" /></td>
							</tr>

							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe" class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff"></td>
								<td align="right" bgColor="#ffffff" class="ta_01">
								<br><br>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<button type="submit" id="search" name="search"
										value="查询" class="button_view">
										查询</button>&nbsp;
									<input type="reset" name="reset" value="重置"
									class="button_view" />
								</td>
							</tr>
						</table>
					</form>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>商品列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="添加商品" class="button_add" onclick="addProduct()">添加商品
						</button>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe" height="550px" style="padding-bottom: 20px;">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="10%">商品编号</td>
								<td align="center" width="20%">商品图片</td>
								<td align="center" width="20%">商品名称</td>
								<td align="center" width="10%">商品价格</td>
								<td align="center" width="10%">商品数量</td>
								<td width="10%" align="center">商品类别</td>
								<td width="10%" align="center">编辑</td>
								<td width="10%" align="center">删除</td>
							</tr>
							
							<c:forEach items="${list }" var="v">
								<tr onmouseover="this.style.backgroundColor = 'ccc'"
									onmouseout="this.style.backgroundColor = '#f5fafe';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${v.pid }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"><img width="50px" height="60px" src="${pageContext.request.contextPath}/static/${v.pimage }" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${v.pname }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${v.shop_price }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">10</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">
										${v.cname }</td>
									<td align="center" style="HEIGHT: 22px"><a href="${pageContext.request.contextPath}/man/edit?pid=${v.pid }">
											<img src="${pageContext.request.contextPath}/jsp/admin/images/i_edit.gif"
											border="0" style="CURSOR: hand">
									</a></td>
									<td align="center" style="HEIGHT: 22px"><a href="${pageContext.request.contextPath}/man/delete?pid=${v.pid }">
											<img src="${pageContext.request.contextPath}/jsp/admin/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand">
									</a></td>
								</tr>
							</c:forEach>
							
						</table>
						<div class="page">
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
						</div>
					</td>
				</tr>
			</TBODY>
		</table>
</body>
</HTML>

