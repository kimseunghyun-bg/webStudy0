<%@page import="com.tag.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/WEB-INF/mytag2.tld" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	List<User> list=new LinkedList<>();
	list.add(new User("자바",20));
	list.add(new User("스프링",15));
	list.add(new User("웹",25));
	
	request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<my:forEach2 items="${list}" var="dto">
${dto.name}|${dto.age}<br>
</my:forEach2>

</body>
</html>