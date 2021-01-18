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
												<a class="delivery_option" onclick="deleteItem(${lis.product.id})" >Delete</a>
											</div>
										</div>
									</div>

									<!-- Price -->

									<div class="cart_item_price" data-value="${lis.product.price}">$${lis.product.price}</div>
									<!-- Quantity -->

									<div class="cart_item_quantity">
										<div class="product_quantity_container">
											<div class="product_quantity clearfix">
												<span>Qty</span> <input name="quantity"
													class="quantity_input" type="text" pattern="[0-9]*"
													value="${lis.quantity}">

												<div class="quantity_buttons">
													<div class="quantity_inc quantity_control">
														<i class="fa fa-chevron-up" aria-hidden="true"></i>
													</div>
													<div class="quantity_dec quantity_control">
														<i class="fa fa-chevron-down" aria-hidden="true"></i>
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
</body>
</html>