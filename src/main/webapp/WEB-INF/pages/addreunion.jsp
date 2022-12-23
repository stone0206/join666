<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>新增聚會</title>


    <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${contextRoot}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
   
   
   
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="canonical"
	href="https://bootstrap5.hexschool.com/docs/5.1/examples/checkout/">



<!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="apple-touch-icon"
	/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href=" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg"
	color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
</head>

<body class="bg-light">
	<header>
		<jsp:include page="/WEB-INF/layout/navbar.jsp" />
	</header>
	<div class="container">
		<main>
			<div class="py-5 text-center">
				<img class="d-block mx-auto mb-4" src="" alt="" width="" height="">
				<h2>新增聚會</h2>

			</div>




			<div class="row g-5">

				<div class="col-md-7 col-lg-8">

					<form  action="/insertReunion" method="post" class="needs-validation" novalidate>
						<div class="row g-3">



							<div class="input-group mb-3 ">
								<input type="file" class="form-control" id="inputGroupFile02" name="picture">
								
								<label class="input-group-text" for="inputGroupFile02">Upload</label>
								<br>
								<input type="hidden" value="" name="img" id="p_img">
							</div>

							<div class="col-12">
								<label for="address" class="form-label">聚會主題</label> <input
									type="text" class="form-control" id="address" name="topic"
									placeholder="請填寫聚會主題" required>
								<div class="invalid-feedback">請輸入主題</div>
							</div>




							<div class="col-12">
								<label for="address" class="form-label">聚會內容</label>
								<div class="control ">
									<textarea class="textarea form-control" placeholder="請填寫聚會描述"
										name="content"></textarea>
								</div>

								<div class="invalid-feedback">請輸入內容</div>
							</div>



							<div class="col-12">
								<label for="address" class="form-label">聚會地點</label> <input
									type="text" class="form-control" id="address"
									placeholder="搜尋聚會地點" required name="place">
								<div class="invalid-feedback">請輸入地點</div>
							</div>



               <div class="control-group">
                <label for="address" class="form-label">聚會時間</label>
                <div class="controls  date form_datetime" data-date="2022-12-16T05:25:07Z" data-date-format="yyyy MM dd- HH:ii p" data-link-field="dtp_input1">
                    <input size="16" type="text" value="" name="holdTime"  class="form-control" >
                    <span class="add-on"><i class="icon-remove"></i></span>
					<span class="add-on"><i class="icon-th"></i></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" /><br/>
            </div>
						

       <div class="control-group">
                <label for="address" class="form-label">審核時間</label>
                <div class=" input-append date form_datetime" data-date="2022-12-16T05:25:07Z" data-date-format="yyyy MM dd- HH:ii p" data-link-field="dtp_input1">
                    <input size="16" type="text" value="" name="reviewTime" class="form-control">
                    <span class="add-on"><i class="icon-remove"></i></span>
					<span class="add-on"><i class="icon-th"></i></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" /><br/>
            </div>

		

							<div class="v">
								<label for="address" class="form-label">聚會人數</label> <input
									type="text" class="form-control" id="address"
									placeholder="請輸入人數" required name="people">
								<div class="invalid-feedback">請輸入聚會人數</div>
							</div>


							<div class="col-12">
								<label for="address" class="form-label">聚會類型</label> <select
									 type="text" class="form-control" id="deptno"
									autocomplete="off" name="activity">

									<option value="none" selected disabled hidden>請選擇選項</option>
									<option value="1">一般聚會</option>
									<option value="2">男女聯誼</option>
									<option value="3">正常交友</option>
								</select>
								<div class="invalid-feedback">請輸入類型</div>
							</div>





							<div class="col-12">
								<label for="address" class="form-label">付款方式</label> <select
									 type="text" class="form-control" id="deptno"
									autocomplete="off" name="payment">

									<option value="none" selected disabled hidden>請選擇付款方式</option>
									<option value="1">男方請客</option>
									<option value="2">先匯款</option>
									<option value="3">AA</option>
								</select>
								<div class="invalid-feedback">請選擇付款方式</div>
							</div>



							<div class="col-12">
								<label for="address" class="form-label">用餐預算</label> <input
									type="text" class="form-control" id="address" placeholder=""
									required name="budget">
								<div class="invalid-feedback">請輸入預算</div>
							</div>
	
             

							<button
								class="button is-fullwidth is-warning is-rounded has-text-black has-text-weight-bold"
								type="submit" onclick="return confirm('確定')">確定</button>

						</div>
					</form>

				</div>
			</div>
		</main>
		<footer>
			<jsp:include page="/WEB-INF/layout/footer.jsp" />
		</footer>
	</div>


				<!-- Bootstrap core JS-->
				<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
				<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>

<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.1.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${contextRoot}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${contextRoot}/js/locales/bootstrap-datetimepicker.zh-TW.js" charset="UTF-8"></script>
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
    	language:  'zh-TW',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'zh-TW',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'zh-TW',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
</script>

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
			</script>

</body>

</html>