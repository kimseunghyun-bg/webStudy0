<%@page import="com.util.FileManager"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	String root=session.getServletContext().getRealPath("/");
	// System.out.println(root);
	
	String pathname=root+File.separator+"uploads"+File.separator+"pds";
	
	String saveFilename=request.getParameter("saveFilename");
	String originalFilename=request.getParameter("originalFilename");
	
	boolean b=FileManager.doFiledownload(saveFilename, originalFilename, pathname, response);
	if(! b){
		out.print("<script>");
		out.print("alert('파일을 다운로드 하지 못했습니다.'); history.back();");
		out.print("</script>");
	}
%>