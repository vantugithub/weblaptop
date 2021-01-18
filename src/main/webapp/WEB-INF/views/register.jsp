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

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
              </div>
              <c:url value='/registerAction' var="url" />
              <form:form class="user" id="formRegister" action="${url}" modelAttribute="user" method="POST">
                <div class="form-group">
                  <form:input type="text" class="form-control form-control-user" id="fullName" path="fullName" placeholder="Full name"/>
                </div>
                <div class="form-group">
                  <form:input type="text" class="form-control form-control-user" id="username" path="username" placeholder="Email Address"/>
                </div>
                <div class="form-group">
                    <form:input type="password" class="form-control form-control-user" id="password" path="password" placeholder="Password"/>
                </div>
                
                <button type="submit"class="btn btn-primary btn-user btn-block" >Register Account</button>
                
              </form:form>
              <hr>
                <a href="index.html" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> Register with Google
                </a>
                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                  <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                </a>
              <hr>
              <div class="text-center">
                <a class="small" href="forgot-password.html">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="login.html">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
	
	
</body>
</html>