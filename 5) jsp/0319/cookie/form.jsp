<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h1>/web/views/0318/cookie/form.jsp</h1>
<%
	Cookie[] cookies = request.getCookies();
	String cookieSave = "";
	
	if(cookies != null) {
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("cookieSave")) {
				cookieSave = cookie.getValue();
			}
		}
	}
%>
<form action="pro.jsp">
	아이디	<input type="text" name="id" value="<%= cookieSave %>" /><br/>
	비밀번호	<input type="password" name="pw" /><br/>
<%
	if(cookieSave == "") { %>
		아이디저장	<input type="checkbox" name="idSave" value="1" /><br/>
	<%} else {%>
		아이디저장	<input type="checkbox" name="idSave" value="1" checked /><br/>
	<%}

%>
			<input type="submit" value="로그인" /><br/>
</form>













