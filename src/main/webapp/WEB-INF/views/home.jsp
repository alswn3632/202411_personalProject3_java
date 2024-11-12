<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="layout/header.jsp"></jsp:include>

<div class="container-md" style="display: flex; justify-content: center; align-items: center;">
	<img alt="" src="/resources/image/main.jpg" class="mainImg" style="width: 80%; height: auto; margin: 0 auto; opacity: 0.8;">
	
</div>

<script>
	let modify_msg = `<c:out value="${modify_msg}" />`;
	console.log(modify_msg);
	if(modify_msg == 'ok'){
		alert("회원 정보가 수정되었습니다. 다시 로그인해주세요.");
	}else if(modify_msg == 'fial'){
		alert("회원 정보가 수정에 실패했습니다. 다시 시도해주세요");		
	}
	
	let modifyPwd_msg = `<c:out value="${modifyPwd_msg}" />`;
	console.log(modify_msg);
	if(modifyPwd_msg == 'ok'){
		alert("비밀번호 수정되었습니다. 다시 로그인해주세요.");
	}else if(modifyPwd_msg == 'fial'){
		alert("비밀번호 수정에 실패했습니다. 다시 시도해주세요");		
	}
</script>
<jsp:include page="layout/footer.jsp"></jsp:include>