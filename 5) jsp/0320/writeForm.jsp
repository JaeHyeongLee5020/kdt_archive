<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form action="writePro.jsp" method="post" enctype="multipart/form-data">
	작성자	<input type="text" name="writer" /><br/>
	제목		<input type="text" name="title" /><br/>
			<textarea name="content" rows="20" cols="60" ></textarea><br/>
	이미지	<input type="file" name="save" /><br/>
			<input type="submit" value="작성" />
</form>


