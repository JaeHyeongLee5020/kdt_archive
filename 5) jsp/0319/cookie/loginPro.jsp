<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h1>/web/views/0318/cookie/loginPro.jsp</h1>

<jsp:useBean id="dto" class="web.tag.dto.CookieDTO" />
<jsp:useBean id="dao" class="web.tag.dao.CookieDAO" />

<jsp:setProperty property="*" name="dto"/>

<%
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		for(Cookie coo : cookies) {
			if(coo.getName().equals("cid")) {
				dto.setId(coo.getValue());
			}
			if(coo.getName().equals("cpw")) {
				dto.setPw(coo.getValue());
			}
			if(coo.getName().equals("cauto")) {
				dto.setAuto(coo.getValue());
			}
		}
	}
	
	boolean result = dao.loginCheck(dto);

	if(result) {
		// 로그인 성공시 세션 생성 
		session.setAttribute("sid", dto.getId());
		
		// 로그인 성공 후 로그인 유지를 사용시 쿠키 생성
		if(dto.getAuto() != null &&  dto.getAuto().equals("1")) {
			Cookie cooId = new Cookie("cid" , dto.getId());
			Cookie cooPw = new Cookie("cpw" , dto.getPw());
			Cookie cooAuto = new Cookie("cauto" , dto.getAuto());
			
			cooId.setMaxAge(180);
			cooPw.setMaxAge(180);
			cooAuto.setMaxAge(180);
			
			response.addCookie(cooId);
			response.addCookie(cooPw);
			response.addCookie(cooAuto);
		}
		
		response.sendRedirect("main.jsp");
	} else {%>
		<script>
			alert("아이디/비밀번호를 확인하세요");
			location.href="loginForm.jsp"
		</script>
	<%}
%>

















