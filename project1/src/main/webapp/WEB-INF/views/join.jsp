<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<link rel="stylesheet" href="./css/join.css?version=0.4">
<script src="./js/jquery-3.7.0.min.js"> </script>
<script type="text/javascript">
/* $(function(){
/* 	$("#idCheck").click(function(){
		let id = $("#id").val();
		if(id == "" || id.length <2) {
			
			//alert("아이디는 5글자 이상이어야 합니다.");
			$("#resultMSG").text("아디는 5글자 이상이어야 합니다.");
			$("#resultMSG").css("color","red");
			$("#id").focus();
			
		} else {
			let result = ""; // 결과값 찍기 
			$.ajax({
				url:"./checkID",
				type: "post",
				data: {"id":id},  //checkID?id=pseidon
				dataType: "html",		
						
				success:function(data){
					
					$("#resultMSG").text("data : " + data);
				},
				error:function(request,status,error){
					
					$("#resultMSG").text("error : " + error);
					console.log(error);
				}
				
				
			});
			
			$("#resultMSG").text("아디는 5글자 이상이어야 합니다.");
			$("#resultMSG").css("color","green");
			
		}
		
		
		return false;

		
	});
	
	 */
	 
	 $(function(){
		 $("#idCheck").click(function(){
			let id = $("#id").val();
			//console.log(id);
			//console.log(id.length);
			if(id == ""|| id.length <2) {
				
				$("#id").focus();
				$("#resultMSG").text("아이디는 2글자 이상이어야 합니다.");
				$("#resultMSG").css("color","red").css("font-weight","bold").css("font-size","15pt");
				
			} else { 
				$.ajax({
					
					url : "./checkID", //
					type : "post",
					data : {"id" : id},
				//	dataType : "html", html 타입 다음 json타입으로 진행
					dataType : "json", // {result : 0}
					success : function(data) {
						//alert(data.result);
					
						//$("#resultMSG").text("성공시 결과값 : " + data);
					if(data.result==1) { 
						$("#resultMSG").text("이미 등록된 아이디 입니다.");
						$("#resultMSG").css("color","red");
						$("#id").css("background-color","red");
						$("#id").css("color","white");
						$("#id").focus();
					} else {
						$("#resultMSG").css("color","green");
						$("#resultMSG").text("가입할 수 있습니다.");
			
						}
					
					},
					
					error: function(request,status,error){
						$("#resultMSG").text("오류가 발생 했습니다. 가입할 수 없습니다.");
					}
					
					
			
				}); //  ajax 시작 선언
			
			}
			return false; //  멈추기 
		 
		 });
	 });


</script>

</head>

<body>


	<div class="container">
		<form action="./join" method="post">
		<h1>회원가입</h1>
		<div>
			<input class="joinId" id="id" name="id" type="text" placeholder="아이디"
				required="required" maxlength="20" onchange="checkID()">
			
				<button id="idCheck"> 중복검사 </button>
				<P><span id="resultMSG"></span></p>
				
		</div>
		<div>
			<input class="joinPw"  name="pw1" type="password" placeholder="비밀번호"
				required="required" maxlength="20">
		</div>
		<div>
			<input class="joinPwck"  name="pw2" type="password" placeholder="비밀번호확인"
				required="required" maxlength="20">
		</div>
		<div>
			<input class="joinName" name="name" type="text" placeholder="이름"
				required="required" maxlength="20">
		</div>
		<div>
			<input class="joinAddress" name="addr" type="text" placeholder="주소"
				required="required" maxlength="20">
		</div>


		<div>
			<select name="mbti" class=" mbti">
			<option value="" >선택해주세요</option>
				<optgroup label="내향형">
				<option value="ISTJ">ISTJ</option>
				<option value="ISTP">ISTP</option>
				<option value="ISFJ">ISFJ</option>
				<option value="ISFP">ISFP</option>
				<option value="INTJ">INTJ</option>
				<option value="INTP">INTP</option>
				<option value="INFJ">INFJ</option>
				<option value="INFP">INFP</option>
				</optgroup>
						<optgroup label="외향형">
				<option value="ESTJ">ESTJ</option>
				<option value="ESTP">ESTP</option>
				<option value="ESFJ">ESFJ</option>
				<option value="ESFP">ESFP</option>
				<option value="ENTJ">ENTJ</option>
				<option value="ENTP">ENTP</option>
				<option value="ENFJ">ENFJ</option>
				<option value="ENTP">ENTP</option>
								</optgroup>
			</select>
		</div>

		<div>
			<input name="birth" class="joinNum" type="date" placeholder="생년월일">
		</div>

		<div>성별</div>
		<div>
		<input type="radio" name="gender" id="m" value="1">
			 <label for="m">남자</label>
			 
		<input type="radio" name="gender" id="f" value="0">
		
	 <label for="f">여자</label>
 		</div>
	
		
		



		<div class="button1">
			<button type="submit" class="login" onclick="">가입하기</button>
			<button type="reset" class="login" onclick="">취소</button>
		</div>
		</div>
	 </form>
	


</body>
</html>