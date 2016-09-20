<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
%>

<a href="<%=cp%>/main">메인</a>
<a href="bbs.jsp">게시판</a>
<a href="guest.jsp">방명록</a>