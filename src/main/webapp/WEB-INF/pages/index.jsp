<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


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
							<form:form modelAttribute="postBean" action="${contextRoot}/post"
								method="post" enctype="multipart/form-data">
								<textarea name="content" class="form-control pe-4 border-0"
									rows="3" cols="100" data-autoresize placeholder="你在想什麼"></textarea>
								<input style="color: white;" type="file" id="imgFile"
									name="photo" accept="image/*" />
								<img id="theImg" src="assets/preview.png"
									style="width: 10px; color: white;" alt="Image preview" />
								<input type="submit" class="bi bi-three-dots" value="貼文"
									style="float: right; border: 2px blue none; background-color: AliceBlue;" />
							</form:form>
						</div>
						<!-- Share feed toolbar START -->


						<!-- Share feed toolbar END -->
					</div>
					<!-- Share feed END -->
					<!-- Card feed item START -->
					<div class="container">
						<c:forEach var="message" items="${page.content}">
							<div class="card">
								<!-- Card header START -->

								<div class="card-header border-0 pb-0 ">
									<c:if test="${message.memberId.id ==loginUser.id}">
										<div style="text-align: right;">
											<a onclick="return confirm('確認刪除嗎?')"
												href="${contextRoot}/deletepost?postid=${message.postid}"
												style="width: 50px; float: right; border: 2px blue none;">刪除</a>
											<a href="${contextRoot}/edit/${message.postid}"
												style="width: 50px; float: right; border: 2px blue none;">編輯</a>

										</div>
									</c:if>

									<c:if test="${message.memberId.id !=loginUser.id}">
										<div style="text-align: right;">

											<a href="${contextRoot}/edit/${message.postid}"
												style="width: 100px; float: right; border: 2px blue none;">檢舉</a>

										</div>
									</c:if>
									<div class="d-flex align-items-center justify-content-between">
										<div class="d-flex align-items-center">
											<!-- Avatar -->
											<div class="avatar">
												<a href="#!"> <img class="avatar-img rounded-circle"
													src="${ message.memberId.avator}" alt="">
												</a>
											</div>
											<!-- Info -->
											<div>
												<div class="nav nav-divider">
													<h6 class="nav-item card-title mb-0">
														<a href="#!">&nbsp;${message.memberId.name} &nbsp;</a>
														<div>&nbsp;&nbsp;&nbsp;</div>
														<br>
														<div
															style="font-size: 12px; text-align: right; background: AliceBlue;">
															Time
															<fmt:formatDate pattern="yyy/MM/dd HH:mm:ss EEEE"
																value="${message.posttime}" />

														</div>

													</h6>

												</div>
											</div>
										</div>

									</div>

								</div>
								<!-- Card header END -->
								<!-- Card body START -->


								<div class="card card-body mb-4 "
									style="background-color: AliceBlue;">
									<!-- 發文的內容 -->
									<!-- ${postHtml} -->
									${message.content} <br>
									<br>
									<!-- Card img -->

									<img class="card-img" style="width: 100%; height: auto;"
										src="${contextRoot}/showPicture?postId=${message.postid}"
										alt="貼照片的地方">

									<!--FEED REACT START -->
									<ul class="nav nav-stack py-3 small">
										<li class="nav-item"><a class="nav-link active" href="#!">
												<i class="bi bi-hand-thumbs-up-fill pe-1"></i>按讚數(誰按讚)
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
												src="${loginUser.avator}" alt="">
											</a>
										</div>
										<!-- Comment box  -->
										<form class="w-100" action="/addComment" method="post">
											<textarea name="comment" data-autoresize
												class="form-control pe-4 bg-light" rows="1"
												placeholder="留言區"></textarea>
											<input type="hidden" name="postId" value="${message.postid}">
											<button type="submit" class="btn btn-primary mt-2">送出留言</button>
										</form>
									</div>
									<!-- Comment wrap START -->
									<ul class="comment-wrap list-unstyled">
										<!-- Comment item START -->
										<c:forEach var="comment" items="${message.commentList}">

											<li class="comment-item">
												<div class="d-flex position-relative">
													<!-- Avatar -->
													<div class="avatar avatar-xs">
														<a href="#!"><img class="avatar-img rounded-circle"
															src="${loginUser.avator}" alt=""></a>
													</div>
													<div class="d-flex mb-3">
														<!-- Comment by -->
														<div class="bg-light rounded-start-top-0 p-3 rounded">
															<div class="d-flex justify-content-between">
																<h6 class="mb-1">
																	<a href="#!"> ${comment.memberId.name} </a>
																</h6>
																<small class="ms-2"> ${comment.commenttime}</small>
															</div>
															<p class="small mb-0">${comment.comments}</p>
														</div>
														<!-- Comment react -->

													</div>
												</div> <!-- Comment item nested START -->
											</li>

										</c:forEach>
								</div>

							</div>
						</c:forEach>
					</div>
					<!-- Card feed item END -->
				</div>


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
										<a role="button" data-bs-auto-close="outside"> <img
											class="avatar-img" src="${random.avator}"
											style="height: 280px; width: 280px; margin: auto;">
										</a>
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
										<a class="btn btn-outline-dark" onclick="changeone()">換一個</a>
										<c:if test="${loginUser ==null}">
											<a class="btn btn-outline-dark" href="/login" id="addBtn">請先登入</a>
										</c:if>
										<c:if test="${loginUser !=null}">
											<a class="btn btn-outline-dark" id="addBtn"
												onclick="addNewFriend(${random.id})"> 送出邀請</a>
										</c:if>

									</div>
								</div>

								<!-- Connection item END -->
								<c:if test="${loginUser ==null}">
									<div class="d-grid mt-3">
										<a class="btn btn-sm btn-primary-soft" href="/login"
											style="font-size: 20px;">更多推薦</a>
									</div>
								</c:if>
								<c:if test="${loginUser !=null}">
									<div class="d-grid mt-3">
										<a class="btn btn-sm btn-primary-soft" href="/addfriend"
											style="font-size: 20px;">更多推薦</a>
									</div>
								</c:if>
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
		<jsp:include page="${contextRoot}/WEB-INF/pages/game.jsp" />

	</footer>
</body>
<script type="text/javascript">

document.getElementById('imgFile').addEventListener('change', function () {
	var reader = new FileReader();
	reader.onload = function (e) {
		document.getElementById('theImg').src = e.target.result;
		document.getElementById('theImg').style.width = "300px";
	}
	reader.readAsDataURL(this.files[0]);
});


const imgFile = document.getElementById("imgFile");
const theImg = document.getElementById("theImg");

imgFile.addEventListener("change", function () {

	let previewSRC = URL.createObjectURL(this.files[0]);
	theImg.src = previewSRC;

})

      function changeone() {
        fetch('${contextRoot}/newfriend')
          .then(function (response) {
            return response.json();
          })
          .then(
            function (random) {
              document.getElementById('onefriend').remove;
              let changefriend = '';
              changefriend += '<div> <a role="button" data-bs-auto-close="outside"><img class="avatar-img" src="' + random.avator + '"'
              changefriend += 'style="height: 280px; width: 280px; margin: auto;"></a></div>'
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
              changefriend += '<div style="text-align: center;"><a class="btn btn-outline-dark" onclick="changeone()">換一個'
              changefriend += '</a><a class="btn btn-outline-dark" id="addBtn" onclick="addNewFriend(' + random.id + ')">送出邀請</a></div></div>'
              document.getElementById('onefriend').innerHTML = changefriend;

            })
      }

      function addNewFriend(fuid) {
        fetch('${contextRoot}/addNewFriend?id=' + fuid).then(res => res.text()).then(text => {
          alert(text);
          if (text == '送出邀請成功') {
            document.getElementById('addBtn').innerHTML = '已送出邀請';
            document.getElementById("addBtn").disabled = true;
          }
          if (text == '您已送出邀請，等待對方回覆') {
	            document.getElementById('addBtn').innerHTML = '等待回覆中';
	            $("#addBtn").attr("disabled",true).css("pointer-events","none");
	          }
        })
      }
    </script>

</html>

