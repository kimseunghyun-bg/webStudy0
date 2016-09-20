<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String upload=request.getParameter("upload");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

이름 : <%=name%><br>
제목 : <%=subject%><br>
파일 : <%=upload%><br>

</body>
</html>