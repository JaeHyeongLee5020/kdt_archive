<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	// 세션 삭제 방법
	// removeAttribute("세션key")	: 특정 세션 1개를 삭제
	// invalidte()				: 모든 세션을 삭제
	
//	session.removeAttribute("sid");
	session.invalidate();
	
	response.sendRedirect("main.jsp");
%>



