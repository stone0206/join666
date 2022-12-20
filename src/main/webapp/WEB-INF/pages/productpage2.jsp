<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="utf-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
				<meta name="description" content="" />
				<meta name="author" content="" />
				<title>Shop Homepage - Start Bootstrap Template</title>
				<!-- Favicon-->
				<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
				<!-- Bootstrap icons-->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
					rel="stylesheet" />
				<!-- Core theme CSS (includes Bootstrap)-->
				<link href="${contextRoot }/css/bootstrap.min.css" rel="stylesheet" />

			</head>

			<style>
				/* 搜索欄格式重置 */
				#img-btn,
				#search-btn,
				#text-btn {
					padding-left: 10px;
					text-decoration: none;
					border: none;
					background: transparent;
				}

				/* 搜索欄大小 */
				#text-btn {
					width: 325px;
					outline: none;
				}

				/* 搜索欄位置固定 */
				#search-form {
					width: 400px;
					height: 38px;
					border: 1px solid grey;
					border-radius: 5px;
					background-color: white;
					margin-bottom: 20px;
				}

				#search-div {
					position: relative;
				}

				#img-form {
					position: absolute;
					right: 285px;
					top: 7px;
				}


				/* 購物車位置固定 */
				#shopping-cart {
					border: none;
					text-decoration: none;
					background-color: transparent;
					position: fixed;
					top: 80%;
					right: 5%;
				}

				/* 訂單欄位的尺寸 */
				#order-list-table {
					width: 750px;
					height: 100px;
					text-align: center;
					border-collapse: collapse;
				}

				/* 訂單th顏色 */
				#order-list-table th {
					background-color: skyblue;
				}

				/* 訂單圖片欄位置中 */
				.modal-body #imgbox {
					display: flex;
					justify-content: center;
					margin: auto;
					width: 135px;
					height: 135px;
				}

				/* 訂單的圖片適應框 */
				.modal-body #imgbox img {
					aspect-ratio: 4/3;
					object-fit: cover;
					width: 100%;
				}

				/* 去除進階搜尋底線 */
				#inner-search-type #search-btn a {
					text-decoration: none;
				}

				#price-search-form {
					display: inline;
				}

				#innersearch p:focus {
					color: black;
					background-color: transparent;
				}

				#innersearch p:hover {
					color: black;
					background-color: transparent;
				}

				#innersearch button a {
					color: #212529;
				}

				#innersearch button a:hover {
					color: black;
					background-color: skyblue;
				}

				#dailyrecommand,
				#query {
					box-shadow: #212529 0 0 3px;
					padding: 20px;
					margin-bottom: 20px;
				}

				#fixLabel {
					top: 0.5rem;
					right: 0.5rem;
					box-shadow: #212529 0 0 6px;
					color: red;
					background-color: yellow;
				}
			</style>

			<body>
				<!-- Navigation-->
				<jsp:include page="../layout/navbar.jsp"></jsp:include>
				<!-- navbar覆蓋的部分 -->
				<div class="top-div" style="margin-top: 72px;"></div>

				<main>
					<div class="container-fluid" style="width: 85%;">
						<div class="row">
							<div class="col-12"
								style="height:400px ;background-color: grey; margin-bottom: 15px; padding: 10px; background-image: sr;">
								<div style="background-color: white; height: 380px;">123</div>
							</div>
						</div>
						<div class="row">
							<!-- 左側邊欄 -->
							<div class="col-3">
								<div id="dailyrecommand">
									<h3>本日推薦</h3>
									<div class="commandhead" style="margin-bottom: 10px;">
										<a href="#">
											<img src="${contextRoot}/assets/productimg/1.jpeg"></a>
									</div>
									<div class="commandbody">
										<div>
											<h5>商品名稱</h5>
										</div>
										<div>
											<span>信箱之類熟悉點頭，版權類熟悉點頭，版權類熟悉點頭，版權類熟悉點頭，版權...</span>
										</div>
									</div>
								</div>

								<div id="query" style="background-color: white;">
									<h6>類型</h6>
									<div id="type-query">
										<a href="">123</a>
										<a href="">123</a>
										<a href="">123</a>
									</div>
									<h6>標籤</h6>
									<div id="label-query">
										<a href="">123</a>
										<a href="">123</a>
										<a href="">123</a>
									</div>
									<h6>價格</h6>
								</div>

							</div>
							<!-- 右側商品欄 -->
							<div class="col-9">
								<div class="row">
									<div id="search-div" class="col-9">
										<!-- 搜尋表單 -->
										<form class="d-flex" id="search-form" action="/searchByKey" method="post">
											<!-- 搜尋框 -->
											<input id="text-btn" type="text" placeholder="請輸入欲搜尋的關鍵字">
											<!-- 搜尋按鈕 -->
											<button id="search-btn" type="submit">
												<i class="bi bi-search"></i>
											</button>
										</form>
										<!-- 以圖搜尋 -->
										<form action="" id="img-form">
											<button id="img-btn">
												<i class="bi bi-card-image"></i>
											</button>
										</form>
									</div>
									<!-- 排序 -->
									<div class="col-3">
										<div class="dropdown">
											<a class="btn btn-outline-dark dropdown-toggle" role="button"
												id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false"
												style="width: 160px; border-radius: 5px; float:right;">
												排序方式 </a>
											<!-- 排序方式 -->
											<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
												<li><a class="dropdown-item" onclick="priceH2L()"
														style="cursor: pointer;">按照價格：高-低</a></li>
												<li><a class=" dropdown-item" onclick="priceL2H()"
														style="cursor: pointer;">按照價格：低-高</a></li>
												<li><a class="dropdown-item" onclick="salesH2L()"
														style="cursor: pointer;">銷量：高-低</a></li>
												<li><a class="dropdown-item" href="#">相關程度：高-低</a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- 商品欄位 -->
								<div class="row row-cols-md-3 justify-content-center" id="productDiv">
								</div>
							</div>
						</div>

					</div>

				</main>






				<!-- Footer-->
				<jsp:include page="../layout/footer.jsp"></jsp:include>

				<!-- Button-trigger-modal -->
				<button type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="shopping-cart">
					<img src="${contextRoot }/assets/shopping-car-icon.png" style="width: 60px"
						onclick="openShoppingCart()" )>
				</button>

				<!--Shopping-car-Modal -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
					tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">您的購物車</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- 訂單表格 -->
								<table id="order-list-table">
									<!-- 訂單標題 -->
									<th><input type="checkbox"></th>
									<th>圖片</th>
									<th>名稱</th>
									<th>數量</th>
									<th>單價</th>
									<th>總價</th>
									<th>操作</th>
									<!-- 訂單內元素 -->
									<tbody id='order-list'>

								</table>
							</div>
							<div class="modal-footer">
								<!-- 取消結帳繼續選購 -->
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">繼續選購</button>
								<!-- 購物車訂單確認結帳 -->
								<a type="button" class="btn btn-primary" href="/sendCartToCheck">確認結帳</a>
							</div>
						</div>
					</div>
				</div>


				<!-- Bootstrap core JS-->
				<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
				<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>

				<!-- 結帳單裡面的js元素 -->
				<script>
					//商品欄位刷新
					window.onload = function () {
						fetch("${contextRoot}/getProduct").then(res => res.json()).then(data => changeProductItem(data))
					}



					function changeProductItem(json) {
						let productData = '';
						$.each(json, function (index, value) {
							productData += '<div class="col mb-5"><div class="card h-100">';
							switch (value.label) {
								case 1:
									productData += '<div class="badge position-absolute" id="fixLabel">New</div>';
									break;
								case 2:
									productData += '<div class="badge position-absolute" id="fixLabel">Discount</div>';
									break;
								case 3:
									productData += '<div class="badge position-absolute" id="fixLabel">Hot</div>';
									break;
								case 4:
									productData += '';
									break;

							}
							productData += '<img class="card-img-top" src="' + value.img + '"style="height: 180px" />';
							productData += '<div class="card-body p-4"><div class="text-center">';
							productData += '<h5 class="fw-bolder">' + value.name + '</h5>';
							productData += '<span class="text-muted text-decoration-line-through">$' + value.price + '</span>';
							productData += '$' + value.price + '</div></div >';
							productData += '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent"><div class="text-center">'
							productData += '<a class="btn btn-outline-dark" href="#' + value.id + '" style="margin-right:10px">查看詳情</a>'
							productData += '<a class="btn btn-outline-dark" onclick="addToCart(' + value.id + ')">加入購物車</a>'
							productData += '</div></div></div ></div >'
						})
						document.getElementById('productDiv').innerHTML = productData;
					}

					//排序系統
					function priceH2L() {
						fetch('${contextRoot}/priceH2L').then(res => res.json()).then(json => changeProductItem(json))
					}

					function priceL2H() {
						fetch('${contextRoot}/priceL2H').then(res => res.json()).then(json => changeProductItem(json))
					}

					function salesH2L() {
						fetch('${contextRoot}/salesH2L').then(res => res.json()).then(json => changeProductItem(json))
					}


					//購物車系統
					function chageCartItem(json) {
						let shoppingCartData = '';
						let totalPrice = 0;
						$.each(json, function (index, value) {
							shoppingCartData += '<tr><td style="width:20px"><input type="checkbox"></td><td><div id="imgbox"><img src='
							shoppingCartData += value.product.img + ' alt=""></div></td>'
							shoppingCartData += '<td style="width:150px">' + value.product.name + '</td>'
							shoppingCartData += '<td><input type="tel" value="' + value.count + '" style="width:40px;text-align:center"'
							shoppingCartData += ';width:40px;text-align:center" onchange="sciCountChange(value,' + value.product.id + ')"></td>'
							shoppingCartData += '<td>' + value.product.price + '</td>'
							shoppingCartData += '<td>' + value.count * value.product.price + '</td>'
							shoppingCartData += '<td>' + '<a class="btn" style="text-decoration: none;color:blue;" onclick="deleteShoppingCart(' + value.id + ')">刪除</a>' + '</td>'
							shoppingCartData += '</tr>'
							totalPrice += value.product.price;
						})
						shoppingCartData += '</tbody>'
						document.getElementById('order-list').innerHTML = shoppingCartData;
					}

					function addToCart(productId) {
						fetch('${contextRoot}/addToCart?id=' + productId).then(res => res.text()).then(text => {
							alert(text)
						})
					}

					function openShoppingCart() {
						fetch('${contextRoot}/openShoppingCart').then(res => res.json()).then(json => chageCartItem(json))
					}

					function deleteShoppingCart(sciId) {
						fetch('${contextRoot}/deleteShoppingCart?sciId=' + sciId).then(res => res.json()).then(json => chageCartItem(json))
					}

					function sciCountChange(count, id) {
						fetch('${contextRoot}/changeCartItem?count=' + count + '&id=' + id).then(res => res.json()).then(json => chageCartItem(json))
					}

				</script>
			</body>

			</html>