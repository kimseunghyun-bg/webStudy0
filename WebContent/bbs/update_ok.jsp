<%@page import="com.bbs.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="com.bbs.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	String pageNum=request.getParameter("page");

	BoardDAO dao=new BoardDAO();
	dao.updateBoard(dto);
	
	response.sendRedirect(cp+"/bbs/list.jsp?page="+pageNum);	//list.jsp도 가능.
%>