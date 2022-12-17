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
				<title>訂單確認</title>
				<!-- Favicon-->
				<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
				<!-- Bootstrap icons-->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
					rel="stylesheet" />
				<!-- Core theme CSS (includes Bootstrap)-->
				<link href="${contextRoot }/css/bootstrap.min.css" rel="stylesheet" />

			</head>

			<body>
				<jsp:include page="../layout/navbar.jsp"></jsp:include>
				<div class="container=fluid">
					<div style="margin-top: 80px; display: flex; justify-content: center;">
						<h2>訂單確認</h2>
					</div>
					<div class="card mb-4" style="width: 70%; margin:0 auto;">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 商品列表
						</div>
						<div class="card-body container-fluid">
							<table class="table table-striped table-sm">
								<thead>
									<tr>
										<th><input type="checkbox" name="" id=""></th>
										<th>名稱</th>
										<th>圖片</th>
										<th>價格</th>
										<th>數量</th>
										<th>總價</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="table">

								</tbody>
							</table>
						</div>
						<div style="display: flex; justify-content: right;">
							<span>總計</span>
						</div>
					</div>
				</div>



				<jsp:include page="../layout/footer.jsp"></jsp:include>
			</body>
			<script>
				window.onload = function () {
					fetch("${contextRoot}/checkCartItem").then(res => res.json()).then(data => changeItem(data))
				}

				function chageItem(item) {
					let itemData = "<tr>";
					$.each(item, function (index, value) {
						itemData += '<td><input type="checkbox" name="" id=""></td>'
						itemData += '<td>' + value.product.name + '</td>'
						itemData += '<td><img src="' + value.product.img + '" style="width: 100px; height: 100px;"></td>'
						itemData += '<td>' + value.product.price + '</td>'
						itemData += '<td>' + value.product.count + '</td>'
						itemData += '<td>' + value.product.price * value.product.count + '</td>'
						itemData += '<td>'
						itemData += '<a class="btn" href="/deleteProduct?id=' + value.product.id + '"style="color: red;">刪除</a>'
						itemData += '</td>'
					})

				}
			</script>

			</html>