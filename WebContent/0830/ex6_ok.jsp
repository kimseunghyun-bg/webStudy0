<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	int row=Integer.parseInt(request.getParameter("row"));
	int col=Integer.parseInt(request.getParameter("col"));
	
	int n=0;
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<table border="1"
    style="width: <%=col*50%>px; margin: 10px auto; border-collapse: collapse;">
<%for(int i=1; i<=row; i++) { %>
     <tr height="30">
     <%for(int j=1; j<=col; j++) { %>
         <td align="center">
             <%= (++n)%>
           </td>
     <%} %>
     </tr>
  <%} %>     
</table>

</body>
</html>