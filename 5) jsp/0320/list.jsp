<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web.tag.dto.BoardDTO" %>
<%@ page import="web.tag.dao.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	BoardDAO dao = new BoardDAO();
	ArrayList<BoardDTO> boardList = dao.listSelect();
%>

<button onclick="location.href='writeForm.jsp'">글 작성</button>

<table border="1" width="800" >
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>조회수</th>
			<th>등록일</th>
		</tr>
<%	
	for(BoardDTO dto : boardList) {%>
		<tr>
			<td><%= dto.getNum() %></td>
			<td><%= dto.getWriter() %></td>
			<td>
				<a href="content.jsp?num=<%= dto.getNum() %>" style="text-decoration: none; color: black"><%= dto.getTitle() %></a>
			</td>
			<td><%= dto.getCount() %></td>
			<td><%= dto.getReg() %></td>
		</tr>
	<%}
%>
</table>

















