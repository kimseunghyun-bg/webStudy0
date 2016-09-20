<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	int age=Integer.parseInt(request.getParameter("age"));
	String msg="성인 입니다.";
	if(age<19)
		msg="미성년자 입니다.";
	
	request.setAttribute("msg", msg);
	request.setAttribute("data", 10);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:forward page="ex1_result.jsp"/>

</body>
</html>