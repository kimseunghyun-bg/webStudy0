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
	<c:choose>
		<c:when test="${param.num%12==0}">
			${param.num}은 3과 4의 배수
		</c:when>
		<c:when test="${param.num%3==0}">
			${param.num}은 3의 배수
		</c:when>
		<c:when test="${param.num%4==0}">
			${param.num}은 4의 배수
		</c:when>
		<c:otherwise>
			${param.num}은 3또는 4의 배수가 아님
		</c:otherwise>
	</c:choose>
</c:if>

</body>
</html>