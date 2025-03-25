<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h1>/web/views/0318/session/scope.jsp</h1>

<%
	// 서버가 켜저있는동안 유지된다.(서버가 재부팅 되기전까지 언제 어디서는 사용이 가능하다.)
	application.setAttribute("aData", "java");

	// 브라우저가 켜져있는동안 유지된다.(브라우저를 끄기 전까지 언제 어디서든 사용이 가능하다.)
	session.setAttribute("sData", "jsp");
	
	// 해당 페이지에서만 사용가능 , forward로 전송한 페이지에서 확인 가능
	request.setAttribute("rData", "script");
	request.getRequestDispatcher("result0318.jsp").forward(request, response);

%>

<h3>application 생성</h3>
<h3>session 생성</h3>
<h3>request 생성</h3>








