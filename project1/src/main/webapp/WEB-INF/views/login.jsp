<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/login.css">
<html>
<head>


</head>
<title>Login</title>






<body>

	<img class="container" src="img/123.jpg" alt="" width=100%;
		height=100%;>


	<form action="./login" method="post">
		<input class="input1" name="id" type="text" placeholder="아이디"
			required="required" maxlength="20"> <input class="input2"
			name="pw" type="password" placeholder="비밀번호" required="required"
			maxlength="20"> <a href="./login" class="a1">회원가입</a> <a
			href="./login" class="a2">아이디/비밀번호 찾기</a>
		<button>로그인</button>
	</form>





</body>

<script type="text/javascript">

function openLoginPage() {
    var newWindow = window.open("./login", "_blank","width=500, height=600,top=200,left=700");
  
    
    if () {
        newWindow.close();
        window.location.reload();


 if () {
    Window.close();
    window.location.reload(); // 현재 창 새로고침
}

 </script>

</html>