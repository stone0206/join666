<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="Zh-Hant-TW">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${contextRoot}/css/chatStyle.css" />
    

    
    <!-- Latest compiled and minified CSS -->
    
<!--    這個會出事 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<%--     <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" /> --%>
    
<!--     Latest compiled and minified JavaScript -->
<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" -->
<!--         integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" -->
<!--         crossorigin="anonymous"></script> -->
<%--     <script src="${contextRoot}/js/jquery-3.6.1.min.js"></script> --%>
<!--     jqueryUI -->
<!--     <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!--     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> -->
<%--     <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script> --%>
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" 
         integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" 
         crossorigin="anonymous"></script> 
         <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
        
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>

    <div>
        <div class="container text-center">
            <div class="row">

<!--                 <div class="chatHeight"> -->
<!--                     <div class="chatImg"> -->

<%--                         <a href="#" id="addClass"><img class="chatImg1" src="${contextRoot}/images/customer.png" /></a> --%>
<!--                     </div> -->

                    <div class="chatImg">
                        <a href="#" id="addFriendTable"><img class="chatImg2" src="${contextRoot}images/friendChat.png" /></a>

                    </div>
                </div>






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
                            <img src="images/IMG_7052.png" alt="">
                        </div>
                        <div>Yousef Sami</div>
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
                                <use xlink:href="#gentle-wave" x="50" y="0" fill="rgba(255, 255, 255, 0.48)" />
                                <use xlink:href="#gentle-wave" x="50" y="3" fill="rgba(255, 255, 255, 0.78)" />
                                <use xlink:href="#gentle-wave" x="50" y="6" fill="rgba(255, 255, 255, 0.8)" />
                            </g>
                        </svg>
                    </div>
                    <div id="closeFriendTable">
                        <button data-widget="remove" id="removeClass1" class="chat-header-button " type="button"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-power" viewBox="0 0 16 19">
  							<path d="M7.5 1v7h1V1h-1z"/>
  							<path d="M3 8.812a4.999 4.999 0 0 1 2.578-4.375l-.485-.874A6 6 0 1 0 11 3.616l-.501.865A5 5 0 1 1 3 8.812z"/>
							</svg></button>
                    </div>
                </div>
                <div class="content-wrapp">
                    <div class="nav-group">
                        <nav id="master-nav">
                            <ul>
                                <li><i class="material-icons">perm_identity</i></li>
                                <li class="active"><i class="material-icons">chat_bubble_outline</i></li>
                                <li><i class="material-icons">favorite_border</i></li>
                                <li><i class="material-icons"><img src="${contextRoot}/images/customer.png" style="width:30px;margin-bottom:15px" /></i></li>
                                <li id="active-line"></li>
                            </ul>
                        </nav>
                    </div>

                    <!-- 聯絡人好友 -->
                    <div id="master-nav-items" data-viewport="true" style="margin:0px 0px">
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
                                <ul class="touch-y">
                                    <li>
                                        <div class="sender-image">
                                            <img
                                                src="https://raw.githubusercontent.com/yousefsami/social-app-assets/master/user1.jpg">
                                        </div>
                                        <div class="mes-detail">
                                            <div class="mes-col1">
                                                <div class="sender-name">
                                                    Masome Sami
                                                </div>
                                                <div class="mes-preview">
                                                    Hi how are you ?
                                                    <br>
                                                    What's your name?
                                                </div>
                                            </div>
                                            <div class="mes-col2">
                                                <div>
                                                    <div class="send-time">10:26 AM</div>
                                                    <div class="mes-seen-status"><i class="material-icons">done_all</i>
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
                                                <div class="sender-name">
                                                    Reza Sami
                                                </div>
                                                <div class="mes-preview">
                                                    Where are you from ...
                                                </div>
                                            </div>
                                            <div class="mes-col2">
                                                <div>
                                                    <div class="send-time">9:00 AM</div>
                                                    <div class="mes-seen-status"><i class="material-icons">done_all</i>
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
                                                <div class="sender-name">
                                                    یوسف سامی
                                                </div>
                                                <div class="mes-preview">
                                                    Lorem ipsum a plane text
                                                </div>
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
                                                <div class="sender-name">
                                                    Ali Torabi
                                                </div>
                                                <div class="mes-preview">
                                                    Hey i'm here
                                                </div>
                                            </div>
                                            <div class="mes-col2">
                                                <div>
                                                    <div class="send-time">Sun</div>
                                                    <!--<div class="mes-seen-status"><i class="material-icons">done_all</i></div>-->
                                                </div>
                                                <!--<span class="mes-count">3</span>-->
                                            </div>
                                        </div>
                                    </li>


                                </ul>
                            </div>
                        </div>



                        <!-- 愛心 -->
                        <div id="item-3">
                            <div class="touch-y activity">
                                <i class="material-icons">sentiment_dissatisfied</i>
                                <h1>Sorry !</h1>
                                <p>You don't have any Activity</p>
                            </div>
                        </div>
                        <div id="item-4">
                            <div class="profile-setting">
                                <div class="touch-y">
                                    <div class="information">
                                        <div class="public">
                                            <p>
                                                PUBLIC INFORMATION
                                            </p>
                                            <div class="form-group">
                                                <span>
                                                    <i class="material-icons">assignment_ind</i>
                                                </span>
                                                <input type="text" placeholder="USERNAME" value="@yousefsami">
                                            </div>
                                            <div class="form-group">
                                                <span>
                                                    <i class="material-icons">face</i>
                                                </span>
                                                <input type="text" placeholder="NAME" value="Yousef Sami">
                                            </div>
                                            <div class="form-group">
                                                <span>
                                                    <i class="material-icons">public</i>
                                                </span>
                                                <input type="text" placeholder="WEB SITE">
                                            </div>
                                            <div class="form-group h-80">
                                                <span>
                                                    <i class="material-icons">info</i>
                                                </span>
                                                <textarea placeholder="BIO" rows="3"></textarea>
                                            </div>
                                        </div>
                                        <div class="private">
                                            <p>
                                                PRIVATE INFORMATION
                                            </p>
                                            <div class="form-group">
                                                <span>
                                                    <i class="material-icons">local_post_office</i>
                                                </span>
                                                <input type="text" placeholder="EMAIL" value="yousef.sami19@gmail.com">
                                            </div>
                                            <div class="form-group">
                                                <span>
                                                    <i class="material-icons">fingerprint</i>
                                                </span>
                                                <input type="text" placeholder="PASSWORD">
                                            </div>
                                            <div class="form-group">
                                                <span>
                                                    <i class="material-icons">phone</i>
                                                </span>
                                                <input type="text" placeholder="PHONE NUMBER">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- 使用者回覆 -->
            <!-- @send message view -->
            <div class="view-message">
                <div class="status-bar">
                    <div class="back-arrow">
                        <i class="material-icons">navigate_before</i>
                    </div>
                    <div class="sender-name">Yousef Sami</div>
                </div>
                <div class="messages-area" data-viewport="true">
                    <ul class="touch-y">
                        <li class="recive">
                            <div>
                                Hi dear welcome
                                <span>12:08 PM</span>
                            </div>
                        </li>
                        <li class="sent">
                            <div>
                                Hi how are you?
                                <br />
                                what's up?
                                <span>12:11 PM</span>
                            </div>
                        </li>
                        <li class="sent">
                            <div>
                                Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and
                                printing
                                in place of English to emphasise design elements over content
                                <span>1:11 PM</span>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="text-media-area">
                    <div class=message-form>
                        <button id="send-message"><i class="material-icons">send</i></button>
                        <input id="message-text" type="text" placeholder="Type Something + Enter">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    	
        // 客服動畫
        var customerWidth = 90;
        $(".chatImg1").click(function () {
            $(".chatImg1").addClass("box")

        })
        //跳出收回客服聊天視窗
        $(function () {
            $("#addClass").click(function () {
                //延遲跳出時間
                window.setTimeout(addCustomer, 300)
            });

            function addCustomer() {

                // $(".popup-box-on").show(200)
                // $(".popup-box-on").show("show", { direction: "right" }, 3000);
                //顯示客服方式
                $(".popup-box-on").show("fold", 800);

                $(".chatImg1").removeClass("box1");
            }

            $("#removeClass").click(function () {
                // $('#qnimate').hide('popup-box-on');
                // $(".popup-box-on").hide(200)
                $(".popup-box-on").hide("fold", { direction: "down" }, "slow");
                setTimeout(function () {
                    $(".chatImg1").removeClass("box")
                    $(".chatImg1").addClass("box1");
                }, 600);
                // $(".chatImg1").removeClass("box")
                // $(".chatImg1").addClass("box1")
            });
        })





        $(document).ready(function () {
            var distX = 0, distY = 0;
            var viewportX, viewportY;


            // 上拉下拉
            $(document).on('mousedown touchstart ', '.touch-y', function (e) {
                var $ele = $(this);
                viewportY = (-1 * $ele.height()) + viewport($ele).height();
                var startY = e.pageY || e.originalEvent.touches[0].pageY;
                var currentY = parseFloat($ele.css('transform').split(',')[5]);
                $(document).on('mousemove touchmove', function (e) {
                    e.preventDefault();
                    var y = e.pageY || e.originalEvent.touches[0].pageY;
                    distY = y - startY;
                    if (currentY) {
                        distY += currentY;
                    }
                    if (distY > 3 || distY < (-3)) {
                        $(".messages-list > ul > li").off('click');
                    }
                    $ele.css('transform', 'translateY(' + distY + 'px)');
                    if (distY > 0 || distY < viewportY) {
                        if (viewport($ele).find('.viewportShadow').length == 0)
                            viewport($ele).append('<span class="viewportShadow"></span>');
                    }
                    if (distY > 0) {
                        viewport($ele).find('.viewportShadow').css({
                            'top': '-5px',
                            'box-shadow': '0px 0px 140px ' + distY / 5 + 'px rgba(255,183,0,0.8)'
                        });
                    } else if (distY < viewportY) {
                        viewport($ele).find('.viewportShadow').css({
                            'bottom': '-5px',
                            'box-shadow': '0px 0px 140px ' + ((-1 * distY) + viewportY) / 5 + 'px rgba(255,183,0,08)'
                        });
                    }
                });
                $(document).on('mouseup touchend', function () {
                    $(document).off('mousemove touchmove mouseup touchend');
                    if (!distY) return;
                    if (distY > 0) {
                        $ele.css('transform', 'translateY(0)').addClass("reset");
                        viewport($ele).find('.viewportShadow').css('box-shadow', '0 0 0 rgba(255,183,0,.5)');
                    } else if (distY < viewportY) {
                        if ($ele.height() > viewport($ele).height()) {
                            $ele.css('transform', 'translateY(' + viewportY + 'px)').addClass("reset");
                        } else {
                            $ele.css('transform', 'translateY(0)').addClass("reset");
                        }
                        viewport($ele).find('.viewportShadow').css('box-shadow', '0 0 0 rgba(255,183,0,.5)');
                    }
                    setTimeout(function () {
                        $ele.removeClass("reset");
                        viewport($ele).find('.viewportShadow').remove();
                        $(".messages-list > ul > li").bind('click', showMessages);
                    }, 400);
                });
            });

            // 上拉下拉程式呼叫
            // Get viewport
            function viewport(ele) {
                return ele.closest('[data-viewport="true"]');
            }




            // nav control
            var $el, leftPos, newWidth,
                $mainNav = $("#master-nav ul");
            var $active_line = $("#active-line");
            $active_line.css("left", $("#master-nav ul .active").position().left);
            navItemPos($("#master-nav ul .active").index());

            // 點擊選項功能    
            $("#master-nav ul li").click(function () {
                $el = $(this);
                $("#master-nav ul li").removeClass('active');
                $el.addClass('active');
                navItemPos($el.index());
                leftPos = $el.position().left;
                newWidth = $el.parent().width();
                $active_line.stop().animate({
                    left: leftPos
                });
            });


            function navItemPos(index) {
                $("#master-nav-items > div").removeClass("active after before");
                $("#master-nav-items > div").eq(index).addClass("active");
                $("#master-nav-items > div").eq(index).nextAll().addClass("after");
                $("#master-nav-items > div").eq(index).prevAll().addClass("before");
            }
            $(".messages-list > ul > li").bind('click', showMessages);
            function showMessages() {
                $('.view-main').addClass("deactive");
                $('.view-message').addClass("active");
            }
            $(".back-arrow").click(function () {
                $('.view-main').removeClass("deactive");
                $('.view-message').removeClass("active");
            })

            $("#send-message").click(sendMassage);
            $(document).keyup(function (e) {
                if (e.which == 13 && $('.view-message').hasClass("active")) {
                    sendMassage();
                }
            })
            function sendMassage() {
                var date = new Date();
                var message = $("#message-text").val();
                $("#message-text").val("");
                var messageItem = "<li class='sent goto'><div>" + message + "<span>" + getTime(date) + "</span></div></li>";
                $(".messages-area > ul").append(messageItem);
                setTimeout(function () {
                    $(document).find(".goto").removeClass("goto");
                    systemMessage(date);
                    messageScrollFix();
                }, 50);
            }

            // 自動回覆
            // function systemMessage(date) {
            //     var messages = [
            //         "Hi my name is yousef sami",
            //         "سلام خوبی؟",
            //         "If you want contact with me please send email to this address <br/> 'yousef.sami19@gmail.com'",
            //         "Thank you for watching this pen"
            //     ]
            //     setTimeout(function () {
            //         var messageItem = "<li class='recive'><div>" + messages[parseInt(Math.random(1, 4) * 4)] + "<span>" + getTime(date) + "</span></div></li>";
            //         $(".messages-area > ul").append(messageItem);
            //         messageScrollFix();
            //     }, 1500);
            // }
            function getTime(date) {
                var hours = date.getHours();
                var minutes = date.getMinutes();
                var ampm = hours >= 12 ? 'PM' : 'AM';
                hours = hours % 12;
                hours = hours ? hours : 12;
                minutes = minutes < 10 ? '0' + minutes : minutes;
                var strTime = hours + ':' + minutes + ' ' + ampm;
                return strTime;
            }
            function messageScrollFix() {
                setTimeout(function () {
                    var mes_hieght = parseInt($(".messages-area > ul").height());
                    var viewportHeight = parseInt($(".messages-area").height());
                    if (mes_hieght > viewportHeight)
                        $(".messages-area > ul").css("transform", "translateY(" + ((viewportHeight - mes_hieght) - 10) + "px)");
                }, 100);
            }
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
                $(".app-wrapp").show("fold", 800);
                $(".chatImg2").removeClass("FriendBox1");
            }
            好友聊天關閉


        });
        // 好友聊天關閉 為何不能放在ready裡
        $("#closeFriendTable").click(function () {

            $(".app-wrapp").hide("fold", { direction: "down" }, "slow");
            setTimeout(function () {
                $(".chatImg2").removeClass("FriendBox")
                $(".chatImg2").addClass("FriendBox1");
            }, 600);


        });
    </script>
</body>

</html>