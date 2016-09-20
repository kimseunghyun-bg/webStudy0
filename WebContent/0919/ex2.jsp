<%@page import="java.net.URLDecoder"%>
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

<ul>
<li>상품명 가격
</li>
<li><a href="phone.jsp">휴대폰</a>&nbsp;100</li>
<li><a href="com.jsp">컴퓨터</a>&nbsp;90</li>
<li><a href="note.jsp">노트북</a>&nbsp;150</li>
<li><a href="tablet.jsp">태블릿</a>&nbsp;50</li>

<li>오늘본 상품목록</li>
<%
	Cookie[] cc=request.getCookies();
	for(Cookie c:cc){
		String name=c.getName();
		String value=c.getValue();
		
		if(name.equals("goods")){
			value=URLDecoder.decode(value,"UTF-8");
			out.print("상품 :"+value+"<br>");
		}
	}

%>
</ul>

</body>
</html>