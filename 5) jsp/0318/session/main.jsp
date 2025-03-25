<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1>메인 페이지</h1>

<%
	String sid = (String)session.getAttribute("sid");

	if(sid == null) {%>
		<h3>현재 guest 상태입니다.</h3>
		<button onclick="location.href='loginForm.jsp'">로그인</button>
	<%} else {%>
		<h3><%= sid %>님 어서오세요</h3>
		<button onclick="location.href='logout.jsp'">로그아웃</button>
	<%}
%>
<button onclick="location.href='myPage.jsp'">마이페이지</button>


