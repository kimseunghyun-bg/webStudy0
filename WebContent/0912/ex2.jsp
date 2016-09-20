<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- enctype="multipart/form-data" 형식으로 전송한 데이터는 request.getParameter()로 받을 수 없다. -->
<!-- 파일 업로드를 위해 생략해서는 안되는 것 : enctype="multipart/form-data" -->
<form action="ex2_ok.jsp" method="post" enctype="multipart/form-data">
이름 : <input type="text" name="name"><br>
제목 : <input type="text" name="subject"><br>
파일 : <input type="file" name="upload"><br>
 <button>보내기</button>
</form>

</body>
</html>