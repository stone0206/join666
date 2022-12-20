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

<title>約約</title>
<style type="text/css">
.box {
	width: 100px;
	height: 50px;
	margin: auto;
	/*區塊置中*/
}

p {
	text-align: center;
	line-height: 50px;
	/*與包著的區塊設定同高度即可*/
}

a {
	text-align: center;
	line-height: 50px;
	/*與包著的區塊設定同高度即可*/
}
</style>
</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/layout/navbar.jsp" />
	</header>
	<main>
		<div class="container">
			<div class="row g-4">
				<div class="col-lg-9" style="margin-top: 60px">
					<div class="card card-body">
						<div class="d-flex mb-3">
							<!-- Avatar -->
							<div class="avatar avatar-xs me-2">
								<a href="#"> <img class="avatar-img rounded-circle"
									src="${loginUser.avator}" alt="">
								</a>
							</div>
							<!-- Post input -->
							<form class="w-100">
								<textarea class="form-control pe-4 border-0" rows="2"
									data-autoresize placeholder="你在想什麼"></textarea>
							</form>
						</div>
						<!-- Share feed toolbar START -->
						<ul class="nav nav-pills nav-stack small fw-normal">
							<li class="nav-item"><a
								class="nav-link bg-light py-1 px-2 mb-0" href="#!"
								data-bs-toggle="modal" data-bs-target="#feedActionPhoto"> <i
									class="bi bi-image-fill text-success pe-2">發起活動</i>
							</a></li>


							<li class="nav-item dropdown ms-lg-auto"><a
								class="nav-link bg-light py-1 px-2 mb-0" href="#"
								id="feedActionShare" data-bs-toggle="dropdown"
								aria-expanded="false"> <i class="bi bi-three-dots">送出</i>
							</a> <!-- Dropdown menu --></li>
						</ul>

						<!-- Share feed toolbar END -->
					</div>
					<!-- Share feed END -->
					<!-- Card feed item START -->
					<div class="card">
						<!-- Card header START -->
						<div class="card-header border-0 pb-0">
							<div class="d-flex align-items-center justify-content-between">
								<div class="d-flex align-items-center">
									<!-- Avatar -->
									<div class="avatar">
										<a href="#!"> <img class="avatar-img rounded-circle"
											src="assets/images/avatar/04.jpg" alt="">
										</a>
									</div>
									<!-- Info -->
									<div>
										<div class="nav nav-divider">
											<h6 class="nav-item card-title mb-0">
												<a href="#!"> 用戶名</a>
											</h6>
											<span class="nav-item small"> 發文時間</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Card header END -->
						<!-- Card body START -->
						<div class="card-body">
							<p>發文內容</p>
							<!-- Card img -->
							<img class="card-img" src="assets/images/post/3by2/01.jpg"
								alt="貼照片的地方">
							<!-- Feed react START -->
							<ul class="nav nav-stack py-3 small">
								<li class="nav-item"><a class="nav-link active" href="#!">
										<i class="bi bi-hand-thumbs-up-fill pe-1"></i>按讚數(誰按讚)
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#!"> <i
										class="bi bi-chat-fill pe-1"></i>留言數(誰留言)
								</a></li>
								<!-- Card share action START -->
								<li class="nav-item dropdown ms-sm-auto"><a
									class="nav-link mb-0" href="#" id="cardShareAction"
									data-bs-toggle="dropdown" aria-expanded="false"> <i
										class="bi bi-reply-fill flip-horizontal ps-1"></i>分享
								</a> <!-- Card share action dropdown menu --></li>
								<!-- Card share action END -->
							</ul>
							<!-- Feed react END -->

							<!-- Add comment -->
							<div class="d-flex mb-3">
								<!-- Avatar -->
								<div class="avatar avatar-xs me-2">
									<a href="#!"> <img class="avatar-img rounded-circle"
										src="assets/images/avatar/12.jpg" alt="">
									</a>
								</div>
								<!-- Comment box  -->
								<form class="w-100">
									<textarea data-autoresize class="form-control pe-4 bg-light"
										rows="1" placeholder="留言區"></textarea>
								</form>
							</div>
							<!-- Comment wrap START -->
							<ul class="comment-wrap list-unstyled">
								<!-- Comment item START -->
								<li class="comment-item">
									<div class="d-flex position-relative">
										<!-- Avatar -->
										<div class="avatar avatar-xs">
											<a href="#!"><img class="avatar-img rounded-circle"
												src="assets/images/avatar/05.jpg" alt=""></a>
										</div>
										<div class="ms-2">
											<!-- Comment by -->
											<div class="bg-light rounded-start-top-0 p-3 rounded">
												<div class="d-flex justify-content-between">
													<h6 class="mb-1">
														<a href="#!"> 留言的用戶 </a>
													</h6>
													<small class="ms-2">時間</small>
												</div>
												<p class="small mb-0">預設留言</p>
											</div>
											<!-- Comment react -->
											<ul class="nav nav-divider py-2 small">
												<li class="nav-item"><a class="nav-link" href="#!">
														按讚數(誰按讚)</a></li>
											</ul>
										</div>
									</div> <!-- Comment item nested START -->
						</div>
					</div>
					<!-- Card feed item END -->


				</div>
				<!-- Card feed item END -->

				<!-- Card feed item START -->



				<!-- Right sidebar START -->
				<div class="col-lg-3">
					<div class="row g-4">
						<!-- Card follow START -->
						<div class="col-sm-6 col-lg-12" style="margin-top: 60px">
							<div class="card">
								<!-- Card header START -->
								<div class="card-header pb-0 border-0">
									<h5 class="card-title mb-0">推薦好友</h5>
								</div>
								<!-- Card header END -->
								<!-- Card body START -->
								<div class="card-body" id="onefriend">
									<div>
										<a href="#!"><img src="${random.avator}"
											style="height: 400px; width: 280px; margin: auto;"></a>
									</div>
									<c:if test="${random.gender==1 }">
										<a>${random.address},男</a>
									</c:if>
									<c:if test="${random.gender==2 }">
										<a>${random.address},女</a>
									</c:if>

									<div class="box">
										<p style="font-size: 30px;">${random.name }</p>
									</div>
									<div style="text-align: center;">
										<a style="font-size: 25px; margin: auto;"><button
												onclick="changeone()">換一個</button></a> <a
											style="font-size: 25px; margin: auto;"><button
												id="addBtn" onclick="addNewFriend(${random.id})">
												送出邀請</button></a>
									</div>
								</div>

								<!-- Connection item END -->

								<div class="d-grid mt-3">
									<a class="btn btn-sm btn-primary-soft" href="/addfriend"
										style="font-size: 20px;">更多推薦</a>
								</div>
							</div>
							<!-- Card body END -->
						</div>
					</div>
					<!-- Card follow START -->

				</div>
			</div>
		</div>
	</main>




	<footer>
		<jsp:include page="/WEB-INF/layout/footer.jsp" />
		<jsp:include page="${contextRoot}/WEB-INF/layout/chat.jsp" />

	</footer>
</body>
<script type="text/javascript">
	function changeone() {
		fetch('${contextRoot}/newfriend')
				.then(function(response) {
					return response.json();
				})
				.then(
						function(random) {
							document.getElementById('onefriend').remove;
							let changefriend = '';
							changefriend += '<div><a href="#!"><img src="' + random.avator + '"'
					changefriend += 'style="height: 400px; width: 280px; margin: auto;"></a></div>'
							if (random.gender == 1) {
								changefriend += '<a>' + random.address
										+ ',男</a>'
							}
							if (random.gender == 2) {
								changefriend += '<a>' + random.address
										+ ',女</a>'
							}
							changefriend += '<div class="box"><p style="font-size: 30px;">'
									+ random.name + '</p></div>'
							changefriend += '<div style="text-align: center;"><a style="font-size: 25px; margin: auto;"><button onclick="changeone()">換一個'
							changefriend += '</button></a> <a style="font-size: 25px; margin: auto;"><button id="addBtn" onclick="addNewFriend('+random.id+')">送出邀請</button></a></div></div>'

							console.log(changefriend);
							document.getElementById('onefriend').innerHTML = changefriend;

						})
	}
	
	function addNewFriend(fuid) {
		fetch('${contextRoot}/addNewFriend?id=' + fuid).then(res => res.text()).then(text => {
			alert(text);
			if(text!=='請先登入'){
			document.getElementById('addBtn').innerHTML = '已送出邀請';
			document.getElementById("addBtn").disabled=true;
			}
		})
	}
</script>

</html>