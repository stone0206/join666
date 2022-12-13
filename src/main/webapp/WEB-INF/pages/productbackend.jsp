<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<link href="${contextRoot}/js/jquery-3.6.1.min.js" rel="stylesheet" />
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<style>
				#table tr {
					text-align: center;
					line-height: 100px;
				}

				#table tr td a {
					text-decoration: none;
				}

				#pagenav ul div {
					margin: 0 auto;
				}

				#pagenav ul div li {
					float: left;
				}

				#insertProductForm input {
					margin-bottom: 10px;
				}
			</style>
		</head>

		<body>
			<jsp:include page="../layout/backendnav.jsp"></jsp:include>
			<div id="layoutSidenav_content">
				<main>
					<div class="container-fluid px-4">
						<h1 class="mt-4">商品列表</h1>
						<div class="card mb-4">
							<class class="card-body">
								<div class="row">

									<div class="col">
										Search
										<div id="search-search">
											<input type="text"> <input type="submit">
										</div>
									</div>

									<div class="col">
										Type
										<div id="type-type">
											<c:forEach var="typecontent" items="${ types}">
												<input type="checkbox" name="" id="">${typecontent.type }<br>
											</c:forEach>
										</div>
									</div>
									<div class="col">
										Label
										<div id="label-label">
											<c:forEach var="labelcontent" items="${labels}">
												<input type="checkbox" name="" id="">${labelcontent.label }<br>
											</c:forEach>
										</div>
									</div>
									<div class="col">
										Status
										<div id="status-status">
											<input type="checkbox" name="" id="">再售<br> <input type="checkbox" name=""
												id="">下架<br>
										</div>
									</div>

									<div class="col" id="btn-btn">
										<button type="button" class="btn btn-primary" data-bs-toggle="modal"
											data-bs-target="#insertProduct">
											新增商品</button>
										<button type="button" class="btn btn-primary" data-bs-toggle="modal"
											data-bs-target="#insertFile">
											批量添加</button>
									</div>
								</div>
							</class>
						</div>



						<!-- 新增商品 -->
						<div class="modal fade" id="insertProduct" tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<form action="/insertProduct" method="post">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">新增商品</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal"
												aria-label="Close"></button>
										</div>
										<div class="modal-body" id="insertProductBody">

											<label for="">商品名稱：</label> <input type="text" name="name"><br>
											<label for="">商品圖片：</label> <input type="file" name="" id="img"><br>
											<input type="hidden" value="" name="img" id="p_img"> <label
												for="">商品價格：</label> <input type="text" name="price"><br>
											<label for="">商品庫存：</label> <input type="text" name="inventory"><br>
											<label for="">商品類型：</label> <select name="type">
												<option>請選擇類型</option>
												<option value="1">派對道具</option>
												<option value="2">桌遊</option>
												<option value="3">裝飾用品</option>
												<option value="4">票券</option>
											</select><br> <label for="">商品標籤：</label> <select name="label">
												<option>請選擇標籤</option>
												<option value="1">New</option>
												<option value="2">Discount</option>
												<option value="3">Hot</option>
												<option value="4">Sales</option>
											</select><br> <label for="">商品描述：</label><br>
											<textarea name="desc" id="" cols="30" rows="10"></textarea>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-outline-lightn">速填</button>
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<input type="submit" class="btn btn-primary"></input>
										</div>
									</form>
								</div>
							</div>
						</div>

						<!-- 批量添加 -->
						<div class="modal fade" id="insertFile" tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">批量添加</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form action="/productsUpload" method="post" enctype="multipart/form-data">
											<label for="">上傳檔案</label> <input type="file"
												accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
												name="file">
											<button type="submit" class="btn btn-primary">上傳</button>
										</form>
									</div>

								</div>
							</div>
						</div>

						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> 商品列表
							</div>
							<div class="card-body container-fluid">
								<table class="table table-striped table-sm">
									<thead>
										<tr style="text-align: center;">
											<th>id</th>
											<th>名稱</th>
											<th>圖片</th>
											<th>價格</th>
											<th>銷量</th>
											<th>庫存</th>
											<th>類型</th>
											<th>標籤</th>
											<th>狀態</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="table">
										<c:forEach var="productContent" items="${products }">
											<tr>
												<td>${productContent.id }</td>
												<td>${productContent.name }</td>
												<td><img alt="" src="${productContent.img }"
														style="width: 150px; height: 100px;"></td>
												<td>${productContent.price }</td>
												<td>${productContent.sales }</td>
												<td>${productContent.inventory }</td>
												<c:choose>
													<c:when test="${productContent.type == 1}">
														<td>派對道具</td>
													</c:when>
													<c:when test="${productContent.type == 2}">
														<td>桌遊</td>
													</c:when>
													<c:when test="${productContent.type == 3}">
														<td>裝飾用品</td>
													</c:when>
													<c:otherwise>
														<td>票券</td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${productContent.label == 1}">
														<td>New</td>
													</c:when>
													<c:when test="${productContent.label == 2}">
														<td>Discount</td>
													</c:when>
													<c:when test="${productContent.label == 3}">
														<td>Hot</td>
													</c:when>
													<c:otherwise>
														<td>Sales</td>
													</c:otherwise>
												</c:choose>

												<c:choose>
													<c:when test="${productContent.status == 0}">
														<td>再售</td>
													</c:when>
													<c:otherwise>
														<td>下架</td>
													</c:otherwise>
												</c:choose>
												<td>
													<button type="button" class="btn" data-bs-toggle="modal"
														data-bs-target="#exampleModal${productContent.id}"
														style="color: blue;">
														<a>編輯</a>
													</button> / <a class="btn"
														onclick="return confirm('是否刪除 ${productContent.name }')"
														href="/deleteProduct?id=${productContent.id }"
														style="color: red;">刪除</a> / 
														<a class="btn" href="/unSold?id=${productContent.id }">下架</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!-- Modal -->
					<c:forEach var="productContent" items="${products }">
						<div class="modal fade" id="exampleModal${productContent.id}" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-xl">
								<form action="/updateProduct" method="post">
									<div class="modal-content">

										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">${ productContent.name}</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal"
												aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<table>
												<tr>
													<th>名稱</th>
													<th>圖片</th>
													<th>價格</th>
													<th>庫存</th>
													<th>類型</th>
													<th>標籤</th>
													<th>描述</th>
												</tr>
												<tr>
														<input type="hidden" name="id" value="${ productContent.id}">
														<input type="hidden" name="img" value="${ productContent.img}">
														<input type="hidden" name="sales" value="${ productContent.sales}">
														<input type="hidden" name="status" value="${ productContent.status}">
													<td><input type="text" value="${productContent.name}"
															name="name"></td>
													<td><img src="${productContent.img}" alt=""
															style="width: 150px;height:120px ;"></td>
													<td><input type="text" value="${productContent.price}"
															name="price"></td>
													<td><input type="text" value="${productContent.inventory}"
															name="inventory">
													</td>
													<td>
														<select name="type">
															<option>請選擇類型</option>
															<option value="1">派對道具</option>
															<option value="2">桌遊</option>
															<option value="3">裝飾用品</option>
															<option value="4">票券</option>
														</select>
													</td>
													<td>
														<select name="label">
															<option>請選擇標籤</option>
															<option value="1">New</option>
															<option value="2">Discount</option>
															<option value="3">Hot</option>
															<option value="4">Sales</option>
														</select>
													</td>
													<td><input type="text" value="${productContent.desc}"
															name="desc">
													</td>
												</tr>
											</table>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">返回</button>
											<button type="submit" class="btn btn-primary"
												data-bs-dismiss="modal">確認修改</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</c:forEach>

					<nav aria-label="Page navigation example" id="pagenav">
						<ul class="pagination">
							<div>
								<li class="page-item"><a class="page-link" href="#">Previous</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</div>
						</ul>
					</nav>
				</main>
			</div>

			<script type="text/javascript">
				// 新增商品時轉換圖片的方式
				let img = document.getElementById('img');
				img.addEventListener('change', function (e) {
					let file = this.files[0]
					let reader = new FileReader()
					// 轉換成 DataURL
					reader.readAsDataURL(file)
					let pimg = document.getElementById('p_img');
					reader.onload = function (e) {
						console.log(e);
						pimg.value = this.result
					}
				})

		// 點擊編輯時會變成form表單，可以直接修改，然後送出
			</script>
		</body>

		</html>