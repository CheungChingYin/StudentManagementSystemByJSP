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
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<script type="text/javascript">
			function del() {
				if(!confirm("确认要删除？")) {
					window.event.returnValue = false;
				}
			}
		</script>
		<title>学生资料管理系统</title>
		<style type="text/css">
			body {
				/*background-color: #eee;*/
			}
			
			form h1 {
				display: inline-block;
				width: 820px;
			}
			
			.check {
				padding: 30px 30px;
			}
			
			form {
				display: inline;
			}
			
			.contain {
				width: 1000px;
				border-radius: 10px;
				border: 1px #bbb solid;
				background-color: #eee;
				padding-top: 20px;
			}
			
			button {
				margin-left: 10px;
			}
			
			.search {
				display: inline-block;
				margin-left: 500px;
			}
			
			.add {
				float: right;
				margin-right: 50px;
			}
		</style>
	</head>

	<body>
		<div class="contain pull-left">
			<form action="DaoSearch.jsp" class="form-inline ">
				<h2>查询结果</h2>
				<div class="form-group search">
					<input type="text" name="check" class="form-control" placeholder="请输入查询姓名或学号" />
					<input type="submit" name="submit" class="btn" value="搜索" />

				</div>
			</form>
			<a href="AddStudent.jsp" target="_self"><button class="btn btn-primary add">添加学生资料</button></a>
			<div class="pull-left">
				<table class="table">
					<thead>
						<tr>
							<th>学号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>出生日期</th>
							<th>入学时间</th>
							<th>专业</th>
							<th>学院</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
	<%
	//查询功能
	if((String)session.getAttribute("user")==null){
		out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='Login.html'</script>");
	}
	
	request.setCharacterEncoding("UTF-8");
	String search = request.getParameter("check");
	String sqlQuery;
	if(search.matches("[0-9]+")){
		sqlQuery = "SELECT * FROM stumanagementbyweb.studentinfo where id='"+search+"'";
	}else{
		sqlQuery = "SELECT * FROM stumanagementbyweb.studentinfo where name='"+search+"'";
	}
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stumanagementbyweb","root","123456");
		Statement sql = con.createStatement();
		ResultSet rs = sql.executeQuery(sqlQuery);
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>"+rs.getString(1)+"</td>");
			out.print("<td>"+rs.getString(2)+"</td>");
			out.print("<td>"+rs.getString(3)+"</td>");
			out.print("<td>"+rs.getString(4)+"</td>");
			out.print("<td>"+rs.getString(5)+"</td>");
			out.print("<td>"+rs.getString(6)+"</td>");
			out.print("<td>"+rs.getString(7)+"</td>");
			out.print("<td><a href='AlertStudent.jsp?id="+rs.getString(1)+"'><button class='btn btn-primary'>修改</button></a><a href='DaoDelete.jsp?id="+rs.getString(1)+"' onclick='javascript:return del();'><button class='btn btn-danger'>删除</button></a></td>");
			out.print("</tr>");
		}
		con.close();
	}catch(SQLException e){
		e.printStackTrace();
	}
%>

					</tbody>
				</table>
			</div>

		</div>
	</body>

</html>