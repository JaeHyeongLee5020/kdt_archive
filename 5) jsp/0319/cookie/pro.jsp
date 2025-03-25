<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h1>/web/views/0318/cookie/pro.jsp</h1>

<jsp:useBean id="dto" class="web.tag.dto.CookieDTO" />
<jsp:useBean id="dao" class="web.tag.dao.CookieDAO" />

<jsp:setProperty property="*" name="dto"/>

<%
	String idSave = request.getParameter("idSave");
	
	if(idSave != null && idSave.equals("1")) {
		Cookie coo = new Cookie("cookieSave", dto.getId());
		coo.setMaxAge(180);
		response.addCookie(coo);
	} else {
		Cookie[] cookies = request.getCookies();
		
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("cookieSave")) {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
	}

	boolean result = dao.loginCheck(dto);

	if(result) {	// 로그인 성공시
		Cookie c1 = new Cookie("cid", dto.getId());
		c1.setMaxAge(180);
		response.addCookie(c1);
		response.sendRedirect("cookieMain.jsp");
	} else {%>
		<script>
			alert("아이디 또는 비밀번호를 확인하세요");
			history.go(-1);
		</script>
	<%}
%>


