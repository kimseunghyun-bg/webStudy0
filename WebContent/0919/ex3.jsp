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

<c:set var="url" value="http://www.google.com"/>
<c:import url="${url}" var="u"/>

<h3>google 사이트 내용 보기</h3>
<c:out value="${u}" escapeXml="false"/>
<hr>

<h3>google 사이트 소스 보기</h3>
<c:out value="${u}"/>
<hr>

<c:set var="url" value="http://www.naver.com"/>
<c:import url="${url}" var="u"/>

<h3>naver 사이트 내용 보기</h3>
<c:out value="${u}" escapeXml="false"/>
<hr>

<h3>naver 사이트 소스 보기</h3>
<c:out value="${u}"/>
<hr>

</body>
</html>