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
				<button type="button" class="btn btn-outline-secondary btn-sm idcheck" style="margin-top: 5px;">중복확인</button>
				<span id="statusMessage" data-ok="0" style="vertical-align: bottom; font-size: 14px; padding-bottom: 5px">중복테스트를 진행해주세요.</span>
			</div>
			<div class="mb-3">
				<label for="p" class="form-label">비밀번호</label>
				<input type="text" class="form-control" name="password" id="p" placeholder="password...">
			</div>
			<div class="mb-3">
				<label for="e" class="form-label">이메일</label>
				<input type="text" class="form-control" name="email" id="e" placeholder="email...">
			</div>
			<div class="mb-3">
				<label for="n" class="form-label">닉네임</label>
				<input type="text" class="form-control" name="nickname" id="n" placeholder="nickname...">
			</div>
			<button type="submit" class="btn btn-secondary" id="modBtn" disabled="disabled">가입</button>
		</form>
		
	</div>
		
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/userModify.js"></script>
	<script type="text/javascript" src="/resources/js/userRegister.js"></script>
</body>
</html>