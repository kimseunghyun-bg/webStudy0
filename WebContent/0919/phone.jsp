<%@page import="java.util.Calendar"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	//String s=request.getCookies();
	//서블릿을 받아서 s에 저장하고 다시 넘긴다.
	
	Cookie c1=new Cookie("goods", URLEncoder.encode("휴대폰","UTF-8"));
	c1.setMaxAge(60*60);
	response.addCookie(c1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
핸드폰
<a href="ex2.jsp">돌아가기</a>
</body>
</html>