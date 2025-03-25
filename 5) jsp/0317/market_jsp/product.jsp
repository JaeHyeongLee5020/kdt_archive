<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.web.dao.ProductDAO" %>
<%@ page import="market.web.dto.ProductDTO" %>
<%@ page import="java.util.ArrayList" %>

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
			<h3><%= products %></h3>
		</div>
	</div>
	<hr>
	
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<%
					ProductDAO dao = ProductDAO.getInstance();
					String productId = request.getParameter("productId");
					ProductDTO dto = dao.getProductById(productId);
				%>
				<div class="col-md-5">
					<img src="/market/productImage/<%= dto.getFileName()%>" width="250" height="300">
				</div>
				<h3>상품명 : <%= dto.getProductName() %></h3>
				<p>상품가격 : <%= dto.getProductPrice() + "원" %></p>
				<p>상품 설명 : <%= dto.getDescription() %></p>
				<p>제조사 : <%= dto.getCompany() %></p>
				<p>카테고리 : <%= dto.getCategory() %></p>
				<p>재고 : <%= dto.getStock() + "개" %></p>
				<p>신상or중고 : <%= dto.getCondition() %></p>
			</div>
		</div>
	</div>
	<hr>
	<%-- footer --%>
	<jsp:include page="footer.jsp" />
</body>
</html>










