<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web.tag.dto.MembershipDTO" %>
<%@ page import="web.tag.dao.MembershipDAO" %>
<%@ page import="java.util.ArrayList" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<%
	MembershipDAO dao = MembershipDAO.getInstance();
	int count = dao.memberCount();
%>

<h1>가입자수 : <%= count %></h1>
<hr/>
<%
	ArrayList<MembershipDTO> memList = dao.getList();

	for(MembershipDTO dto : memList) { %>
		<p>아이디 : <%= dto.getId() %></p>
		<p>비밀번호 : <%= dto.getPw() %></p>
		<p>이름 : <%= dto.getName() %></p>
		<p>이메일 : <%= dto.getEmail() %></p>
		<hr/>
	<%}
%>
<h1>아이디 검색</h1>
<%
	String id = "java";
	MembershipDTO resultDTO = dao.matchId(id);
	
	if(resultDTO != null && id.equals(resultDTO.getId())) {%>
		<h3>검색한 <%= id %>는 있는 회원입니다.</h3>
		<p>아이디 : <%= resultDTO.getId() %></p>
		<p>비밀번호 : <%= resultDTO.getPw() %></p>
		<p>이름 : <%= resultDTO.getName() %></p>
		<p>이메일 : <%= resultDTO.getEmail() %></p>
	<%} else {%>
		<h3>검색한 <%= id %>는 없는 회원입니다.</h3>
	<%}
%>

<a href="main.jsp">
	<button type="button" class="btn btn-primary">메인</button>
</a>

<a href="form.jsp">
	<button type="button" class="btn btn-primary">회원가입</button>
</a>
