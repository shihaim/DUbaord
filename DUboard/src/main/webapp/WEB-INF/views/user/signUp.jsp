<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="initial-scale=1.0, width=device-width">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css"/>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

<div data-role="page" id="page1">
    <div data-role="header" data-position="fixed" data-theme="b">
        <h1>회원가입</h1>
     <a href="#" onclick="history.back();" data-icon="home" data-iconpos="notext" class="ui-btn-right">Home</a>
    </div>
    <div data-role="content">
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
    </div>
    <div data-role="footer" data-position="fixed" data-theme="b">
        <h4></h4>
    </div>
  </div>


	
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