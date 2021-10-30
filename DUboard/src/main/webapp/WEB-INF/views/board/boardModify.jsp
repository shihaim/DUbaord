<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<form action="boardModify.do" method="post">
		<input type="hidden" name="idx" value="${BOARD.idx }">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${BOARD.title }" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="20" cols="60" name="content" required><c:out value="${BOARD.content }"></c:out></textarea></td>
			</tr>
		</table>
		<button type="submit">수정</button>
		<button type="button" onclick="history.back();">이전</button>
	</form>
</body>
</html>