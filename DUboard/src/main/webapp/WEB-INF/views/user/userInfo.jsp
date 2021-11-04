<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<body>

     <h2 class="text-center">회원정보</h2>


   <form action="userModify.do" method="post">
	<table class="table table-bordered">
		<tr>
			<th>아이디</th>
			<td>
				<input type="hidden" name="id" value="${USER.id }">
				<c:out value="${USER.id }"></c:out>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pwd" required></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value="${USER.name }" required></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" value="${USER.phone }"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" value="${USER.email }"></td>
		</tr>
	</table>
	<button type="submit" class="btn btn-primary">회원수정</button>
	<button type="button" id="deleteBtn" class="btn btn-primary">회원탈퇴</button>
</form>


  
  
	
	<form action="userDelete.do" method="post" id="userDeleteForm">
		<input type="hidden" name="id" value="${USER.id }">
	</form>
</body>
<script type="text/javascript">
	window.onload = function() {
		var deleteBtn = document.getElementById("deleteBtn");
		deleteBtn.onclick = function() {
			if(confirm("회원 탈퇴를 진행하시겠습니까?")) {
				document.getElementById("userDeleteForm").submit();
			} else {
				return;
			}
		}
	}
	
</script>
</html>