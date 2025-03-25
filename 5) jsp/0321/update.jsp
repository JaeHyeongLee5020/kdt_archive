<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web.tag.dto.BoardDTO" %>
<%@ page import="web.tag.dao.BoardDAO" %>

<%
	BoardDAO dao = new BoardDAO();
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDTO dto = dao.content(num);
%>

<form action="updatePro.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="<%= num %>" />
			<input type="hidden" name="oldFile" value="<%= dto.getSave() %>" />
	제목		<input type="text" name="title" value="<%=dto.getTitle() %>" /><br/>
			<textarea name="content" rows="20" cols="60" ><%=dto.getContent() %></textarea><br/>
			<p>업로드 이미지 : <%= dto.getSave() %></p>
	이미지	<input type="file" name="save" ><br/>
			<input type="submit" value="수정" />
			<button onclick="location.href='content.jsp?num=<%= dto.getNum()%>'">취소</button>
</form>





