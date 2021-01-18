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
		<div class="home">
			<div class="home_container">
				<div class="home_background"
					style="background-image: url(template/web2/images/categories.jpg)"></div>
				<div class="home_content_container">
					<div class="container">
						<div class="row">
							<div class="col">
								<div class="home_content">
									<div class="home_title">
										${NAME}<span>.</span>
									</div>
									<div class="home_text">
										<p></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Products -->

		<div class="products">
			<div class="container">
				<div class="row">
					<div class="col">

						<!-- Product Sorting -->
						<div
							class="sorting_bar d-flex flex-md-row flex-column align-items-md-center justify-content-md-start">
							<div class="results">
								Showing <span>12</span> results
							</div>
							<div class="sorting_container ml-md-auto">
								<div class="sorting">
									<ul class="item_sorting">
										<li><span class="sorting_text">Sort by</span> <i
											class="fa fa-chevron-down" aria-hidden="true"></i>
											<ul>
												<li class="product_sorting_btn"
													data-isotope-option='{ "sortBy": "original-order" }'><span>Default</span></li>
												<li class="product_sorting_btn"
													data-isotope-option='{ "sortBy": "price" }'><span>Price</span></li>
												<li class="product_sorting_btn"
													data-isotope-option='{ "sortBy": "stars" }'><span>Name</span></li>
											</ul></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">

						<div class="product_grid">

							<!-- Product -->
							<c:forEach items="${listProduct}" var="lis">
								<div class="product">
									<div class="product_image">
										<img src="<c:url value="/allfile/${lis.imageList}"/>" alt="">
									</div>
									<div class="product_extra product_new">
										<a href="#">New</a>
									</div>
									<div class="product_content">
										<div class="product_title">
											<a href='<c:url value="/product/${lis.id}" />'>${lis.name}</a>
										</div>
										<div class="product_price">$${lis.price}</div>
									</div>
									<button class="newsletter_button trans_200 " type="button"
												onclick="addToCart(${lis.id})"><span>Add to cart</span></button>
								</div>
							</c:forEach>
						</div>
						<div class="product_pagination">
							<ul>
								<li class="active"><a href="#">01.</a></li>
								<li><a href="#">02.</a></li>
								<li><a href="#">03.</a></li>
							</ul>
						</div>

					</div>
				</div>
			</div>
		</div>

		<!-- Icon Boxes -->

		<div class="icon_boxes">
			<div class="container">
				<div class="row icon_box_row">

					<!-- Icon Box -->
					<div class="col-lg-4 icon_box_col">
						<div class="icon_box">
							<div class="icon_box_image">
								<img src="template/web2/images/icon_1.svg" alt="">
							</div>
							<div class="icon_box_title">Free Shipping Worldwide</div>
							<div class="icon_box_text">
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Nullam a ultricies metus. Sed nec molestie.</p>
							</div>
						</div>
					</div>

					<!-- Icon Box -->
					<div class="col-lg-4 icon_box_col">
						<div class="icon_box">
							<div class="icon_box_image">
								<img src="template/web2/images/icon_2.svg" alt="">
							</div>
							<div class="icon_box_title">Free Returns</div>
							<div class="icon_box_text">
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Nullam a ultricies metus. Sed nec molestie.</p>
							</div>
						</div>
					</div>

					<!-- Icon Box -->
					<div class="col-lg-4 icon_box_col">
						<div class="icon_box">
							<div class="icon_box_image">
								<img src="template/web2/images/icon_3.svg" alt="">
							</div>
							<div class="icon_box_title">24h Fast Support</div>
							<div class="icon_box_text">
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Nullam a ultricies metus. Sed nec molestie.</p>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<!-- Newsletter -->

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
							<div class="newsletter_title">Subscribe to our newsletter</div>
							<div class="newsletter_text">
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Nullam a ultricies metus. Sed nec molestie eros</p>
							</div>
							<div class="newsletter_form_container">
								<form action="#" id="newsletter_form" class="newsletter_form">
									<input type="email" class="newsletter_input"
										required="required">
									<button class="newsletter_button trans_200">
										<span>Subscribe</span>
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	function addToCart(id) {
		var xhttp;
		var quantity = 0 ;
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
	</script>
</body>
</html>