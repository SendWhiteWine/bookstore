<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
				<td width="25%">
					<table width="100%" border="0" cellspacing="0"
						style="margin-top:30px">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						<tr>
							<td class="listtd"><img src="${pageContext.request.contextPath }/static/images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath }/pro/modifyuserinfo">用户信息修改</a></td>
						</tr>

						<tr>
							<td class="listtd"><img src="${pageContext.request.contextPath }/static/images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath }/book/orderShow">订单查询</a>
							</td>
						</tr>

						<tr>
							<td class="listtd"><img src="${pageContext.request.contextPath }/static/images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">用戶退出</a>
							</td>
						</tr>
					</table></td>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="myAccount.jsp">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;用户信息修改
					</div>

					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<form action="${pageContext.request.contextPath }/book/userAlter" onsubmit="return fnaaa()" method="post">
									<input type="hidden" name="id" value="">
									<table width="100%" border="0" cellspacing="2" class="upline">
										<tr>
											<td style="text-align:right; width:20%">会员邮箱：</td>
											<td style="width:40%; padding-left:20px">${user.uemail }</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="text-align:right">会员名：</td>
											<td style="padding-left:20px">${user.uname }</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="text-align:right">修改密码：</td>
											<td><input type="password" name="upwd" id="upwd" class="textinput" value="${user.upwd }" />
											</td>
											<td><font color="#999999">密码设置至少6位，请区分大小写</font>
											</td>
										</tr>
										<tr>
											<td style="text-align:right">重复密码：</td>
											<td><input type="password" class="textinput" id="reupwd" value="${user.upwd }" />
											</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="text-align:right">性别：</td>
											<td colspan="2">&nbsp;&nbsp;
											<input type="radio" name="ugender" value="男" ${user.ugender=='男'?"checked='checked'":"" } /> 男
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="ugender" value="女" ${user.ugender=='女'?"checked='checked'":"" } /> 女</td>
										</tr>
										<tr>
											<td style="text-align:right">联系方式：</td>
											<td colspan="2"><input name="utel" type="text"
												value="${user.utel }" class="textinput" id="utel" />
											</td>
										</tr>

										<tr>
											<td style="text-align:right">&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</table>

									<p style="text-align:center">
										<input type="image" src="${pageContext.request.contextPath }/static/images/botton_gif_025.gif" border="0">
									</p>
									<p style="text-align:center">&nbsp;</p>
								</form></td>
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
<script type="text/javascript">
function fnaaa(){
	var upwd=$("#upwd").val();
	var reupwd=$("#reupwd").val();
	var utel=$("#utel").val();
	
	var regexpwd=/^\w{6,}$/;
	var regexTel=/^[1][3458]\d{9}$/;
	
	
	if(!regexpwd.test(upwd)){
		alert("请输入正确的密码格式");
		$("#upwd").focus();
		return false;
		
	}
	if(reupwd!=upwd){
		alert("两次输入的密码不一样");
		$("#reupwd").focus();
		return false;
		
	}
	if(!regexTel.test(utel)){
		alert("请输入正确的手机号");
		$("#utel").focus();
		return false;
		
	}
	
	return true;
	
};	
</script>
<script src="${pageContext.request.contextPath }/static/js/beijing.js"></script>
</html>
