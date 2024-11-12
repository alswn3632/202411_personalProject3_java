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
		<h3 class="midTitle">📝회원 리스트</h3>
		<hr>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>No</th>
					<th>username</th>
					<th>email</th>
					<th>nickname</th>
					<th>regDate</th>
					<th>logDate</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="uvo" >
					<tr>
						<td>${uvo.id }</td>
						<td>${uvo.username }</td>
						<td>${uvo.email }</td>
						<td>${uvo.nickname }</td>
						<td>${uvo.regDate }</td>
						<td>${uvo.logDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
		
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>