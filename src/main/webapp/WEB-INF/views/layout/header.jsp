<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/main.css">
<style>
	.navBox a {
		text-decoration: none; /* 링크에 밑줄 제거 */
    }

    .navBox a:hover {
      	color: #B17457; /* 마우스를 올렸을 때 색상 변경 */
    }
</style>
</head>
<body>
	<div class="headerBox">
		<a href="/"><h1><img alt="" src="/resources/image/logo.png"> 빵냥이의 부엌</h1></a>
	</div>
	<div class="container-md navBox">
		<ul class="nav justify-content-center">
			<li class="nav-item">
				<a class="nav-link" href="/board/list">📝게시판</a>
			</li>
			<!-- 로그인하지 않은 상태에서 볼 수 있는 메뉴 -->
			<sec:authorize access="isAnonymous()">
				<li class="nav-item">
					<a class="nav-link" href="/user/register">👨‍👩‍👦회원가입</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/user/login">🧀로그인</a>
				</li>
			</sec:authorize>
			
			<!-- 로그인 후 볼 수 있는 메뉴 -->
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.uvo.nickname" var="authnick" />
				<sec:authentication property="principal.uvo.authList" var="auths" />
				<sec:authentication property="principal.uvo.id" var="authid" />
				
				<li class="nav-item">
					<a class="nav-link" href="/board/register">✏️글쓰기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/user/detail?userId=${authid }">❤️${authnick }님</a>
				</li>
				
				<!-- 로그인 + 관리자 전용 메뉴 -->
				<c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get() }">
					<li class="nav-item">
						<a class="nav-link text-danger" href="/user/dashboard">🔒대시보드</a>
					</li>
				</c:if>
				
				<li class="nav-item">
					<a class="nav-link" href="/user/logout">👨‍👩‍👦로그아웃</a>
				</li>
			</sec:authorize>
		</ul>
	</div>