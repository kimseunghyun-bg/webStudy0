<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("UTF-8");
    
    int num1=Integer.parseInt(request.getParameter("num1"));
    int num2=Integer.parseInt(request.getParameter("num2"));
    String san=request.getParameter("san");
    
    int result=0;
    
    if(san.equals("+"))
    	result=num1+num2;
    else if(san.equals("-"))
    	result=num1-num2;
    else if(san.equals("/"))
    	result=num1/num2;
	else if(san.equals("*"))
    	result=num1*num2;
    %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=num1 %><%=san %><%=num2 %>=<%=result %>
</body>
</html>