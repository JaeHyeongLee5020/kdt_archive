<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1>회원 정보 수정</h1>
<form action="updatePro.jsp" method="post">
	id		<input type="text" name="id" /><br/>
	pw		<input type="password" name="pw" /><br/>
	name	<input type="text" name="name" /><br/>
	age		<input type="number" name="age" /><br/>
			<input type="submit" value="정보 수정" /><br/>
</form>