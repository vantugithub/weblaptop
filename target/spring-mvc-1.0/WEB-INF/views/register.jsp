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
			<c:url value='/registerAction' var="url" />
				<form:form id="formRegister" action="${url}"
					method="POST" modelAttribute="user">
					<div class="form-group">
					<form:input class="form-control"  path="username" id="username" placeholder="Username" />
					</div>
					<div class="form-group">
					<form:password class="form-control"  path="password" id="password" placeholder="Password" />
					</div>
					<div class="form-group">
					<form:input class="form-control"  path="fullName" id="fullName" placeholder="Fullname" />
					</div>
					<button class="btn btn-primary"  type="submit" value="Register">Đăng Ký</button> 
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>