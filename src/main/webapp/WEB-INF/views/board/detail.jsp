<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../layout/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/boardDetail.css">
</head>
<body>
	<!-- 변수 간단하게 설정 -->
	<c:set value="${bdto.bvo }" var="bvo"></c:set>
	<c:set value="${bdto.flist }" var="flist"></c:set>
		
	<!-- 로그인 상태 확인하기 -->
	<script type="text/javascript">
		let uno = -1;
		let nickname = "";
	</script>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.uvo.id" var="authid"/>
		<sec:authentication property="principal.uvo.nickname" var="authnick"/>
		<script type="text/javascript">
			uno = "${authid }";
			nickname = "${authnick}";
		</script>
	</sec:authorize>

	<div class="container-md">
		<hr>
		<div class="midInfo">
			<span>${bvo.writer }</span>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
				<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
				<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
			</svg>
			${bvo.readQty }
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
				<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
			</svg>
			${bvo.likeQty }
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-dots" viewBox="0 0 16 16">
				<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
				<path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0"/>
			</svg>
			${bvo.commQty }
			<br>
			${bvo.regDate }
		</div>
		<br>
		<p class="midTitle">${bvo.title }</p>
		<br>
		<div class="midImg">
			<div class="">
				<c:forEach items="${flist }" var="fvo">
					<img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}" class="rounded" style="width: 200px; height: 200px; object-fit: cover;">
				</c:forEach>			
			</div>
		</div>
		<br>
		<div class="midText">
			${bvo.content }
		</div>
		<br>
		
		<div class="btnArea">
			<div>
				<button type="button" class="btn btn-outline-danger likeBtn" id="likeBtn">추천</button>
			</div>
			<div>
				<button type="button" class="btn btn-outline-warning reportBtn" id="reportBtn">신고</button>			
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.uvo.id" var="authid"/>
					<c:if test="${authid eq bvo.userId}">
						<a href="/board/modify?id=${bvo.id }"><button type="button" class="btn btn-outline-secondary">수정</button></a>
						<a href="/board/delete?id=${bvo.id }"><button type="button" class="btn btn-outline-secondary">삭제</button></a>
					</c:if>
				</sec:authorize>
			</div>
		</div>
		<hr>
		<br>
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.uvo.nickname" var="authnick"/>
			<div class="input-group mb-3">
				<span class="input-group-text" id="cmtWriter">${authnick }</span>
				<input type="text" class="form-control" id="cmtText" placeholder="Add Comment..." aria-label="Username" aria-describedby="basic-addon1">
				<button class="btn btn-outline-secondary addBtn1" id="cmtAddBtn" type="button">등록</button>
			</div>
		</sec:authorize>
			
		<!-- Comment Print -->
		<ul class="list-group list-group-flush" id="cmtListArea"></ul>
		
		<!-- 댓글 페이징 : 더보기 버튼 -->
		<div><button class="btn btn-dark" id="moreBtn" type="button" data-page = "1" style="visibility:hidden">더보기</button></div>
		
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
		let buno = "${bvo.userId}"
	</script>
	<script type="text/javascript" src="/resources/js/boardDetailLike.js"></script>
	<script type="text/javascript" src="/resources/js/boardDetailComment.js"></script>
	<script type="text/javascript" src="/resources/js/boardDetailReport.js"></script>
	<script type="text/javascript">
		printLikeBox(bno, uno);
		spreadCommentList(bno);
	</script>
</body>
</html>