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
	
	String sysFimeName1 = mr.getFilesystemName("upload1");
	String sysFimeName2 = mr.getFilesystemName("upload2");
	String sysFimeName3 = mr.getFilesystemName("upload3");
	String sysFimeName4 = mr.getFilesystemName("upload4");
	
	String contentType1 = mr.getContentType("upload1");
	String contentType2 = mr.getContentType("upload2");
	String contentType3 = mr.getContentType("upload3");
	String contentType4 = mr.getContentType("upload4");
	
	if(contentType1 != null){
		String[] mimeType1 = contentType1.split("/");
		if(!mimeType1[0].equals("image")) {
			mr.getFile("upload1").delete();
		}
	}

	
	String[] mimeType2 = contentType2.split("/");
	if(!mimeType2[0].equals("image")) {
		mr.getFile("upload2").delete();
	}
	
	String[] mimeType3 = contentType3.split("/");
	if(!mimeType3[0].equals("image")) {
		mr.getFile("upload3").delete();
	}
	
	String[] mimeType4 = contentType4.split("/");
	if(!mimeType4[0].equals("image")) {
		mr.getFile("upload4").delete();
	}
%>

<h3>upload1 : <%= sysFimeName1 %></h3>
<h3>upload2 : <%= sysFimeName2 %></h3>
<h3>upload3 : <%= sysFimeName3 %></h3>
<h3>upload4 : <%= sysFimeName4 %></h3>





