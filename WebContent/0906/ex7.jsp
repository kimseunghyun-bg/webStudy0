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

<form method="post">
	number : <input type="text" name="num">
	<button> submit </button>
</form>
<br>

<c:if test="${not empty param.num}">
	<c:set var="s" value="0"/>
	<c:forEach var="n" begin="1" end="${param.num }">
		<c:set var="s" value="${s+n}"/>
	</c:forEach>
	결과 : ${s}<br>
</c:if>


</body>
</html>