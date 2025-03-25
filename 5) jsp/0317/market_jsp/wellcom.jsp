<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="css.jsp" %>
</head>
<body>
	<%@ include file="text.jsp" %>
	<%-- 네비게이션 바 --%>
	<jsp:include page="menu.jsp" />
	
	<%-- 상단 --%>
	<div class="jumbotron">
		<div class="container">
		<h1 class="display-3 text-cecter"><%= title %></h1>
		</div>
	</div>
	<hr>
	
	<%-- 중단 --%>
	<div class="container">
		<div class="text-center">
			<h3><%= shopping %></h3>
		</div>
	</div>
	<hr>
	
	<%-- footer --%>
	<jsp:include page="footer.jsp" />
</body>
</html>






