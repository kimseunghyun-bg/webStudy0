<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Enumeration"%>
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

<%
	String cintetnString=request.getContentType();
	Enumeration<String> e=request.getHeaderNames();
	
	out.print("헤더 정보...<br>");
	while(e.hasMoreElements()){
		String key=(String)e.nextElement();
		String value=request.getHeader(key);
		out.print(key+":"+value+"<br>");
	}
	out.print("<hr>");
	
	out.print("데이터...<br>");
	BufferedReader br=new BufferedReader(new InputStreamReader(request.getInputStream(),"ISO-8859-1"));
	
	String str;
	while((str=br.readLine())!=null){
		out.print(new String(str.getBytes("ISO-8859-1"),"euc-kr")+"<br>");
	}
	
%>

</body>
</html>