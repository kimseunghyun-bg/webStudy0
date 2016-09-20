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

<a href="setCookie.jsp">쿠키설정</a><br>
<a href="getCookie.jsp">쿠키가져오기</a><br>
<a href="removeCookie.jsp">쿠키제거</a><br>

</body>
</html>