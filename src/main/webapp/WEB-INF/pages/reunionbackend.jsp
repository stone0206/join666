<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<html>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>聚會管理</title>
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
			<h1 class="text-center">聚會管理</h1>
			<div class="container-fluid px-4">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 檢舉聚會
				</div>
				<div class="card-body container-fluid">
					<table class="table table-striped table-sm">
						<thead>
							<tr style="text-align: center;">
								<th>聚會id</th>
								<th>聚會名稱</th>
								<th>發起人ID</th>
								<th>檢舉人ID</th>
								<th>檢舉內容</th>
					
							</tr>
						</thead>
						<tbody id="table">
							<c:forEach var="reunionreport" items="${reunionreport}">
								<tr>
									<td>${reunionreport.reunionid}</td>
									<td>${reunionreport.reunion.topic}</td>
									<td>${reunionreport.reunion.memberTest.name}</td>
									<td>${reunionreport.memberTest.name}</td> 
									<td>${reunionreport.content}</td>
									
									

								
									<td>
																				<!-- return confirm('是否刪除 ${productContent.name }') -->
										 <a class="btn"
										onclick="return confirm('是否刪除 ${reunionreport.reunion.reunionid}')"
										href="/deleteReunionreport?id=${reunionreport.reunion.reunionid}"
										style="color: red;">刪除</a> 
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
	
</div>

    </main>
    </div>

</body>

</html>