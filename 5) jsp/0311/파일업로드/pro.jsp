<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>

<h1>/web/views/0311/pro.jsp</h1>

<%
	String path = "C:/upload/tmp";	// 파일을 저장할 경로
	int maxSize = 1024 * 1024 * 10;	// 업로드할 파일의 크기 제한 (10MB)
	String encType = "UTF-8";		// 인코딩 타입 (EUC-KR, UTF-8)
	DefaultFileRenamePolicy fr = new DefaultFileRenamePolicy();
	
	// request, 저장경로, 파일크기, 인코딩 타입, DefaultFileRenamePolicy
	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encType, fr);
	
	String name = mr.getParameter("name");
	
	// form으로부터 받은 save(파일)을 파일 클래스로 리턴
	File file = mr.getFile("save");
	
	String fileName = file.getName();
	long fileSize = file.length();
	
	String OriginaleFileName = mr.getOriginalFileName("save");
	String filesystemName = mr.getFilesystemName("save");
	String contentType = mr.getContentType("save");
%>
<h3>name : <%= name %></h3>
<h3>파일 이름 : <%= fileName %></h3>
<h3>파일 크기 : <%= fileSize + "Byte" %></h3>
<h3>원본 파일명 : <%= OriginaleFileName %></h3>
<h3>업로드 파일명 : <%= filesystemName %></h3>
<h3>MIME 타입 : <%= contentType %></h3>






