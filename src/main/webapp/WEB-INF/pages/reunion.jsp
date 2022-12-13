<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<header>
		<jsp:include page="/WEB-INF/layout/navbar.jsp" />
	</header>
	
	
	    <section class="py-5 text-center container">
            <div class="row py-lg-5">
                <div class="col-lg-6 col-md-8 mx-auto">
                    <h1 class="fw-light">約約</h1>
                    <p class="lead text-muted">可以免費交友及參加聚會</p>

                </div>
            </div>
       </section>



	<div class="container">

		<div class=" dnKCVK">最新聚會</div>
		<div class="fFXEDN">
			<a href=>
				<button type="button" class="btn btn-success">聖誕</button>
			</a> <a href=>
				<button type="button" class="btn btn-danger">電影</button>
			</a> <a href=>
				<button type="button" class="btn btn-warning">唱歌</button>
			</a> <a href=>
				<button type="button" class="btn btn-info">新手友善</button>
			</a>
		</div>
		<div>
			<form class="row g-3">
				<div class="col-auto">
					<label for="staticEmail2" class="visually-hidden"></label> <input
						type="text" readonly class="form-control-plaintext"
						id="staticEmail2" value="聚會">
				</div>

				<div class="col-auto">
					<button type="submit" class="btn btn-primary mb-3">搜尋</button>
				</div>
			</form>

			<div class=" " style="width: 100px">
				<select class="form-select form-select-sm"
					aria-label=".form-select-sm example">
					<option selected>選擇</option>
					<option value="1">One</option>
					<option value="2">Two</option>
					<option value="3">Three</option>
				</select>
			</div>

			<div class=" " style="width: 100px">
				<select class="form-select form-select-sm"
					aria-label=".form-select-sm example">
					<option selected>收藏</option>
					<option value="1">已收藏</option>
					<option value="2">未收藏</option>

				</select>
			</div>

			<div class=" " style="width: 100px">
				<select class="form-select form-select-sm"
					aria-label=".form-select-sm example">
					<option selected>報名</option>
					<option value="1">已報名</option>
					<option value="2">未報名</option>
				</select>
			</div>
		</div>
		<div class="container">

			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

				<div class="col">
					<div class="card shadow-sm">



						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHu07nG6F3K81EjL5yAZ69_oZjOPj122YRYg&usqp=CAU">




						<div class="card-body">
							<p class="card-text">不能去泰國 就來吃泰式料理</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="content" style="margin-left: 3px;">
									<div class="flex-parent">
										<p class="title is-5 is-size-6-mobile long-and-truncated"
											style="width: 100%;">12/18玩了～玩了～芭比Q了#新手友善#聖誕</p>
									</div>
									<div class="flex-parent" style="margin-top: 4px;">
										<div class=" long-and-truncated">
											<span class="subtitle is-6 is-size-7-mobile">147漆彈主題樂園</span>
										</div>
									</div>
									<div class="flex-parent" style="margin-top: 4px;">
										<div class=" long-and-truncated">
											<span class="subtitle is-6 is-size-7-mobile">星期日,十二月
												18日 10:30</span>
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
															<span class="" style=>龍</span>
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
				<c:forEach var="message" items="${page.content}">
					<div class="col">
						<div class="card shadow-sm">
							<img src="${message.picture}">
							<div class="card-body">
								<p class="card-text">${message.topic}</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="content" style="margin-left: 3px;">
										<div class="flex-parent">
											<p class="title is-5 is-size-6-mobile long-and-truncated"
												style="width: 100%;"></p>
										</div>
										<div class="flex-parent" style="margin-top: 4px;">
											<div class=" long-and-truncated">
												<span class="subtitle is-6 is-size-7-mobile">${message.place}</span>
											</div>
										</div>
										<div class="flex-parent" style="margin-top: 4px;">
											<div class=" long-and-truncated">
												<span class="subtitle is-6 is-size-7-mobile"><fmt:formatDate
														pattern="yyyy/MM/dd HH:mm EEEE"
														value="${message.holdTime}" /></span>
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
																<span class="" style=>${message.reunionid}</span>
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


	<nav aria-label="...">
		<ul class="pagination pagination-sm">
			<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
				<c:choose>
					<c:when test="${pageNumber-1 != page.number }">

						<li class="page-item"><a class="page-link"
							href="${contextRoot}/msg/page?p=${pageNumber}">${pageNumber}</a></li>
					</c:when>

					<c:otherwise>
						<li class="page-item active" aria-current="page"><span
							class="page-link">${pageNumber}</span></li>
					</c:otherwise>

				</c:choose>

				<c:if test="${pageNumber != page.totalPages}">

				</c:if>
			</c:forEach>
		</ul>
	</nav>


	<footer>
		<jsp:include page="/WEB-INF/layout/footer.jsp" />
	</footer>
</body>
</html>