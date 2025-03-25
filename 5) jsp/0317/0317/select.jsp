<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="web.tag.dto.TestDTO" %>

<jsp:useBean id="dao" class="web.tag.dao.TestDAO" />

<h1> 전체 회원 정보 확인 </h1>
<h1>가입된 회원 : <%= dao.getMemCount() %> 명</h1>
<%
	ArrayList<TestDTO> memList = dao.getMember();
	
	int count = 0;
	for(TestDTO dto : memList) { 
		count++;%>
		<h2>
			<%= count%> 
			<%= ") " + dto.getId()+ " "%>
			<%= dto.getPw()+ " "%>
			<%= dto.getName()+ " "%>
			<%= dto.getAge()+ " "%>
			<%= dto.getReg()+ " "%>
		</h2>
	<%}
%>



