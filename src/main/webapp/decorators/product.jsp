<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<!-- search -->
<link href="<c:url value='/template/search/search.css'/>" rel="stylesheet" type="text/css">

<!-- Bootstrap core CSS -->
<link href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->

<link href="<c:url value='/template/assets/font-awesome/4.5.0/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/template/assets/css/ace.min.css'/>" rel="stylesheet" type="text/css">


<!-- Main Home web -->
<link href="<c:url value='/template/web2/plugins/OwlCarousel2-2.2.1/owl.carousel.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/template/web2/plugins/OwlCarousel2-2.2.1/owl.theme.default.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/template/web2/plugins/OwlCarousel2-2.2.1/animate.css'/>" rel="stylesheet" type="text/css">

<!-- product -->
<link href="<c:url value='/template/web2/styles/product.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/template/web2/styles/product_responsive.css'/>" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/common/web/header.jsp" %>

	<dec:body/>

	<!-- Footer -->
	<%@ include file="/common/web/footer.jsp" %>

	<!-- Bootstrap core JavaScript -->

	
	<!-- Home core JavaScript -->
	<script src="<c:url value='/template/web2/js/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/template/web2/styles/bootstrap4/popper.js'/>"></script>
	<script src="<c:url value='/template/web2/styles/bootstrap4/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/greensock/TweenMax.min.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/greensock/TimelineMax.min.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/scrollmagic/ScrollMagic.min.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/greensock/animation.gsap.min.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/greensock/ScrollToPlugin.min.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/OwlCarousel2-2.2.1/owl.carousel.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/Isotope/isotope.pkgd.min.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/easing/easing.js'/>"></script>
	<script src="<c:url value='/template/web2/plugins/parallax-js-master/parallax.min.js'/>"></script>
	
	<!-- product core JavaScript -->
	<script src="<c:url value='/template/web2/js/product.js'/>"></script>
	
	<!-- search -->
	<script src="<c:url value='/template/search/search.js'/>"></script>


	
</body>
</html>