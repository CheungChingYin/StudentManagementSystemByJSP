<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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

	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String sql = "DELETE FROM `stumanagementbyweb`.`studentinfo` WHERE (`id` = ?)";
	Connection con = null;
	PreparedStatement ps = null;
	try{
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stumanagementbyweb","root","123456");
		ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.executeUpdate();
		out.print("<script type='text/javascript'>alert('删除学生信息成功!');window.location.href='Contain.jsp';</script>");
		ps.close();
		con.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>