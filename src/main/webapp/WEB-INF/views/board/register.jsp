<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
		
	<div class="container-md">
		<h3>User Register Page!!</h3>
		<hr>
		<form action="/board/insert" method="post" enctype="multipart/form-data">
			<div class="mb-3">
				<label for="t" class="form-label">제목</label>
				<input type="text" class="form-control" name="title" id="t" placeholder="title..">
			</div>
			<div class="mb-3">
				<label for="t" class="form-label">작성자</label>
				<input type="text" class="form-control" name="writer" id="t" placeholder="writer..">
				<input type="hidden" class="form-control" name="userId" value=1 >
			</div>
			<div class="mb-3">
				<label for="t" class="form-label">내용</label>
				<input type="text" class="form-control" name="content" id="t" placeholder="content..">
			</div>
			
			<!-- 첨부파일 입력 라인 추가 -->
			<div class="mb-3">
				<input type="file" class="form-control" name="files" id="file" multiple="multiple" style="display:none" accept="image/*">
				<label class="input-group-text" for="file" style="display:none"></label>
			    <button type="button" class="btn btn-primary" id="trigger">파일 업로드</button>
			</div>
			<!-- 첨부파일 표시 라인 추가 -->
			<div class="mb-3" id="fileZone"></div>
			
			<button type="submit" class="btn btn-primary" id="regBtn">등록</button>
		</form>		
	</div>
		
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
	<!-- Script Line -->
	<script type="text/javascript" src="/resources/js/boardRegister.js"></script>
</body>
</html>