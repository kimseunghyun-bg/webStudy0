<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="background: gray; width: 800px; height: 40px; text-align: center;">스크린</div>

<form action=""></form>
<div style="width: 800px; height: 300px;">
<table style="width: 800px; height: 260px;">
	<%for(int i=1; i<=11; i++){ %>
	<tr>
		<%for(int j=1; j<=16; j++){ %>
			<%if(i==1 && j==1) {%>
			<td></td>
			<%}else if(i==1 && j>1){%>
			<td><%=j-1 %></td>
			<%}else if(i>1 && j==1){%>
			<td><%=i-1 %></td>
			<%}else{%>
			<td><input name="<%=(j-1)+":"+(i-1) %>" type="checkbox"></td>
			<%} %>
		<%} %>
	</tr>
	<%} %>
</table>
</div>

</body>
</html>