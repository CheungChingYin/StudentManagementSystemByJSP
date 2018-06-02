<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.block{
		width: 1300px;
		height: 50px;
		background-color: #ccc;
		border-radius: 10px;
		margin: 0 auto;
	}
	h3{
		text-align: center;
		padding-top: 12px;
		font-family: "微软雅黑";
	}
</style>
</head>
<body>
	<div class="block">
		<%
			if((String)session.getAttribute("user")==null){
				out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='Login.html'</script>");
			}
		%>
		<h3>您好！<%=session.getAttribute("user") %>管理员，欢迎使用学生资料管理系统</h3>
	</div>
</body>
</html>