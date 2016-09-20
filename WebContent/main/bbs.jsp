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

<table style="width: 800px; height: 700px; margin: 10px auto;" >
	<tr height="50">
		<td>
			<jsp:include page="top.jsp"/>
		</td>
	</tr>
	
	<tr height="600">
		<td valign="top">
			게시판 입니다.
		</td>
	</tr>
	
	<tr height="50">
		<td align="center">
			<jsp:include page="bottom.jsp"/>
		</td>
	</tr>
</table>

</body>
</html>