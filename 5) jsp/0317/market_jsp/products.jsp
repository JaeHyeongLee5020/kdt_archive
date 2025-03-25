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
		<div class="row" align="center">
			<%
				ProductDAO dao = ProductDAO.getInstance();
				ArrayList<ProductDTO> list = dao.getList();
			
				for(ProductDTO dto : list) { %>
					<div class="col-md-4">
						<img src="/market/productImage/<%= dto.getFileName()%>" width="250" height="300">
						<h3> <%= dto.getProductName() %></h3>
						<p> <%= dto.getDescription() %></p>
						<p> <%= dto.getProductPrice() + "원" %></p>
						<a href="product.jsp?productId=<%= dto.getProductId() %>" class="btn btn-primary">상품 상세</a>
					</div>
				<%}
			%>
		</div>
	</div>
	<hr>
	<%-- footer --%>
	<jsp:include page="footer.jsp" />
</body>
</html>






