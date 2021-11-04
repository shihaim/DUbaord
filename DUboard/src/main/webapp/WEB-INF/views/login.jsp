<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div data-role="header" data-position="fixed" data-theme="b">
              
              <h2 class="text-center">게시판</h2>
              <div data-role="navbar">
                <p>환영합니다! <c:out value="${USER.name }"></c:out></p>
                <button type="button" class="btn btn-primary" onclick="location.href='userModifyPage.do'">회원정보</button>
                <button type="button" class="btn btn-primary" onclick="location.href='logout.do'">로그아웃</button>
              </div>
          </div>
          <div data-role="content">

                  <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>글쓴이</th>
                                <th>작성날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${BOARDLIST }" var="item">
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
                        </tbody>
                    </table>

              <button type="button" class="btn btn-primary" onclick="location.href='boardWritePage.do'">글쓰기</button>
          </div>

          <div data-role="footer" data-position="fixed" data-theme="b">
              
          </div>
</body>

<script type="text/javascript">
	function trClick(idx) {
		var url = "boardInfoPage=" + idx + ".do";
		
		location.href = url;
	}
	
	 $(function() {
         // tr 태그에 마우스를 올릴때
         $('table tbody tr').mouseover(function() {
             $(this).children().css({
                 'backgroundColor': '#DCDCDC',
                 'cursor': 'pointer'
             });
         }).mouseout(function() {
             $(this).children().css({
                 'backgroundColor': '#FFFFFF',
                 'cursor': 'default'
             });
         });

     });
</script>
</html>