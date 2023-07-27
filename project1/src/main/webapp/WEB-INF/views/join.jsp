<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
</head>
<body>

<div>


	<div>	<input class="joinId" type="text" placeholder="아이디"
			required="required" maxlength="20" onchange="checkID()"> 
			</div>
	<div> <input class="joinPw" type="password" placeholder="비밀번호"
			required="required" maxlength="20">
			 </div>
 	<div> <input class="joinPwck" type="" placeholder="비밀번호확인"
			required="required" maxlength="20">
			</div>
	<div>	<input class="joinName" type="text" placeholder="이름"
			required="required" maxlength="20">
			</div>
	<div>	<input class="joinAddress" type="text" placeholder="주소"
			required="required" maxlength="20">
			</div>
			
			
			<div> 
		<select class= " mbti" >
  			<option value="">  mmmm </option>
  			<option value="">  mmmm </option>
  			<option value="">  mmmm </option>
  			<option value="">  mmmm </option>
  			<option value="">  mmmm </option>
  			<option value="">  mmmm </option>
  			<option value="">  mmmm </option>
  			<option value="">  mmmm </option>
  			<option value="">  mmmm </option>
  			<option value="">  mmmm </option>
  			<option value="">  mmmm </option>
		 </select>
			 </div>
			
			<div> <input class="joinNum" type="date" placeholder="생년월일">
			 </div>
			
			<div> <select class="">
				<option value="">남 </option> 
				<option value=""> 여</option>
							</select> 
			
			 </div>
	
	
		
	
		<button type="button" class="login" onclick="">가입하기</button>
<button type="button" class="login" onclick="">취소</button>
		

		</div>
		



mbti( 드롭다운)
생년월일 ( input 달력)
성별(라디오)









</body>
</html>