<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member회원가입</title>
<%@ include file="css.jsp" %>
</head>
<body>
	<h1>Member 회원가입</h1>
	<div class="container">
		<form action="processAddProduct.jsp" class="form-horizontal" method="post" >
		
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="id" class="form-control" />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="text" name="pw" class="form-control" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">닉네임</label>
				<div class="col-sm-3">
					<input type="text" name="nickName" class="form-control" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input type="email" name="mail" class="form-control" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="addr" class="form-control" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">생년월일</label>
				<div class="col-sm-3">
					<input type="date" name="birth" class="form-control" />
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-3">
					<input type="submit" value="상품등록" class="btn btn-primary" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>