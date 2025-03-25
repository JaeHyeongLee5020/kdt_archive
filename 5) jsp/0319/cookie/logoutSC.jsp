<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 세션과 쿠키를 모두 사용하기때문에 둘다 삭제해야 한다.
	
//	session.removeAttribute("sid");	// 특정 세션만 삭제
	session.invalidate();			// 모든 세션 삭제
	
	Cookie[] cookies = request.getCookies();
	
	// 쿠키 삭제
	for(Cookie coo : cookies) {
		if(coo.getName().equals("cid") || coo.getName().equals("cpw") || coo.getName().equals("cauto")) {
			coo.setMaxAge(0);
			response.addCookie(coo);
		}
	}
	
	response.sendRedirect("main.jsp");
%>