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
		<h3 class="midTitle">👨‍👩‍👦로그인</h3>
		<hr>
			<form action="/user/login" method="post">
				<div class="mb-3">
				  <label for="u" class="form-label">아이디</label>
				  <input type="text" class="form-control" name="username" id="u" placeholder="id...">
				</div>
				<div class="mb-3">
				  <label for="p" class="form-label">비밀번호</label>
				  <input type="text" class="form-control" name="password" id="p" placeholder="pwd...">
				</div>
				<!-- 로그인 실패시 errMsg 출력할 장소 -->
<%-- 				<c:if test="${param.errMsg ne null }">
					<div class="text-danger mb-3">
						${param.errMsg }
					</div>
				</c:if> --%>
				<button type="submit" class="btn btn-primary">로그인</button>
			</form>
	</div>
		
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>