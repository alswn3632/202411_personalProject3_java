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
		<h3 class="midTitle">👨‍👩회원가입</h3>
		<hr>
		<form action="/user/register" method="post">
			<div class="mb-3">
				<label for="u" class="form-label">아이디</label>
				<input type="text" class="form-control" name="username" id="u" placeholder="id...">
			</div>
			<div class="mb-3">
				<label for="p" class="form-label">비밀번호</label>
				<input type="text" class="form-control" name="password" id="p" placeholder="pwd...">
			</div>
			<div class="mb-3">
				<label for="e" class="form-label">이메일</label>
				<input type="text" class="form-control" name="email" id="e" placeholder="email..">
			</div>
			<div class="mb-3">
				<label for="n" class="form-label">닉네임</label>
				<input type="text" class="form-control" name="nickname" id="n" placeholder="nickName...">
			</div>
			<button type="submit" class="btn btn-primary">가입</button>
		</form>
		
	</div>
		
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>