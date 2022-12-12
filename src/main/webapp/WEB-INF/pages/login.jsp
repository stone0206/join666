<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>歡迎使用約約-登入</title>



<!-- 自訂CSS -->
<!-- <link rel="stylesheet" href="/Login/css/login.css"> -->

</head>

<body class="vh-100">


	<main class="form-signin m-5 text-center ">
		<jsp:include page="/WEB-INF/layout/navbar.jsp" />
		<br>
		<form action="${contextRoot}/login" method="post">
			<h1 class="h3 mb-3 fw-normal">會員登入</h1>
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="aaa" name="account" required> <label
					for="floatingInput">帳號</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingPassword"
					placeholder="Password" name="password" required> <label
					for="floatingPassword">密碼</label> <i id="checkEye"
					class="fas fa-eye"></i>
			</div>
			<div class="checkbox my-3">
				<label> <input type="checkbox" name="remeberMe"> 記住我
				</label>
			</div>
			<div class=" mb-2">
				<button class="w-25 btn btn-lg btn-primary">登入</button>
			</div>
			<div class=" mb-2">
				<input type="button" class="w-25 btn btn-lg btn-primary"
					onclick="location.href='https://accounts.google.com/o/oauth2/auth?scope=email+profile&redirect_uri=http://localhost:8080/Login/LoginGoogleHandler&response_type=code&client_id=378093448501-ebvinmo23u9l8lmljs9souqd3953nbqg.apps.googleusercontent.com&approval_prompt=force';"
					value="Google登入" />
			</div>
			<div>
				<button class="w-25 btn btn-lg btn-outline-dark" id="cancel">取消</button>
			</div>
			<div class="mt-5" style="color: red">${message}</div>
		</form>
	</main>

	<div class="text-center m-5">
		快速登入:
		<button class="btn btn-outline-info fastLogin2">Leo</button>
		<button class="btn btn-outline-info fastLogin2">Amy</button>
		<button class="btn btn-outline-info fastLogin2">Kevin</button>
<!-- 		<button class="btn btn-outline-info fastLogin">易穎</button> -->
<!-- 		<button class="btn btn-outline-info fastLogin">博宇</button> -->
<!-- 		<button class="btn btn-outline-info fastLogin">宇豐</button> -->
<!-- 		<button class="btn btn-outline-info fastLogin" -->
<!-- 			style="border: none; opacity: 0;">奕徵</button> -->

	</div>

</body>

<script type="text/javascript">
	//快速登入
	$(".fastLogin2").click(function() {
		$("#floatingInput").val(this.innerHTML+"001");
		$("#floatingPassword").val("1234");
	});
	$(".fastLogin").click(function() {
		$("#floatingInput").val(this.innerHTML);
		$("#floatingPassword").val(this.innerHTML + "001");
	});

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
</script>

</html>