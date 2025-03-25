<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="web.tag.dto.TestDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="web.tag.dao.TestDAO" />
<%
	String sid = (String)session.getAttribute("sid");
	
	// table에 등급이 있다면 세션 정보도 있어야 하고 관리자 권한이 있을때반 접근이 가능해야 한다.
	if(sid == null) { %>
		<script>
			alert("로그인이 필요한 페이지 입니다.");
			location.href="loginForm.jsp";
		</script>
	<%}
%>
<h1>회원 검색</h1>
<form>
	<input type="text" name="id">
	<input type="submit" value="검색" />
</form>
<%
	String id = request.getParameter("id");
	TestDTO dto = dao.getMyinfo(id);
	if(dto.getId() != null && id != null) {%>
		<h2> 아이디 : <%= dto.getId() %></h2>
		<h2> 비밀번호 :<%= dto.getPw() %></h2>
		<h2> 이름 : <%= dto.getName() %></h2>
		<h2> 나이 : <%= dto.getAge() %></h2>
		<h2> 가입일 : <%= dto.getNewReg() %></h2>
	<%} else if(id == null)  {
		// 페이지가 처음 실행시 가입하지 않은 아이디입니다를 출력하지 않기위한 else if %>
	<%} else {%>
		<h2>가입하지 않은 아이디입니다.</h2>
	<%}
%>



