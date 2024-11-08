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
		<h3>User Detail Page!!</h3>
		<hr>
		<div class="mb-3">
			<label for="n" class="form-label">no</label>
			<span class="badge rounded-pill text-bg-primary">${bvo.regDate }</span>
			<input type="text" class="form-control" id="n" value="${bvo.id }" readonly>
		</div>
		<div class="mb-3">
			<label for="f" class="form-label">title</label>
			<input type="text" class="form-control" id="f" value="${bvo.title }" readonly>
		</div>
		<div class="mb-3">
			<label for="w" class="form-label">writer</label>
			<input type="text" class="form-control" id="w" value="${bvo.writer }" readonly>
		</div>
		<div class="mb-3">
			<label for="c" class="form-label">content</label>
			<textarea class="form-control" name="content" id="c" rows="3" readonly>${bvo.content }</textarea>
		</div>
		<a href="/board/modify?id=${bvo.id }"><button type="button" class="btn btn-primary">수정</button></a>
		<a href="/board/delete?id=${bvo.id }"><button type="button" class="btn btn-primary">삭제</button></a>
		
		<!-- Comment Line -->
		<!-- Comment Post -->
		<hr>
		<br>
		<div class="input-group mb-3">
			<span class="input-group-text" id="cmtWriter">테스터</span>
			<input type="text" class="form-control" id="cmtText" placeholder="Add Comment..." aria-label="Username" aria-describedby="basic-addon1">
			<button class="btn btn-outline-secondary" id="cmtAddBtn" type="button">등록</button>
		</div>
		<!-- Comment Print -->
		<ul class="list-group list-group-flush" id="cmtListArea">
			<!-- Js로 출력할 부분 -->
		</ul>
		
		<!-- 더보기 버튼 -->
		<div>
			<button class="btn btn-dark" id="moreBtn" type="button" data-page = "1" style="visibility:hidden">더보기</button>
		</div>
	</div>
	
	<!-- Modal Line -->
	<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
			    	<h1 class="modal-title fs-5" id="exampleModalLabel">writer</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			    </div>
				<div class="modal-body">
					<input type="text" class="form-control" id="cmtTextMod">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				    <button type="button" id="cmtModBtn" class="btn btn-primary">저장</button>
				</div>
			</div>
		</div>
	</div>
		
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<!-- Script Line -->
	<script type="text/javascript">
		let bno = "${bvo.id }";
		let uno = 1;
	</script>
	<script type="text/javascript" src="/resources/js/boardDetailComment.js"></script>
	<script type="text/javascript">
		spreadCommentList(bno);
	</script>
</body>
</html>