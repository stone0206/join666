<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/js/jquery-3.6.1.min.js" rel="stylesheet" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>會員管理</title>
<style>
#table tr {
	text-align: center;
/* 	line-height: 100px; */
}

#table tr td {
 	align:center;  
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
			<div class="container-fluid px-4">
				<h1 class="mt-4">搜尋會員</h1>
				<div class="card mb-4">
					<class class="card-body">
					<div class="row">

						<div class="col">
							<div id="search-search">
								<input type="text" id="name"> <input type="submit" value="找帳號"><br>
								<input type="text" id="address"> <input type="submit" value="找暱稱">
							</div>
						</div>

						<div class="col">
							縣/市
							<div id="type-type">
								<c:forEach var="typecontent" items="${ types}">
									<input type="checkbox" name="" id="">${typecontent.type }<br>
								</c:forEach>
							</div>
						</div>
						<div class="col">
							區/市/鎮
							<div id="label-label">
								<c:forEach var="labelcontent" items="${labels}">
									<input type="checkbox" name="" id="">${labelcontent.label }<br>
								</c:forEach>
							</div>
						</div>
						<div class="col">
							性別
							<div id="status-status">
								<input type="checkbox" name="male" id="male" value="1" onchange="getGender()">男<br> 
								<input type="checkbox" name="female" id="female" value="2" onchange="getGender()">女<br>
							</div>
						</div>

					</div>
					</class>
				</div>

				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 會員列表
					</div>
					<div class="card-body container-fluid">
						<table class="table table-striped table-sm">
							<thead>
								<tr style="text-align: center;">
									<th>id</th>
									<th>帳密</th>
									<th>暱稱</th>
									<th>出生日期</th>
									<th>聯絡方式</th>
									<th>所在地</th>
									<th>頭像</th>
									<th>性別</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="table">
								<c:forEach var="memberContent" items="${members}">
									<tr>
										<td rowspan="2" valign="middle">${memberContent.id }</td>
										<td rowspan="1" valign="middle">帳號: ${memberContent.account}</td>
										<td rowspan="2" valign="middle">${memberContent.name}</td>
										<td rowspan="2" valign="middle"><fmt:formatDate pattern="yyyy/MM/dd"
												value="${memberContent.birth}" /></td>
										<td rowspan="1" valign="middle">手機: ${memberContent.phone }</td>
										<td rowspan="2" valign="middle">${memberContent.address }</td>
										<td rowspan="2" ><img alt="" src="${memberContent.avator }"
											style="width: 130px; height: 100px;"></td>
										<c:choose>
											<c:when test="${memberContent.gender == 1}">
												<td rowspan="2" valign="middle">男</td>
											</c:when>
											<c:otherwise>
												<td rowspan="2" valign="middle">女</td>
											</c:otherwise>
										</c:choose>
										<td rowspan="2" valign="middle"><button >停權</button></td>
										<%-- 												<c:choose> --%>
										<%-- 													<c:when test="${productContent.status == 0}"> --%>
										<!-- 														<td>再售</td> -->
										<%-- 													</c:when> --%>
										<%-- 													<c:otherwise> --%>
										<!-- 														<td>下架</td> -->
										<%-- 													</c:otherwise> --%>
										<%-- 												</c:choose> --%>
										<!-- 												<td> -->
										<!-- 													<button type="button" class="btn" data-bs-toggle="modal" -->
										<%-- 														data-bs-target="#exampleModal${productContent.id}" --%>
										<!-- 														style="color: blue;"> -->
										<!-- 														<a>編輯</a> -->
										<!-- 														return confirm('是否刪除 ${productContent.name }') -->
										<!-- 													</button> / <a class="btn" -->
										<%-- 														onclick="return confirm('是否刪除 ${productContent.name }')" --%>
										<%-- 														href="/deleteProduct?id=${productContent.id }" --%>
										<!-- 														style="color: red;">刪除</a> / -->
										<%-- 													<a class="btn" href="/unSold?id=${productContent.id }">下架</a> --%>
										<!-- 												</td> -->
									</tr>
									<tr>
									<td valign="middle">密碼: ${memberContent.password}</td>
									<td valign="middle">信箱: ${memberContent.email}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
	</div>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
 <script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
		function getGender(){
			var m= $('#male').is(':checked');
			var f= $('#female').is(':checked');
			var male=1;
			var female=2;
			if (!m){
				male=0;
			}
			if(!f){
				female=0;
			}
			if(!f&&!m){
				var male=1;
				var female=2;
			}
			console.log(male+","+female)
			let formData = new FormData();
			formData.append("male", male)
			formData.append("female", female)
			
			fetch("${contextRoot}/findByGender", {method:"POST", body:formData}).then(result=>result.json()).then(members2=>{
				console.log(members2.length);
				var table=$('#table');
				var gender="";
				var birth="";
				var member2='';
				for(i=0;i<members2.length;i++){	
					birth = new Date(members2[i].birth).toLocaleDateString();
					if(members2[i].gender==1){
					gender='男';
				}else{
					gender='女';
				}
// 				member2+='<td>';
// 				member2+=birth;
// 				member2+='</td>';
				member2+='<tr><td rowspan="2" valign="middle">';
				member2+=members2[i].id;
				member2+='</td><td rowspan="1" valign="middle">帳號: ';
				member2+=members2[i].account;
				member2+='</td><td rowspan="2" valign="middle">';
				member2+=members2[i].name;
				member2+='</td><td rowspan="2" valign="middle">';
				member2+=birth;
				member2+='</td><td rowspan="1" valign="middle">手機: ';
				member2+=members2[i].phone;
				member2+='</td><td rowspan="2" valign="middle">';
				member2+=members2[i].address;
				member2+='</td><td rowspan="2" ><img alt="" src="';
				member2+=members2[i].avator;
				member2+='" style="width: 130px; height: 100px;"></td>';
				member2+='<td rowspan="2" valign="middle">';
				member2+=gender;
				member2+='</td></tr><tr>';
				member2+='<td valign="middle">密碼: ';
				member2+=members2[i].password;
				member2+='</td><td valign="middle">信箱: ';
				member2+=members2[i].email;
				member2+='</td></tr>';
				}
				table.html(member2);
			})
		}
		// 新增商品時轉換圖片的方式
		let img = document.getElementById('img');
		img.addEventListener('change', function(e) {
			let file = this.files[0]
			let reader = new FileReader()
			// 轉換成 DataURL
			reader.readAsDataURL(file)
			let pimg = document.getElementById('p_img');
			reader.onload = function(e) {
				console.log(e);
				pimg.value = this.result
			}
		})
	</script>
</body>

</html>