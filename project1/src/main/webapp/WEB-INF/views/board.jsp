<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/board.css">
<script type="text/javascript">
	function linkPage(pageNo){
		location.href = "./board?pageNo="+pageNo;
	}	
</script>
</head>
<body>
<%@ include file="menu.jsp" %>


<div style="color: white;">

		<%-- 길이 검사 : ${fn:length(list) } --%>
		${paginationInfo }
		<c:choose>
			<c:when test="${fn:length(list)  gt 0}"> 
			
			<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list }" var="row">
			<!-- onclick 자바스크립트 페이지 이동, URL?파라미터=값 -->
			<tr onclick="location.href='./detail?bno=${row.bno }'">
				<td class="td1">${row.bno }</td>
				<td class="title">${row.btitle }</td>
				<td class="td1">${row.m_name}</td>
				<td class="td2">${row.bdate }</td>
				<td class="td1">${row.blike }</td>
			</tr>
		</c:forEach>
		
		
	</table>
	<div id="img">
	<ui:pagination paginationInfo = "${paginationInfo}"
	type="text"
	jsFunction="linkPage"/>
	</div>
	</c:when>
			<c:otherwise> <h1>출력할 데이터가 없습니다</h1></c:otherwise>
		</c:choose>
	
	</div>	
	<ul class="actions special">

<!-- 로그인한 이름 : ${sessionScope.mname} / ${sessionScope.mid} -->
<c:if test="${sessionScope.mname ne null}">
	<li ><button onclick="location.href='./write'" class="button"> 글쓰기</button></li>	
	
	</c:if>
</ul>
</body>

<footer>
								<div class="pagination">
									<!--<a href="#" class="previous">Prev</a>-->
									<a onclick=>처음으로</a>&#160;
									<a href="#" class="page active">1</a>
									<a href="#" class="page">2</a>
									<a href="#" class="page">3</a>
									<span class="extra">&hellip;</span>
									<a href="#" class="page">8</a>
									<a href="#" class="page">9</a>
									<a href="#" class="page">10</a>
									<a href="#" class="next">Next</a>
								</div>
							</footer>
</html>