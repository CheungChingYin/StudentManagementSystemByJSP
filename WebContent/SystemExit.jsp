<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if((String)session.getAttribute("user")==null){
	out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='Login.html'</script>");
}
%>
<%
	//用户退出登录时移除会话
	session.removeAttribute("user");
	session.removeAttribute("id");
	out.print("<script type='text/javascript'>alert('用户退出成功!');window.location.href='Login.html';</script>");
%>
</body>
</html>