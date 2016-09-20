<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


number : 12345.6789 <br>

number : <fmt:formatNumber value="12345.6789"/><br>
currency : <fmt:formatNumber value="12345.6789" type="currency"/><br>
currency : <fmt:formatNumber value="12345.6789" type="currency" currencySymbol="$"/><br>

percent : <fmt:formatNumber value="0.789" type="percent"/><br>
pattern : <fmt:formatNumber value="123456.789" pattern=".0"/><br>
pattern : <fmt:formatNumber value="123456.789" pattern="#,##0.0"/><br>
pattern : <fmt:formatNumber value="0.789" pattern="#,##0.0"/><br>
pattern : <fmt:formatNumber value="0.789" pattern="#,###.0"/><br>
pattern : <fmt:formatNumber value="123456.789" pattern="￦#,###.0"/><br>

<c:set var="now" value="<%=new java.util.Date()%>"/>

${now}<br>

<fmt:formatDate value="${now}" type="date"/><br>
<fmt:formatDate value="${now}" type="time"/><br>
<fmt:formatDate value="${now}" type="both"/><br>

</body>
</html>