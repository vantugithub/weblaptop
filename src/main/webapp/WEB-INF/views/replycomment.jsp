<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${listReplyComment}" var="listRep">
		<div class="commented-section mt-2">
			<div class="time">
				<i class="ace-icon fa fa-clock-o"></i> <span class="grey">${listRep.date}</span>
			</div>
			<div class="d-flex flex-row align-items-center commented-user">
				<div class="name">
					<a href="#">${listRep.fullName}</a>
				</div>
				<span class="dot mb-1"></span><span class="mb-1 ml-2"></span>
			</div>
			<div class="comment-text-sm">
				<span>${listRep.content}</span>
			</div>
		</div>
	</c:forEach>
	<form name="formReplyComment">
		<form>
			<div class="form-actions">
				<div class="input-group">
					<input id="content-${CommentId}"
						placeholder="Type your message here ..." type="text"
						class="form-control" /> <span class="input-group-btn">
						<button class="btn btn-sm btn-info no-radius" type="button"
							onclick="replyComment(${CommentId})">
							<i class="ace-icon fa fa-share"></i> Send
						</button>
					</span>
				</div>
			</div>
		</form>
	</form>
</body>
</html>