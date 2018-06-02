<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.container{
		width: 1000px;
		border: 1px #bbb solid;
		background-color: #eee;
		padding-top: 20px;
		border-radius: 10px;
		float: left;
	}
	.form-control{
		width: 300px;
		height: 30px;
	}
	form {
		margin-left: 300px;
	}
	.submit{
		margin-left: 50px;
	}
	.reset{
		margin-left: 50px;
	}
</style>
</head>
<body>
	<%
	if((String)session.getAttribute("user")==null){
		out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='Login.html'</script>");
	}
	%>
<div class="container">
  <h2>管理员账户密码修改</h2>
  <form action="DaoAdminPasswordReset.jsp" method="post">
    <div class="form-group">
      <label for="user">用户名</label>
      <input type="email" class="form-control" id="user" name="user"  readonly="readonly" value="<%= session.getAttribute("user")%>">
    </div>
    <div class="form-group">
      <label for="pwd">密码</label>
      <input type="password" class="form-control" id="pwd" name="pwd" placeholder="请输入新的密码">
    </div>
    <button type="submit" class="btn btn-danger submit">修改</button>
    <input type="reset" class="btn btn-warning reset" id="reset" value="重置" />
  </form>
</div>
</body>
</html>