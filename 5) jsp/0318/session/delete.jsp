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
	
<h1>회원 탈퇴</h1>
<form action="deletePro.jsp" method="post">
	비밀번호 	<input type="password" name="pw" /><br/>
			<input type="submit" value="탈퇴" />
</form>








