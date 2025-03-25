<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web.tag.dao.MembershipDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="web.tag.dto.MembershipDTO" />

<jsp:setProperty property="*" name="dto"/>

<%
	MembershipDAO dao = MembershipDAO.getInstance();
	dao.insertMember(dto);
	response.sendRedirect("main.jsp");
%>








