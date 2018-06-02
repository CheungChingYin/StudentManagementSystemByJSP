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

	if((String)session.getAttribute("user")==null){
		out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='Login.html'</script>");
	}

	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String sourceId = request.getParameter("sourceId");
	sourceId = sourceId.substring(1, sourceId.length()-1);//由于传值过来会被''括住，需要去除
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String birthday = request.getParameter("birthday");
	String schoolday = request.getParameter("schoolday");
	String college = request.getParameter("college");
	String major = request.getParameter("major");
	String sqlQuery = "UPDATE `stumanagementbyweb`.`studentinfo` SET `id` = ?, `name` = ?, `sex` = ?, `birthday` = ?, `schoolday` = ?, `major` = ?, `college` = ? WHERE (`id` = ?)";
	String sqlid = "SELECT * FROM stumanagementbyweb.studentinfo where id='"+id+"'";
	Connection con = null;
	Statement stat = null;
	ResultSet rs = null;
	PreparedStatement ps = null;
	boolean flag = true;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stumanagementbyweb","root","123456");
		stat = con.createStatement();
		rs = stat.executeQuery(sqlid);
		
		if(sourceId.equals(id)){
			flag = false;
		}
		/*//out.print(flag);
		out.print("<br/>"+sourceId);
		out.print("<br/>"+id);*/
		if(rs.next() && flag){
			out.print("<script type='text/javascript'>alert('学号重复!请重新输入!');window.location.href = document.referrer;</script>");
		}else{
			ps = con.prepareStatement(sqlQuery);
			ps.setString(1, id);
			ps.setString(2,name);
			ps.setString(3,sex);
			ps.setString(4,birthday);
			ps.setString(5,schoolday);
			ps.setString(6,major);
			ps.setString(7,college);
			ps.setString(8,sourceId);
			ps.executeUpdate();
			out.print("<script type='text/javascript'>alert('更改学生信息成功!');window.location.href='Contain.jsp';</script>");
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