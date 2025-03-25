<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<h1>/web/views/0312/pro2.jsp</h1>

<%
	// 파일을 업로드할 경로
	String path = application.getRealPath("fileUpload");	// 파일을 업로드할 경로
	int maxSize = 1024 * 1024 * 10;	// 파일 크기 제한
	String encType = "UTF-8";	// 인코딩 타입
	DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();	// 파일명 중복시 파일명 변경

	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encType, df);
	
	String sysFileName = mr.getFilesystemName("upload");	// 업로드된 파일명
	String contentType = mr.getContentType("upload");		// MIME 타입
	
	// 이미지 파일만 업로드가 가능해야 한다. 
	// 사진을 업로드하지 않으면 기본 이미지 출력 , 이미지 파일 업로드시 업로드한 이미지 출력
	
	String[] mimeType = contentType.split("/");
	/* 	
	if(!mimeType[0].equals("image")) {
		mr.getFile("upload").delete();	// 업로드된 파일 삭제
		sysFileName = "default.png";	// default.png 이미지를 출력
	}
	 */
	 
	// image , text , video 타입만 업로드 되어야 한다.
	if(mimeType[0].equals("image") || mimeType[0].equals("text") || mimeType[0].equals("video")) { %>
		<h2><%= sysFileName %>파일이 업로드 되었습니다.</h2>
	<%} else {
		mr.getFile("upload").delete();
		sysFileName = "default.png"; %>
		<h2>업로드할 수 없는 파일형식입니다.(mage , text , video 타입만 업로드가능합니다.)</h2>
	<%}
	 
%>
<img src="/web/fileUpload/<%= sysFileName %>" width="500" height="350">
<h2>업로드된 파일명 : <%= sysFileName %></h2>
<h2>MIME Type : <%= contentType %></h2>















