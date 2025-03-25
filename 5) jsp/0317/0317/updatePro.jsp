<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="web.tag.dto.TestDTO" />
<jsp:useBean id="dao" class="web.tag.dao.TestDAO" />
<jsp:setProperty property="*" name="dto"/>

<%
	int update = dao.memUpdate(dto);
	
	if(update > 0) {
		response.sendRedirect("select.jsp");
	} else {
		response.sendRedirect("update.jsp");
	}
%>
