<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="web.tag.dto.BoardDTO" %>
<%@ page import="web.tag.dao.BoardDAO" %>

<%
	String path = request.getRealPath("upload");
	int maxSize = 1024 * 1024 * 10;
	String encType = "UTF-8";
	DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encType, df);
	
	BoardDTO dto = new BoardDTO();
	BoardDAO dao = new BoardDAO();
	
	dto.setWriter(mr.getParameter("writer"));
	dto.setTitle(mr.getParameter("title"));
	dto.setContent(mr.getParameter("content"));
	dto.setSave(mr.getFilesystemName("save"));
	
	int result = dao.insertBoard(dto);
	
	if(result > 0) {
		response.sendRedirect("list.jsp");
	} else {%>
		<script>
			alert("글이 작성되지 않았습니다.");
			history.go(-1);
		</script>
	<%}
%>












