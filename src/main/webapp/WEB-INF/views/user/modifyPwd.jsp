<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빵냥이의 부엌 : 회원정보수정</title>
<jsp:include page="../layout/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/userModify.css">
</head>
<body>
		
	<div class="container-md" style="min-height: 500px;">
		<h3 class="midTitle">👨‍👩비밀번호변경</h3>
		<hr>
		<form action="/user/modifyPwd" method="post">
			<div class="mb-3">
				<label for="p" class="form-label">* 비밀번호</label>
				<input type="hidden" name="id" value="${uvo.id }">
				<input type="text" class="form-control" name="password" id="p">
			</div>
			<button type="submit" class="btn btn-secondary modify" id="modBtn">저장</button>
		</form>
		
	</div>
		
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/userModify.js"></script>
</body>
</html>