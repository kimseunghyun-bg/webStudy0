<%@page import="com.score.ScoreDTO"%>
<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	String hak=request.getParameter("hak");
	
	ScoreDAO dao=new ScoreDAO();
	dao.deleteScore(hak);
	
	response.sendRedirect("list.jsp");
%>
