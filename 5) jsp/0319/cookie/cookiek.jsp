<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1>/web/views/0318/cookie/cookie.jsp</h1>

<%-- 
	--session 	: 내장 객체이브로 바로 사용이 가능하다.
	--cookie	: 객체를 생성해서 사용해야 한다.
 --%>

<%
	Cookie c1 = new Cookie("cid", "java");
	Cookie c2 = new Cookie("cpw", "1234");

	c1.setMaxAge(120);
	c2.setMaxAge(120);
	
	c1.setPath("/web/views/");
	c2.setPath("/web/views/");
	
	response.addCookie(c1);
	response.addCookie(c2);
%>

<h2>쿠키 생성 완료</h2>