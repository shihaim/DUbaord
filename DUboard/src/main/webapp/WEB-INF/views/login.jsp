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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
              <div>
              	<h2 class="text-center">게시판</h2>
              	환영합니다! [<c:out value="${USER.name }"></c:out>]님
                <button type="button" class="btn btn-primary" onclick="location.href='userModifyPage.do'">회원정보</button>
                <button type="button" class="btn btn-primary" onclick="location.href='logout.do'">로그아웃</button>
              </div>
              
              <div>
              	<table style="margin-left: auto; margin-right: auto;">
              		<tr>
              			<th><span class="material-icons">search</span></th>
              			<td><input type="text" id="searchTitle" placeholder="검색할 제목을 입력하세요" value="<c:out value='${title }'></c:out>"/></td>
              			<td><button type="button" id="searchBtn" class="btn btn-primary">검색</button></td>
              		</tr>
              	</table>
              </div>
              
              <div>
              	<table class="table table-bordered table-hover" id="dataList">
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
                                <tr onclick="trClick(`${item.idx }`);">
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

              
          
          
	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${PAGINATION.prev }">
				<li class="page-item"><a class="page-link" href="#" onclick="fn_prev('${PAGINATION.page}', '${PAGINATION.range }', '${PAGINATION.rangeSize }')">이전</a></li>
			</c:if>
			
			<c:forEach begin="${PAGINATION.startPage }" end="${PAGINATION.endPage }" var="idx">
				<li class="page-item <c:out value="${PAGINATION.page == idx ? 'active' : ''}"></c:out>"><a class="page-link" href="#" onclick="fn_pagination('${idx}', '${PAGINATION.range }', '${PAGINATION.rangeSize }')">${idx }</a></li>
			</c:forEach>
			
			<c:if test="${PAGINATION.next }">
				<li class="page-item"><a class="page-link" href="#" onclick="fn_next('${PAGINATION.page}', '${PAGINATION.range }', '${PAGINATION.rangeSize }')">다음</a></li>
			</c:if>
		</ul>
	</div>


</body>

<script type="text/javascript">

	window.onload = function() {
		var searchTitle = document.getElementById("searchTitle");
		var searchBtn = document.getElementById("searchBtn");
		
		searchTitle.addEventListener("keydown", function(event){
			if(event.keyCode === 13) {
				searchBtn.click();
			}
		})
		
		searchBtn.onclick = function() {
			
// 			var tr = document.querySelectorAll("#dataList tbody tr");
			
// 			for(var item of tr) {
// 				var title = item.getElementsByTagName('td')[1].innerHTML;
				
// 				if(title.includes(searchTitle.value)) {
// 					item.style.display = "";
// 				} else {
// 					item.style.display = "none";
// 				}
// 			}

			var url = "login.do";
			url = url + "?title=" + searchTitle.value;
			
			location.href = url;

		}
	}

	function trClick(idx) {
		var url = "boardInfoPage=" + idx + ".do";
		
		location.href = url;
	}
	 
	// 이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var url = "login.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&title=" + searchTitle.value;
		
		location.href = url;
	}
	
	// 페이지 번호 클릭 이벤트
	function fn_pagination(page, range, rangeSize) {
		var url = "login.do";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&title=" + searchTitle.value;
		
		location.href = url;
	}
	
	// 다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt(range * rangeSize) + 1;
		var range = parseInt(range) + 1;
		
		var url = "login.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&title=" + searchTitle.value;
		
		location.href = url;
	}
</script>
</html>