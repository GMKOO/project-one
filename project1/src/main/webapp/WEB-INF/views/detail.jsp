<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="./css/detail.css">
<script src="./js/jquery-3.7.0.min.js"> </script>
<script type="text/javascript">

function del() {
	let chk = confirm("삭제하시겠습니까?"); //참 거짓으로 나옵니다
	
	
	if(chk) {
		location.href="./delete?bno=${dto.bno}";
		
	}
	
}

function cdel(cno) {

	
	
	if(confirm("수정하시겠습니까?")) {
		location.href="./cdel?bno=${dto.bno}&cno="+cno;
		
	}
	
}// 댓글삭제 버튼 만들기 = 반드시 로그인 하고, 자신의 글인지 확인하는 검사 구문필요.

function edit() {
	
	if(confirm("수정하시겠습니까?")) {
		location.href="./edit?bno=${dto.bno}";
	}
}

function cedit() {
	
	if(confirm("수정하시겠습니까?")) {
		location.href="./edit?bno=${dto.bno}";
	}
}
// 댓글 수정 버튼 만들기 = 반드시 로그인하고, 자신의 글인지 확잉ㄴ하는 검사 구문 필요.
//자바 , jstl , el 태그가 먼저 동작된다 . > 자바스크립 html 등등 나중에 실ㄹ행 

$(function(){
	$(".commentBox").hide();
	$("#openComment").click(function(){
		$(".commentBox").show('slow');
		$("#openComment").remove();
	});
	
	//댓글 삭제 다른 방법
	$(".cdel").click(function(){
		if(confirm("삭제하시겠습니까?")) {
		let cno= $(this).parent().siblings(".cid").text();
	//	location.href="./cdel?bno=${dto.bno}&cno=" +cno;
		
	$.ajax({
		
		url:"./cdelR",
		type:"post",
		data: {bno:${dto.bno},cno: cno},
		dataType: "json",
		success: function(data){
			
			alert(data);
		},
		error:function(error){
			alert("에러가 발생했습니다" + error);
		}
		
		
	});

		}
	});
	
	
});
</script>
</head>

<body>
	<%@ include file="menu.jsp"%>

	<!-- 2023-07-18 / 데이터베이스 구현 / 메뉴만들기, 글쓰기 -->
	<div class="detail-content">
		<div class="title">
			${dto.bno } / ${dto.btitle }

			<c:if
				test="${sessionScope.mid ne null && sessionScope.mid eq dto.m_id }">

				<img class="update2" alt="" src="./img/update2.png" onclick="edit()"> &nbsp;
		 <img class="delete2" alt="" src="./img/delete2.png" onclick="del()">

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


	<h1 class="h1">comment</h1>
	<div class="commentsList">
		<c:choose>
			<c:when test="${fn:length(commentsList) gt 0}">
				<div class="comments">
					<c:forEach items="${commentsList }" var="c">
		<div class="comment">
						<div class="commentHead">
							<div class="cname">${c.m_name }(${c.m_id })
							
								<c:if test="${sessionScope.mid ne null && sessionScope.mid eq c.m_id }">
							
								<img class="update2" alt="" src="./img/update2.png" onclick="cedit(${c.c_no })"> &nbsp;
								 <img class="cdel" alt="" src="./img/delete2.png"  onclick="cdel1(${c.c_no })">
								 
								 </c:if>
								 </div>
							<div class="cdate">${c.c_date }</div>
							<div class="cid">${c.c_no }</div>
						</div>
						<div class="commentBody">${c.c_comment }</div> 
					</div>			
				</c:forEach>
			</div>
			</c:when>
			<c:otherwise>
				<div><h2>댓글이 없습니다.</h2></div>
			</c:otherwise>
		</c:choose>
		</div>
		<c:if test="${sessionScope.mid ne null }">
		<button type="button" id="openComment">댓글창 열기</button>
		<div class="commentBox">
			<form action="./comment" method="post">
				<textarea id="commenttextarea" name="comment" placeholder="댓글을 입력하세요"></textarea>
				<button type="submit" id="comment">글쓰기</button>
				<input type="hidden" name="bno" value="${dto.bno }">
			</form>
		</div>
		</c:if>
	</div>
	

</body>

</html>