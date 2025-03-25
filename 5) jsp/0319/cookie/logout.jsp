<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h1>/web/views/0318/cookie/logout.jsp</h1>

<%
	Cookie[] cookies =  request.getCookies();
	
	String cid = null;
	
	for(Cookie cookie : cookies) {
		if(cookie.getName().equals("cid")) {
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	}
	response.sendRedirect("cookieMain.jsp");
%>




