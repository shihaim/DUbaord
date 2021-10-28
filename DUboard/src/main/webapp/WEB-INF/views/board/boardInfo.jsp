<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${board.title }"></c:out></title>
</head>
<body>
	<table border="1">
		<tr>
			<th>제목</th>
			<td><c:out value="${board.title }"></c:out></td>
			<th>작성날짜</th>
			<td>
				<c:choose>
					<c:when test="${board.modifyDate != null}">
						<fmt:parseDate value="${board.modifyDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="date"></fmt:parseDate>
						<fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</c:when>
					<c:otherwise>
						<fmt:parseDate value="${board.registDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="date"></fmt:parseDate>
						<fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3"><c:out value="${board.writerName }"></c:out></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3"><c:out value="${board.content }"></c:out></td>
		</tr>
	</table>
	<div>
		<button type="button" onclick="location.href='boardModifyPage.do?idx=${board.idx}'">글수정</button>
		<button type="button" id="deleteBtn">글삭제</button>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>