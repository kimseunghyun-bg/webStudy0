<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	int age=Integer.parseInt(request.getParameter("age"));
	String s="성인";
	if(age<19)
		s="미성년자";
	request.setAttribute("msg", s);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

제가 보이나요 제가 보이면...

<jsp:forward page="ex3_result.jsp"/>

</body>
</html>