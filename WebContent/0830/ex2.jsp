<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!
	//선언부(필드, 메소드 정의 영역)
	int a;

	public int sum(int n){
		int s=0;
		for(int i=1; i<=n; i++)
			s+=i;
		return s;
}
%>

<%
	// scriptlet -> service() method 안에 정의 됨.
	int b=0;

	a++;
	b++;
	
	Calendar cal=Calendar.getInstance();
	String s=String.format("%tF %tT", cal, cal);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

1~100까지 합 : <%=sum(100) %><br>
a:<% out.print(a); %><br>
b:<%=b %><br>
s:<%=s %><br>
수정했다.

</body>
</html>