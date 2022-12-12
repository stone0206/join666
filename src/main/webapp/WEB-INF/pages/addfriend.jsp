<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
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
<body>

	<!-- Navigation-->
	<!-- Header-->
	<!-- 高度設為350是為了留位置給nav -->
	<header>
		<jsp:include page="../layout/navbar.jsp"></jsp:include>

	</header>

	<main>
		<div class="container" style="margin-top: 80px">
			<h1>交友配對</h1>
		</div>
	</main>
	<footer>
		<jsp:include page="../layout/footer.jsp"></jsp:include>

	</footer>

</body>
</html>