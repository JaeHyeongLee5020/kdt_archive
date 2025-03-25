<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web.tag.dto.TestDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="web.tag.dao.TestDAO"/>

<h1>나의 정보</h1>

<%
	String sid = (String)session.getAttribute("sid");

	if(sid == null) { %>
		<script>
			alert("로그인이 필요한 페이지 입니다.");
			location.href="loginForm.jsp";
		</script>
	<%}
	
	TestDTO dto = dao.getMyinfo(sid);
%>

<h3>아이디 : <%= dto.getId()%></h3>
<h3>비밀번호 : <%= dto.getPw()%></h3>
<h3>이름 : <%= dto.getName()%></h3>
<h3>나이 : <%= dto.getAge()%></h3>
<h3>등록일 기존 : <%= dto.getReg()%></h3>
<h3>등록일 년/월/일 : <%= dto.getNewReg()%></h3>
