<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${resultSearch != null}">
	<c:forEach items="${resultSearch}" var="list">
	<a href="<c:url value='/product/${list.id}'/>">
	<li class="result-entry" data-suggestion="Target 1"
							data-position="2" data-type="type" data-analytics-type="merchant">
							<div class="media">
								<div class="media-left ok">
									<img
										src='<c:url value="/allfile/${list.imageList}"/>'
										class="media-object ok">
								</div>
								<div class="media-body">
									<h4 class="media-heading">${list.name}</h4>
									<p>${list.price}</p>
								</div>
							</div>
						</li>
						</a>
	</c:forEach>
	</c:if>
</body>
</html>