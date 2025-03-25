<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<h1>/web/views/0312/uploadPro.jsp</h1>

<%
	String path = application.getRealPath("fileUpload");
	int maxSize = 1024 * 1204 * 10;
	String encType = "UTF-8";
	DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
	
	MultipartRequest mr = new MultipartRequest(
						request, path, maxSize, encType, df);
	String[] files = {"upload1", "upload2", "upload3", "upload4"};
	
	for(String file : files) {
		// files 배열안의 값(upload1, upload2...)를 사용하여 반복문으로 처리
		String contentType = mr.getContentType(file);
		
		if(contentType != null) {
			// EX) image/jpeg : mimeType[0] = "image" , mimeType[1] = "jpeg"
			String[] mimeType = contentType.split("/");
				
			// EX) mimeType[0] = "image" , mimeType[0] = "text" 
			if(!mimeType[0].equals("image")) {
				mr.getFile(file).delete();
			}%>
			<h3>업로드 파일 : <%= mr.getFilesystemName(file) %></h3>
		<%}
	}
%>





