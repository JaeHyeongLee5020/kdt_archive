<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h1>/web/views/0318/cookie/cookieMain.jsp</h1>
<h1>쿠키 메인 페이지</h1>

<%
	Cookie[] cookies = request.getCookies();

	String cid = null;
	
	if(cookies != null) {
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("cid")) {
				cid = cookie.getValue();
			}
		}
	}

	if(cid == null) { %>
		<script>
			alert("로그인이 필요한 서비스입니다.");
			location.href="form.jsp";
		</script>
	<%}
%>

<h1><%= cid %>님 어서오세요</h1>

<button onclick="location.href='myPage.jsp'">마이페이지</button>
<button onclick="location.href='logout.jsp'">로그 아웃</button>



