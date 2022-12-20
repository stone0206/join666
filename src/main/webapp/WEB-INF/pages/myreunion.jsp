<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />

<link id="style-switch" rel="stylesheet" type="text/css"
	href="${contextRoot}/css/style.css">
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
</head>
<body>
	<h1>我的聚會</h1>
	<header>
		<jsp:include page="/WEB-INF/layout/navbar.jsp" />
	</header>
	<main>
	<div class="container">

		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

			<div class="col">
			


					<c:forEach var="reunion" items="${reunion}">
						<div class="col">
							<div class="card shadow-sm">
								<img src="${reunion.picture}"
									style="max-width: 100%; height: 450px;">
								<div class="card-body">
									<p class="card-text">${reunion.topic}</p>
									<div class="d-flex justify-content-between align-items-center">
										<div class="content" style="margin-left: 3px;">
											<div class="flex-parent">
												<p class="title is-5 is-size-6-mobile long-and-truncated"
													style="width: 100%;"></p>
											</div>
											<div class="flex-parent" style="margin-top: 4px;">
												<div class=" long-and-truncated">
													<span class="subtitle is-6 is-size-7-mobile">${reunion.place}</span>
												</div>
											</div>
											<div class="flex-parent" style="margin-top: 4px;">
												<div class=" long-and-truncated">
													<span class="subtitle is-6 is-size-7-mobile"><fmt:formatDate
															pattern="yyyy/MM/dd HH:mm EEEE"
															value="${reunion.holdTime}" /></span>
												</div>

											</div>
											<div class="is-hidden-tablet" style="margin-top: 9px;">
												<div class="columns is-variable is-1 is-mobile">
													<div class="column is-3 has-text-left">
														<img loading="lazy"
															src="https://cdn.eatgether.com/member/60cd09c0-af2b-4376-bbd3-7a8faf753617/avatar/8e15ac4c-85bb-437f-bc7f-7cd90277286d.jpg"
															width="30" heigh="30" style="border-radius: 50px;">
													</div>
													<div class="column is-9 has-text-left">
														<div class="columns is-mobile">
															<div class="column is-6">
																<div class="long-and-truncated" style="width: 80px;">
																	<span class="" style=>${reunion.reunionid}</span>
																</div>
															</div>
															<div class="column is-8">
																<div class="long-and-truncated" style="width: 70px;">
																	<span><span class="icon"><img
																			src="/static/media/popularity.d5eeb51c.svg" alt=""></span>1086</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>

										</div>

									</div>
								</div>
							</div>
						</div>
					</c:forEach>
			</div>
		</div>
	</div>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/layout/footer.jsp" />
	</footer>




</body>
</html>