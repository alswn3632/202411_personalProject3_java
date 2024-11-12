<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빵냥이의 부엌 : 관리자</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
		
	<div class="container-md" style="min-height: 500px;">
		<h3 class="midTitle">🔒대시보드</h3>
		<hr>
		
		<a href="/user/list"><button type ="button" class="btn btn-success">유저목록</button></a>
		<a href="/user/alert"><button type ="button" class="btn btn-danger">신고알림</button></a>
		
	</div>
		
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>