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
<%//액션이 없으면 자기 자신%>
<form method="post">
	number : <input type="text" name="num">
	<button> submit </button>
</form>
<br>

<%//<c: 는 <jsp:과 유사하다.%>
<c:if test="${not empty param.num}">
	<%//문자열도 ==으로 비교한다. %>
	<c:if test="${param.num %2 ==0 }">
		${param.num } is even.<br>
	</c:if>
	<c:if test="${param.num %2 !=0 }">
		${param.num } is odd.<br>
	</c:if>
</c:if>



</body>
</html>