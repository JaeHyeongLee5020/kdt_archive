<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//	session.removeAttribute("sid");	// 특정 세션 삭제
	session.invalidate();	// 모든 세션 삭제
	response.sendRedirect("main.jsp");
%>