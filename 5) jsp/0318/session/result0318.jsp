<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h1>/web/views/0318/session/result0318.jsp</h1>

<%
	String app = (String)application.getAttribute("aData");
	String ses = (String)session.getAttribute("sData");
	String req = (String)request.getAttribute("rData");
%>

<h3>application : <%= app %></h3>
<h3>session : <%= ses %></h3>
<h3>request : <%= req %></h3>


