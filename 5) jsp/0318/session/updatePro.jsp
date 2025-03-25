<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="web.tag.dto.TestDTO" />
<jsp:useBean id="dao" class="web.tag.dao.TestDAO" />
<jsp:setProperty property="*" name="dto"/>

<%
	// 필요한 정보 : id, name, age
	// form에서 전달한 정보 :  name, age
	// id 값이 없기때문에 session의 value를 String id에 저장후 dto에 저장
	// dto : id, name, age
	String id = (String)session.getAttribute("sid");
	dto.setId(id);

	int result = dao.myUpdate(dto);

	if(result > 0) {%>
		<script>
			alert("수정 되었습니다.");
			location.href="myPage.jsp";
		</script>
	<%} else {%>
		<script>
			location.href="update.jsp";
		</script>
	<%}
%>
</html>