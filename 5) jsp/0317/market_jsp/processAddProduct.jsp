<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.web.dao.ProductDAO" %>
<%@ page import="market.web.dto.ProductDTO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String path = application.getRealPath("productImage");
	int maxSize = 1024 * 1024 * 10;
	String encType = "UTF-8";
	DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encType, df);
%>

<%
	ProductDTO dto = new ProductDTO();
	dto.setProductId(mr.getParameter("productId"));				// 상품 코드
	dto.setProductName(mr.getParameter("productName"));			// 상품 이름
	dto.setProductPrice(Integer.parseInt(mr.getParameter("productPrice")));	// 상품 가격
	dto.setDescription(mr.getParameter("description"));			// 상품 설명
	dto.setCompany(mr.getParameter("company"));					// 제조사
	dto.setCategory(mr.getParameter("category"));				// 카테고리
	dto.setStock(Integer.parseInt(mr.getParameter("stock")));	// 재고
	dto.setCondition(mr.getParameter("condition"));				// 신상 or 중고
	dto.setFileName(mr.getFilesystemName("productImage"));		// 업로드된 파일명을 DTO에 저장
%>

<%
	ProductDAO dao = ProductDAO.getInstance();
	dao.addProduct(dto);
	response.sendRedirect("products.jsp");
%>




