<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String name=request.getParameter("name");
int age=Integer.parseInt(request.getParameter("age"));
String sage="성인";
if(age<19)
	sage="미성년자";
String gender=request.getParameter("gender");
String []hobbys=request.getParameterValues("hobby");
String hh="";
if(hobbys!=null){
	for(String s:hobbys)
		hh+=s+" ";
}
String hak=request.getParameter("hak");
String subject=request.getParameter("subject");
String []subjects=request.getParameterValues("subject");
String ss="";
if(subjects!=null){
	for(String s:subjects)
		ss+=s+" ";
}

String memo=request.getParameter("memo");
memo=memo.replaceAll("&", "&amp;").replaceAll("\"", "&quot;")
			.replaceAll(">", "&gt;").replaceAll("<", "&lt;")
			.replaceAll("\n", "<br>").replaceAll("\\s", "&nbsp;");

%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

아이디 : <%=id %><br>
패스워드 : <%=pwd %><br>
이름 : <%=name %><br>
나이 : <%=age %>, <%=sage %><br>
성별 : <%=gender %><br>
취미 : <%=hh %><br>
학력 : <%=hak %><br>
좋아하는 과목 : <%=ss %><br>
메모 : <br><%=memo %><br>

</body>
</html>