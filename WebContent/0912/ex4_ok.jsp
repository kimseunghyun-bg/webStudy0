<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	// String root=pageContext.getServletContext().getRealPath("/");
	String root=session.getServletContext().getRealPath("/");
	// System.out.println(root);
	
	String pathname=root+File.separator+"uploads"+File.separator+"pds";
	File f=new File(pathname);
	if(! f.exists()){
		f.mkdirs();
	}
	
	String encType="UTF-8";
	int maxFilesize=5*1024*1024;
	
	MultipartRequest mreq=null;
	mreq=new MultipartRequest(request, pathname, maxFilesize, encType, new DefaultFileRenamePolicy());
	
	String name=mreq.getParameter("name");
	String subject=mreq.getParameter("subject");
	String saveFilename=mreq.getFilesystemName("upload");
	String originalFilename=mreq.getOriginalFileName("upload");
	long len=0;
	File file=mreq.getFile("upload");
	if(file!=null)
		len=file.length();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

이름 : <%=name%><br>
제목 : <%=subject%><br>
서버에저장된파일명 : <%=saveFilename%><br>
업로드한파일명 : <%=originalFilename%><br>
파일크기 : <%=len%><br>

<hr>
<a href="download.jsp?saveFilename=<%=saveFilename%>&originalFilename=<%=originalFilename%>">다운로드</a>


</body>
</html>