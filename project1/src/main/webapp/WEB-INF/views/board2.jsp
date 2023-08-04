<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/board.css">
<script src="./js/jquery-3.7.0.min.js"> </script>
<script type="text/javascript">

	$(function(){
		
		let pageNo = 1;

		ajax_call(1);

		let totalCount = 0;
		
		function ajax_call(pageNo) {
			
			$.ajax({
				
				url:"./boardList2",
				type:"get",
				data:{"pageNo": pageNo },
		 		dataType: "json",
				success: function(data){
					
					pageNo= data.pageNo;
					totalCount = data.totalCount;	
					let startPage = pageNo;
					let endPage = pageNo + 9;
			let	list = data.list;
			$(".tableHead").empty();  // 무한증식 막기위해 초기화 시켜버린다
			$(".paging").empty();
			// 	console.log(lists);
				let html = "";
			//alert(list[0].btitle);
		
				$.each(list, function(index){
					html += "<tr>";
					html += "<td>" + list[index].bno+"</td>";
					html += "<td>" + list[index].btitle+"</td>";
					html += "<td>" + list[index].m_name+"</td>";
					html += "<td>" + list[index].bdate+"</td>";
					html += "<td>" + list[index].blike+"</td>";
					html += "</tr>";
				});
				
				$(".tableHead").append(html);
					
			
			//페이징하기 
			//$(".paging").text(data.pageNo + " : " + data.totalCount);
		
			//totalCount 나누기 10 했을때 나머지가 있으면 pages +1 해주세요
			
			let pages = totalCount / 10;
			if(totalCount % 10 != 0){pages += 1;}
			startPage= pageNo;
			endPage =startPage + 10 < pages ? startPage + 9 : pages;
			
		
			
			
			if(pageNo - 10 > 0){
				$(".paging").append("<button class='start'>◀◀</button>");
			}else{
				$(".paging").append("<button disabled='disabled'>◀◀</button>");
			}
			if(pageNo - 1 > 0){
				$(".paging").append("<button class='backward'>◀</button>");
			}else{
				$(".paging").append("<button disabled='disabled'>◀</button>");
			}
			for (let i=startPage; i <= endPage; i++) {
				$(".paging").append("<button type='button' class='page'>" + i + "</button>");
			}
			if(pageNo + 1 < pages){						
				$(".paging").append("<button class='forward'>▶</button>");
			}else{
				$(".paging").append("<button disabled='disabled'>▶</button>");
			}
			if(pageNo + 10 < pages){
				$(".paging").append("<button class='end'>▶▶</button>");
			}else{
				$(".paging").append("<button disabled='disabled'>▶▶</button>");
			}
		},
			error: function(error){
				alert("에러가 발생했습니다. : " + error);
			}
			
		}); //ajax end
		} //ajax_call
		
		
		$(document).on("click", ".start", function(){
			pageNo = pageNo - 10;
			ajax_call(pageNo);
		});
		
		$(document).on("click", ".backward", function(){
			pageNo = pageNo - 1;
			ajax_call(pageNo);
		});
		$(document).on("click",".page", function(){ //  동적으로 생성된 버튼 클릭하기
			
		 pageNo = $(this).text();
		ajax_call(pageNo);
			
		});
		
		$(document).on("click", ".end", function(){
			pageNo = pageNo + 10;
			ajax_call(pageNo);
		});
		
		$(document).on("click",".forward", function(){ //  동적으로 생성된 버튼 클릭하기
			pageNo = pageNo + 1;
			ajax_call(pageNo);
	
			
		});
		
		//$(document).on("click",".end", function(){ //  동적으로 생성된 버튼 클릭하기
			//pageNo = pageNo ;
			//ajax_call(pageNo);
	
			
		//});
		
		/*const list = [
			{bno:10, btitle:'제목입니다', m_name : '홍길동', bdate : '2023-08-02', blike : 15},
			{bno:9, btitle:'제목입니다', m_name : '홍길동', bdate : '2023-08-02', blike : 15},
			{bno:8, btitle:'제목입니다', m_name : '홍길동', bdate : '2023-08-02', blike : 15},
			{bno:7, btitle:'제목입니다', m_name : '홍길동', bdate : '2023-08-02', blike : 15},
			{bno:6, btitle:'제목입니다', m_name : '홍길동', bdate : '2023-08-02', blike : 15},
			{bno:5, btitle:'제목입니다', m_name : '홍길동', bdate : '2023-08-02', blike : 15},
			{bno:4, btitle:'제목입니다', m_name : '홍길동', bdate : '2023-08-02', blike : 15},
			{bno:3, btitle:'제목입니다', m_name : '홍길동', bdate : '2023-08-02', blike : 15},
			{bno:2, btitle:'제목입니다', m_name : '홍길동', bdate : '2023-08-02', blike : 15},
			{bno:1, btitle:'제목입니다', m_name : '홍길동', bdate : '2023-08-02', blike : 15}
			]; */
		
	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>

	<div style="color: white;">

		<table>
			<thead>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>글쓴이</td>
					<td>날짜</td>
					<td>조회수</td>
				</tr>
			</thead>
			<tbody class="tableHead"></tbody>

		</table>

		<div class="paging"></div>

	</div>
</html>