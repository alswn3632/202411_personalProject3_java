<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<jsp:include page="layout/header.jsp"></jsp:include>

<div class="container-md">
	<h1>Main Page!!!</h1>
	<P>The time on the server is ${serverTime}.</P>
</div>

<jsp:include page="layout/footer.jsp"></jsp:include>