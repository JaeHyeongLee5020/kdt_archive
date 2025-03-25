<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
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

<h1>회원 전체 정보</h1>

<%
	ArrayList<TestDTO> allList = dao.getAllMember();

	for(TestDTO dto : allList) {%>
		<h3>아이디 : <%= dto.getId() %></h3>
		<h3>비밀번호 : <%= dto.getPw() %></h3>
		<h3>이름 : <%= dto.getName() %></h3>
		<h3>나이 : <%= dto.getAge() %></h3>
		<h3>등록일 : <%= dto.getReg() %></h3>
		<h3>-------------------------------------</h3>
	<%}
	int memCount = dao.getMemberCount();
%>

<h2>가입 회원수 : <%= memCount %>명</h2>












