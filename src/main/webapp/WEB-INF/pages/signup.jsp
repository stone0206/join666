<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>寵物論壇-加入會員</title>


<!-- 自訂CSS -->
<!-- <link rel="stylesheet" href="/PetForum/css/login.css"> -->
</head>
<body class="vh-100">
	<main class="form-signin m-5 text-center ">
		<jsp:include page="/WEB-INF/layout/navbar.jsp" />
		<br>
		<form action="${contextRoot}/signup" method="post"
			enctype="multipart/form-data">
			<h1 class="h3 mb-3 fw-normal">請輸入會員資料</h1>
			<!-- 			<div class="form-floating"> -->
			<!-- 				<input type="text" class="form-control" id="floatingInput" -->
			<!-- 					placeholder="aaa" name="id" required> <label -->
			<!-- 					for="floatingInput">ID</label> -->
			<!-- 			</div> -->
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="aaa" name="account" onblur="checkAcc()" required>
				<label for="floatingInput">帳號</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingPassword"
					placeholder="Password" name="password" onblur="checkPwd()" required>
				<label for="floatingPassword">密碼</label>
			</div>
			<!-- 			<div class="form-floating"> -->
			<!-- 				<input type="file" class="form-control" id="floatingInput" -->
			<!-- 					placeholder="aaa" name="photo" required> <label -->
			<!-- 					for="floatingInput"></label> -->
			<!-- 			</div> -->
			<!-- 			<div class="form-floating"> -->
			<!-- 				<input type="text" class="form-control" id="floatingInput" -->
			<!-- 					placeholder="aaa" name="level" required> <label -->
			<!-- 					for="floatingInput">等級</label> -->
			<!-- 			</div> -->
			<i id="checkEye" class="fas fa-eye"></i>

			<div class=" mb-2">
				<button type="submit" class="w-25 btn btn-lg btn-primary">確認送出</button>
			</div>
			<div>
				<button class="w-25 btn btn-lg btn-outline-dark" id="cancel">取消</button>
			</div>
			<div class="mt-5" style="color: red">${message}</div>
		</form>
	</main>
</body>

<script type="text/javascript">
	//密碼可視切換
	$("#checkEye").click(function() {
		if ($(this).hasClass('fa-eye')) {
			$("#floatingPassword").attr('type', 'password');
		} else {
			$("#floatingPassword").attr('type', 'text');
		}
		$(this).toggleClass('fa-eye').toggleClass('fa-eye-slash');
	});

	//取消按鈕返回上頁
	$("#cancel").click(function(event) {
		event.preventDefault(); //取消預設行為
		window.history.back(); //返回上一頁
	})


	function checkAcc() {
		
		var acc = document.getElementsByName("account")[0].value;
		console.log(acc);
		if (!acc) {
			//	 			div.innerHTML = "<font color='blue' size='-1'>請輸入帳號</font>";
			//alert("請輸入帳號");
			return;
		}
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/CheckAcc'/>", true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr.send("account=" + acc);
		var message = "";
		xhr.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = JSON.parse(xhr.responseText);

				if (result.acc.length == 0) {
					message = "帳號可用";
				} else if (result.acc.startsWith("Error")) {
					message = result.acc;
				} else {
					message = "帳號重複，請重新輸入帳號";
				}
				alert(message);
				//	 				div.innerHTML = "<font color='red' size='-2'>" + message
				//	 						      + "</font>";
			}
		}
	}
</script>



</html>