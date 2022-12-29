<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

				<!DOCTYPE html>

				<html>

				<head>

					<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />

					<link id="style-switch" rel="stylesheet" type="text/css"
						href="${pageContext.request.contextPath}/css/style.css">
					<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
					<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
					<meta charset="UTF-8">
					<title>Insert title here</title>
					<base href="/webapp/">
					
				</head>

				<body>
					<header class="navbar-light fixed-top header-static bg-mode" style="height:70px;">
<!-- 					<a class="navbar-brand" href="/index"> -->
<!-- 						<img class="light-mode-item navbar-brand-item" src="/assets/favicon.ico" alt="Logo"> -->
						<jsp:include page="/WEB-INF/layout/navbar.jsp" />				
					</a>
					</header>


<!-- 	<a class="navbar-brand" href="/index"> -->
<!--               logo圖片位置 -->
<!--               <img class="light-mode-item navbar-brand-item" src="assets/favicon.ico"> -->
<!--             </a> -->

								<main>

									<div class="container">

										<div class="row g-4 d-flex justify-content-center align-items-center">
											<div class="col-lg-9" style="margin-top: 60px">
											
													<!-- Post input -->
											
											
											<form:form modelAttribute="postBean" class="form-control" action="${contextRoot}/editpost">
                                               <form:input type="hidden" path="postid" />
                                               <form:input type="hidden" path="posttime" />
                                               <form class="w-100">
                                                 <div class="form-group">
                                                   <div class="form-row">
                                                     <div class="col">
<%--                                                        <textarea class="form-control" rows="3">${postBean.content}</textarea> --%>
                                                     </div>
                                                   </div>
                                                 </div>
                                                 <div class="form-group">
                                                   <div class="form-row">
                                                     <div class="col-sm-12">   
                                                     <form action="/submit" method="post">
   													 <textarea name="content" class="form-control" rows="5" cols="80">${postBean.content}</textarea>
													  <input class="form-control bi bi-three-dots" type="submit" value="貼文" style="float:right; font-size:8px; background-color:AliceBlue;" /> 
													  </form>
</form>                                                
<%--                                                     <form:input path="content" class="form-control" style="height: 120px; width: 800px;" /> --%>
<!--                                                        <input class="form-control bi bi-three-dots" type="submit" value="貼文" style="float:right; font-size:8px; background-color:AliceBlue;" /> -->
                                                     </div>
                                                   </div>
                                                 </div>
                                              
                                             </form:form>
											
												<div class="card card-body">
													<div class="d-flex mb-3">
														<!-- Avatar -->
<!-- 														<div class="avatar avatar-xs me-2"> -->
															<!-- 															<a href="#"> <img class="avatar-img rounded-circle" -->
															<%-- src="${loginUser.avator}" alt=""> --%>
																<!-- 															</a> -->
<!-- 														</div> -->
												



														<div class="container">
<%-- 															<c:forEach var="message" items="${page.content}"> --%>
																<div class="card">

																	<!-- Card header START -->
																	<div class="card-header border-0 pb-0">
																		<div
																			class="d-flex align-items-center justify-content-between">
																			<div class="d-flex align-items-center">
																				<!-- Avatar -->
																				<div class="avatar">
																					<a href="#!"> <img
																							class="avatar-img rounded-circle"
																							src="${loginUser.getAvator()}"
																							alt="">
																					</a>
																				</div>
																				<!-- Info -->
																				<div>
																					<div class="nav nav-divider">
																						<h6
																							class="nav-item card-title mb-0">
																							<a
																								href="#!">&nbsp;${loginUser.getName()}&nbsp;</a>
																							<div>&nbsp;&nbsp;&nbsp;
																							</div><br>
<%-- 																							<c:forEach var="message" items="${page.content}"> --%>
<!-- 																							<div -->
<!-- 																								style="font-size:12px ;text-align: right; background: blanchedalmond;"> -->
<!-- 																								Time -->
<%-- 																								<fmt:formatDate --%>
<%-- <%-- 																									pattern="yyy/MM/dd HH:mm:ss EEEE" --%> 
<%-- <%-- 																									value="${message.posttime}" /> --%> 
<%-- 																							</div> --%>
<%-- 																							</c:forEach> --%>





																							<!-- Bootstrap core JS-->
																							<script
																								src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
																							<script
																								src="${contextRoot}/js/jquery-3.6.1.min.js"></script>



<!-- 																							<div -->
<!-- 																								style="text-align: right;"> -->
<%-- 																								<a href="${contextRoot}/edit/${message.postid}" --%>
<!-- 																									style="width:470px;height:0px;display: block;float: right;">編輯</a> -->
<!-- 																							</div> -->


																						</h6>

																					</div>
																				</div>
																			</div>
																		</div>

																	</div>

																	<!-- Card header END -->
																	<!-- 页面HTML代码 -->

																	<!-- Card body START -->
																	<div class="container">

																		<div class="card-body">
																			${postBean.content}


																			<form:form modelAttribute="postBean"
																				action="${contextRoot}/post">
																				<form class="w-100">

<!-- 																					<textarea name="content" -->
<!-- 																						class="form-control pe-4 border-0" -->
<!-- 																						rows="3" cols="100" -->
<!-- 																						data-autoresize -->
<!-- 																						placeholder="你在想什麼"></textarea> -->
																					
																				</form>






																				<!-- Card img -->
																				<img class="card-img"
																					src="/assets/images/post/3by2/01.jpg"
																					alt="貼照片的地方">
																				<!-- Feed react START -->
																				<ul class="nav nav-stack py-3 small">
																					<li class="nav-item"><a
																							class="nav-link active"
																							href="#!">
																							<i
																								class="bi bi-hand-thumbs-up-fill pe-1"></i>按讚數(誰按讚)
																						</a></li>
																					<li class="nav-item"><a
																							class="nav-link" href="#!">
																							<i
																								class="bi bi-chat-fill pe-1"></i>留言數(誰留言)
																						</a></li>
																					<!-- Card share action START -->
																					<li
																						class="nav-item dropdown ms-sm-auto">
																						<a class="nav-link mb-0"
																							href="#"
																							id="cardShareAction"
																							data-bs-toggle="dropdown"
																							aria-expanded="false">
																							<i
																								class="bi bi-reply-fill flip-horizontal ps-1"></i>分享
																						</a>
																						<!-- Card share action dropdown menu -->
																					</li>
																					<!-- Card share action END -->
																				</ul>
																				<!-- Feed react END -->

																				<!-- Add comment -->
																				<div class="d-flex mb-3">
																					<!-- Avatar -->
																					<div class="avatar avatar-xs me-2">
																						<a href="#!"> <img
																								class="avatar-img rounded-circle"
																								src="/assets/images/avatar/12.jpg"
																								alt="">
																						</a>
																					</div>
																					<!-- Comment box  -->
																					<form class="w-100">
																						<textarea data-autoresize
																							class="form-control pe-4 bg-light"
																							rows="1"
																							placeholder="留言區"></textarea>
																					</form>
																				</div>
																				<!-- Comment wrap START -->
																				<ul class="comment-wrap list-unstyled">
																					<!-- Comment item START -->
																					<li class="comment-item">
																						<div
																							class="d-flex position-relative">
																							<!-- Avatar -->
																							<div
																								class="avatar avatar-xs">
																								<a href="#!"><img
																										class="avatar-img rounded-circle"
																										src="/assets/images/avatar/05.jpg"
																										alt=""></a>
																							</div>
																							<div class="ms-2">
																								<!-- Comment by -->
																								<div
																									class="bg-light rounded-start-top-0 p-3 rounded">
																									<div
																										class="d-flex justify-content-between">
																										<h6
																											class="mb-1">
																											<a
																												href="#!">
																												留言的用戶
																											</a>
																										</h6>
																										<small
																											class="ms-2">時間</small>
																									</div>
																									<p
																										class="small mb-0">
																										預設留言</p>
																								</div>
																								<!-- Comment react -->
																								<ul
																									class="nav nav-divider py-2 small">
																									<li
																										class="nav-item">
																										<a class="nav-link"
																											href="#!">
																											按讚數(誰按讚)</a>
																									</li>
																								</ul>
																							</div>
																						</div>
																						<!-- Comment item nested START -->
																		</div>

																	</div>
																	<!-- Card feed item END -->
																	</form:form>

<%-- 															</c:forEach> --%>
														</div>
														<!-- Card feed item END -->
													</div>
													<!-- Card feed item START -->



<!-- 													Right sidebar START -->
<!-- 													<div class="col-lg-3"> -->
<!-- 														<div class="row g-4"> -->
<!-- 															Card follow START -->
<!-- 															<div class="col-sm-6 col-lg-12" style="margin-top: 60px"> -->
<!-- 																<div class="card"> -->
<!-- 																	Card header START -->
<!-- 																	<div class="card-header pb-0 border-0"> -->
<!-- 																		<h5 class="card-title mb-0">推薦好友</h5> -->
<!-- 																	</div> -->
<!-- 																	Card header END -->
<!-- 																	Card body START -->
<!-- 																	<div class="card-body"> -->
<!-- 																		Connection item START -->
<!-- 																		<div class="hstack gap-2 mb-3"> -->
<!-- 																			Avatar -->
<!-- 																			<div class="avatar"> -->
<!-- 																				<a href="#!"><img -->
<!-- 																						class="avatar-img rounded-circle" -->
<!-- 																						src="assets/images/avatar/04.jpg" -->
<!-- 																						alt=""></a> -->
<!-- 																			</div> -->
<!-- 																			Title -->
<!-- 																			<div class="overflow-hidden"> -->
<!-- 																				<a class="h6 mb-0" href="#!">用戶1</a> -->
<!-- 																				<p class="mb-0 small text-truncate">性別地點 -->
<!-- 																				</p> -->
<!-- 																			</div> -->
<!-- 																			Button -->
<!-- 																			<a class="btn btn-primary-soft rounded-circle icon-md ms-auto" -->
<!-- 																				href="#"><i class="fa-solid fa-plus"> -->
<!-- 																					加他</i></a> -->
<!-- 																		</div> -->
<!-- 																		Connection item END -->
<!-- 																		Connection item START -->
<!-- 																		<div class="hstack gap-2 mb-3"> -->
<!-- 																			Avatar -->
<!-- 																			<div class="avatar"> -->
<!-- 																				<a href="#!"> <img -->
<!-- 																						class="avatar-img rounded-circle" -->
<!-- 																						src="assets/images/avatar/05.jpg" -->
<!-- 																						alt=""> -->
<!-- 																				</a> -->
<!-- 																			</div> -->
<!-- 																			Title -->
<!-- 																			<div class="overflow-hidden"> -->
<!-- 																				<a class="h6 mb-0" href="#!">用戶2 </a> -->
<!-- 																				<p class="mb-0 small text-truncate">性別地點 -->
<!-- 																				</p> -->
<!-- 																			</div> -->
<!-- 																			Button -->
<!-- 																			<a class="btn btn-primary-soft rounded-circle icon-md ms-auto" -->
<!-- 																				href="#"><i class="fa-solid fa-plus">加他 -->
<!-- 																				</i></a> -->
<!-- 																		</div> -->
<!-- 																		Connection item END -->

<!-- 																		Connection item START -->
<!-- 																		<div class="hstack gap-2 mb-3"> -->
<!-- 																			Avatar -->
<!-- 																			<div class="avatar"> -->
<!-- 																				<a href="#"> <img -->
<!-- 																						class="avatar-img rounded-circle" -->
<!-- 																						src="assets/images/avatar/11.jpg" -->
<!-- 																						alt=""> -->
<!-- 																				</a> -->
<!-- 																			</div> -->
<!-- 																			Title -->
<!-- 																			<div class="overflow-hidden"> -->
<!-- 																				<a class="h6 mb-0" href="#!">用戶3 </a> -->
<!-- 																				<p class="mb-0 small text-truncate">性別地點 -->
<!-- 																				</p> -->
<!-- 																			</div> -->
<!-- 																			Button -->
<!-- 																			<a class="btn btn-primary-soft rounded-circle icon-md ms-auto" -->
<!-- 																				href="#"><i class="fa-solid fa-plus">加他 -->
<!-- 																				</i></a> -->
<!-- 																		</div> -->
<!-- 																		Connection item END -->

<!-- 																		Connection item START -->
<!-- 																		<div class="hstack gap-2 mb-3"> -->
<!-- 																			Avatar -->
<!-- 																			<div class="avatar"> -->
<!-- 																				<a href="#"> <img -->
<!-- 																						class="avatar-img rounded-circle" -->
<!-- 																						src="assets/images/avatar/01.jpg" -->
<!-- 																						alt=""> -->
<!-- 																				</a> -->
<!-- 																			</div> -->
<!-- 																			Title -->
<!-- 																			<div class="overflow-hidden"> -->
<!-- 																				<a class="h6 mb-0" href="#!">用戶4 </a> -->
<!-- 																				<p class="mb-0 small text-truncate">性別地點 -->
<!-- 																				</p> -->
<!-- 																			</div> -->
<!-- 																			Button -->
<!-- 																			<a class="btn btn-primary-soft rounded-circle icon-md ms-auto" -->
<!-- 																				href="#"><i class="fa-solid fa-plus"> -->
<!-- 																					加他</i></a> -->
<!-- 																		</div> -->
<!-- 																		Connection item END -->

<!-- 																		Connection item START -->
<!-- 																		<div class="hstack gap-2 mb-3"> -->
<!-- 																			Avatar -->
<!-- 																			<div class="avatar"> -->
<!-- 																				<a href="#"> <img -->
<!-- 																						class="avatar-img rounded-circle" -->
<!-- 																						src="assets/images/avatar/placeholder.jpg" -->
<!-- 																						alt=""> -->
<!-- 																				</a> -->
<!-- 																			</div> -->
<!-- 																			Title -->
<!-- 																			<div class="overflow-hidden"> -->
<!-- 																				<a class="h6 mb-0" href="#!">用戶5 </a> -->
<!-- 																				<p class="mb-0 small text-truncate">性別地點 -->
<!-- 																				</p> -->
<!-- 																			</div> -->
<!-- 																			Button -->
<!-- 																			<a class="btn btn-primary-soft rounded-circle icon-md ms-auto" -->
<!-- 																				href="#"><i class="fa-solid fa-plus">加他 -->
<!-- 																				</i></a> -->
<!-- 																		</div> -->
<!-- 																		Connection item END -->

<!-- 																		View more button -->
<!-- 																		<div class="d-grid mt-3"> -->
<!-- 																			<a class="btn btn-sm btn-primary-soft" -->
<!-- 																				href="#!">更多推薦</a> -->
<!-- 																		</div> -->
<!-- 																	</div> -->
																	<!-- Card body END -->
																</div>
															</div>
															<!-- Card follow START -->

														</div>
													</div>
												</div>

											</div>

								</main>




								<footer>
									<jsp:include page="/WEB-INF/layout/footer.jsp" />
								</footer>

				</body>

				</html>