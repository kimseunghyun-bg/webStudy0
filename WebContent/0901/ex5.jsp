<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page errorPage="/error/error.jsp" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	String name=request.getParameter("name");
	name=name.toUpperCase();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

이름 : <%=name%> <br>


</body>
</html>