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
	dto.setIpAddr(request.getRemoteAddr());

	BoardDAO dao=new BoardDAO();
	dao.insertBoard(dto);
	
	response.sendRedirect(cp+"/bbs/list.jsp");	//list.jsp도 가능.
%>