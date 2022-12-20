<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />

<link id="style-switch" rel="stylesheet" type="text/css"
	href="${contextRoot}/css/style.css">
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<header>
		<jsp:include page="/WEB-INF/layout/navbar.jsp" />
	</header>
	<main>
		<h1>通知</h1>
	</main>



	<footer>
		<jsp:include page="/WEB-INF/layout/footer.jsp" />
		<jsp:include page="${contextRoot}/WEB-INF/layout/chat.jsp" />

	</footer>
</body>
</html>