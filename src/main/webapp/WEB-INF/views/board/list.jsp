<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../layout/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/boardList.css">
</head>
<body>
		
	<div class="container-md">
		<h3 class="midTitle">📝게시판</h3>
		<hr>
		
		<!-- Search Line -->
		<div class="searchBox">
			<form action="/board/list" method="get" class="d-flex" role="search">
				<!-- 타입 -->
				<select class="form-select form-select-sm selectBox" aria-label="Small select example" name="type" id="inputGroupSelect01" style="outline: none;">
				    <option value="twc" ${ph.pgvo.type eq 'twc'? 'selected' : '' }>전체</option>
				    <option value="t" ${ph.pgvo.type eq 't'? 'selected' : '' }>제목</option>
				    <option value="w" ${ph.pgvo.type eq 'w'? 'selected' : '' }>작성자</option>
				    <option value="c" ${ph.pgvo.type eq 'c'? 'selected' : '' }>내용</option>
				</select>
				<!-- 넘겨줄 값 -->
			    <input class="form-control me-2" type="search" name="keyword" value="${ph.pgvo.keyword }" placeholder="Search" aria-label="Search">
			    <input type="hidden" name="pageNo" value="1">
			    <!-- 검색 내용 -->
			    <input type="hidden" name="qty" value="${ph.pgvo.qty }" class="wordBox" style="outline: none;">
			    <button type="submit" class="btn btn-primary position-relative searchBtn">
					검 색
					<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
						${ph.totalCount }
						<span class="visually-hidden">unread messages</span>
					</span>
				</button>
			</form>
		</div>
			
		<!-- List Line -->	
		<table class="table table-hover listBox">
			<thead>
				<tr>
					<th scope="col">번호</th>
				    <th scope="col" class="titleLine">제목</th>
				    <th scope="col">글쓴이</th>
				    <th scope="col">등록일</th>
				    <th scope="col">조회</th>
				    <th scope="col">추천</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="bvo">
					<tr>
						<td>${bvo.id }</td>
					  	<td>
							<a href="/board/detail?id=${bvo.id }" style="text-decoration: none; font-weight: bold; color: inherit;">
						  	  	${bvo.title }<span style="color: red;"> [${bvo.commQty }]</span><span> ${bvo.hasFile>0? '💾':'' }</span> 
						  	</a>
					  	  </td>
					  	<td>${bvo.writer }</td>
					  	<td>${bvo.regDate }</td>
					  	<td>${bvo.readQty }</td>
					  	<td>${bvo.likeQty }</td>
				  	</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- Pagination Line  -->
		<div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
				  	<!-- 이전 -->
				    <li class="page-item ${ph.prev eq false? 'disabled' :  ''}">
				     	<a class="page-link" href="/board/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty }&type=${ph.pgvo.type }&keyword=${ph.pgvo.keyword }" aria-label="Previous">
				        	<span aria-hidden="true">이전</span>
				      	</a>
				    </li>
				    
				    <!-- 페이지네이션 번호 -->
				    <c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
				    	<li class="page-item ${ph.pgvo.pageNo eq i? 'active' : ''}">
				    		<a class="page-link" href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty }&type=${ph.pgvo.type }&keyword=${ph.pgvo.keyword }">${i }</a>
				    	</li>
				    </c:forEach>
				    
				    <!-- 다음 -->
				    <li class="page-item ${ph.next eq false? 'disabled' :  ''}">
				      	<a class="page-link" href="/board/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty }&type=${ph.pgvo.type }&keyword=${ph.pgvo.keyword }" aria-label="Next">
				        	<span aria-hidden="true">다음</span>
				      	</a>
				    </li>
				</ul>
			</nav>
		</div>
	</div>
		
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>