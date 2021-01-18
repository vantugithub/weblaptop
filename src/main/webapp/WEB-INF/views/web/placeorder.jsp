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
	<div class="super_container">
		<!-- Home -->

		<div class="home">
			<div class="home_container">
				<div class="home_background"
					style="background-image: url(template/web2/images/cart.jpg)"></div>
				<div class="home_content_container">
					<div class="container">
						<div class="row">
							<div class="col">
								<div class="home_content">
									<div class="breadcrumbs">
										<ul>
											<li><a href="index.html">Home</a></li>
											<li><a href="cart.html">Shopping Cart</a></li>
											<li>Checkout</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Checkout -->

		<div class="checkout">
			<div class="container">
				<div class="row">

					<!-- Billing Info -->
					<div class="col-lg-6">
						<div class="billing checkout_section">
							<div class="section_title">Billing Address</div>
							<div class="section_subtitle">Enter your address info</div>
							<div class="checkout_form_container">
								<form action="#" id="checkout_form" class="checkout_form">
									<div>
										<!-- Name -->
										<label for="checkout_company">Name</label> <input type="text"
											id="checkout_company" class="checkout_input"
											value="${myUser.fullName}">
									</div>
									<div>
										<!-- Address -->
										<label for="checkout_address">Province*</label> <input
											value="${myUser.city}" type="text" id="checkout_address"
											class="checkout_input" required="required">
									</div>
									<div>
										<!-- Address -->
										<label for="checkout_address">Address*</label> <input
											value="${myUser.address}" type="text" id="checkout_address"
											class="checkout_input" required="required">
									</div>
									<div>
										<!-- Phone no -->
										<label for="checkout_phone">Phone no*</label> <input
											value="${myUser.phone}" type="text" id="checkout_phone"
											class="checkout_input" required="required">
									</div>
									<div>
										<!-- Email -->
										<label for="checkout_email">Email Address*</label> <input
											type="text" id="checkout_email" class="checkout_input"
											required="required">
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- Order Info -->

					<div class="col-lg-6">
						<div class="order checkout_section">
							<div class="section_title">Your order</div>
							<div class="section_subtitle">Order details</div>

							<!-- Order details -->
							<div class="order_list_container">
								<div
									class="order_list_bar d-flex flex-row align-items-center justify-content-start">
									<div class="order_list_title">Product</div>
									<div class="order_list_value ml-auto">Total</div>
								</div>
								<ul class="order_list">
									<c:forEach items="${list}" var="lis">
										<li
											class="d-flex flex-row align-items-center justify-content-start">
											<div class="order_list_title">${lis.product.name}</div>
											<div class="order_list_value ml-auto">$${lis.product.price}</div>
										</li>
									</c:forEach>
									<li
										class="d-flex flex-row align-items-center justify-content-start">
										<div class="order_list_title">Subtotal</div>
										<div class="order_list_value ml-auto">$${total}</div>
									</li>
									<li
										class="d-flex flex-row align-items-center justify-content-start">
										<div class="order_list_title">Shipping</div>
										<div class="order_list_value ml-auto">Free</div>
									</li>
									<li
										class="d-flex flex-row align-items-center justify-content-start">
										<div class="order_list_title">Total</div>
										<div class="order_list_value ml-auto">$${total}</div>
									</li>
								</ul>
							</div>

							<!-- Payment Options -->
							<div class="payment">
								<div class="payment_options">
									<label class="payment_option clearfix">Cash on delivery
										<input type="radio" name="radio"> <span
										class="checkmark"></span>
									</label>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-8 offset-lg-2">
										<!-- Order Text -->
										<div class="newsletter_form_container">
											<c:url value="/cart/placeorder" var="url" />
											<form action="${url}" method="POST" class="newsletter_form">
												<button class="newsletter_button trans_200" type="submit">Place
													Order</button>
											</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>