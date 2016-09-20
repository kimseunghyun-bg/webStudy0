<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	//쿠키제거
	Cookie c1=new Cookie("name", null);
	c1.setMaxAge(0);
	response.addCookie(c1);
	
	Cookie c2=new Cookie("city", null);
	c2.setMaxAge(0);
	response.addCookie(c2);
	
	Cookie c3=new Cookie("tel",null);
	c3.setPath("/");//모든 쿠키는 설정한 경로에서 접근 가능
					//쿠키를 접근할 수 있는 경로를 모든 폴더에서 접근할 수 있도록 설정
	c3.setMaxAge(0);
	response.addCookie(c3);
	
	Cookie c4=new Cookie("age", null);
	c4.setMaxAge(0);
	response.addCookie(c4);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>