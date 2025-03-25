<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>

<%
	request.setCharacterEncoding("UTF-8");

	String dirPath = "C:/upload/tmep";	// 파일을 업로드할 임시 경로
	
	// dirPath 경로를 사용하여 File 객체 생성
	File tempDir = new File(dirPath);
	
	// File객체의 경로가 없으면 디렉터리 생성
	if(!tempDir.exists()) {	// File 객체의 경로가 없으면
		tempDir.mkdirs();	// 경로상의 모든 디렉터리 생성
	}
	
	int maxSize = 1024 * 1024 * 10;	// 업로드 파일 크기 제한
	String encType = "UTF-8";		// 인코딩 방식
	
	MultipartRequest mr = new MultipartRequest(request, dirPath, maxSize, encType);
	
	String name = mr.getParameter("name");
	
	String finalPath = "C:/upload/final";	// 파일을 업로드할 최종 경로
	File finalDir = new File(finalPath);
	
	// File객체의 경로가 없으면 디렉터리 생성
	if(!finalDir.exists()) {	// File 객체의 경로가 없으면
		finalDir.mkdirs();		// 경로상의 모든 디렉터리 생성
	}
	
	// 원본 파일명 저장 (파일명이 겹치지 않으면 originalFileName을 업로드)
	String originalFileName = mr.getOriginalFileName("save");
	
	// 새로운 파일명에 원본 파일명 저장 (파일명 중복시 newFileName을 서버에 저장)
	String newFileName = originalFileName;
	
	File uploadedFile = mr.getFile("save");	// 임시 폴더
	
	if(uploadedFile != null) { 
		// 최종 파일 경로와 파일명을 사용하여 File 객체 생성 (C:/upload/final/cat.jpg)
		File finalFile = new File(finalDir, newFileName);
		
		// 파일명과 확장자를 분리하기위해서 lastIndexOf(".") 사용
		// 확장자가 변경되는것을 방지(파일명을 변경)
		int dotIndex = originalFileName.lastIndexOf(".");
		String base;	// 파일명
		String ext;		// 확장자
		
		if(dotIndex == -1) {	// dot이 없는 파일(확장자가 없는 파일)
			base = originalFileName;	// 원본 파일명을 base(파일명)에 저장
			ext = "";
		} else {
			// 0번 인덱스부터 dotIndex 인덱스 전까지를 잘라서 base에 저장(파일명)
			base = originalFileName.substring(0, dotIndex);	// cat
			// dotIndex 인덱스부터 마지막 인덱스까지 잘라서 ext에 저장(확장자)
			ext = originalFileName.substring(dotIndex);		// .jpg
		}
		
		int count = 0;
		while(finalFile.exists()) {	// C:/upload/final/cat.jpg
			count++;
			newFileName = base + count + ext;
			finalFile = new File(finalDir, newFileName);
		}
		
		boolean moved = uploadedFile.renameTo(finalFile);
		if(moved) {%>
			<h3><%= newFileName + "이 업로드 되었습니다." %></h3>
		<%}
 	} else {%>
 		<h3>파일을 업로드하지 않았습니다.</h3>
 	<%}
%>

<h3>name : <%= name %></h3>










