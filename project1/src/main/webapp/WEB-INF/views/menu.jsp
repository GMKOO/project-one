<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function openLoginPage() {
	
	
	var newWindow = window.open("./login", "_blank","width=500, height=600,top=200,left=700");

    newWindow.onunload = function() {
        window.location.reload(); // 기존 창 새로고침
    };

 };



	
</script>
<link rel="stylesheet" href="./css/menu.css">
<nav>
	<ul>
		<li onclick="link('')">Main</li>
		<li onclick="link('board')">Board</li>
		<li class="dropdown">Menu
			<div class="dropdown-content">
				<a href="#">항목 1</a> <a href="#">항목 2</a> <a href="#">항목 3</a>
			</div>
		</li>
		<li onclick="link('mooni')">:D</li>



		<c:choose>
			<c:when test="${sessionScope.mname eq null }">
				<li onclick="openLoginPage()">Login</li>
			</c:when>
			<c:otherwise>
				<li onclick="link('myInfo')">${sessionScope.mname }님반갑습니다.</li>
				<li onclick="link('logout')">로그아웃</li>
			</c:otherwise>
		</c:choose>

		<!--  <li onclick="link('notice')">Notice</li>-->

	</ul>
</nav>
<div style="height: 50px; width: 100%;"></div>
<script>
	function link(url) { 
		location.href="./"+url;
		
	}
	
	
	</script>





