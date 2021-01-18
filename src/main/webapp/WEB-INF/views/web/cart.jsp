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
											<li><a href="#">Home</a></li>
											<li><a href="#">Categories</a></li>
											<li>Shopping Cart</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Cart Info -->

		<div class="cart_info">
			<div class="container">
				<div class="row">
					<div class="col">
						<!-- Column Titles -->
						<div class="cart_info_columns clearfix">
							<div class="cart_info_col cart_info_col_product">Product</div>
							<div class="cart_info_col cart_info_col_price">Price</div>
							<div class="cart_info_col cart_info_col_quantity">Quantity</div>
							<div class="cart_info_col cart_info_col_total">Total</div>
						</div>
					</div>
				</div>

				<div id="cart_items_">
					<c:forEach items="${list}" var="lis">
						<div class="row cart_items_row">
							<div class="col">
								<!-- Cart Item -->
								<div
									class="cart_item d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">
									<!-- Name -->
									<div
										class="cart_item_product d-flex flex-row align-items-center justify-content-start">
										<div class="cart_item_image">
											<div>
												<img
													src='<c:url value="/allfile/${lis.product.imageList}" />'
													alt="">
											</div>
										</div>
										<div class="cart_item_name_container">
											<div class="cart_item_name">
												<a href="#">${lis.product.name}</a>
											</div>
											<div class="cart_item_edit clear_cart_button ">
												<a class="delivery_option"
													onclick="deleteItem(${lis.product.id})">Delete</a>
											</div>
										</div>
									</div>

									<!-- Price -->

									<div class="cart_item_price" data-value="${lis.product.price}">$${lis.product.price}</div>
									<!-- Quantity -->

									<div class="cart_item_quantity">
										<div class="product_quantity_container">
											<div class="product_quantity clearfix">
												<span>Qty</span> <input id="id_product_${lis.product.id}"
													class="quantity_input" type="text" pattern="[0-9]*"
													value="${lis.quantity}">

												<div class="quantity_buttons">
													<div class="quantity_inc quantity_control">
														<a class="fa fa-chevron-up" aria-hidden="true"
															onclick="updateQuantityInc(${lis.product.id})"></a>
													</div>
													<div class="quantity_dec quantity_control">
														<a class="fa fa-chevron-down" aria-hidden="true"
															onclick="updateQuantityDec(${lis.product.id})"></a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- Total -->
									<div class="cart_item_total">$${lis.quantity*lis.product.price}</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>


				<div class="row row_cart_buttons">
					<div class="col">

						<div
							class="cart_buttons d-flex flex-lg-row flex-column align-items-start justify-content-start">
							<div class="button continue_shopping_button">
								<a href="#">Continue shopping</a>
							</div>

							<div class="cart_buttons_right ml-lg-auto">

								<div class="button clear_cart_button">
									<a onclick="clearAllCart()">Clear cart</a>
								</div>

								<div class="button update_cart_button">
									<a onclick="updateCart()">Update cart</a>
								</div>

							</div>
						</div>
					</div>
				</div>


				<div class="row row_extra">
					<div class="col-lg-4">

						<!-- Delivery -->
						<div class="delivery">
							<div class="section_title">Shipping method</div>
							<div class="section_subtitle">Select the one you want</div>
							<div class="delivery_options">
								<label class="delivery_option clearfix">Next day
									delivery <input type="radio" name="radio"> <span
									class="checkmark"></span> <span class="delivery_price">$4.99</span>
								</label> <label class="delivery_option clearfix">Standard
									delivery <input type="radio" name="radio"> <span
									class="checkmark"></span> <span class="delivery_price">$1.99</span>
								</label> <label class="delivery_option clearfix">Personal pickup
									<input type="radio" checked="checked" name="radio"> <span
									class="checkmark"></span> <span class="delivery_price">Free</span>
								</label>
							</div>
						</div>

						<!-- Coupon Code -->
						<div class="coupon">
							<div class="section_title">Coupon code</div>
							<div class="section_subtitle">Enter your coupon code</div>
							<div class="coupon_form_container">
								<form action="#" id="coupon_form" class="coupon_form">
									<input type="text" class="coupon_input" required="required">
									<button class="button coupon_button">
										<span>Apply</span>
									</button>
								</form>
							</div>
						</div>
					</div>

					<div class="col-lg-6 offset-lg-2">
						<div class="cart_total">
							<div class="section_title">Cart total</div>
							<div class="section_subtitle">Final info</div>
							<div class="cart_total_container">
								<ul>
									<li
										class="d-flex flex-row align-items-center justify-content-start">
										<div class="cart_total_title">Subtotal</div>
										<div class="cart_total_value ml-auto" id="cart_total_value">$${cart_total_value}</div>
									</li>
									<li
										class="d-flex flex-row align-items-center justify-content-start">
										<div class="cart_total_title">Shipping</div>
										<div class="cart_total_value ml-auto">Free</div>
									</li>
									<li
										class="d-flex flex-row align-items-center justify-content-start">
										<div class="cart_total_title">Total</div>
										<div class="cart_total_value ml-auto" id="cart_total_value_1">$${cart_total_value}</div>
									</li>
								</ul>
							</div>
							<security:authorize ifAllGranted="ROLE_USER">
								<div class="button checkout_button">
									<a href='<c:url value="/checkout" />'>Proceed to checkout</a>
								</div>
							</security:authorize>
							<security:authorize ifNotGranted="ROLE_USER">
								<div class="button checkout_button">
									<a data-toggle="modal" data-target="#exampleModal"
										data-whatever="@mdo">Proceed to checkout</a>
								</div>
							</security:authorize>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="limiter">
					<div class="wrap-login100">
					 <c:url value='/loginn' var="url" />
						<form class="user" action="${url}" id="formLogin" method="POST">
							<span class="login100-form-logo"> <i
								class="zmdi zmdi-landscape"></i>
							</span> <span class="login100-form-title p-b-34 p-t-27"> Log in </span>

							<div class="wrap-input100 validate-input"
								data-validate="Enter username">
								<input class="input100" type="text" id="username" name="username"
									placeholder="Username"> <span class="focus-input100"
									data-placeholder="&#xf207;"></span>
							</div>

							<div class="wrap-input100 validate-input"
								data-validate="Enter password">
								<input class="input100" type="password" id="password" name="password"
									placeholder="Password"> <span class="focus-input100"
									data-placeholder="&#xf191;"></span>
							</div>

							<div class="contact100-form-checkbox">
								<input class="input-checkbox100" id="ckb1" type="checkbox"
									name="remember-me"> <label class="label-checkbox100"
									for="ckb1"> Remember me </label>
							</div>

							<div class="container-login100-form-btn">
								<button class="login100-form-btn">Login</button>
							</div>
							<div class="text-center p-t-90">
								<c:url value='/register' var="url" />
								<a class="txt1" href="#">
									Forgot Password? </a>
									<a class="txt1" href="${url}"> Register?</a> 
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
		function clearAllCart() {
			var xhttp;
			var url = "http://localhost:8080/spring-mvc/orthers/clearCart";
			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}

			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
					var data = xhttp.responseText;
					document.getElementById("cart_items_").innerHTML = data;
				}
			}
			xhttp.open("GET", url, true);
			xhttp.send();
		}
		
		function deleteItem(id) {
			var xhttp;
			var url = "http://localhost:8080/spring-mvc/orthers/deleteItem/"+id;
			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}

			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
					var data = xhttp.responseText;
					document.getElementById("cart_items_").innerHTML = data;
				}
			}
			xhttp.open("GET", url, true);
			xhttp.send();
		}
		
		function updateQuantityInc(id) {
			var xhttp;
			var quantity = document.getElementById("id_product_"+id).value;
			var url = "http://localhost:8080/spring-mvc/orthers/updateQuantityInc/"+id+"/"+quantity;
			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}

			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
					var data = xhttp.responseText;
					document.getElementById("id_product_"+id).innerHTML = data;
				}
			}
			xhttp.open("GET", url, true);
			xhttp.send();
		}
		
		function updateQuantityDec(id) {
			var xhttp;
			var quantity = document.getElementById("id_product_"+id).value;
			var url = "http://localhost:8080/spring-mvc/orthers/updateQuantityDec/"+id+"/"+quantity;
			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
					var data = xhttp.responseText;
					document.getElementById("id_product_"+id).innerHTML = data;
				}
			}
			xhttp.open("GET", url, true);
			xhttp.send();
		} 
		
	</script>

</body>
</html>