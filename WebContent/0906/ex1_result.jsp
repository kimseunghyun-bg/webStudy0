<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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

이름 : ${param.name}<br>
<% String n=request.getParameter("name"); %>
<%=n%><br>
나이 : ${param.age}<br>

msg : ${msg}<br>
<% String s=(String)request.getParameter("msg"); %>
<%=s%><br>

msg1 : ${msg1}<br>
<% s=(String)request.getParameter("msg1"); %>
<%=s%><br>

data : ${data + 10}<br>

</body>
</html>