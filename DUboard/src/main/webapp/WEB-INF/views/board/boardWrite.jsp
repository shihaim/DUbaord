<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<form action="boardWrite.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="writerId" value="${USER.id }">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="20" cols="60" name="content" required></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="attFile"></td>
			</tr>
		</table>
		<button type="submit">등록</button>
		<button type="button" onclick="history.back();">이전</button>
	</form>
</body>
</html>