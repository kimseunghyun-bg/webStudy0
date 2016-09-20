<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	//redirect 된 경우에는 request, response 객체가 초기화 됨.
	String name=request.getParameter("name");
	String age=request.getParameter("age");
	
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