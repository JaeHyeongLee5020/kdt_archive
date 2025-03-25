<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="web.tag.dto.MemberDTO" %>

<jsp:useBean id="dao" class="web.tag.dao.MemberDAO" />


<% 
	request.setCharacterEncoding("UTF-8"); 
	
	int status = Integer.parseInt(request.getParameter("memberCheck"));
%>
	
<table border="1" width="800">
	<tr>
		<th>아이디</th><th>이름</th><th>나이</th><th>가입일</th><th>회원상태</th>
	</tr>
<% 
	ArrayList<MemberDTO> list = dao.membershipCheck(status);
	
	for(MemberDTO dto : list) {%>
	<tr>
		<td><%=dto.getId()%></td>
		<td><%=dto.getName()%></td>
		<td><%=dto.getAge()%></td>
		<td><%=dto.getReg()%></td>
		<td><%=dto.getStatus()%></td>
	</tr>
	<% }
	
%>
</table>
<button onclick="location.href='adminPage.jsp'">관리자 페이지</button>






