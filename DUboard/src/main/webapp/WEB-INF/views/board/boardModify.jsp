<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div data-role="header" data-position="fixed" data-theme="b">
        <h2 class="text-center">글 수정</h2>
        
    </div>
    <div data-role="content">
		<form action="boardModify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="idx" value="${BOARD.idx }">
			<input type="hidden" name="attIdx" value="${BOARD.attIdx }">
			<table class="table table-bordered">
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
						<label class="radio-inline"><input type="radio" name="handleType" value="fix" checked="checked"><c:out value="고정"></c:out></label>
						<label class="radio-inline"><input type="radio" name="handleType" value="chg"><c:out value="변경"></c:out></label>
						<label class="radio-inline"><input type="radio" name="handleType" value="del"><c:out value="삭제"></c:out></label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="file" name="attFile">
					</td>
				</tr>
			</table>
			<button type="submit" class="btn btn-primary">수정</button>
			<button type="button" class="btn btn-primary" onclick="history.back();">이전</button>
		</form>
	</div>
	
</body>
</html>