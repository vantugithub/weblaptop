<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>

</head>
<body>

	<c:forEach items="${product.listResult}" var="product">
		<div class="super_container">
			<!-- Home -->

			<div class="home">
				<div class="home_container">
					<div style="" class="home_background">
						<img src="<c:url value="/template/web2/images/categories.jpg"/>"
							alt="">
					</div>
					<div class="home_content_container">
						<div class="container">
							<div class="row">
								<div class="col">
									<div class="home_content">

										<!-- Details Product -->
										<div class="home_title">
											${product.name} <span>.</span>
										</div>
										<div class="home_text"></div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Product Details -->

			<div class="product_details">
				<div class="container">
					<div class="row details_row">
						<!-- Product Image -->
						<div class="col-lg-6">
							<div class="details_image">
								<div class="details_image_large">
									<img src="<c:url value="/allfile/${fistImage}"/>" />
								</div>
								<div
									class="details_image_thumbnails d-flex flex-row align-items-start justify-content-between">
									<c:forEach items="${strListImage}" var="image">
										<div class="details_image_thumbnail active"
											data-image="<c:url value="/allfile/${image}"/>">
											<img src="<c:url value="/allfile/${image}"/>" alt="">
										</div>
									</c:forEach>
								</div>
							</div>
						</div>

						<!-- Product Content -->
						<div class="col-lg-6">
							<div class="details_content">
								<div class="details_name">Smart Phone</div>
								<div class="details_discount">12000000</div>
								<div class="details_price">${product.price}</div>

								<!-- In Stock -->
								<div class="in_stock_container">
									<div class="availability">Availability:</div>
									<span>In Stock</span>
								</div>
								<div class="details_text">

									<c:set var="result"
										value="${fn:replace(product.content , nTagInDatabase,brTagInHtml)}" />
									<p>
										<c:out value="${result}" escapeXml="false" />
									</p>

								</div>
								<!-- Product Quantity -->
								<div class="product_quantity_container">
									<div class="product_quantity clearfix">
										<span>Qty</span> <input id="quantity_input"
											name="quantity_input" type="text" pattern="[0-9]*" value="1">

										<div class="quantity_buttons">
											<div id="quantity_inc_button"
												class="quantity_inc quantity_control">
												<i class="fa fa-chevron-up" aria-hidden="true"></i>
											</div>
											<div id="quantity_dec_button"
												class="quantity_dec quantity_control">
												<i class="fa fa-chevron-down" aria-hidden="true"></i>
											</div>
										</div>
									</div>
									<div class="button cart_button">
										<a onclick="addToCart(${product.id})" >Add to cart</a>
									</div>
								</div>

								<!-- Share -->
								<div class="details_share">
									<span>Share:</span>
									<ul>
										<li><a href="#"><i class="fa fa-pinterest"
												aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-instagram"
												aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-facebook"
												aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-twitter"
												aria-hidden="true"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="row description_row">
						<div class="col">

							<div class="tabbable">
								<ul class="nav">
									<li class="active description_title"><a data-toggle="tab"
										href="#description">Description</a></li>
									<li class="reviews_title"><a data-toggle="tab"
										href="#reviews">Reviews<span>(${sumComment})</span></a></li>
								</ul>
								<br /> <br />
								<div class="tab-content">
									<div id="description" class="tab-pane in active">
										<div class="details_content">
										
											<c:forEach items="${descriptionProduct}"
												var="item1">
												<div class="description_title">${item1.title}</div>
													<p>${item1.headContent}</p>
													<img src="<c:url value="/allfile/${item1.image}"/>" alt="">
													<p>${item1.footContent}</p>
											</c:forEach>
										</div>
									</div>
									<div id="reviews" class="tab-pane">

										<div class="widget-header">
											<h4 class="widget-title lighter smaller">
												<i class="ace-icon fa fa-comment blue"></i>
												Comments(${sumComment})
											</h4>
										</div>
										<div class="widget-body">
											<div class="widget-main no-padding">
												<div class="dialogs" id="listcomment">
													<c:forEach items="${listComment}" var="list">
														<div class="itemdiv dialogdiv">
															<div class="user">
																<img alt="Jim's Avatar"
																	src="<c:url value="/template/admin/assets/avatars/avatar4.png"/>" />
															</div>
															<div class="body">
																<div class="time">
																	<i class="ace-icon fa fa-clock-o"></i> <span
																		class="grey">${list.date}</span>
																</div>
																<div class="name">
																	<a href="#">${list.fullName}</a>
																</div>
																<p>${list.content}</p>
																
														        <div class="coment-bottom bg-white p-2 px-4">
													<div class="collapsable-comment">
														<div
															class="d-flex flex-row justify-content-between align-items-center action-collapse p-2"
															data-toggle="collapse" aria-expanded="false"
															aria-controls="collapse-1" href="#collapse-1-${list.id}">
															<span>Comments</span><i
																class="fa fa-chevron-down servicedrop"></i>
														</div>
														
														
														<div id="collapse-1-${list.id}" class="collapse">
														<c:forEach items="${listReplyComment}" var="listRep">
															<c:if test="${list.id == listRep.commentId}">
															<div class="commented-section mt-2">
															<div class="time">
																	<i class="ace-icon fa fa-clock-o"></i> <span
																		class="grey">${listRep.date}</span>
																</div>
																<div
																	class="d-flex flex-row align-items-center commented-user">
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
																	<button class="btn btn-sm btn-info no-radius"
																		type="button" onclick="replyComment(${list.id})">
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
												</div>

												<form name="formComment">
													<form>
														<div class="form-actions">
															<div class="input-group">
																<input name="content"
																	placeholder="Type your message here ..." type="text"
																	class="form-control" /> <span class="input-group-btn">
																	<button class="btn btn-sm btn-info no-radius"
																		type="button" onclick="Binhluan()">
																		<i class="ace-icon fa fa-share"></i> Send
																	</button>
																</span>
															</div>
														</div>
													</form>
												</form>
											</div>
											<!-- /.widget-main -->
										</div>
										<!-- /.widget-body -->
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</c:forEach>
	<script type="text/javascript">
	function addToCart(id) {
		var xhttp;
		var quantity = document.getElementById("quantity_input").value;
		var url = "http://localhost:8080/spring-mvc/orthers/addToCart/"+id+"/"+quantity;
		if (window.XMLHttpRequest) {
			xhttp = new XMLHttpRequest();
		} else {
			xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4) {
				var data = xhttp.responseText;
				document.getElementById("idquantity").innerHTML = data;
			}
		}
		xhttp.open("GET", url, true);
		xhttp.send();
	}
	
		function Binhluan() {
			var xhttp;

			var content = document.formComment.content.value;
			var url = "http://localhost:8080/spring-mvc/comment/" + ${idProduct1}
			+"/" + content;

			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}

			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
					var data = xhttp.responseText;
					document.getElementById("listcomment").innerHTML = data;
				}
			}
			xhttp.open("POST", url, true);
			xhttp.send();
		}
		
		function replyComment(idComment) {
			var xhttp;
			var content = document.getElementById("content-"+idComment).value;
			var url = "http://localhost:8080/spring-mvc/comment/reply/"+${idProduct1}+"/"+idComment+"/"+content;

			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}

			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
					var data = xhttp.responseText;
					document.getElementById("collapse-1-"+idComment).innerHTML = data;
				}
			}
			xhttp.open("POST", url, true);
			xhttp.send();
		}
		
	</script>
</body>
</html>
