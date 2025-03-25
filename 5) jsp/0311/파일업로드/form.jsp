<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1>/web/views/0311/form.jsp</h1>
<%--
 전송 방식 	: post만 가능
 enctype	: multipart/form-data를 설정시 텍스트뿐 아니라 동영상, 이미지등의 여러가지 파일을 전송할 수 있다.
 			  단 enctype="multipart/form-data"를 설정시 request.getParameter()를 사용하여 값을 받을 수 없다.
 --%>
<form action="pro2.jsp" method="post" enctype="multipart/form-data">
	name : 	<input type="text" name="name" /><br/>
	file : 	<input type="file" name="save" /><br/>
			<input type="submit" value="업로드">
</form>

