<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<link rel="stylesheet" href="./css/write.css">
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>

<body>
<%@ include file="menu.jsp" %>

<!-- 2023-07-18 / 데이터베이스 구현 / 메뉴만들기, 글쓰기 -->
		<h1>글수정</h1>
		${dto.bno }/ ${dto.btitle } / ${dto.bcontent } / ${dto.bdate } 
	<div class="write-div">
	
	<form action="./edit" method="post">
		<input type="text" name="btitle" value="${dto.btitle }">
		
	
		<textarea id="summernote" name="bcontent"> ${dto.bcontent }</textarea>

		<button class="btn100" type="submit" > 글수정 </button>
		<input type="hidden" name= "bno" value = "${dto.bno }"> 
		</form>	
	
	</div>
	
	
	
	
	<script type="text/javascript">
	/* JQyery문법 : 문서가 모두 로딩되었다면, 익명함수를 실행하세요*/
	$(document).ready(function() {
  $('#summernote').summernote();
  
  	height : 400 
  	
  
});
</script>
</body>
</html>