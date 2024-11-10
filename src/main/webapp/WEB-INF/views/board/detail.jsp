<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div class="container-md">
		<h3 class="midTitle">✏️${bvo.title }</h3>
		<hr>
		
		<!-- Board Detail Line -->
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
		
		<!-- 좋아요 버튼 -->
		<button type="button" class="btn btn-outline-danger likeBtn" id="likeBtn">추천</button>
		<!-- 신고 버튼 -->
		<button type="button" class="btn btn-outline-warning reportBtn" id="reportBtn">신고</button>	
		<!-- file upload 표시 라인 -->
		<div class="mb-3">
			<ul class="list-group list-group-flush">
				<!-- 파일의 개수만큼 li를 반복하여 파일 표시 타입이 1인 경우만 크림으로 표시 -->
				<c:forEach items="${flist }" var="fvo">
					<li class="list-group-item">
						<div>
							<img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}" style="max-width: 300px; height: auto;">
							<div class="fw-bold">${fvo.fileName }</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>		
		
		<a href="/board/modify?id=${bvo.id }"><button type="button" class="btn btn-primary">수정</button></a>
		<a href="/board/delete?id=${bvo.id }"><button type="button" class="btn btn-primary">삭제</button></a>
		
		<!-- Comment Line -->
		<!-- Comment Post -->
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