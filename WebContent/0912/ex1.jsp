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

<!-- 파일의 이름만 서버로 전송된다. -->
<form action="ex1_ok.jsp" method="post">
이름 : <input type="text" name="name"><br>
제목 : <input type="text" name="subject"><br>
파일 : <input type="file" name="upload"><br>
 <button>보내기</button>
</form>

</body>
</html>