<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../layout/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/userDetail.css">
</head>
<body>
	<c:set value="${udto.uvo }" var="uvo"></c:set>
	<c:set value="${udto.blist }" var="blist"></c:set>
	<div class="container-md">
		<h3>❤️마이페이지</h3>
		<hr>
		
		<div class="midArea">
			<div class="box">
				<h5>내 정보 보기</h5>
				<hr>
				<label for="i" class="form-label">* 아이디</label>
				<input type="text" class="form-control" name="username" id="i" value="${uvo.username }" readonly><br>
				<label for="n" class="form-label">* 닉네임</label>
				<input type="text" class="form-control" name="nickname" id="n" value="${uvo.nickname }" readonly><br>
				<label for="e" class="form-label">* 이메일</label>
				<input type="text" class="form-control" name="email" id="e" value="${uvo.email }" readonly><br>
				<a href="/user/modify?id=${uvo.id }"><button type="button" class="btn btn-outline-secondary">내정보수정</button></a>
			</div>
			<div class="box">
				<h5>내가 쓴 글</h5>
				<hr>
				<table class="table table-hover listBox">
					<thead>
						<tr>
							<th scope="col">번호</th>
						    <th scope="col">제목</th>
						    <th scope="col">등록일</th>
						    <th scope="col">조회</th>
						    <th scope="col">추천</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${blist }" var="bvo">
							<tr>
								<td>${bvo.id }</td>
							  	<td>
									<a href="/board/detail?id=${bvo.id }" style="text-decoration: none; font-weight: bold; color: inherit;">
								  	  	${bvo.title }<span style="color: red;"> [${bvo.commQty }]</span><span> ${bvo.hasFile>0? '💾':'' }</span> 
								  	</a>
							  	  </td>
							  	<td>${bvo.regDate }</td>
							  	<td>${bvo.readQty }</td>
							  	<td>${bvo.likeQty }</td>
						  	</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
		
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>