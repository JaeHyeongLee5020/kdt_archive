<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1>마이 페이지</h1>

<%
	String sid = (String)session.getAttribute("sid");

	if(sid == null) { %>
		<script>
			alert("로그인이 필요한 페이지 입니다.");
			location.href="loginForm.jsp";
		</script>
	<%}
%>

<button onclick="location.href='main.jsp'">메인</button>
<button onclick="location.href='myinfo.jsp'">확인</button>
<button onclick="location.href='update.jsp'">수정</button>
<button onclick="location.href='delete.jsp'">탈퇴</button>
<button onclick="location.href='logout.jsp'">로그아웃</button>
<button onclick="location.href='allInfo.jsp'">회원전체정보</button>
<button onclick="location.href='memberSearch.jsp'">회원검색</button>