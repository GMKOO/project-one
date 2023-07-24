<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="./css/detail.css">
<script type="text/javascript">

function del() {
	let chk = confirm("삭제하시겠습니까?"); //참 거짓으로 나옵니다
	
	
	if(chk) {
		location.href="./delete?bno=${dto.bno}";
		
	}
	
}

function edit() {
	
	if(confirm("수정하시겠습니까?")) {
		location.href="./edit?bno=${dto.bno}";
	}
}
</script>
</head>
<body>
<%@ include file="menu.jsp" %>

<!-- 2023-07-18 / 데이터베이스 구현 / 메뉴만들기, 글쓰기 -->
	<div class="detail-content">
		<div class="title">
				${dto.bno } / ${dto.btitle }
		
		<c:if test="${sessionScope.mid ne null && sessionScope.mid eq dto.m_id }">
		
		 <img class="update2" alt="" src="./img/update2.png" onclick="edit()"> &nbsp;
		 <img class="delete2" alt="" src="./img/delete2.png" 
		 onclick="del()" >
		 
		  </c:if>
		  
		</div>
		<div class="name-bar">
			<div class="name">${dto.m_name }님</div>
			<div class="like">${dto.blike }</div>
			<div class="date">${dto.bdate }</div>
			<div class="ip">${dto.bip }</div>
		</div>
		<div class="content">${dto.bcontent }</div>
	</div>
	
	
	
	
	
	
</body>
</html>