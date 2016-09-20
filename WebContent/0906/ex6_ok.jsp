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

<c:forEach var="vo" items="${data}">
${vo.name } | ${vo.age } <br>
</c:forEach>
<hr>

<c:forEach var="vo" items="${data}" varStatus="st">
${vo.name } | ${vo.age } |
${st.index} | ${st.count } | ${st.first} | ${st.last }<br>
</c:forEach>

</body>
</html>