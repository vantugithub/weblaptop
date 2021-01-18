<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<script type="text/javascript">
	function search() {
		var xhttp;
		var name = document.myform.name.value;
		var url = "http://localhost:8080/spring-mvc/orthers/search/"+name;
		
		if(name!="") {
			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}

			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
					var data = xhttp.responseText;
					document.getElementById("resultSearch").innerHTML = data;
				}
			}
			xhttp.open("POST", url, true);
			xhttp.send();
		}
		else {
			document.getElementById("resultSearch").innerHTML = "";
		}
		
	}
</script>
<div class="container">
	<nav class="navbar navbar-expand-lg navbar-white bg-white fixed-top">
		<div class="header_extra ml-auto navbar-brand">
			<div class="shopping_cart">
				<a href='<c:url value="/cart"/>'> <svg version="1.1"
						xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
						viewBox="0 0 489 489" style="enable-background: new 0 0 489 489;"
						xml:space="preserve">
											<g>
												<path
							d="M440.1,422.7l-28-315.3c-0.6-7-6.5-12.3-13.4-12.3h-57.6C340.3,42.5,297.3,0,244.5,0s-95.8,42.5-96.6,95.1H90.3
													c-7,0-12.8,5.3-13.4,12.3l-28,315.3c0,0.4-0.1,0.8-0.1,1.2c0,35.9,32.9,65.1,73.4,65.1h244.6c40.5,0,73.4-29.2,73.4-65.1
													C440.2,423.5,440.2,423.1,440.1,422.7z M244.5,27c37.9,0,68.8,30.4,69.6,68.1H174.9C175.7,57.4,206.6,27,244.5,27z M366.8,462
													H122.2c-25.4,0-46-16.8-46.4-37.5l26.8-302.3h45.2v41c0,7.5,6,13.5,13.5,13.5s13.5-6,13.5-13.5v-41h139.3v41
													c0,7.5,6,13.5,13.5,13.5s13.5-6,13.5-13.5v-41h45.2l26.9,302.3C412.8,445.2,392.1,462,366.8,462z" />
											</g>
										</svg>
					<div id="idquantity">
						Cart(<%=request.getSession().getAttribute("quantity") != null ? request.getSession().getAttribute("quantity") : 0 %>)
					</div>

				</a>
			</div>
			<div id="search-form" class="search">
				<form class="form-search"  name="myform" onkeyup="search()">
					<input name="name" />
				</form>
				
				<div class="instant-results">
					<ul class="list-unstyled result-bucket" id="resultSearch">
					
					</ul>
				</div>
				
			</div>
		</div>
		<nav class="main_nav">
			<ul>
				<li class="hassubs active"><a
					href='<c:url value="/trang-chu"/>'>Home</a>
					<ul>
						<li><a href='<c:url value="/categories"/>'>Categories</a></li>
						<li><a href="#">Product</a></li>
						<li><a href='<c:url value="/cart" />'>Cart</a></li>
						<li><a href="#">Check out</a></li>
						<li><a href="#">Contact</a></li>
					</ul></li>
				<li class="hassubs"><a href="#">Categories</a>
					<ul>
						<c:forEach items="${listCatalog}" var="lis">
							<li><a href='<c:url value="/${lis.name}"/>'>${lis.name}</a></li>
						</c:forEach>
					</ul></li>
				<li><a href="#">Contact</a></li>
				<security:authorize ifAnyGranted="ROLE_ANONYMOUS">
					<li><a href="<c:url value='/dang-nhap'/>">Login</a></li>
				</security:authorize>
				<security:authorize ifAllGranted="ROLE_USER">
					<c:url value="/profile" var="url" />
					<li><a href="${url}">Welcome
							${pageContext.request.userPrincipal.name}</a></li>
					<li><a href="<c:url value='/j_spring_security_logout'/>">Logout</a></li>
				</security:authorize>
			</ul>
		</nav>

	</nav>
</div>