<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="signUp.do" method="post" id="signUpForm">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" required></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pwdInput" name="pwd" required></td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td><input type="password" id="pwdInputCheck" required></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email"></td>
			</tr>
		</table>
		<button type="button" id="signUpBtn">회원가입</button>
	</form>
</body>

<script type="text/javascript">
	window.onload = function() {
			var signUpBtn = document.getElementById("signUpBtn");
			
			signUpBtn.onclick = function() {
				var pwdInput = document.getElementById("pwdInput").value;
				var pwdInputCheck = document.getElementById("pwdInputCheck").value;
				
				if(pwdInput == pwdInputCheck) {
					document.getElementById("signUpForm").submit();
				} else {
					alert("비밀번호를 확인해주세요.");
				}
			}
	}
</script>
</html>