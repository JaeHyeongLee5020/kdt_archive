<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1>로그인 상태 유지 메인</h1>

<%
	String sid = (String)session.getAttribute("sid");

	if(sid == null) {
		String cid = null;
		String cpw = null;
		String cauto = null;
		
		Cookie[] cookies = request.getCookies();
		for(Cookie coo : cookies) {
			if(coo.getName().equals("cid")) {
				cid = coo.getValue();
			}
			if(coo.getName().equals("cpw")) {
				cpw = coo.getValue();
			}
			if(coo.getName().equals("cauto")) {
				cauto = coo.getValue();
			}
		}
		
		if(cid == null || cpw == null || cauto == null) {%>
			<script>
				alert("로그인이 필요한 서비스입니다.");
				location.href="loginForm.jsp"
			</script>
		<%} else {
			response.sendRedirect("loginPro.jsp");
		}
	}
%>
<h1><%= sid %>님 반갑습니다.</h1>

<button onclick="location.href='logoutSC.jsp'" >로그아웃</button>


