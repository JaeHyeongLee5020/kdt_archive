<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1>메인 페이지</h1>

<%
	String sid = (String)session.getAttribute("sid");

	if(sid == null) {%>
		<button onclick="location.href='loginForm.jsp'">로그인</button>
		<button onclick="location.href='list.jsp'">게시판</button>
	<%} else {%>
		<button onclick="location.href='logout.jsp'">로그아웃</button>
		<button onclick="location.href='list.jsp'">게시판</button>
		<button onclick="location.href='myPage.jsp'">마이 페이지</button><%
		if(sid.equals("admin")) {%>
			<button onclick="location.href='adminPage.jsp'">관리자 페이지</button>
		<%}
	}

%>












