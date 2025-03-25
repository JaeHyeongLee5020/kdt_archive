<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<h1>/web/views/0312/uploadPro3.jsp</h1>

<%
	String path = application.getRealPath("fileUpload");
	int maxSize = 1024 * 1204 * 10;
	String encType = "UTF-8";
	DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
	
	MultipartRequest mr = new MultipartRequest(
						request, path, maxSize, encType, df);
	
	// Iterator 이전에 사용했던 기능 (Iterator와 사용 방법은 동일)
	Enumeration fileName = mr.getFileNames();	// 여러개의 파일을 한번에 처리
	
	while(fileName.hasMoreElements()) {
		String file = (String)fileName.nextElement();
		
		// MIME 타입 EX) image/jpeg , text/plain
		String contentType = mr.getContentType(file);
		
		if(contentType != null) {
			String[] mimeType = contentType.split("/");
			if(!mimeType[0].equals("image")) {
				mr.getFile(file).delete();
			} else {%>
				<h1><%= mr.getFilesystemName(file) %>이 업로드 되었습니다.</h1>
			<%}
		}
	}
%>





