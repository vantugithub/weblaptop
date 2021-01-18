<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Failed</title>
</head>
<body>
	<div class="super_container">
		<!-- Home -->
		<div class="home">
			<div class="home_container">
				<div class="home_background"
					style="background-image: url(<c:url value="/template/web2/images/avds_large.jpg"/>)"></div>
				<div class="home_content_container">
					<div class="container">
						<div class="row">
							<div class="col">
								<div class="home_content">
									<div class="breadcrumbs">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="newsletter">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="newsletter_border"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8 offset-lg-2">
						<div class="newsletter_content text-center">
							<div class="newsletter_title">You have no items in your shopping cart</div>
							<div class="newsletter_text">
							</div>
							<div class="newsletter_form_container">
							<c:url value="/categories" var="url" />
								<form action="${url}" class="newsletter_form" method="GET">
									<button type="submit" class="newsletter_button trans_200">
										<span>Continue shopping</span>
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>