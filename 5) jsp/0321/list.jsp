<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web.tag.dto.BoardDTO" %>
<%@ page import="web.tag.dao.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
	int pageSize = 5;	// 한번에 볼 글의 개수
	
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null) {
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	
	int start = (currentPage - 1) * pageSize + 1;
	
	int end = currentPage * pageSize;

	request.setCharacterEncoding("UTF-8");
	
	BoardDAO dao = new BoardDAO();
	ArrayList<BoardDTO> boardList = dao.listSelect(start, end);
	
%>
<button onclick="location.href='main.jsp'">메인</button>
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
				<a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>" style="text-decoration: none; color: black"><%= dto.getTitle() %></a>
			</td>
			<td><%= dto.getCount() %></td>
			<td><%= dto.getReg() %></td>
		</tr>
	<%}
%>
</table>

<%
	int count = dao.count();
	
	if(count > 0) {	// 글이 1개이상인 경웨 출력
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	
		int pageBlock = 10;
		
		int startPage = (int)(currentPage / 10) * 10 + 1;
		
		int endPage = startPage + pageBlock - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		if(startPage > 10) {%>
			<a href="list.jsp?pageNum=<%=startPage - 10%>" style="text-decoration: none; color: black">[이전]</a>
		<%}
		
		for(int i = startPage; i <= endPage; i++) {%>
			<a href="list.jsp?pageNum=<%=i%>" style="text-decoration: none; color: black">[<%=i%>]</a>
		<%}
		
		if(endPage < pageCount) {%>
		<a href="list.jsp?pageNum=<%=startPage + 10%>" style="text-decoration: none; color: black">[다음]</a>
	<%}
	}
%>























