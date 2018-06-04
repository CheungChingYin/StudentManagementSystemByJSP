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
			.pageNav{
				margin-left: 200px;
			}
		</style>
	</head>

	<body>
		<%
		request.setCharacterEncoding("UTF-8");
		String pages = request.getParameter("pages");
		int startLine = (Integer.parseInt(pages)-1)*10;
		%>
		<div class="contain pull-left">
			<form action="DaoSearch.jsp" class="form-inline ">
				<h2>学生名单管理</h2>
				<div class="form-group search">
					<input type="text" name="check" class="form-control" placeholder="请输入查询姓名或学号" />
					<input type="submit" name="submit" class="btn" value="搜索" />

				</div>
			</form>
			<a href="AddStudent.jsp" target="_self"><button class="btn btn-primary add">添加学生资料</button></a>
			<div class="pull-left">
				<table class="table table-hover">
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
	int pageSize = 10;
	String sqlQuery = "SELECT * FROM stumanagementbyweb.studentinfo limit "+startLine+","+pageSize;
	String sqlAll = "SELECT * FROM stumanagementbyweb.studentinfo";
	int pagesCount = 0;
	int lastRow = 0;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stumanagementbyweb","root","123456");
		Statement sql = con.createStatement();
		Statement stat = con.createStatement();
		ResultSet rs = sql.executeQuery(sqlQuery);
		ResultSet rsAll = stat.executeQuery(sqlAll);
		rsAll.last();
		lastRow = rsAll.getRow();//记录最后一行
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
				<div class="pageNav">
					<ul class="pagination">
					<%
						int prePage;
						if(pages.equals("1")){
							prePage = 1;
						}else{
							prePage = Integer.parseInt(pages)-1;
						}
					%>
					<li class="page-item"><a class="page-link" href="Contain.jsp?pages=<%=prePage%>">Previous</a></li>
					<%
						pagesCount = (lastRow % pageSize == 0) ? (lastRow / pageSize) : (lastRow / pageSize +1);
						for(int i = 1;i<=pagesCount;i++){
							out.print("<li class='page-item'>");
							out.print("<a class='page-link' href='Contain.jsp?pages="+i+"'>"+i+"</a>");
							out.print("</li>");
						}
					%>
					<%
						int nextPage;
						if(pages.equals(pagesCount+"")){
							nextPage = pagesCount;
						}else{
							nextPage = Integer.parseInt(pages)+1;
						}
					%>
					<li class="page-item"><a class="page-link" href="Contain.jsp?pages=<%=nextPage%>">Next</a></li>
					</ul>
				</div>

			</div>

		</div>
	</body>

</html>