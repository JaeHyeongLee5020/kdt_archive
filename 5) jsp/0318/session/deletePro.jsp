<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="dto" class="web.tag.dto.TestDTO" />
<jsp:useBean id="dao" class="web.tag.dao.TestDAO" />
<jsp:setProperty property="*" name="dto"/>

<%
	String sid = (String)session.getAttribute("sid");
	dto.setId(sid);
	
	int result = dao.getMemberDelete(dto);
	
	if(result > 0) {%>
		<script>
			alert("탈퇴되었습니다. 안녕히가세요");
			location.href="main.jsp"
		</script>
	<%} else {%>
		<script>
			history.go(-1);
		</script>
	<%}
%>

