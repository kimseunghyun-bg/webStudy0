<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<div><label>꿈의로또</label></div><br>
<form action="lotto_ok.jsp" method="post">
<div>로또 구매 갯수[1~5] : <input type="text" name="cnt"></div>
<table>
<%for(int i=1, cnt=0; i<=5; i++) {
	out.print("<tr>");
	for(int j=1; j<=9; j++){
		cnt++;
		out.print("<td>");
		out.print(cnt);
		out.print("<input type='checkbox'; name='checkbox'; value='"+cnt+"';>");
		out.print("</td>");
	}
	out.print("</tr>");
}
%>
</table><br>
<input type="submit" value="로또">
</form>
</div>
</body>
</html>