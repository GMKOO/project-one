<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/board.css">
</head>
<body>
	<h1>board</h1>
	<img alt="" src="./img/3.jpeg" height="100px">
	<a href="./index"> index로 가기</a>
	

		<table>
	<tr>
		<th>번호 </th>
		<th>제목 </th>
		<th>글쓴이 </th>
		<th>날짜 </th>
		<th>조회수 </th>
	</tr>
	<c:forEach items="${list }" var="row"   > 
	<!--onclick 자바스크립트 페이지이동, url?파라미터=값  -->
	<tr onclick="location.href='./detail?bno=${row.bno }'">
		<td class="td1">${row.bno }</td>
		<td class="title">${row.btitle }</td>
		<td class="td1">${row.bwrite }</td>
		<td class="td2">${row.bdate }</td>
		<td class="td1">${row.blike }</td>
	</tr>
		
		</c:forEach>
	</table>
	
	
	
			
</body>
</html> 