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
		<h3 class="midTitle">🔔알림</h3>
		<hr>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>No</th>
					<th>Content</th>
					<th>BoardId</th>
					<th>Status</th>
					<th>.</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${arList }" var="avo" >
					<tr>
						<td>${avo.id }</td>
						<td>${avo.alertMsg }</td>
						<td><a href="/board/detail?id=${avo.boardId }">이동</a></td>
						<td>${avo.status }</td>
						<td>
							<button type="button" class="btn btn-secondary delBtn" data-bno=${avo.boardId } data-id=${avo.id }>삭제</button> 
							<button type="button" class="btn btn-secondary hodBtn" data-bno=${avo.boardId } data-id=${avo.id }>보류</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
		
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/userAlert.js"></script>
</body>
</html>