<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<meta name="viewport" content="initial-scale=1.0, width=device-width">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css"/>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>
<div data-role="page" id="page2">
 <div data-role="header" data-position="fixed" data-theme="b">
     <h1>회원정보</h1>
  <a href="#" onclick="history.back();" data-icon="home" data-iconpos="notext" class="ui-btn-right">Home</a>
 </div>
<div data-role="content">
   <form action="userModify.do" method="post">
	<table>
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
	<button type="submit">회원수정</button>
	<button type="button" id="deleteBtn">회원탈퇴</button>
</form>
</div>
<div data-role="footer" data-position="fixed" data-theme="b">
    <h4></h4>
</div>
</div>
  
  
	
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