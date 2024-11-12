<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빵냥이의 부엌 : Modify</title>
<jsp:include page="../layout/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/boardModify.css">
</head>
<body>
	<!-- 변수 간단하게 설정 -->
	<c:set value="${bdto.bvo }" var="bvo"></c:set>
	<c:set value="${bdto.flist }" var="flist"></c:set>
	
		
	<div class="container-md" style="min-height: 500px;">
		<h3 class="midTitle">✏️수정하기</h3>
		<hr>
		<form action="/board/update" method="post" enctype="multipart/form-data">
			<input type="hidden" class="form-control" id="n" name="id" value="${bvo.id }" readonly>
			<input type="hidden" class="form-control" id="w" name="writer" value="${bvo.writer }" readonly>
			
			<div class="mb-3">
				<label for="f" class="form-label">* 제목</label>
				<input type="text" class="form-control" id="f" name="title" value="${bvo.title }">
			</div>
			<div class="mb-3">
				<label for="c" class="form-label">* 내용</label>
				<textarea class="form-control" name="content" id="c" rows="3">${bvo.content }</textarea>
			</div>
			<div class="mb-3">
				<label for="f" class="form-label">* 첨부파일</label>
				
				<div class="midImg">
					<c:forEach items="${flist }" var="fvo">
						<div class="imgBox">
							<img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}" class="rounded" style="width: 200px; height: 200px; object-fit: cover;">
							<button type="button" class="btn btn-outline-secondary file-x" data-uuid="${fvo.uuid}">삭제</button>
						</div>
					</c:forEach>			
				</div>
				
			</div>
			
			<!-- file upload 표시 라인 -->
<%-- 			<div class="mb-3">
				<ul class="list-group list-group-flush">
					<!-- 파일의 개수만큼 li를 반복하여 파일 표시 타입이 1인 경우만 크림으로 표시 -->
					<c:forEach items="${flist }" var="fvo">
						<li class="list-group-item">
						    <div style="position: relative; display: inline-block;">
						        <!-- 이미지 -->
						        <img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}" 
						             style="max-width: 300px; height: auto; display: block;">
						        <!-- 'x' 버튼을 이미지 위에 겹쳐서 배치 -->
						        <button type="button" class="btn btn-outline-dark file-x" data-uuid="${fvo.uuid}" 
						                style="position: absolute; top: 5px; right: 5px;">
						            X
						        </button>
						    </div>
						    <div class="fw-bold">${fvo.fileName}</div>
						</li>
					</c:forEach>
				</ul>
			</div>		 --%>	
			
			<!-- 첨부파일 표시 라인 추가 -->
			<br>
			<div class="mb-3" id="fileZone">
				
			</div>	
			
			<!-- 첨부파일 입력 라인 추가 -->
			<div class="mb-3 btnArea">
				<div>
					<input type="file" class="form-control" name="files" id="file" multiple="multiple" style="display:none" accept="image/*">
					<label class="input-group-text" for="file" style="display:none"></label>
				    <button type="button" class="btn btn btn-secondary" id="trigger">파일 추가</button>
				</div>
				<button type="submit" id="regBtn" class="btn btn btn-secondary">저장</button>
			</div>
			<hr>
		</form>
	</div>
		
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
	<!-- Script Line -->
	<script type="text/javascript">
		let bno = "${bvo.id }";
	</script>
	<script type="text/javascript" src="/resources/js/boardRegister.js"></script>
	<script type="text/javascript" src="/resources/js/boardModify.js"></script>
</body>
</html>