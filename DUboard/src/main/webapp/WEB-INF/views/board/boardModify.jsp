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
	<form action="boardModify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="idx" value="${BOARD.idx }">
		<input type="hidden" name="attIdx" value="${BOARD.attIdx }">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${BOARD.title }" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="20" cols="60" name="content" required><c:out value="${BOARD.content }"></c:out></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><c:out value="${BOARD.attFilename }"></c:out></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="radio" name="handleType" value="fix" checked="checked"><c:out value="고정"></c:out>
					<input type="radio" name="handleType" value="chg" checked="checked"><c:out value="변경"></c:out>
					<input type="radio" name="handleType" value="del" checked="checked"><c:out value="삭제"></c:out>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="file" name="attFile">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
		<button type="button" onclick="history.back();">이전</button>
	</form>
</body>
</html>