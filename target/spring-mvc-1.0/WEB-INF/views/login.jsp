<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="container">
		<div class="login-form">
			<div class="main-div">
			<c:url value='/loginn' var="url" />
				<form action="${url}" id="formLogin" method="POST">
					<div class="form-group">
						<input type="text" class="form-control" name="username" placeholder="Tên đăng nhập">
					</div>

					<div class="form-group">
						<input type="password" class="form-control" name="password" placeholder="Mật khẩu">
					</div>
					<button type="submit" class="btn btn-primary" >Đăng nhập</button>
					<br/>
					<a href='<c:url value='/register'/>' class="btn btn-danger" >Đăng Ký</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>