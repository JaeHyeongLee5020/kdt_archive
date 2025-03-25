<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String sid = (String)session.getAttribute("sid");

	if(sid == null) { %>
		<script>
			alert("로그인이 필요한 페이지 입니다.");
			location.href="loginForm.jsp";
		</script>
	<%}
%>

<h1>개인 정보 수정</h1>

<form action="updatePro.jsp" method="post" >
	수정할 이름	<input type="text" name="name" /><br/>
	수정할 나이	<input type="number" name="age" /><br/>
			<input type="submit" value="확인" />
</form>






