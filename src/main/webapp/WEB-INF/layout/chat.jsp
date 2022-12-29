<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!DOCTYPE html>
			<html lang="Zh-Hant-TW">

			<head>
				<meta charset="UTF-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>Document</title>
				<link rel="stylesheet" href="${contextRoot}/css/chatStyle.css" />

				<!-- <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
				<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script> -->
				<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
				<!-- Latest compiled and minified CSS -->
				<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
					integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
					crossorigin="anonymous"></script>


				<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
				<link rel="stylesheet"
					href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>

				<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
			</head>

			<body>
				<div id="onlineCount">
					<span></span>
				</div>
				<div>
					<div class="container text-center">
						<div class="row">

							<!-- <div class="chatHeight">
							                     <div class="chatImg"> 

							<a href="#" id="addClass"><img class="chatImg1"
									src="${contextRoot}/images/customer.png" /></a> 
								                     </div>  -->

							<div class="chatImg">
								<c:if test="${loginUser==null }">


									<a href="/login"><img src="${contextRoot}/images/iMessage.png"
											style="width: 65px; margin-top: 15px; flex-direction: column-reverse; position: fixed; right: 0px; bottom: 70px; z-index: 99999;" /></a>
								</c:if>
								<c:if test="${loginUser!=null }">
									<a href="#" id="addFriendTable"><img class="chatImg2"
											src="${contextRoot}/images/iMessage.png" /></a>
								</c:if>
							</div>
						</div>
						<!-- /participants/select1 -->





					</div>
				</div>


				<!--         <div class="popup-box chat-popup popup-box-on" id="qnimate"> -->
				<!--             <div class="popup-head"> -->
				<!--                 <div class="popup-head-left pull-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客服</div> -->
				<!--                 <div class="popup-head-right pull-right"> -->
				<!--                     <div class="btn-group"> -->
				<!--                         <button class="chat-header-button" data-toggle="dropdown" type="button" aria-expanded="false"> -->
				<!--                             <i class="glyphicon glyphicon-cog"></i> </button> -->
				<!--                         <ul role="menu" class="dropdown-menu pull-right"> -->
				<!--                             <li><a href="#">Media</a></li> -->
				<!--                             <li><a href="#">Block</a></li> -->
				<!--                             <li><a href="#">Clear Chat</a></li> -->
				<!--                             <li><a href="#">Email Chat</a></li> -->
				<!--                         </ul> -->
				<!--                     </div> -->

				<!--                     <button data-widget="remove" id="removeClass" class="chat-header-button pull-right" type="button"><i -->
				<!--                             class="glyphicon glyphicon-off"></i></button> -->
				<!--                 </div> -->
				<!--             </div> -->
				<!--             <div class="popup-messages"> -->




				<!--                 <div class="direct-chat-messages"> -->


				<!--                     <div class="chat-box-single-line"> -->
				<!--                         <abbr class="timestamp">October 8th, 2015</abbr> -->
				<!--                     </div> -->


				<!--                     Message. Default to the left -->
				<!--                     <div class="direct-chat-msg doted-border"> -->
				<!--                         <div class="direct-chat-info clearfix"> -->
				<!--                             <span class="direct-chat-name pull-left">Osahan</span> -->
				<!--                         </div> -->
				<!--                         /.direct-chat-info -->
				<!--                         <img alt="message user image" src="images/customer.png" class=" direct-chat-img"> -->
				<!--                         /.direct-chat-img -->
				<!--                         <div class="direct-chat-text"> -->
				<!--                             Hey bro, how’s everything going ? -->
				<!--                         </div> -->
				<!--                         <div class="direct-chat-info clearfix"> -->
				<!--                             <span class="direct-chat-timestamp pull-right">3.36 PM</span> -->
				<!--                         </div> -->
				<!--                         <div class="direct-chat-info clearfix"> -->


				<!--                         </div> -->
				<!--                         /.direct-chat-text -->
				<!--                     </div> -->
				<!--                     /.direct-chat-msg -->


				<!--                     <div class="chat-box-single-line"> -->
				<!--                         <abbr class="timestamp">October 9th, 2015</abbr> -->
				<!--                     </div> -->


				<!--                     訊息 -->
				<!--                     Message. Default to the left -->
				<!--                     <div class="direct-chat-msg doted-border"> -->
				<!--                         <div class="direct-chat-info clearfix"> -->
				<!--                             <span class="direct-chat-name pull-left">Osahan</span> -->
				<!--                         </div> -->
				<!--                         /.direct-chat-info -->
				<!--                         <img alt="iamgurdeeposahan" src="images/customer.png" class="direct-chat-img"> -->
				<!--                         /.direct-chat-img -->
				<!--                         <div class="direct-chat-text"> -->
				<!--                             Hey bro, how’s everything going ? -->
				<!--                         </div> -->
				<!--                         <div class="direct-chat-info clearfix"> -->
				<!--                             <span class="direct-chat-timestamp pull-right">3.36 PM</span> -->
				<!--                         </div> -->
				<!--                         <div class="direct-chat-text"> -->
				<!--                             Hey bro, how’s everything going ? -->
				<!--                         </div> -->
				<!--                         <div class="direct-chat-info clearfix"> -->
				<!--                             <span class="direct-chat-timestamp pull-right">3.36 PM</span> -->
				<!--                         </div> -->
				<!--                         <div class="direct-chat-text"> -->
				<!--                             Hey bro, how’s everything going ? -->
				<!--                         </div> -->
				<!--                         <div class="direct-chat-info clearfix"> -->
				<!--                             <span class="direct-chat-timestamp pull-right">3.36 PM</span> -->
				<!--                         </div> -->
				<!--                         /.direct-chat-text -->
				<!--                     </div> -->
				<!--                     /.direct-chat-msg -->






				<!--                 </div> -->









				<!--             </div> -->
				<!--             <div class="popup-messages-footer"> -->
				<!--                 <textarea id="status_message" placeholder="Type a message..." rows="10" cols="40" -->
				<!--                     name="message"></textarea> -->
				<!--                 <div class="btn-footer"> -->
				<!--                     <button class="bg_none"><i class="glyphicon glyphicon-film"></i> </button> -->
				<!--                     <button class="bg_none"><i class="glyphicon glyphicon-camera"></i> </button> -->
				<!--                     <button class="bg_none"><i class="glyphicon glyphicon-paperclip"></i> </button> -->
				<!--                     <button id=""><i class="">send</i></button> -->
				<!--                 </div> -->
				<!--             </div> -->
				<!--         </div> -->
				<!--     </div> -->


				<div class="app-wrapp">
					<div class="app-container">
						<!-- @main page view -->
						<div class="view-main">
							<div class="header-wrapp">

								<div class="app-detail">
									<div>
										<img src="${loginUser.getAvator()}" alt=""
											style="width: 90px; height: 90px; border-radius: 50%">
									</div>
									<div>${loginUser.getName()}</div>
									<div class="status">online</div>
								</div>
								<div class="wave-wrapp">
									<svg class="wave" xmlns="http://www.w3.org/2000/svg" viewBox="0 24 150 28"
										preserveAspectRatio="none">
										<defs>
											<path id="gentle-wave"
												d="m -160,44.4 c 30,0 58,-18 87.7,-18 30.3,0 58.3,18 87.3,18 30,0 58,-18 88,-18 30,0 58,18 88,18 l 0,34.5 -351,0 z" />
										</defs>
										<g class="parallax">
											<use xlink:href="#gentle-wave" x="50" y="0"
												fill="rgba(255, 255, 255, 0.48)" />
											<use xlink:href="#gentle-wave" x="50" y="3"
												fill="rgba(255, 255, 255, 0.78)" />
											<use xlink:href="#gentle-wave" x="50" y="6"
												fill="rgba(255, 255, 255, 0.8)" />
										</g>
									</svg>
								</div>
								<div id="closeFriendTable">
									<button data-widget="remove" id="removeClass1" class="chat-header-button "
										type="button">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
											fill="currentColor" class="bi bi-power" viewBox="0 0 16 19">
											<path d="M7.5 1v7h1V1h-1z" />
											<path
												d="M3 8.812a4.999 4.999 0 0 1 2.578-4.375l-.485-.874A6 6 0 1 0 11 3.616l-.501.865A5 5 0 1 1 3 8.812z" />
										</svg>
									</button>
								</div>
							</div>
							<div class="content-wrapp">
								<div class="nav-group">
									<nav id="master-nav">
										<ul>
											<li class="ac"><i class="material-icons">perm_identity</i></li>
											<li class="active"><i class="material-icons">chat_bubble_outline</i></li>
											<!-- <li><i class="material-icons">favorite_border</i></li> -->
											<li class="navClick" grouproom=""><i class="material-icons"><img
														src="${contextRoot}/images/customer.png"
														style="width: 30px; margin-bottom: 15px" /></i></li>
											<li id="active-line"></li>
										</ul>
									</nav>
								</div>

								<!-- 聯絡人好友 -->
								<div id="master-nav-items" data-viewport="true" style="margin: 0px 0px">
									<div id="item-1">

										<div class="contact-list">
											<ul class="touch-y">
												<li id="a" class=""><a name="a" class="title">A</a>
													<ul>
														<li>Adam</li>
														<li>Alex</li>
														<li>Ali</li>
														<li>Apple</li>
														<li>Arthur</li>

													</ul>
												</li>
												<li id="b" class=""><a name="b" class="title">B</a>
													<ul>
														<li>Barry</li>
														<li>Becky</li>
														<li>Biff</li>



													</ul>
												</li>
												<li id="c" class=""><a name="c" class="title">c</a>
													<ul>
														<li>Calista</li>
														<li>Cathy</li>
														<li>Chris</li>
														<li>Cinderella</li>
														<li>Corky</li>
														<li>Cypher</li>
													</ul>
												</li>

											</ul>
										</div>
									</div>


									<!-- 訊息 -->
									<div id="item-2">
										<div class="messages-list">
											<ul class="touch-y" id="chatRoom">
												<!-- <li>
													<div class="sender-image">
														<img
															src="https://raw.githubusercontent.com/yousefsami/social-app-assets/master/user1.jpg">
													</div>
													<div class="mes-detail">
														<div class="mes-col1">
															<div class="sender-name">Masome Sami</div>
															<div class="mes-preview">
																Hi how are you ? <br> What's your name?
															</div>
														</div>
														<div class="mes-col2">
															<div>
																<div class="send-time">10:26 AM</div>
																<div class="mes-seen-status">
																	<i class="material-icons">done_all</i>
																</div>
															</div>
															<span class="mes-count">3</span>
														</div>
													</div>
												</li>
												<li>
													<div class="sender-image">
														<img
															src="https://raw.githubusercontent.com/yousefsami/social-app-assets/master/user2.jpg">
													</div>
													<div class="mes-detail">
														<div class="mes-col1">
															<div class="sender-name">Reza Sami</div>
															<div class="mes-preview">Where are you from ...</div>
														</div>
														<div class="mes-col2">
															<div>
																<div class="send-time">9:00 AM</div>
																<div class="mes-seen-status">
																	<i class="material-icons">done_all</i>
																</div>
															</div>
															<span class="mes-count">12</span>
														</div>
													</div>
												</li>
												<li>
													<div class="sender-image">
														<img
															src="https://raw.githubusercontent.com/yousefsami/social-app-assets/master/user3.jpg">
													</div>
													<div class="mes-detail">
														<div class="mes-col1">
															<div class="sender-name">یوسف سامی</div>
															<div class="mes-preview">Lorem ipsum a plane text</div>
														</div>
														<div class="mes-col2">
															<div>
																<div class="send-time">Tue</div>
																<div class="mes-seen-status"></div>
															</div>
															<span class="mes-count">50</span>
														</div>
													</div>
												</li>
												<li>
													<div class="sender-image">
														<img
															src="https://raw.githubusercontent.com/yousefsami/social-app-assets/master/user4.jpg">
													</div>
													<div class="mes-detail">
														<div class="mes-col1">
															<div class="sender-name">Ali Torabi</div>
															<div class="mes-preview">Hey i'm here</div>
														</div>
														<div class="mes-col2">
															<div>
																<div class="send-time">Sun</div>
																<div class="mes-seen-status"><i class="material-icons">done_all</i></div>
															</div>
															<span class="mes-count">3</span>
														</div>
													</div>
												</li> -->

											</ul>
										</div>
									</div>

									<!-- 愛心 -->
									<!-- <div id="item-3">
										<div class="touch-y activity">
											<i class="material-icons">sentiment_dissatisfied</i>
											<h1>Sorry !</h1>
											<p>You don't have any Activity</p>
										</div>
									</div> -->
									<!-- <div id="item-4">
										<div class="profile-setting">
											<div class="touch-y">
												<div class="information">
													<div class="public">
														<p>PUBLIC INFORMATION</p>
														<div class="form-group">
															<span> <i class="material-icons">assignment_ind</i>
															</span> <input type="text" placeholder="USERNAME"
																value="@yousefsami">
														</div>
														<div class="form-group">
															<span> <i class="material-icons">face</i>
															</span> <input type="text" placeholder="NAME"
																value="Yousef Sami">
														</div>
														<div class="form-group">
															<span> <i class="material-icons">public</i>
															</span> <input type="text" placeholder="WEB SITE">
														</div>
														<div class="form-group h-80">
															<span> <i class="material-icons">info</i>
															</span>
															<textarea placeholder="BIO" rows="3"></textarea>
														</div>
													</div>
													<div class="private">
														<p>PRIVATE INFORMATION</p>
														<div class="form-group">
															<span> <i class="material-icons">local_post_office</i>
															</span> <input type="text" placeholder="EMAIL"
																value="yousef.sami19@gmail.com">
														</div>
														<div class="form-group">
															<span> <i class="material-icons">fingerprint</i>
															</span> <input type="text" placeholder="PASSWORD">
														</div>
														<div class="form-group">
															<span> <i class="material-icons">phone</i>
															</span> <input type="text" placeholder="PHONE NUMBER">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div> -->
								</div>
							</div>
						</div>


						<!-- 對方回覆 -->
						<!-- @send message view -->
						<div class="view-message">
							<div class="status-bar">
								<div class="back-arrow">
									<i class="material-icons">navigate_before</i>
								</div>
								<div class="sender-name" id="messageTitle"></div>
							</div>
							<div class="messages-area" data-viewport="true">
								<ul class="touch-y" id="message" participants="" grouproom="">
									<!-- <li class="recive" style="display:none"><img
											src="https://raw.githubusercontent.com/yousefsami/social-app-assets/master/user1.jpg"
											style="width: 35px; height: 35px; border-radius: 50%; display: flex; float: left; margin-top: 10px" />
										<div>
											Hi dear welcome <span>12:08 PM</span>
										</div>
									</li> -->
									<!-- <li class="sent">
										<div>
											Hi how are you? <br /> what's up? <span>12:11 PM</span>
										</div>
									</li>
									<li class="sent" messageId="" style="display:none">
										<div>
											Lorem ipsum is a pseudo-Latin text used in web design,
											typography, layout, and printing in place of English to
											emphasise design elements over content <span>1:11 PM</span>
										</div>
									</li> -->
								</ul>
							</div>
							<div class="text-media-area" id="dragArea">
								<div class=message-form>
									<button id="send-message">
										<i class="material-icons">send</i>
									</button>
									<input id="message-text" type="text" placeholder="Type Something + Enter"
										groupRoom="" senderId="">
									<!-- <textarea id="message-text" type="text" placeholder="Type Something + Enter"
										groupRoom="" senderId=""></textarea> -->
								</div>
							</div>
						</div>
						<!-- -------------------- -->
					</div>
				</div>
				<!-- 預覽圖片 -->
				<div id="previewDiv"></div>
				<div id="remind" class="alert alert-info alert-dismissible ">
					<button type="button" class="close" id="removeRemind">&times;</button>
					<strong>信息!</strong> 你有一則新訊息。
				</div>


				<script>

					// 客服動畫
					const getJsonMessageFile = document.querySelector("#addFriendTable");
					let viewMessage = document.querySelector("#message");
					let viewTitle = document.querySelector("#messageTitle")
					let chat = document.querySelector("#chatRoom");
					//聊天室資料載入


					getJsonMessageFile.addEventListener("click", function () {
						// $(document).ready(function () {
						//搜聊天室
						callChatRoom()
						$("#remind").hide("fold", {
							direction: "down"
						}, "slow");
					})


					function callChatRoom() {
						participantsSelect()
						setTimeout(() => touchMessageLi(), 1200)
					}

					function touchMessageLi() {
						$(".messages-list > ul>li").click(function (e) {


							let roomId = $(this).attr("id")
							$("#message-text").attr("groupRoom", roomId)
							// if (roomId === null) {
							// 	console.log("no")
							// } else {
							// 	console.log('roomId' + roomId)
							// 	//延遲仔入js
							groupRoom(roomId)
							$(".messages-list > ul>li").unbind();
							// }
						});
					}
					//延遲仔入js
					function groupRoom(roomId) {




						//訊息介面

						fetch("${contextRoot}/participants/select1", {
							method: "GET"

						}).then(function (result) {
							return result.json()
						}).then(function (data) {
							let participantsId = [];
							let message = '';
							let messageTitle = '';
							let groomList = data.groomList;
							let memList = data.memList;
							// console.log(groomList)
							// console.log(memList)
							$.each(groomList, function (index, groupList) {

								if (groupList.groupId == roomId) {
									console.log(true)
									// message += '<div class="status-bar"><div class="back-arrow"><i class="material-icons">navigate_before</i></div>'
									if (groupList.groupType === 0) {
										$.each(groupList.participants, function (index, participants) {

											if (participants.personId != data.userId) {

												// participantsId.push(participants.personId)
												$.each(memList, function (index, member) {
													if (member.id == participants.personId) {
														messageTitle += member.name;
														participantsId.push(member.account)
													}
												})
											}
										})

									} else {
										$.each(groupList.participants, function (index, participants) {
											if (participants.personId != data.userId) {
												// participantsId.push(participants.personId)
												$.each(memList, function (index, member) {
													if (member.id == participants.personId) {

														participantsId.push(member.account)
													}
												})
											}
										})
										messageTitle += groupList.groupName;
									}
									// message += '<div class="messages-area" data-viewport="true"><ul class="touch-y">'

									$.each(groupList.messageText, function (index, messageContent) {
										if (messageContent.senderId != data.userId) {
											$.each(memList, function (index, member) {
												if (messageContent.senderId === member.id) {
													message += '<li class="recive" messageId="' + messageContent.messageId + '"><img src="' + member.avator + '"style="width: 35px; height: 35px; border-radius: 50%; display: flex; float: left; margin-top: 10px" />';

												}

											})
											let startTime = new Date(Date.parse(messageContent.createAt));
											let strTime = getTime(startTime);
											message += '<div><span style="display:flex">' + messageContent.messageText + '</span><span>' + strTime + '</span></div></li>';


										} else {
											let startTime = new Date(Date.parse(messageContent.createAt));
											let strTime = getTime(startTime);
											message += '<li class="sent context-menu-one" onclick="conTextM()" messageId="' + messageContent.messageId + '"><div><span>' + messageContent.messageText + '</span><span>' + strTime + '</span></div></li>';
										}
									})
									// message += '</ul></div><div class="text-media-area"><div class=message-form><button id="send-message"><i class="material-icons">send</i></button><input id="message-text" type="text" placeholder="Type Something + Enter"></div></div></div>';
								}

							})


							viewMessage.innerHTML = message;
							viewTitle.innerHTML = messageTitle;
							$("#message").attr("groupRoom", roomId)
							$("#message-text").attr("senderId", data.userId)
							// $('.sent').click(function (e) {
							// 	console.log($(this).attr("messageId"))
							// 	e.button == 2
							// })
							// console.log(participantsId)
							$("#message").attr("participants", participantsId)

						})







						// showMessages(roomId)
						// $('.view-main').addClass("deactive");
						// $('".' + roomId + '"').addClass("active");
						setTimeout(() => showMessages(), 300)

						// setTimeout(() => controllMessage(), 1000)
						$(".back-arrow").unbind();
						setTimeout(() => backArrow(), 1000)
					}


					function showMessages() {
						$('.view-main').addClass("deactive");
						$('.view-message').addClass("active");

					}
					//進入後返回鍵
					function backArrow() {
						$(".back-arrow").click(function (e) {
							callChatRoom()
							$("#message").empty();

							function removeMessage() {
								$('.view-main').removeClass("deactive");
								$('.view-message').removeClass("active");
							}
							setTimeout(() => removeMessage(), 300)
							$("#message").attr("participants", "")

							// navItemPos($("#master-nav ul .active").index());

							$("#messageTitle").text("");
							$("#message-text").attr("groupRoom", "")
							$("#message-text").attr("senderId", "")
							$("#message").attr("groupRoom", "")
						})
					}


					// function controllMessage() {

					//進入後返回鍵


					//傳送訊息enter鍵
					$("#send-message").click(function () {

						let groupRoom = $("#message-text").attr("groupRoom")
						let groupRoomId = $("#message").attr("groupRoom")
						let senderId = $("#message-text").attr("senderId")
						// console.log($("#message").attr("participants"))
						// console.log(websocket)
						// let data = {};
						// data["from"] = "${loginUser.avator}";
						// data["to"] = $("#message").attr("participants");
						// data["text"] = $("#message-text").val();
						// // console.log("AAA", JSON.stringify(data))
						// websocket.send(JSON.stringify(data)); // 使用 send() 方法发送数据
						if (groupRoom != "") {
							sendMassage(groupRoom, senderId)
						} else {
							customerServiceAuto();

						}
					});
					$(document).keyup(
						function (e) {
							if (e.which == 13
								&& $('.view-message').hasClass(
									"active")) {
								let groupRoom = $("#message-text").attr("groupRoom")
								let groupRoomId = $("#message").attr("groupRoom")
								let senderId = $("#message-text").attr("senderId")
								if (groupRoom != "") {
									sendMassage(groupRoom, senderId);
								} else {
									customerServiceAuto();
								}
							}
						})
					function sendMassage(groupRoom, senderId) {
						// console.log(groupRoom)
						// console.log(senderId)
						var date = new Date();
						var message = $("#message-text").val();
						let messageImg;
						if ($("#previewDiv").html() != null) {
							messageImg = $("#previewDiv").html();
							$("#previewDiv").html("");
							message += messageImg
						}
						//輸入歸零
						$("#message-text").val("");
						// let messageIte = ""
						// messageIte += "<li class='sent'><div>" + message + "<span>" + getTime(date)
						// 	+ "</span></div></li>";

						let formData = new FormData();
						formData.append('groupId', groupRoom);
						formData.append('senderId', senderId);
						formData.append('text', message);
						fetch("${contextRoot}/msg/add", {
							method: "POST",
							body: formData

						}).then(function (result) {
							return result.json()
						}).then(function (data) {

							// console.log(data.messageId)
							let messageItem = "<li class='sent goto context-menu-one' messageId='" + data.messageId + "'><div><span>"
								+ message + "</span><span>" + getTime(date)
								+ "</span></div></li>";
							$(".messages-area > ul").append(messageItem);
							setTimeout(function () {
								$(document).find(".goto").removeClass(
									"goto");


								// systemMessage(date);
								// messageScrollFix();
							}, 50);
							// $('.sent').unbind();

							setTimeout(() => conTextM(), 1000)

							// $('.sent').click(function (e) {

							// 	console.log($(this).attr("messageId"))
							// })
							let dataMessage = {};
							dataMessage["type"] = 1
							dataMessage["from"] = "${loginUser.avator}";
							dataMessage["to"] = $("#message").attr("participants");
							dataMessage["text"] = message;
							dataMessage["messageId"] = data.messageId;
							// console.log("AAA", JSON.stringify(data))
							websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据
						});
					}


					function customerServiceAuto() {
						var date = new Date();
						var message = $("#message-text").val();
						let messageImg;
						if ($("#previewDiv").html() != null) {
							messageImg = $("#previewDiv").html();
							$("#previewDiv").html("");
							message += messageImg
						}
						//輸入歸零
						$("#message-text").val("");
						let messageItem = "<li class='sent goto'><div><span>"
							+ message + "</span><span>" + getTime(date)
							+ "</span></div></li>";
						$(".messages-area > ul").append(messageItem);
						setTimeout(function () {
							$(document).find(".goto").removeClass(
								"goto");


							// systemMessage(date);
							// messageScrollFix();
						}, 50);
						if (message == "") {
							setTimeout(function () {
								let message = '<li class="recive"><img src="${contextRoot}/images/customer.png"style="width: 35px; height: 35px; border-radius: 50%; display: flex; float: left; margin-top: 10px" />';
								message += '<div>我不太了解您的意思，您可以轉<a href="#" onclick="customerService()">專員</a>，讓他為您服務<span>' + getTime(new Date) + '</span></div></li>';
								$(".messages-area > ul").append(message);



							}, 500);

						} else {
							let formData = new FormData();
							formData.append('text', message);
							fetch("${contextRoot}/customerService/like", {
								method: "POST",
								body: formData

							}).then(function (result) {
								// console.log(result)
								return result.json()
							}).catch(function (error) {
								setTimeout(function () {
									let message = '<li class="recive"><img src="${contextRoot}/images/customer.png"style="width: 35px; height: 35px; border-radius: 50%; display: flex; float: left; margin-top: 10px" />';
									message += '<div>我可能不太懂您的意思，您可以轉<a href="#"" onclick="customerService()"">專員</a>，讓他為您服務<span>' + getTime(new Date) + '</span></div></li>';
									$(".messages-area > ul").append(message);



								}, 500);
							}).then(function (data) {
								// console.log(date)
								// if (data == null) {
								// 	setTimeout(function () {
								// 		let message = '<li class="recive"><img src="${contextRoot}/images/customer.png"style="width: 35px; height: 35px; border-radius: 50%; display: flex; float: left; margin-top: 10px" />';
								// 		message += '<div>我可能不太懂您的意思，您可以轉<a href="#"" onclick="customerService()"">專員</a>，讓他為您服務<span>' + getTime(new Date) + '</span></div></li>';
								// 		$(".messages-area > ul").append(message);



								// 	}, 500);

								// } else {
								if (data != null) {
									let message = '<li class="recive"><img src="${contextRoot}/images/customer.png"style="width: 35px; height: 35px; border-radius: 50%; display: flex; float: left; margin-top: 10px" />';
									message += '<div>' + data.toMessageText + '<span>' + getTime(new Date) + '</span></div></li>';
									$(".messages-area > ul").append(message);
								}

							})
						}
					}



					//訊息超過會自動往下
					function messageScrollFix() {
						setTimeout(
							function () {
								let mes_hieght = parseInt($(
									".messages-area > ul")
									.height());
								let viewportHeight = parseInt($(
									".messages-area").height());
								if (mes_hieght > viewportHeight)
									$(".messages-area > ul")
										.css(
											"transform",
											"translateY("
											+ ((viewportHeight - mes_hieght) - 10)
											+ "px)");
							}, 100);
					}
					// }

					var customerWidth = 90;
					// $(".chatImg1").click(function () {
					// 	$(".chatImg1").addClass("box")

					// })
					// //跳出收回客服聊天視窗
					// $(function () {
					// 	$("#addClass").click(function () {
					// 		//延遲跳出時間
					// 		window.setTimeout(addCustomer, 300)
					// 	});

					// 	function addCustomer() {

					// 		// $(".popup-box-on").show(200)
					// 		// $(".popup-box-on").show("show", { direction: "right" }, 3000);
					// 		//顯示客服方式
					// 		$(".popup-box-on").show("fold", 800);

					// 		$(".chatImg1").removeClass("box1");
					// 	}

					// 	$("#removeClass").click(function () {
					// 		// $('#qnimate').hide('popup-box-on');
					// 		// $(".popup-box-on").hide(200)
					// 		$(".popup-box-on").hide("fold", {
					// 			direction: "down"
					// 		}, "slow");
					// 		setTimeout(function () {
					// 			$(".chatImg1").removeClass("box")
					// 			$(".chatImg1").addClass("box1");
					// 		}, 600);
					// 		// $(".chatImg1").removeClass("box")
					// 		// $(".chatImg1").addClass("box1")
					// 	});
					// })


					//複雜得東西
					$(document)
						.ready(

							function () {
								// var distX = 0, distY = 0;
								// var viewportX, viewportY;
								// $(document).on('mousedown touchstart', '.touch-y', function (e) {
								// 	var $ele = $(this);
								// 	viewportY = (-1 * $ele.height()) + viewport($ele).height();
								// 	var startY = e.pageY || e.originalEvent.touches[0].pageY;
								// 	var currentY = parseFloat($ele.css('transform').split(',')[5]);
								// 	$(document).on('mousemove touchmove', function (e) {
								// 		e.preventDefault();
								// 		var y = e.pageY || e.originalEvent.touches[0].pageY;
								// 		distY = y - startY;
								// 		if (currentY) {
								// 			distY += currentY;
								// 		}
								// 		// if (distY > 3 || distY < (-3)) {
								// 		// 	$(".messages-list > ul > li").off('click');
								// 		// }
								// 		$ele.css('transform', 'translateY(' + distY + 'px)');
								// 		if (distY > 0 || distY < viewportY) {
								// 			if (viewport($ele).find('.viewportShadow').length == 0)
								// 				viewport($ele).append('<span class="viewportShadow"></span>');
								// 		}
								// 		if (distY > 0) {
								// 			viewport($ele).find('.viewportShadow').css({
								// 				'top': '-5px',
								// 				'box-shadow': '0px 0px 140px ' + distY / 5 + 'px rgba(255,183,0,0.8)'
								// 			});
								// 		} else if (distY < viewportY) {
								// 			viewport($ele).find('.viewportShadow').css({
								// 				'bottom': '-5px',
								// 				'box-shadow': '0px 0px 140px ' + ((-1 * distY) + viewportY) / 5 + 'px rgba(255,183,0,08)'
								// 			});
								// 		}
								// 	});
								// 	$(document).on('mouseup touchend', function () {
								// 		$(document).off('mousemove touchmove mouseup touchend');
								// 		if (!distY) return;
								// 		if (distY > 0) {
								// 			$ele.css('transform', 'translateY(0)').addClass("reset");
								// 			viewport($ele).find('.viewportShadow').css('box-shadow', '0 0 0 rgba(255,183,0,.5)');
								// 		} else if (distY < viewportY) {
								// 			if ($ele.height() > viewport($ele).height()) {
								// 				$ele.css('transform', 'translateY(' + viewportY + 'px)').addClass("reset");
								// 			} else {
								// 				$ele.css('transform', 'translateY(0)').addClass("reset");
								// 			}
								// 			viewport($ele).find('.viewportShadow').css('box-shadow', '0 0 0 rgba(255,183,0,.5)');
								// 		}
								// 		setTimeout(function () {
								// 			$ele.removeClass("reset");
								// 			viewport($ele).find('.viewportShadow').remove();
								// 			$(".messages-list > ul > li").bind('click', showMessages);
								// 		}, 400);
								// 	});
								// });


								// 上拉下拉程式呼叫
								// Get viewport
								function viewport(ele) {
									return ele.closest('[data-viewport="true"]');
								}

								// nav control
								var $el, leftPos, newWidth, $mainNav = $("#master-nav ul");
								//nav橘色底線
								var $active_line = $("#active-line");
								$active_line.css("left", "83.9062px");
								//a一打開的畫面（聊天）
								navItemPos($("#master-nav ul .active").index());

								// 點擊選項功能    
								$("#master-nav ul li").click(function () {
									$el = $(this);
									console.log($el)
									if ($el.hasClass("navClick")) {
										// $("#master-nav ul li").removeClass('active');
										// $el.addClass('active');

										let roomId = $("#message").attr("groupRoom")
										// 	// setTimeout(() => controllMessage(), 1000)
										groupRoom(roomId)
										let messageDate = new Date;
										systemMessage(messageDate);
									} else {
										$("#master-nav ul li").removeClass('active');
										$el.addClass('active');
										navItemPos($el.index());
										leftPos = $el.position().left;
										newWidth = $el.parent().width();
										$active_line.stop().animate({
											left: leftPos
										})
									};
								});

								function navItemPos(index) {
									$("#master-nav-items > div").removeClass(
										"active after before");
									$("#master-nav-items > div").eq(index)
										.addClass("active");
									$("#master-nav-items > div").eq(index)
										.nextAll().addClass("after");
									$("#master-nav-items > div").eq(index)
										.prevAll().addClass("before");
								}






								//點擊進入聊天


								// 自動回覆
								function systemMessage(date) {
									let messages = [
										"有什麼需要幫忙的嗎？目前為自動訊息回覆，如需由<a href='#' onclick='customerService()'>專員</a>為您服務，請點此"
									]
									setTimeout(function () {
										let messageItem = "<li class='recive'><div>" + messages + "<span>" + getTime(date) + "</span></div></li>";
										$(".messages-area > ul").append(messageItem);

									}, 1000);
								}
								// [parseInt(Math.random(1, 4) * 4)]

								window.customerService = function () {

									let messageItem = "<li class='sent'><div>轉專員<span>" + getTime(new Date) + "</span></div></li>";
									$(".messages-area > ul").append(messageItem);
									setTimeout(function () {
										messageItem = "<li class='recive'><div>已轉人工，接下來的對話紀錄將會被存取，以確保雙方權益，請見諒，您可先輸入問題，稍後由專員為您服務<span>" + getTime(new Date) + "</span></div></li>";
										$(".messages-area > ul").append(messageItem);

									}, 700);
									let grouproomId = $("#message").attr("grouproom");
									let groupRoom = $("#message-text").attr("groupRoom", grouproomId);
									let senderId = $("#message-text").attr("senderId", "${loginUser.id}");

								}

								//時間格式
								// function getTime(date) {
								// 	var hours = date.getHours();
								// 	var minutes = date.getMinutes();
								// 	var ampm = hours >= 12 ? 'PM' : 'AM';
								// 	hours = hours % 12;
								// 	hours = hours ? hours : 12;
								// 	minutes = minutes < 10 ? '0' + minutes
								// 		: minutes;
								// 	var strTime = hours + ':' + minutes + ' '
								// 		+ ampm;
								// 	return strTime;
								// }
								//訊息超過會自動往下
								// function messageScrollFix() {
								// 	setTimeout(
								// 		function () {
								// 			var mes_hieght = parseInt($(
								// 				".messages-area > ul")
								// 				.height());
								// 			var viewportHeight = parseInt($(
								// 				".messages-area").height());
								// 			if (mes_hieght > viewportHeight)
								// 				$(".messages-area > ul")
								// 					.css(
								// 						"transform",
								// 						"translateY("
								// 						+ ((viewportHeight - mes_hieght) - 10)
								// 						+ "px)");
								// 		}, 100);
								// }
								// 好友聊天顯示
								$(".chatImg2").click(function () {
									$(".chatImg2").addClass("FriendBox")

								})
								$("#addFriendTable").click(function () {
									//延遲跳出時間
									window.setTimeout(addCustomer, 300)
								});

								function addCustomer() {

									//顯示客服方式
									$(".app-wrapp").show("fold", 1100);
									$(".chatImg2").removeClass("FriendBox1");
									$("#closeFriendTable").unbind();
									setTimeout(() => closeFriendTable(), 1000)
								}
								// 好友聊天關閉
								// function showMessages() {
								// 	$('.view-main').addClass("deactive");
								// 	$('.view-message').addClass("active");

								// }
								// //進入後返回鍵
								// $(".back-arrow").click(function () {
								// 	$('.view-main').removeClass("deactive");
								// 	$('.view-message').removeClass("active");
								// })



							});
					// 好友聊天關閉 為何不能放在ready裡
					function closeFriendTable() {
						$("#closeFriendTable").click(function () {

							$(".app-wrapp").hide("fold", {
								direction: "down"
							}, "slow");
							setTimeout(function () {
								$(".chatImg2").removeClass("FriendBox")
								$(".chatImg2").addClass("FriendBox1");
							}, 600);

						})
					};


					function getTime(date) {
						var hours = date.getHours();
						var minutes = date.getMinutes();
						var ampm = hours >= 12 ? 'PM' : 'AM';
						hours = hours % 12;
						hours = hours ? hours : 12;
						minutes = minutes < 10 ? '0' + minutes
							: minutes;
						var strTime = hours + ':' + minutes + ' '
							+ ampm;
						return strTime;
					}


					//收回選單
					$(function () {

						conTextM()

					})

					window.conTextM = function () {
						$.contextMenu({
							selector: '.context-menu-one',
							callback: function (key, options) {
								var m = "clicked: " + key;
								// window.console && console.log(m) || alert(m);
								let messageId = $(this).attr("messageId")
								// console.log(messageId)
								console.log(m)
								console.log(key)
								console.log(options)
							},
							items: {
								"edit": {
									name: "編輯", icon: "edit",
									callback: function () {
										let messageId = $(this).attr("messageId")
										// console.log($(this).attr("messageId"))
										let defalutMessage = $("li[messageId='" + messageId + "'] > div span:first-child").text()
										var nickname = prompt('請輸入修改內容', defalutMessage);
										if (nickname == null) {
											$("li[messageId='" + messageId + "'] > div span:first-child").text(defalutMessage)
										} else {
											$("li[messageId='" + messageId + "'] > div span:first-child").text(nickname)
											// 	let formData = new FormData();
											// 	formData.append('messageId', messageId);
											// formData.append('text', nickname);
											// fetch("${contextRoot}/msg/add", {
											// 	method: "POST",
											// 	body: formData

											// }).then(function (result) {
											// 	return result.json()
											// }).then(function (data) {

											// })
										}

										// let s = $("li[messageId='" + messageId + "'] > div span:first-child").text()


										// formData.append('messageId', messageId);
										// formData.append('text', nickname);
										// fetch("${contextRoot}/msg/add", {
										// 	method: "POST",
										// 	body: formData

										// }).then(function (result) {
										// 	return result.json()
										// }).then(function (data) {

										// }
									}
								},
								// "cut": { name: "剪下", icon: "cut" },
								// "copy": { name: "複製", icon: "copy" },
								// "paste": { name: "貼上", icon: "paste" },
								"delete": {
									name: "收回", icon: "delete",
									callback: function () {
										// console.log($(this).attr("messageId"))
										let messageId = $(this).attr("messageId")

										let yes = confirm('你確定嗎？');

										if (yes) {
											// $("li[messageId='" + messageId + "']").addClass("deleteMessage")
											// $("li[messageId='" + messageId + "']").hide();
											// alert('你按了確定按鈕');
											// $("li[messageId='" + messageId + "']").addClass("deleteMessage")
											let defalutMessage = '<span style="color:blue;font-weight:800;font-style:italic;">訊息已被收回</span>'

											$("li[messageId='" + messageId + "'] > div span:first-child").text(null)
											$("li[messageId='" + messageId + "'] > div span:first-child").append(defalutMessage)

											let formData = new FormData();
											formData.append('messageId', messageId);
											formData.append('text', defalutMessage);
											fetch("${contextRoot}/msg/updateMessage", {
												method: "POST",
												body: formData

											})
											let dataMessage = {};
											dataMessage["type"] = 2
											// dataMessage["from"] = "${loginUser.avator}";
											dataMessage["to"] = $("#message").attr("participants");
											dataMessage["text"] = defalutMessage;
											dataMessage["messageId"] = messageId;
											// console.log("AAA", JSON.stringify(data))
											websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据
										} else {

										}

									}
								},
								// "sep1": "---------",
								// "quit": {
								// 	name: "離開", icon: function () {
								// 		return 'context-menu-icon context-menu-icon-quit';
								// 	}
								// }

							}
						});
					}


					//搜聊天室
					function participantsSelect() {
						$.ajax({
							url: "${contextRoot}/participants/select1",
							type: "get",
							dataType: "json",
							success: function (data) {
								let groomList = data.groomList
								let memList = data.memList

								console.log(groomList)
								console.log(memList)
								let chatRoom = '';
								$.each(groomList, function (index, groupList) {
									console.log(index, groupList)
									console.log(groupList.groupId)

									console.log(data.userId)

									if (groupList.groupType === 0) {

										chatRoom += '<li id="' + groupList.groupId + '">';
										$.each(groupList.participants, function (index, participants) {

											if (participants.personId != data.userId) {
												$.each(memList, function (index, member) {
													if (member.id == participants.personId) {
														chatRoom += '<div class="sender-image" account="' + member.account + '">';
														chatRoom += '<img src="' + member.avator + '">';
														chatRoom += '</div><div class="mes-detail"><div class="mes-col1"><div class="sender-name">' + member.name + '</div>';
														let dataMessage = {};

														dataMessage["from"] = "${loginUser.account}";
														dataMessage["to"] = 4;
														dataMessage["text"] = member.account;

														// console.log("AAA", JSON.stringify(data))
														websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据
														$.each(groupList.messageText, function (index, message) {

															if (index === groupList.messageText.length - 1) {
																// let fmt = SimpleDateFormat("H:mm");

																// let aTime = fmt.parse(message.createAt);
																// let strTime = fmt.format(aTime)
																// let startTime = new Date(Date.parse(message.createAt));

																// let strStart = sdf.format(startTime);
																let startTime = new Date(Date.parse(message.createAt));
																let strTime = getTime(startTime);
																chatRoom += '<div class="mes-preview">' + message.messageText + '</div></div>'
																chatRoom += '<div class="mes-col2"><div><div class="send-time">' + strTime + '</div></div></div>'
															}
														})
														chatRoom += '</div>'
													}
												})
											}
										})
										chatRoom += '</li>';

									} else if (groupList.groupType === 1) {
										chatRoom += '<li id="' + groupList.groupId + '">';
										if (groupList.groupPhoto == null) {
											chatRoom += '<div class="sender-image">';
											chatRoom += '<img src="${ contextRoot}/images/sing.png"/>';
											chatRoom += '</div>';
										} else {
											chatRoom += '<div class="sender-image">';
											chatRoom += '<img src="' + groupList.groupPhoto + '">';
											chatRoom += '</div>';
										}
										let people = groupList.participants.length
										chatRoom += '</div><div class="mes-detail"><div class="mes-col1"><div class="sender-name">' + groupList.groupName + ' (' + people + ')</div>';

										$.each(groupList.messageText, function (index, message) {


											if (index === groupList.messageText.length - 1) {

												// let fmt = SimpleDateFormat("H:mm");

												// let aTime = fmt.parse(message.createAt);
												// let strTime = fmt.format(aTime)
												let startTime = new Date(Date.parse(message.createAt));

												// let strStart = sdf.format(startTime);
												let strTime = getTime(startTime);
												chatRoom += '<div class="mes-preview">' + message.messageText + '</div></div>'
												chatRoom += '<div class="mes-col2"><div><div class="send-time">' + strTime + '</div></div></div>'
											}
										})
										chatRoom += '</div>';
										chatRoom += '</li>';

									} else {
										$("#message").attr("grouproom", groupList.groupId)
									}

								})
								chat.innerHTML = chatRoom;

							}
						})
					}

					// 	$(document).ready(function() {
					// 		let websocket=null;
					// 		if ('WebSocket' in window) { // 浏览器支持 WebSocket
					// 	websocket = new WebSocket("ws://localhost:8080/webSocket/" + username); // 打开一个 web socket
					// }
					// 	})
					let websocket = null;
					if ("${loginUser.account}" != null) {
						// console.log("userId" + "${loginUser.id}")

						if ('WebSocket' in window) { // 浏览器支持 WebSocket
							websocket = new WebSocket("ws://localhost:8080/webSocket/${loginUser.account}"); // 打开一个 web socket‘
							// console.log("${loginUser.account}")
							// console.log(websocket)
						}

					}
					websocket.onmessage = function (event) {
						var data = JSON.parse(event.data);
						// if (data.to == 0) { //上线消息
						// 	if (data.text != username) {
						// 		$("#users").append('<a href="#" onclick="talk(this)" class="list-group-item">' + data.text + '</a>');
						// 		$("#log-container").append("<div class='bg-info'><label class='text-danger'>" + data.from + "&nbsp;" + data.date + "</label><div class='text-success'>" + data.text + "上线了" + "</div></div><br>");
						// 		scrollToBottom();
						// 	}
						// } else if (data.to == -2) { //下线消息
						// 	if (data.text != username) {
						// 		$("#users > a").remove(":contains('" + data.text + "')");
						// 		$("#log-container").append("<div class='bg-info'><label class='text-danger'>" + data.from + "&nbsp;" + data.date + "</label><div class='text-success'>" + data.text + "下线了" + "</div></div><br>");
						// 		scrollToBottom();
						// 	}
						// } else { // 普通消息
						if (data.to == 0) {
							$("#onlineCount>span").text("線上人數: " + data.text)

						} else if (data.to == -2) {
							$("#onlineCount>span").text("線上人數: " + data.text)
						} else if (data.to == 4) {
							console.log("account" + data.text)
							$("div[account='" + data.text + "']").css({
								"border": "2px solid lightgreen",
								"border-width": "0 4px 0 0"
							})



						} else if (data.type == 1) {
							if ($("#message").children().length == 0) {

								$("#remind").show("shake", 700);
								$("#removeRemind").unbind();
								$("#removeRemind").click(function () {
									$(this).parent().hide("fold", {
										direction: "down"
									}, "slow");

								})
								console.log("messagefalse")
							} else {
								$("#message").append('<li class="recive" messageId="' + data.messageId + '"><img src="' + data.from + '"style="width: 35px; height: 35px; border-radius: 50%; display: flex; float: left; margin-top: 10px" /><div><span style="display:flex">' + data.text + '</span><span>' + getTime(new Date()) + '</span></div></li>');

							}
						} else {
							$("li[messageId='" + data.messageId + "'] > div span:first-child").text(null)
							$("li[messageId='" + data.messageId + "'] > div span:first-child").append(data.text)
						}


					}
					// };



					let base64String = "WW91IGNhdGNoZWQgbWUh"
					// atob() 解碼
					atob(base64String)
					// 輸出: "You catched me!"
					// 預覽圖片，將取得的files一個個取出丟到convertFile()
					function previewFiles(files) {
						if (files && files.length >= 1) {
							$.map(files, file => {
								convertFile(file)
									.then(data => {
										// console.log(data) // 把編碼後的字串輸出到console
										showPreviewImage(data, file.name)
									})
									.catch(err => console.log(err))
							})
						}
					}

					// 使用FileReader讀取檔案，並且回傳Base64編碼後的source
					function convertFile(file) {
						return new Promise((resolve, reject) => {
							// 建立FileReader物件
							let reader = new FileReader()
							// 註冊onload事件，取得result則resolve (會是一個Base64字串)
							reader.onload = () => { resolve(reader.result) }
							// 註冊onerror事件，若發生error則reject
							reader.onerror = () => { reject(reader.error) }
							// 讀取檔案
							reader.readAsDataURL(file)
						})
					}

					// 在頁面上新增<img>
					function showPreviewImage(src, fileName) {
						let image = new Image(250) // 設定寬250px
						image.name = fileName
						image.src = src // <img>中src屬性除了接url外也可以直接接Base64字串
						$("#previewDiv").append(image)
						// .append(`<p>File: ${image.name}`)
					}

					// 當上傳檔案改變時清除目前預覽圖，並且呼叫previewFiles()
					$("#dragArea").change(function () {
						$("#previewDiv").empty() // 清空當下預覽
						previewFiles(this.files) // this即為<input>元素
					})

					// dragover事件：拖曳(滑鼠還沒鬆開)至放置區時，就要先防止瀏覽器進行開圖
					$("#dragArea").on("dragover", function (e) {
						e.preventDefault()
					})

					// 當拖曳區發生drop事件時，接受格式為image的資料
					$("#dragArea").on("drop", function (e) {
						// 防止事件傳遞及預設事件發生
						e.stopPropagation()
						e.preventDefault()
						// 取得data type為image/*的資料
						e.originalEvent.dataTransfer.getData("image/*")
						let files = e.originalEvent.dataTransfer.files
						// console.dir(files) // 看看File長什麼樣子
						$("#previewDiv").empty() // 清空當下預覽
						previewFiles(files)
					})

					//客服系統
					// $("#master-nav ul li img").click(function () {
					// 	setTimeout(() => showMessages(), 300)

					// 	// setTimeout(() => controllMessage(), 1000)
					// 	$(".back-arrow").unbind();
					// 	setTimeout(() => backArrow(), 1000)
					// })
				</script>
			</body>

			</html>