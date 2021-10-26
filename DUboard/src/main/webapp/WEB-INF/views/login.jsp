<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>
<body>
	<p>환영합니다! <c:out value="${USER.name }"></c:out></p>
	<button type="button" onclick="location.href='userModifyPage.do'">회원정보</button>
</body>
</html>