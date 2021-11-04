<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

      <form action="boardWrite.do" method="post" enctype="multipart/form-data">
          <h2 class="text-center" >글쓰기</h2>
            <input type="hidden" name="writerId" value="${USER.id }">
            <table class="table table-bordered">
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" required></td>
                </tr>
                
                <tr>
                    <th>내용</th>
                    <td><textarea cols="50" name="content" required></textarea></td>
                </tr>
                
                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" name="attFile"></td>
                </tr>
                
            </table>
            <button type="submit"  class="btn btn-primary">등록</button>
            <button type="button"  class="btn btn-primary" onclick="history.back();">이전</button>
        </form>

</body>
</html>