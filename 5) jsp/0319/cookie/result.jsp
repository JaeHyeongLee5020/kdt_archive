<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1>/web/views/0318/cookie/result.jsp</h1>
<%
	Cookie[] cookies = request.getCookies();

	for(Cookie cookie : cookies) { %>
		<h2>
			getName : <%= cookie.getName() + " , " %>
			getValue : <%= cookie.getValue() %>
		</h2>
	<%}
%>
