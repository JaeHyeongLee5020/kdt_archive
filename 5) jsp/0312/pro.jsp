<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<h1>/web/views/0312/pro.jsp</h1>

<%
//	String path = "D:/test/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/web/fileUpload";	// 파일 저장 경로
//	String path = request.getRealPath("fileUpload");
	String path = application.getRealPath("fileUpload");
	int maxSize = 1024 * 1024 * 10;	// 업로드 파일 크기 제한(10MB)
	String encType = "UTF-8";		// 인코딩 방식
	
	// 업로드된 파일 이름 중복시 파일명을 변경
	DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
	
	// request, 저장 경로, 파일 크기 제한, 인코딩 타입, DefaultFileRenamePolicy
	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encType, df);
	
	String data = mr.getParameter("data");
	String originalFileName = mr.getOriginalFileName("upload");	// 원본 파일명
	String sysFileName = mr.getFilesystemName("upload");		// 업로드된 파일명
	String contentType = mr.getContentType("upload");			// MIME 타입

%>
<img src="/web/fileUpload/<%= sysFileName %>" width="500" height="300">
<h3>data : <%= data %></h3>
<h3>원본 파일명 : <%= originalFileName %></h3>
<h3>업로드된 파일명 : <%= sysFileName %></h3>
<h3>MIME 타입 : <%= contentType %></h3>




















