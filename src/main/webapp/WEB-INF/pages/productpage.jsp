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
					border-radius: 38px;
					background-color: white;
					display: inline-block;
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
			</style>

			<body>
				<!-- Navigation-->
				<jsp:include page="../layout/navbar.jsp"></jsp:include>
				<!-- Header-->
				<!-- 高度設為350是為了留位置給nav -->
				<header class="bg-dark py-5" style="height: 350px;">
					<div class="container px-4 px-lg-5 my-5">
						<div class="text-center text-white">
							<!-- 文字距離頂部距離 -->
							<h1 class="display-4 fw-bolder" style="padding-top: 80px;">商城首頁</h1>
							<p class="lead fw-normal text-white-50 mb-0">直接放圖片即可</p>
						</div>
					</div>
				</header>

				<!-- search nav -->
				<nav class="navbar navbar-light bg-light">
					<div class="container-fluid">
						<!-- 下拉選單做進階查詢 -->
						<div class="dropdown">
							<a class="btn btn-secondary dropdown-toggle" role="button" id="dropdownMenuLink"
								data-bs-toggle="dropdown" aria-expanded="false"
								style="width: 160px; border-radius: 38px; background-color: rgb(253, 171, 116); border: none;">
								進階查詢 </a>
							<!-- 排序方式 -->
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink" id="innersearch">
								<li id="inner-search-type">
									<p class="dropdown-item">
										商品類型：
										<c:forEach var="typescontent" items="${types }">
											<button id="search-btn">
												<a onclick="searchByTypeId(${typescontent.id })">${typescontent.type
													}</a>
											</button>
										</c:forEach>
									</p>
								</li>
								<li id="inner-search-type">
									<p class="dropdown-item">
										商品狀態：
										<c:forEach var="labelcontext" items="${labels }">
											<button id="search-btn">
												<a href="/searchByLabelId?id=${labelcontext.id }">${labelcontext.label
													}</a>
											</button>
										</c:forEach>
									</p>
								</li>
								<li>
									<form method="post" action="/searchByHLPrice">
										<p class="dropdown-item" style="margin-right: 10px;">
											價格區間：
											<input type="text" style="width: 60px;" placeholder="最低價" name="lowPrice">
											一 <input type="text" style="width: 60px; margin-right: 10px;"
												placeholder="最高價" name="highPrice">
											<input type="submit" value="送出">
										</p>
									</form>
								</li>
							</ul>
						</div>


						<!-- 搜尋表單 -->
						<form class="d-flex" id="search-form" action="/searchByKey" method="post">
							<!-- 搜尋框 -->
							<input id="text-btn" type="text" placeholder="請輸入欲搜尋的關鍵字">
							<!-- 以圖搜圖 -->
							<button id="img-btn">
								<i class="bi bi-card-image"></i>
							</button>
							<!-- 搜尋按鈕 -->
							<button id="search-btn" type="submit">
								<i class="bi bi-search"></i>
							</button>
						</form>

						<!-- 下拉選單做排序 -->
						<div class="dropdown">
							<a class="btn btn-secondary dropdown-toggle" role="button" id="dropdownMenuLink"
								data-bs-toggle="dropdown" aria-expanded="false"
								style="width: 160px; border-radius: 38px;">
								排序方式 </a>
							<!-- 排序方式 -->
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<li><a class="dropdown-item" href="/priceHightToLow">按照價格：高-低</a>
								</li>
								<li><a class=" dropdown-item" href="/priceLowToHight">按照價格：低-高</a></li>
								<li><a class="dropdown-item" href="/salesHightToLow">銷量：高-低</a></li>
								<li><a class="dropdown-item" href="#">相關程度：高-低</a></li>
							</ul>
						</div>
					</div>
				</nav>



				<!-- Section-->
				<section class="py-5" style="padding-top: 10px !important; padding-bottom: 10px !important;">
					<div class="container px-4 px-lg-5 mt-5">
						<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
							<c:forEach var="p" items="${products}">
								<div class="col mb-5">
									<div class="card h-100">
										<!-- Sale badge-->
										<div class="badge bg-dark text-white position-absolute"
											style="top: 0.5rem; right: 0.5rem">${p.label }</div>
										<!-- Product image-->
										<img class="card-img-top" src="${p.img }" style="width: 270px; height: 180px" />
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="text-center">
												<!-- Product name-->
												<h5 class="fw-bolder">${p.name }</h5>
												<!-- Product price with discount-->
												<span class="text-muted text-decoration-line-through">折扣放著</span>
												<!-- Product price without discount-->
												$${p.price }
											</div>
										</div>

										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<!-- 查看詳情之trigger -->
												<button type="button" class="btn btn-outline-dark"
													data-bs-toggle="modal"
													data-bs-target="#staticBackdropbydetail${p.id }"
													style="margin-right: 10px;">查看詳情</button>
												<!-- 查看詳情之cart -->
												<a class="btn btn-outline-dark" onclick='addToCart(${p.id})'>加入購物車</a>
											</div>
										</div>

									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</section>

				<!-- 查看詳情 -->
				<c:forEach var="p" items="${products}">
					<div class="modal fade" id="staticBackdropbydetail${p.id }" data-bs-backdrop="static"
						data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">

								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">${p.name}</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<!-- 商品介紹 -->
									<table>
										<tr>
											<!-- 圖片 -->
											<td>
												<div id="imgbox">
													<img src="${p.img}" alt="">
												</div>
											</td>
											<td>${p.desc}</td>
										</tr>
									</table>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
									<button type="button" class="btn btn-primary">加入購物車</button>
								</div>

							</div>
						</div>
					</div>
				</c:forEach>

				<!-- Footer-->
				<jsp:include page="../layout/footer.jsp"></jsp:include>

				<!-- Button-trigger-modal -->
				<button type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="shopping-cart">
					<img src="${contextRoot }/assets/shopping-car-icon.png" style="width: 60px">
				</button>

				<!--Shopping-car-Modal -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
					tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">您的訂單</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- 訂單表格 -->
								<table id="order-list-table">
									<!-- 訂單標題 -->
									<th>圖片</th>
									<th>名稱</th>
									<th>數量</th>
									<th>單價</th>
									<th>總價</th>
									<th>操作</th>
									<!-- 訂單內元素 -->
									<tr>
										<td>
											<div id="imgbox">
												<img src="/assets/shopping-car-icon.png" alt="">
											</div>
										</td>
										<td>元大50</td>
										<td>100</td>
										<td>110</td>
										<td>110</td>
										<td><a href="#">刪除</a></td>
									</tr>
								</table>
							</div>
							<div class="modal-footer">
								<!-- 取消結帳繼續選購 -->
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">繼續選購</button>
								<!-- 購物車訂單確認結帳 -->
								<button type="button" class="btn btn-primary">確認結帳</button>
							</div>
						</div>
					</div>
				</div>


				<!-- Bootstrap core JS-->
				<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
				<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>

				<!-- 結帳單裡面的js元素 -->
				<script>
					let trs = document.getElementsByTagName('tr');
					for (let i = 0; i < trs.length; i++) {
						trs[i].onmouseover = function () {
							for (let i = 0; i < trs.length; i++) {
								trs[i].style.backgroundColor = '';
							}
							trs[i].style.backgroundColor = 'rgba(200, 200, 200,0.2)';
						}
					}

					function addToCart(productId) {
						fetch('${contextRoot}/addToCart?id=' + productId).then(res => res.text()).then(text => {
							alert(text)
						 })
					}

				</script>
			</body>

			</html>