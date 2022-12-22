<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>約約-註冊頁面</title>
<!-- <link rel="stylesheet" href="/join666/css/signup2.css"> -->
<style type="text/css">
* {
	font-family: 微軟正黑體;
}

b {
	color: red;
}

body {
	background-color: white;
}

#account, #password, h3, #fullname, #comfirm_password, #username,
	#password, #birth, #sex, #e-mail, #phone, #address, .fullname {
	width: 200px;
	height: 20px;
	margin: 10px;
	color: black;
}

h5 {
	margin: 20px;
	color: #a3a2a3;
}

h5:hover {
	color: black;
}

#container1 {
	margin: 50px;
	padding: 10px;
	width: 230px;
	height: 400px;
	background-color: white;
	border-radius: 5px;
	border-top: 10px solid #31C1DD;
	box-shadow: 0 0px 70px rgba(0, 0, 0, 0.1);
	/*定位對齊*/
	position: relative;
	margin: auto;
	top: 100px;
	text-align: center;
}

#container2 {
	margin: 50px;
	padding: 10px;
	width: 230px;
	height: 350px;
	background-color: white;
	border-radius: 5px;
	border-top: 10px solid #31C1DD;
	box-shadow: 0 0px 70px rgba(0, 0, 0, 0.1);
	/*定位對齊*/
	position: relative;
	margin: auto;
	top: 100px;
	text-align: center;
}

.system_name {
	/*定位對齊*/
	position: relative;
	margin: auto;
	top: 100px;
	text-align: center;
}

.submit {
	color: white;
	background: #31C1DD;
	width: 200px;
	height: 30px;
	margin: 10px;
	padding: 5px;
	border-radius: 5px;
	border: 0px;
}

.submit:hover {
	background: #31C1DD;
}

#container2 {
	visibility: hidden;
	/*剛開始消失*/
	height: 600px;
}

#copyright {
	text-align: center;
	color: #31C1DD;
	margin: -200px 0px 0px 0px;
	font-size: 14px;
}

input, button {
	padding: 5px;
	border: none;
	border: solid 1px #ccc;
	border-radius: 5px;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/layout/navbar.jsp" />
	<form action="/insertMember" id="form1" method="post">
		<div class="signup_page">
			<div id="container2">

				<div class="signup">

					<h3>請輸入個人資料</h3>

					<%-- 				<form action="/insertMember" id="form2" method="post"> --%>
					<input type="text" id="name" class="fullname" name="name"
						placeholder="暱稱" required>
					<div class="tab"></div>
					<input type="date" id="birth" name="birth" placeholder="出生日期"
						required>
					<div class="tab"></div>
					<input type="tel" id="phone" name="phone" placeholder="電話" required>
					<div class="tab"></div>
					<input type="text" id="address" name="address" placeholder="地址"
						required>
					<div class="tab"></div>
					<div style="text-align: left; margin-left: 10px" id="gen">
						<label id="gen">性別:</label> <input type="radio" id="gender"
							name="gender" value="1" checked>男 <input type="radio"
							id="gender" name="gender" value="2">女
					</div>
					<div class="tab"></div>

					<button type="submit" class="submit" id="submitBoth">註冊</button>
					<button class="submit" id="lastBtn">上一步</button>

				</div>
			</div>
		</div>
	</form>
</body>

<script type="text/javascript">
					const account = $("#account");
					const password = $("#password");
					const comfirm_password = $("#comfirm_password");
					const accLabel = $("#accLabel");
					const pwdLabel = $("#pwdLabel");
					const comfirmPwdLabel = $("#comfirmPwdLabel");
					const nextBtn = $("#nextBtn");
					const lastBtn = $("#lastBtn");
					const submitBoth= $("#submitBoth");
					
					let flag1 = false;
					let flag2 = false;
					let flag3 = false;

					account.keyup(function () {

						checkAll()
					})

					password.keyup(function () {

						checkAll()
					})

					comfirm_password.keyup(function () {

						checkAll()
					})
					
				


					function checkAll() {

						let rex = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
						let accValue = account.val();

						if (!rex.test(accValue)) {
							accLabel.html("<font color='red' size='-1'>請輸入正確格式</font>");
							flag1 = false
						}

						if (rex.test(accValue)) {
							let formData = new FormData();
							formData.append("account", accValue)
// 							console.log(formData)
							fetch("${contextRoot}/CheckAcc", { method: "POST", body: formData }).then(result => result.text()).then(message => {
								if (message == "帳號重複") {
									accLabel.html("<font color='red' size='-1'>帳號重複</font>");
									flag1 = false
								}
								if (message == "此帳號可用") {
									accLabel.html("<font color='red' size='-1'>此帳號可用</font>");
									flag1 = true
								}
							})
						}

						rex = /^[a-zA-Z0-9]+$/;
						let pwdValue = password.val();
						if (!rex.test(pwdValue)) {
							pwdLabel.html("<font color='red' size='-1'>請輸入正確格式</font>");
							flag2 = false
						}

						if (rex.test(pwdValue)) {
							pwdLabel.html("<font color='red' size='-1'>密碼格式正確</font>");
							flag2 = true
						}


						if (password.val() !== comfirm_password.val()) {
							comfirmPwdLabel.html("<font color='red' size='-1'>兩次密碼不相符</font>");
							flag3 = false
						}

						if (password.val() == comfirm_password.val()) {
							comfirmPwdLabel.html("<font color='red' size='-1'>二次驗證正確</font>");
							flag3 = true
						}

						checkFlag();

					}


					function checkFlag() {
						if (flag1 && flag2 && flag3) {
							nextBtn.removeAttr("disabled");
							nextBtn.attr("style","background-color:#31C1DD")
							console.log("disabled"+flag1+","+flag2+","+flag3)
						} else {
							nextBtn.attr("disabled", "")
							nextBtn.attr("style","background-color:gray")
							console.log("undisabled"+flag1+","+flag2+","+flag3)
						}
					}

					

					$("#cancel").click(function(event) {
						event.preventDefault(); //取消預設行為
						location.href='https://localhost:8080/index';
						window.history.back(); //返回上一頁
						})

				</script>

</html>