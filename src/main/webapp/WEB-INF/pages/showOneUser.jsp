<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>約約-個人頁面</title>


<!-- 自訂CSS -->
<%-- <link rel="stylesheet" href="${root}/css/showUser.css"> --%>

</head>
<body class="vh-100">

	
	<main class="form-signin m-5 text-center ">
	<jsp:include page="/WEB-INF/layout/navbar.jsp" />
	<br>
		<%-- 		<jsp:useBean id="loginUser" scope="session" --%>
		<%-- 			class="com.ispan6.bean.membersystem.MemberTest" /> --%>
		<form action="${contextRoot}/update" method="post"
			enctype="multipart/form-data">
			<h1 class="h3 mb-3 fw-normal">會員資料</h1>
			<div class="form-floating" style="position: relative">
				<input type="file" class="form-control" id="photo"
					onchange="upload('#photo', '#avator');" placeholder="aaa"
					name="avator" value=""
					style="opacity: 10; width: 110px; positon: absolute"> <label
					for="floatingInput"><img id="avator"
					src="${loginUser.getAvator()}" style="width: 110px" /></label>
			</div><br>
				<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="aaa" name="account" value="${loginUser.getAccount()}" readonly>
				<label for="floatingInput">帳號</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="aaa" name="name" value="${loginUser.getName()}" required>
				<label for="floatingInput">暱稱</label>
			</div>
						<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="aaa" name="phone" value="${loginUser.getPhone()}" required>
				<label for="floatingInput">電話</label>
			</div>
						<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="aaa" name="email" value="${loginUser.getEmail()}" required>
				<label for="floatingInput">信箱</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="aaa" name="address" value="${loginUser.getAddress()}"
					required> <label for="floatingInput">地址</label>
			</div>


			<!-- 			<div class="form-floating"> -->
			<!-- 				<input type="file" class="form-control" id="floatingInput" -->
			<!-- 					placeholder="aaa" name="photo"><label for="floatingInput"></label> -->
			<!-- 			</div> -->


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
	var upload = function(c, d) {
		"use strict";
		var $c = document.querySelector(c), $d = document.querySelector(d), file = $c.files[0], reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = function(e) {
//			console.log(e.target.result);
// 			$d.setAttribute("value", e.target.result);
			$d.setAttribute("src", e.target.result);
		};
	};
</script>

</html>