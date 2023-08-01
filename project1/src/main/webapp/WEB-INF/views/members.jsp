<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원게시판</title>
<link rel="stylesheet" href="./css/members.css">
<link rel="stylesheet" href="./css/menu.css">
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="board-div">
<h1>회원게시판</h1>
<c:forEach items = "${list }"  var = "m">
${m_no } / ${m_id } / ${m_name} / ${m_birth } / ${m_mbti } / ${m_gender } <br>
</c:forEach>
</div>

</body>
</html>