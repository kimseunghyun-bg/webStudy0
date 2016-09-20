<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/WEB-INF/mytag.tld" %>
<%@ taglib prefix="page" uri="/WEB-INF/paginate.tld" %>
<%@ taglib prefix="cal" uri="/WEB-INF/calendarTag.tld" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	String pageNum=request.getParameter("page");
	int current_page=1;
	if(pageNum!=null)
		current_page=Integer.parseInt(pageNum);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<cal:date year="2016" month="9"/>
</div>

<div>
	<page:page total_page="100" uri="ex1.jsp" current_page="<%=current_page%>"/>
</div>

<my:gugudan num="5"/>

</body>
</html>