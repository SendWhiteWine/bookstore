<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link
	href="${pageContext.request.contextPath}/jsp/admin/css/left.css"
	rel="stylesheet" type="text/css">
</head>
<link rel="StyleSheet"
	href="${pageContext.request.contextPath}/jsp/admin/css/dtree.css"
	type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsp/admin/js/dtree.js"></script>
<body>
	<table width="100" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td height="12"></td>
			</tr>
		</tbody>
	</table>
	<table width="100%" border="0">
		<tbody>
			<tr><td><div class="dtree">
				<a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>
				<script type="text/javascript">
						d = new dTree('d');
						d.add(0,-1,'系统菜单树');
						d.add(1,0,'商品管理','/ssh/adm/login/welcome','','mainFrame');
						d.add(2,0,'订单管理','/ssh/adm/login/welcome','','mainFrame');
						//子目录添加
						d.add(11,1,'商品查看','/ssh/man/showAllProduct','','mainFrame');
						d.add(21,2,'订单查看','/ssh/man/showAllOrders','','mainFrame');
						document.write(d);
				</script>
			</div></td></tr>
		</tbody>
	</table>
</body>
</body>
</html>
