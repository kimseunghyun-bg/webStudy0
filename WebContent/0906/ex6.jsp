<%@page import="java.util.ArrayList"%>
<%@page import="com.user.User"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");

	List<User> list=new ArrayList<>();
	
	list.add(new User("A", 11));
	list.add(new User("B", 13));
	list.add(new User("C", 15));
	list.add(new User("D", 17));
	
	list.add(new User("E", 20));
	list.add(new User("F", 19));
	list.add(new User("G", 14));
	list.add(new User("H", 8));
	
	request.setAttribute("data", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="ex6_ok.jsp"/>
</body>
</html>