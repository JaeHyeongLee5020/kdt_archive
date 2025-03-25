<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="web.tag.dto.TestDTO" />
<jsp:useBean id="dao" class="web.tag.dao.TestDAO" />
<jsp:setProperty property="*" name="dto"/>

<%
	int idResult = dao.idCheck(dto);
	if(idResult > 0) {%>
		<h1>이미 사용중인 id입니다.</h1>
	<%} else {
		int result = dao.getInsert(dto);
		if(result == 1) {%>
			<h1>회원 가입 되었습니다.</h1>
		<%} else {%>
			<h1>회원 가입되지 않았습니다.</h1>
		<%}
	}
%>

<button type="button" onclick="location.href='main.jsp'">메인 페이지</button>
<button type="button" onclick="location.href='form.jsp'">회원가입</button>
<button type="button" onclick="location.href='select.jsp'">회원정보</button>
