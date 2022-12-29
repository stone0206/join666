<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />

<link id="style-switch" rel="stylesheet" type="text/css"
	href="${contextRoot}/css/style.css">
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${contextRoot }/css/bootstrap.min.css" rel="stylesheet" />

</head>

<style>
/* 搜索欄格式重置 */
#img-btn, #search-btn, #text-btn {
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
	width: 370px;
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

#dailyrecommand, #query {
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
					style="height: 400px; margin-bottom: 5px; padding: 10px;">
					<div style="height: 30px;">
						<img src="/assets/matchpage.webp"
							style="height: 360px; width: 1600px;">
					</div>
				</div>
			</div>
			<div class="row">
				<!-- 左側邊欄 -->
				<div class="col-3">
					<div id="query" style="background-color: white;">
						<form id="conditions" onchange="check()">
							<h6>性別</h6>
							<div class="row">
								<div class="col-6">
									<input type="checkbox" name="typeCondi" value="1">男性
								</div>
								<div class="col-6">
									<input type="checkbox" name="typeCondi" value="2">女性
								</div>
							</div>
							<h6>興趣</h6>
							<div class="row">
								<div class="col-6" style="margin-bottom: 10px;">
									<input type="checkbox" name="label" value="1">唱歌
								</div>
								<div class="col-6">
									<input type="checkbox" name="label" value="2">爬山
								</div>
							</div>
							<div class="row" style="margin-bottom: 10px;">
								<div class="col-6">
									<input type="checkbox" name="label" value="3">健身
								</div>
								<div class="col-6">
									<input type="checkbox" name="label" value="4">看電影
								</div>
							</div>
							<div class="row" style="margin-bottom: 10px;">
								<div class="col-6">
									<input type="checkbox" name="label" value="5">逛街
								</div>
								<div class="col-6">
									<input type="checkbox" name="label" value="6">露營
								</div>
							</div>
						</form>
						<div>
							<h6>年紀</h6>
							<form action="/" method="post">
								<input type="text" style="width: 60px;" placeholder="" id="lP">
								一 <input type="text" style="width: 60px; margin-right: 10px;"
									placeholder="" id="hP"> <input type="submit" value="送出"
									id="form-btn">
							</form>
						</div>
					</div>

				</div>
				<!-- 右側商品欄 -->
				<div class="col-9">
					<div class="row">
						<div id="search-div" class="col-9"></div>
						<!-- 排序 -->
						

					</div>
					<div class="col"
						style="margin-bottom: 10px; font-size: 10px; color: blue;"
						id="showCondition"></div>
					<!-- 商品欄位 -->
					<div class="row row-cols-md-3 justify-content-center"
						id="productDiv"></div>
				</div>
			</div>

		</div>

	</main>


	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>


	<footer>
		<jsp:include page="/WEB-INF/layout/footer.jsp" />
		<jsp:include page="${contextRoot}/WEB-INF/layout/chat.jsp" />

	</footer>

</body>
</html>