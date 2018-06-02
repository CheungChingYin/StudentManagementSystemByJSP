<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String birthday = request.getParameter("birthday");
	String schoolday = request.getParameter("schoolday");
	String college = request.getParameter("college");
	String major = request.getParameter("major");
	
	String sqlQuery = "INSERT INTO `stumanagementbyweb`.`studentinfo` (`id`, `name`, `sex`, `birthday`, `schoolday`, `major`, `college`) VALUES (?, ?, ?, ?, ?,?,?)";
	String sqlid = "SELECT * FROM stumanagementbyweb.studentinfo where id='"+id+"'";
	Connection con = null;
	Statement stat = null;
	ResultSet rs = null;
	PreparedStatement ps = null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stumanagementbyweb","root","123456");
		stat = con.createStatement();
		rs = stat.executeQuery(sqlid);
		
		if(rs.next()){
			out.print("<script type='text/javascript'>alert('学号重复!请重新输入!');window.location.href = document.referrer;</script>");
		}else{
			ps = con.prepareStatement(sqlQuery);
			ps.setString(1,id);
			ps.setString(2,name);
			ps.setString(3,sex);
			ps.setString(4,birthday);
			ps.setString(5,schoolday);
			ps.setString(6,major);
			ps.setString(7,college);
			ps.executeUpdate();
			out.print("<script type='text/javascript'>alert('添加学生信息成功!');window.location.href='Contain.jsp';</script>");
			ps.close();
		}
		rs.close();
		stat.close();
		con.close();
	}catch (Exception e){
			e.printStackTrace();
		}
		
		
%>
</body>
</html>