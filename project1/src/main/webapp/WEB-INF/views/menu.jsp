<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

function toggleDropdown() {
    var dropdownContent = document.querySelector(".dropdown-content");
    dropdownContent.style.display = (dropdownContent.style.display === "block") ? "none" : "block";
}

function openLoginPage() {
	
	
	var newWindow = window.open("./login", "_blank","width=500, height=600,top=200,left=700");

   // newWindow.onunload = function() {
       // newwindow.location.reload(); // 기존 창 새로고침


 }



	
</script>
<link rel="stylesheet" href="./css/menu.css">

	<a class="ul2" onclick="toggleDropdown()"> Menu
			<div class="dropdown-content">
				<a class="a1" href="#">항목 1</a>
				 <a class="a1" href="#">항목 2</a>
				  <a class="a1" href="#">항목 3</a>
			</div>
		</a>
<nav>
	<ul>
		<li onclick="link('')">Main</li>
		<li onclick="link('board')">Board</li>
	
		<li onclick="link('mooni')">:D</li>



		<c:choose>
			<c:when test="${sessionScope.mname eq null }">
				<li class="log1" onclick="openLoginPage()">Login</li>
			</c:when>
			<c:otherwise>
				<li class="log2"  onclick="link('myInfo')">${sessionScope.mname }님 반갑습니다.</li>
				<li class="log1"  onclick="link('logout')">로그아웃</li>
			</c:otherwise>
		</c:choose>

		<!--  <li onclick="link('notice')">Notice</li>-->

	</ul>
</nav>

<script>
	function link(url) { 
		location.href="./"+url;
		
	}
	
	
	
	</script>





