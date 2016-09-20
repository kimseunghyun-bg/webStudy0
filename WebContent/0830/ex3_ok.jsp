<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	out.println("메소드 : "+request.getMethod()+"<br>");
	out.println("get 방식 파라미터 : " + request.getQueryString()+"<br>");
	out.println("<hr>request로 넘어온 header 영역<br>");
	Enumeration<String> e=request.getHeaderNames();
	while(e.hasMoreElements()){
		String key=e.nextElement();
		String value=request.getHeader(key);
		out.println(key+" : "+value+"<br>");
	}
	
	InputStream is=request.getInputStream();
	byte[] b=new byte[1024];
	int size;
	String str;
	
	out.println("<hr>body영역 : post 파라미터...<br>");
	while((size=is.read(b))!=-1){
		str=new String(b,0,size);
		out.println(str+"<br>");
		str=URLDecoder.decode(str, "UTF-8");
		out.println(str+"<br>");
	}
%>


</body>
</html>