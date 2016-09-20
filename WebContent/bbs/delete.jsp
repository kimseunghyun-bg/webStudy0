<%@page import="com.bbs.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	BoardDAO dao=new BoardDAO();
	
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("page");
	
	dao.deleteBoard(num);
	
	String url="list.jsp?page="+pageNum;
	response.sendRedirect(url);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
삭제...
</body>
</html>