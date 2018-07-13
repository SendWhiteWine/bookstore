<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/jsp/admin/css/Style.css" type="text/css" rel="stylesheet">
<script language="javascript" src="${pageContext.request.contextPath}/jsp/admin/js/jquery-2.1.0.js"></script>
<script type="text/javascript">
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


</HEAD>

<body>
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath }/man/addProduct" method="post" enctype="multipart/form-data">
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4" height="26">
					<strong>添加商品</strong>
				</td>
			</tr>


			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品名称：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="pname" class="bg"/>
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品价格：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="shopPrice" class="bg" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品数量：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="pnum" class="bg" />
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品类别：</td>
				<td class="ta_01" bgColor="#ffffff">
				<select name="cid" id="category">
						<option value="" selected="selected">--选择商品类加--</option>
						<option value="1">手机数码</option>
						<option value="2">电脑办公</option>
						<option value="3">计算机</option>
						<option value="4">外语</option>
						<option value="5">经营</option>
						<option value="6">励志</option>
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
				<td align="center" bgColor="#f5fafe" class="ta_01">商品图片：</td>
				<td class="ta_01" bgColor="#ffffff" colSpan="3">
					<input type="file" name="image" size="30" value=""/>
				</td>
			</tr>
			<TR>
				<TD class="ta_01" align="center" bgColor="#f5fafe">商品描述：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3">
				<textarea name="pdesc" cols="30" rows="3" style="WIDTH: 96%"></textarea>
				</TD>
			</TR>
			<TR>
				<td align="center" colSpan="4" class="sep1">
					<img src="${pageContext.request.contextPath}/jsp/admin/images/shim.gif">
				</td>
			</TR>


			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					
					<input type="submit" class="button_ok" value="确定">	
						
					<input type="reset" value="重置" class="button_cancel">

					<input class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					
					<span id="Label1">
					
					</span>
				</td>
			</tr>
		</table>
	</form>
</body>
</HTML>