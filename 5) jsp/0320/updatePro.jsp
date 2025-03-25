<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web.tag.dto.BoardDTO" %>
<%@ page import="web.tag.dao.BoardDAO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%
	String path = request.getRealPath("upload");
	int maxSize = 1024 * 1024 * 10;
	String encType = "UTF-8";
	DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encType, df);

	BoardDTO dto = new BoardDTO();
	BoardDAO dao = new BoardDAO();
	
	dto.setNum(Integer.parseInt(mr.getParameter("num")));
	dto.setTitle(mr.getParameter("title"));
	dto.setContent(mr.getParameter("content"));
	
	String oldFile = mr.getParameter("oldFile");
	String newFile = mr.getFilesystemName("save");
	
	if(newFile == null) {	// save값이 null 이면(이미지 선택 X)
		dto.setSave(oldFile);	// 원래의 이미지를 사용
	} else {
		dto.setSave(newFile);	// 새로 선택한 이미지를 사용
	}
	
	int result = dao.updateBoard(dto);
	
	int num = Integer.parseInt(mr.getParameter("num"));
	
	if(result > 0) {
		response.sendRedirect("content.jsp?num=" + num);
	} else {
		response.sendRedirect("update.jsp?num=" + num);
	}
%>














