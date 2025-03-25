<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="web.tag.dto.TestDTO"/>
<jsp:useBean id="dao" class="web.tag.dao.TestDAO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	boolean result = dao.loginCheck(dto);
	
	if(result) {
		// id = test , pw = 1234 --> sid = test
		session.setAttribute("sid", dto.getId());
		response.sendRedirect("main.jsp");
	} else {%>
		<script>
			alert("아이디 또는 비밀번호를 확인하세요");
			history.go(-1);	// 이전 페이지로 이동
		</script>
	<%}
%>



