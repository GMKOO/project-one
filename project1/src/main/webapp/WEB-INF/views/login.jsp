<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/login.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
<html>
<head>
<title>Login</title>
<script type="text/javascript">
	//스크립트 영역
	//호이스팅이 뭐에요? let 현재위치에서 vs var 고정선언 
	// json? const 알고있어야된답니다...
	// ajax

	function checkID() {

		//alert("!");

		let msg = document.getElementById("msg");
		//msg.innerHTML = "<p>" + document.getElementById("id").value + " 아이디를 변경했습니다. </p>"
	}

	function check() {
		//alert("!");
		let id = document.getElementById("id");

		let msg = document.getElementById("msg");

		if (id.value.length < 1) {

			alert("아이디는 2글자 이상이어야 합니다");
			msg.innerHTML = text;
			id.focus();
			return false; // 
		}

		if (pw.value.length < 8) {

			alert("비밀번호는는 8글자 이상이어야 합니다");
			pw.focus();
			return false;
		}
		document.fm.submit();
		/* alert(id.value);//1234  */
		/* alert(id.value.length); // 4 */

	}

	//Jquery
	$(function() {
		$(".login").click(function() {
			let id = $("#id").val();
			let pw = $("#pw").val();
			if (id.length < 2) {
				alert("아이디를 입력하세요111111");
				$("#id").focus();
			} else {
				if (pw.length < 5) {
					alert("암호를 입력하세요.");
					$("#pw").focus();
				} else {
					//아이디하고 암호하고 정확하게 입력되었습니다.
					let form = $("<form></form>");
					form.attr("method", "post");
					form.attr("action", "./login");
					form.append($("<input/>", {
						type : "hidden",
						name : "id",
						value : id
					}));
					form.append($("<input/>", {
						type : "hidden",
						name : "pw",
						value : pw
					}));
					form.appendTo("body");
					form.submit();

				}
			}
		});
	});
</script>
</head>
<body>

	<img class="container" src="img/123.jpg" alt="" width=100%;
		height=100%;>
	<!--onsubmit="return check()">  -->

	<form name="fm" action="./login" method="post"></form>
	<input class="input1" name="id" id="id" type="text" placeholder="아이디"
		required="required" maxlength="20" onchange="checkID()">


	<input class="input2" name="pw" id="pw" type="password"
		placeholder="비밀번호" required="required" maxlength="20">
	<a href="./join" class="a1">회원가입</a>
	<a href="./login" class="a2">아이디/비밀번호 찾기</a>
	
	<button type="button" class="login" onclick="check()">로그인</button>
	<span id="msg">1</span>
<!--<div class="login-box"  선생님꺼>
			<div class="login-image">
				<img alt="logo" src="./img/robot.png" height="150px">
			</div>
			<div class="login-form">

				<form action="./login" method="post" onsubmit="return check()"></form>


				<input type="text" name="id" id="id" placeholder="ID"
					required="required" maxlength="10" onchange="checkID()"> <input
					type="password" name="pw" id="pw" placeholder="PW"
					required="required" maxlength="15">
				<button type="submit" class="login">LOGIN</button>
				<span id="msg"></span> 아이디 찾기 | 비밀번호 찾기 | <a href="./join">회원가입</a>
			</div> -->







</body>

<script type="text/javascript">
	function openLoginPage() {

		var newWindow = window.open("./login", "_blank",
				"width=500, height=600,top=200,left=700");

		newWindow.onunload = function() {
			newwindow.location.reload(); // 기존 창 새로고침
		};

	}
</script>

</html>