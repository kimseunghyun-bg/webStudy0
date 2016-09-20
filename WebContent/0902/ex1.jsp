<%@page import="com.util.MyUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	MyUtil util=new MyUtil();
	
	int dataCount=966;
	int numPerPage=10;
	
	String pageNum=request.getParameter("page");
	int current_page=1;
	if(pageNum!=null)
		current_page=Integer.parseInt(pageNum);
	
	int total_page=util.pageCount(numPerPage, dataCount);
	if(current_page>total_page)
		current_page=total_page;
	
	String listUrl="ex1.jsp";
	String paging=util.paging(current_page, total_page, listUrl);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a{
	font-family: 돋움;
	font-size: 15pt;
	text-decoration: none;
	color:black;
}

a:hover{
	text-decoration: underline;
	color: tomato;
}

span{
	font-family: 돋움;
	font-size: 20pt;
	text-decoration: none;
	color:black;
}
</style>
</head>
<body>

<div>
	이곳은 <%=current_page%>의 내용 입니다.
</div>

<div style="width: 800px; height: 50px; line-height: 50px; margin: 30px auto; text-align: center;]">
<%=paging%>	
</div>

</body>
</html>