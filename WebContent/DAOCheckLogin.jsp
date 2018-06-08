<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
	//检验管理员的用户名密码是否正确
	request.setCharacterEncoding("UTF-8");
	String user = request.getParameter("user");
	String password = request.getParameter("password");
	String sqlQuery = "SELECT * FROM stumanagementbyweb.login WHERE user='"+user+"'AND password='"+password+"'";
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stumanagementbyweb","root","123456");
		Statement sql = con.createStatement();
		ResultSet rs = sql.executeQuery(sqlQuery);
		if(rs.next()){
			session.setAttribute("user", user);
			session.setAttribute("id", rs.getString(1));
			response.sendRedirect("frame.jsp");
		}else{
			out.print("<script language='JavaScript'>alert('您的用户名或密码有误，请重新输入或者注册');window.location.href='Login.html'</script>");
		}
		con.close();
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>