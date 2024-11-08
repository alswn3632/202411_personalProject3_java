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
		<h3>User List Page!!</h3>
		<hr>
		
		<!-- Search Line -->
		<div class="container-fluid">
			<form action="/board/list" method="get" class="d-flex" role="search">
				<select class="form-select" name="type" id="inputGroupSelect01">
				    <option value="twc" ${ph.pgvo.type eq 'twc'? 'selected' : '' }>전체</option>
				    <option value="t" ${ph.pgvo.type eq 't'? 'selected' : '' }>제목</option>
				    <option value="w" ${ph.pgvo.type eq 'w'? 'selected' : '' }>작성자</option>
				    <option value="c" ${ph.pgvo.type eq 'c'? 'selected' : '' }>내용</option>
				</select>
			    <input class="form-control me-2" type="search" name="keyword" value="${ph.pgvo.keyword }" placeholder="Search" aria-label="Search">
			    <input type="hidden" name="pageNo" value="1">
			    <input type="hidden" name="qty" value="${ph.pgvo.qty }">
			    <button type="submit" class="btn btn-primary position-relative">
					Search
					<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
						${ph.totalCount }
						<span class="visually-hidden">unread messages</span>
					</span>
				</button>
			</form>
		</div>
			
		<!-- List Line -->	
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">.</th>
				    <th scope="col">제목</th>
				    <th scope="col">작성자</th>
				    <th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="bvo">
					<tr>
						<td>${bvo.id }</td>
					  	<td>
							<a href="/board/detail?id=${bvo.id }" style="text-decoration: none; font-weight: bold; color: inherit;">
						  	  	${bvo.title } 
						  	</a>
					  	  </td>
					  	<td>${bvo.writer }</td>
					  	<td>${bvo.regDate }</td>
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
				        	<span aria-hidden="true">&laquo;</span>
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
				        	<span aria-hidden="true">&raquo;</span>
				      	</a>
				    </li>
				</ul>
			</nav>
		</div>
	</div>
		
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>