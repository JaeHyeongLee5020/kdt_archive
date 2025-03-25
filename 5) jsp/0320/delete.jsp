<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1>글삭제</h1>

<jsp:useBean id="dao" class="web.tag.dao.BoardDAO" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	System.out.println("pageNum : " + pageNum);
	int result = dao.delete(num);
	
	if(result > 0) {%>
		<script>
			alert("글이 삭제되었습니다.");
			location="list.jsp?pageNum=<%=pageNum%>";
		</script>
	<%} else {%>
		<script>
			alert("다시 삭제해주세요");
			location="content.jsp?num=<%= num %>";
		</script>
	<%}
%>
