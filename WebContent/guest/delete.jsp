<%@page import="com.guest.GuestDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	GuestDAO dao=new GuestDAO();
	
	int num=Integer.parseInt(request.getParameter("num"));
	
	dao.deleteGuest(num);
	response.sendRedirect("guest.jsp");
%>