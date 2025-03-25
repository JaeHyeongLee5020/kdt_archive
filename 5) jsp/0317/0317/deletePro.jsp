<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="dto" class="web.tag.dto.TestDTO" />
<jsp:useBean id="dao" class="web.tag.dao.TestDAO" />
<jsp:setProperty property="*" name="dto"/>

<%
	int delResult = dao.getDelete(dto);

	if(delResult > 0) {%>
		<h2>정상적으로 탈퇴 되었습니다.</h2>
	<%} else {%>
		<h2>정상적으로 탈퇴되지 않았습니다.</h2>
	<%}
%>


<%-- 
<%
	if(delResult > 0) {
		response.sendRedirect("main.jsp");
	} else {
		response.sendRedirect("delete.jsp");
	}

%>
 --%>
