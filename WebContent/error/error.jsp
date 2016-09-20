<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page isErrorPage="true" %>
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

에러가 발생했습니다.<br>

에러 타입 : <%=exception.getClass().getName()%>
에러 메시지 : <%=exception.getMessage()%>

</body>
</html>