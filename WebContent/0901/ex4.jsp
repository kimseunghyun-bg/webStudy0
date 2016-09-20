<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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

<form action="ex4_ok.jsp" method="post">
	이름 : <input type="text" name="name"><br>
	나이 : <input type="text" name="age"><br>
	<button>보내기</button>
</form>

</body>
</html>