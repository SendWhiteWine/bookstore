<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<div id="divhead" style="width: 1200px; margin: 0 auto; padding-top: 20px;">
	<table cellspacing="0" class="headtable">
		<tr>
			<td width="260px">
<%-- 			<a href="${pageContext.request.contextPath }/pro/index"> --%>
				<div class="contact-fp-wrap" onclick="fnindex()">
				  <svg height="60" width="200" xmlns="http://www.w3.org/2000/svg">
				    <defs>
				   <linearGradient id="logo-gradient" x1="50%" y1="0%" x2="75%" y2="100%" > 
				            
				            <stop offset="0%" stop-color="#F79533">
				                <animate attributeName="stop-color" values="#F79533; #F37055; #EF4E7B; #A166AB; #5073B8; #1098AD; #07B39B; #6DBA82; #F79533" dur="4s" repeatCount="indefinite"></animate>
				            </stop>
				
				            <stop offset="100%" stop-color="#F79533">
				                <animate attributeName="stop-color" values="#F37055; #EF4E7B; #A166AB; #5073B8; #1098AD; #07B39B; #6DBA82; #F79533; #F37055" dur="4s" repeatCount="indefinite"></animate>
				            </stop>
				
				        </linearGradient> 
				  </defs>
				    <rect class="booton" height="60" width="200" />
				  </svg>
				   <div class="booton-text">HOVER</div>
				</div> 
<!-- 			</a> -->
			</td>
			<td style="text-align:right; padding-right: 10px; padding-top: 10px;">
			<img src="${pageContext.request.contextPath }/static/images/cart.gif" width="26" height="23" style="margin-bottom:-4px;" />&nbsp;
				<a href="${pageContext.request.contextPath }/pro/cart">购物车</a>
				|<a href="#">帮助中心</a>
				|<c:if test="${empty sessionScope.user }">
					<a href="${pageContext.request.contextPath }/book/loginShow">您好,请登录</a>
				</c:if>
				<c:if test="${!empty sessionScope.user }">
					<span>欢迎您：${sessionScope.user.uname }</span>
				</c:if>
				|<a href="${pageContext.request.contextPath }/pro/register">新用户注册</a>
				|<a href="${pageContext.request.contextPath }/book/userLogout">注销</a>
				|<a href="${pageContext.request.contextPath }/pro/myAccount">我的账户</a> 
				</td>
		</tr>
	</table>
</div>
<script>
function fnindex(){
	$(location).prop("href", "${pageContext.request.contextPath }/pro/index");
}
</script>