<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${BOARD.title }"></c:out></title>
</head>
<body>
	<table border="1">
		<tr>
			<th>제목</th>
			<td><c:out value="${BOARD.title }"></c:out></td>
			<th>작성날짜</th>
			<td>
				<c:choose>
					<c:when test="${BOARD.modifyDate != null}">
						<fmt:parseDate value="${BOARD.modifyDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="date"></fmt:parseDate>
						<fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</c:when>
					<c:otherwise>
						<fmt:parseDate value="${BOARD.registDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="date"></fmt:parseDate>
						<fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3"><c:out value="${BOARD.writerName }"></c:out></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3"><c:out value="${BOARD.content }"></c:out></td>
		</tr>
		<c:if test="${BOARD.writerId == USER.id }">
			<tr>
				<td>
					<button type="button" onclick="location.href='boardModifyPage.do?idx=${BOARD.idx}'">글수정</button>
					<button type="button" id="deleteBtn">글삭제</button>
				</td>
			</tr>
		</c:if>
	</table>
	<table border="1">
		<c:forEach items="${REPLY }" var="item">
			<tr>
				<th><c:out value="${item.writerName }"></c:out></th>
				<td><c:out value="${item.content }"></c:out></td>
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
					<c:if test="${item.writerId == USER.id }">
						<button type="button" onclick="replyModify(${item.idx});">댓글수정</button>
						<button type="button" id="replyDelete">댓글삭제</button>
					</c:if>
					<form action="replyModfiy.do" method="post">
						<input type="hidden" name="idx" value="${item.idx }">
						<input type="hidden" name="content" id="replyInput_${item.idx }" placeholder="댓글 수정">
						<button type="submit" id="modifyBtn_${item.idx }" style="display: none;">수정</button>
						<button type="button" id="cancel_${item.idx }" style="display: none;">취소</button>
					</form>	
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="3">
				<form action="replyWrite.do" method="post">
					<input type="hidden" name="boardIdx" value="${BOARD.idx }">
					<input type="hidden" name="writerId" value="${USER.id }">
					<input type="text" name="content" placeholder="댓글 작성">
					<button type="submit">등록</button>
				</form>
			</td>
		</tr>
	</table>
	
	<form action="boardDelete.do" method="post" id="boardDeleteForm">
		<input type="hidden" value="${BOARD.idx }" name="idx">
	</form>
</body>
<script type="text/javascript">
	window.onload = function() {
		var deleteBtn = document.getElementById("deleteBtn");
		deleteBtn.onclick = function() {
			if(confirm("글 삭제하시겠습니까?")) {
				document.getElementById("boardDeleteForm").submit();
			} else {
				return;
			}
		}
	}
	
	function replyModify(idx) {
		console.log(idx);
		var replyInput = document.getElementById("replyInput_" + idx);
		var modifyBtn = document.getElementById("modifyBtn_" + idx);
		var cancel = document.getElementById("cancel_" + idx);
		
		replyInput.type = "text";
		modifyBtn.style.display = "";
		cancel.style.display = "";
		
		cancel.onclick = function() {
			replyInput.type = "hidden";
			modifyBtn.style.display = "none";
			cancel.style.display = "none";
		}
	}
</script>
</html>