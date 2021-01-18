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
	<c:forEach items="${listComment}" var="list">
		<div class="itemdiv dialogdiv">
			<div class="user">
				<img alt="Jim's Avatar"
					src="<c:url value="/template/admin/assets/avatars/avatar4.png"/>" />
			</div>
			<div class="body">
				<div class="time">
					<i class="ace-icon fa fa-clock-o"></i> <span class="grey">${list.date}</span>
				</div>
				<div class="name">
					<a href="#">${list.fullName}</a>
				</div>
				<div class="text">${list.content}</div>

				<div class="coment-bottom bg-white p-2 px-4">
					<div class="collapsable-comment">
						<div
							class="d-flex flex-row justify-content-between align-items-center action-collapse p-2"
							data-toggle="collapse" aria-expanded="false"
							aria-controls="collapse-1" href="#collapse-1-${list.id}">
							<span>Comments</span><i class="fa fa-chevron-down servicedrop"></i>
						</div>


						<div id="collapse-1-${list.id}" class="collapse">
							<c:forEach items="${listReplyComment}" var="listRep">
								<c:if test="${list.id == listRep.commentId}">
									<div class="commented-section mt-2">
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
								</c:if>
							</c:forEach>
							<form name="formReplyComment">
								<form>
									<div class="form-actions">
										<div class="input-group">
											<input name="content[${list.id}]" id="content-${list.id}"
												placeholder="Type your message here ..." type="text"
												class="form-control" /> <span class="input-group-btn">
												<button class="btn btn-sm btn-info no-radius" type="button"
													onclick="replyComment(${list.id})">
													<i class="ace-icon fa fa-share"></i> Send
												</button>
											</span>
										</div>
									</div>
								</form>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>