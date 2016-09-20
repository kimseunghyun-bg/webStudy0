<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	//forwarding 된 경우에는 request, response 객체가 그대로 넘어온다.
	String name=request.getParameter("name");
	int age=Integer.parseInt(request.getParameter("age"));
	
	String s=(String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름 : <%=name%><br>
나이 : <%=age%><br>
<%=s%><br>

</body>
</html>