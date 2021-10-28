<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			<th>글쓴이</th>
			<th>작성날짜</th>
		</tr>
		<c:forEach items="${boardList }" var="item">
			<tr onclick="trClick(`${item.idx}`);">
				<td><c:out value="${item.idx }"></c:out></td>
				<td><c:out value="${item.title }"></c:out></td>
				<td><c:out value="${item.writerName }"></c:out></td>
				<td>
					<c:choose>
						<c:when test="${item.modifyDate != null}">
							<fmt:parseDate value="${item.modifyDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="date"></fmt:parseDate>
							<fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</c:when>
						<c:otherwise>
							<fmt:parseDate value="${item.registDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="date"></fmt:parseDate>
							<fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
	<button type="button" onclick="location.href='boardWritePage.do'">글쓰기</button>
</body>
<script type="text/javascript">
	function trClick(idx) {
		var url = "boardInfoPage=" + idx + ".do";
		
		location.href = url;
	}
</script>
</html>