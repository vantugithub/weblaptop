<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- search -->
<link href="<c:url value='/template/search/search.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/template/web2/styles/bootstrap4/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/template/web2/plugins/font-awesome-4.7.0/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/template/web2/styles/checkout.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/template/web2/styles/checkout_responsive.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/template/web2/styles/categories.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/template/web2/styles/categories_responsive.css'/>" rel="stylesheet" type="text/css">

</head>
<body>
<!-- Navigation -->
	<%@ include file="/common/web/header.jsp" %>

	<dec:body/>

	<!-- Footer -->
	<%@ include file="/common/web/footer.jsp" %>
	
	
	<script src="<c:url value='/template/web2/js/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/template/web2/styles/bootstrap4/popper.js'/>"></script>
	<script src="<c:url value='/template/web2/styles/bootstrap4/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/greensock/TweenMax.min.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/greensock/TimelineMax.min.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/scrollmagic/ScrollMagic.min.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/greensock/animation.gsap.min.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/greensock/ScrollToPlugin.min.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/easing/easing.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/parallax-js-master/parallax.min.js'/>"></script>
	<script src="<c:url value='/template/web2/js/checkout.js'/>"></script>
	
		<!-- search -->
	<script src="<c:url value='/template/search/search.js'/>"></script>
</body>
</html>