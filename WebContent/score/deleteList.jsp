<%@page import="java.util.List"%>
<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	String[] hak=request.getParameterValues("haks");
	
	ScoreDAO dao=new ScoreDAO();
	
	int result=dao.deleteList(hak);
/* 	if(result==0)
		response.sendRedirect("list.jsp"); */
	response.sendRedirect("list.jsp");
%>
