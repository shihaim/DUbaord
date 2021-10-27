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
	<button type="button" onclick="location.href='logout.do'">로그아웃</button>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글</th>
			<th>글쓴이</th>
			<th>작성날짜</th>
		</tr>
		<c:forEach items="${boardList }" var="item">
			<tr>
				<td><c:out value="${item.idx }"></c:out></td>
				<td><c:out value="${item.title }"></c:out></td>
				<td><c:out value="${item.content }"></c:out></td>
				<td><c:out value="${item.writerName }"></c:out></td>
				<td><c:out value="${item.registDate }"></c:out></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>