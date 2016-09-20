<%@page import="com.guest.GuestDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
%>
	
	<jsp:useBean id="dto" class="com.guest.GuestDTO"/>
	<jsp:setProperty property="*" name="dto"/>

<%	
	GuestDAO dao=new GuestDAO();
	
	dao.insertGuest(dto);
	
	response.sendRedirect("guest.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>