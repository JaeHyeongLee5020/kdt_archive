<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web.tag.dao.BoardDAO" %>
<%@ page import="web.tag.dto.BoardDTO" %>

<h1>content.jsp</h1>

<%
	request.setCharacterEncoding("UTF-8");
	// request.getParameter()는 리턴 타입이 String이므로 Integer로 변환
	int num = Integer.parseInt(request.getParameter("num"));
	
	String pageNum = request.getParameter("pageNum");
	BoardDAO dao = new BoardDAO();
	
	String SessionName = "view_" + num;	// num = 글번호 EX) num = 57 ->  view_57
			
	if(session.getAttribute(SessionName) == null) {
		dao.numCount(num);	// content.jsp가 실행시마다 조회수가 1씩 증가
		session.setAttribute(SessionName, true);
	}
	
	BoardDTO dto = dao.content(num);
%>
<table border="1" width="800" height="500">
	<tr>
    	<td>글번호</td><td><%= dto.getNum()%></td>
  	</tr>
  	<tr>
    	<td>작성자</td><td><%= dto.getWriter()%></td>
  	</tr>
  	<tr>
    	<td>제목</td><td><%= dto.getTitle()%></td>
  	</tr>
  	<tr>
    	<td>본문</td><td><%= dto.getContent()%></td>
  	</tr>
  	<tr>
    	<td>조회수</td><td><%= dto.getCount()%></td>
  	</tr>
  	<tr>
    	<td>등록일</td><td><%= dto.getReg()%></td>
  	</tr>
  	<tr>
    	<td>이미지</td>
    	<td> 
    		<img src="/web/upload/<%= dto.getSave()%>" height="200" >
    	</td>
  	</tr>
</table><br/>

<button onclick="location='list.jsp?pageNum=<%=pageNum%>'">글 목록</button>
<button onclick="location='update.jsp?num=<%=dto.getNum()%>'">글 수정</button>
<button onclick="location='delete.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">글 삭제</button>


















