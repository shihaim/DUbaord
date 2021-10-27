<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
	</head>
	<body>
		<form action="login.do" method="post" id="loginForm">
			<table>
				<thead>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" id="id"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pwd" id="pwd"></td>
					</tr>
				</thead>
			</table>
			<button type="button" id="loginBtn">로그인</button>
			<button type="button" onclick="location.href='signUpPage.do'">회원가입</button>
		</form>
	</body>
	<script type="text/javascript">
		window.onload = function() {
			var loginBtn = document.getElementById("loginBtn");
			
			loginBtn.onclick = function() {
				var id = document.getElementById("id").value;
				var pwd = document.getElementById("pwd").value;
				
				if(id == "" || pwd == "") {
					alert("아이디 또는 비밀번호를 입력해주세요.");
				}  else {
					document.getElementById("loginForm").submit();
				}
			}
		}
	</script>
</html>