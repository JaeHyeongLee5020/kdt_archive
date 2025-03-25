<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1>관리자 페이지</h1>

<%
	String sid = (String)session.getAttribute("sid");
	
	if(!sid.equals("admin")) { %>
		<script>
			alert("접근 권한이 없습니다.");
			location.href="loginForm.jsp";
		</script>
	<%}
%>

<form action="adminPagePro.jsp">
	<select name="memberCheck" >
		<option value="1">일반 회원 정보</option>
		<option value="0">탈퇴 회원 정보</option>
		<option value="10">관리자 정보</option>
	</select>
	<input type="submit" value="확인">
</form>



