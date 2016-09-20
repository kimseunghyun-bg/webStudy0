<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>쿠키 설정</h3>

<a href="ex1.jsp">돌아가기</a>

<%
	Cookie[] cc=request.getCookies();
	for(Cookie c:cc){
		String name=c.getName();
		String value=c.getValue();
		if(name.equals("city"))
			value=URLDecoder.decode(value,"UTF-8");
		out.print(name+":"+value+"<br>");
			
		
	}

%>

</body>
</html>