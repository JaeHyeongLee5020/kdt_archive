<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.ArrayList" %>
<h1>/web/views/0312/pro3.jsp</h1>

<%
	// 파일을 업로드할 경로
	String path = application.getRealPath("fileUpload");	// 파일을 업로드할 경로
	int maxSize = 1024 * 1024 * 10;	// 파일 크기 제한
	String encType = "UTF-8";	// 인코딩 타입
	DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();	// 파일명 중복시 파일명 변경

	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encType, df);
	
	String sysFileName = mr.getFilesystemName("upload");	// 업로드된 파일명
	String contentType = mr.getContentType("upload");		// MIME 타입
	
	
	// image , text , video 타입만 업로드 되어야 한다.
	ArrayList<String> contentList = new ArrayList<String>();
	contentList.add("image");
	contentList.add("text");
	contentList.add("video");
	
	// EX) mimeType[0] = image , mimeType[1] = jpeg
	// EX) mimeType[0] = text , mimeType[1] = plain		
	String[] mimeType = contentType.split("/");
	
	if(!contentList.contains(mimeType[0])) {
		mr.getFile("upload").delete();
		sysFileName = "default.png";
	}
	
%>
<img src="/web/fileUpload/<%= sysFileName %>" width="500" height="350">
<h2>업로드된 파일명 : <%= sysFileName %></h2>
<h2>MIME Type : <%= contentType %></h2>















