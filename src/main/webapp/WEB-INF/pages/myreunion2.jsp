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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
					rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>我的聚會</title>
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
    <header>
		<jsp:include page="/WEB-INF/layout/navbar.jsp" />
	</header>

		<main>
		<div id="layoutSidenav_content">
			<h1 class="text-center">我的聚會</h1>
			
			<c:if test="${reunion[0].reunionid==null}">
	         沒有聚會
            </c:if>
			<c:if test="${reunion[0].reunionid!=null}">
			<div class="container-fluid px-4">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 我的聚會
				</div>
				<div class="card-body container-fluid">
					<table class="table table-striped table-sm">
						<thead>
							<tr style="text-align: center;">
							    <th>圖片</th>
								<th>聚會類型</th>
								<th>聚會名稱</th>
								<th>發起人</th>
								<th>地點</th>
								<th>舉行時間</th>
					
							</tr>
						</thead>
						<tbody id="table">
						
							<c:forEach var="reunion" items="${reunion}">
								<tr>
								<td><a href="/detailedreunion?id=${reunion.reunionid}"><img class="" src="${reunion.picture}" alt="avatar"width="80" height="80"style="border-radius: 50px;"></a></td>
								    
									<td>${reunion.reuniontype.reutype}</td>
									<td>${reunion.topic}</td>
									<td>${reunion.memberTest.name}</td>
									<td>${reunion.place}</td> 
									<td>${reunion.holdTime}</td>
									
									

								
									<td>
																				<!-- return confirm('是否刪除 ${productContent.name }') -->
										 <a class="btn"
										onclick="return confirm('是否刪除 ${reunion.topic} 聚會')"
										href="/deleteReunion?id=${reunion.reunionid}"
										style="color: red;">刪除</a> 
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
	
</div>

</c:if>
</div>

<c:if test="${register[0].registerid==null}">
	沒有報名
</c:if>
<c:if test="${register[0].registerid!=null}">
	<div id="layoutSidenav_content">
			<h1 class="text-center"></h1>
			<div class="container-fluid px-4">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 我的報名
				</div>
				<div class="card-body container-fluid">
					<table class="table table-striped table-sm">
						<thead>
							<tr style="text-align: center;">
							    <th>圖片</th>
								<th>聚會類型</th>
								<th>聚會名稱</th>
								<th>發起人</th>
								<th>地點</th>
								<th>舉行時間</th>
								<th>狀態</th>
					
							</tr>
						</thead>
						<tbody id="table">
							<c:forEach var="register" items="${register}">
								<tr>
								<td><a href="/detailedreunion?id=${register.reunion.reunionid}"><img class="" src="${register.reunion.picture}" alt="avatar"width="80" height="80"style="border-radius: 50px;"></a></td>
									<td>${register.reunion.reuniontype.reutype}</td>
									<td>${register.reunion.topic}</td>
									<td>${register.reunion.memberTest.name}</td>
									<td>${register.reunion.place}</td> 
									<td>${register.reunion.holdTime}</td>
									<c:if test="${register.review==0}"><td>未審核</td></c:if>
									<c:if test="${register.review==1}"><td>審核成功</td></c:if>
									<c:if test="${register.review==2}"><td>審核失敗</td></c:if>
									

								
								
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
	
</div>
</div>
</c:if>



<c:if test="${reunionreport[0].reunionreportid==null}">
	<br>沒有檢舉
</c:if>
<c:if test="${reunionreport[0].reunionreportid!=null}">
	<div id="layoutSidenav_content">
			<h1 class="text-center"></h1>
			<div class="container-fluid px-4">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 我的檢舉
				</div>
				<div class="card-body container-fluid">
					<table class="table table-striped table-sm">
						<thead>
							<tr style="text-align: center;">
							    <th>圖片</th>
								<th>聚會類型</th>
								<th>聚會名稱</th>
								<th>發起人</th>
								<th>地點</th>
								<th>舉行時間</th>
								<th>檢舉內容</th>
					
							</tr>
						</thead>
						<tbody id="table">
							<c:forEach var="reunionreport" items="${reunionreport}">
								<tr>
								    <td><a href="/detailedreunion?id=${reunionreport.reunion.reunionid}"><img class="" src="${reunionreport.reunion.picture}" alt="avatar"width="80" height="80"style="border-radius: 50px;"></a></td>
									<td>${reunionreport.reunion.reuniontype.reutype}</td>
									<td>${reunionreport.reunion.topic}</td>
									<td>${reunionreport.reunion.memberTest.name}</td>
									<td>${reunionreport.reunion.place}</td> 
									<td>${reunionreport.reunion.holdTime}</td>
									<td>${reunionreport.content}</td>
									

								
								
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
	
</div>
</div>
</c:if>
    </main>
    
   <footer>
		<jsp:include page="/WEB-INF/layout/footer.jsp" />
	</footer>

</body>
 

</html>