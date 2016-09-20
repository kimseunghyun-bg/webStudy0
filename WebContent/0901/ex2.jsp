<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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

<form action="ex2_ok.jsp" method="post">
아이디 : <input type="text" name="id"><br>
패스워드 : <input type="password" name="pwd"><br>
이름 : <input type="text" name="name"><br>
나이 : <input type="text" name="age"><br>
성별 : <input type="radio" name="gender" value="남" checked="checked">남자
         <input type="radio" name="gender" value="여">여자<br>
취미 : <input type="checkbox" name="hobby" value="운동">운동
         <input type="checkbox" name="hobby" value="게임">게임
         <input type="checkbox" name="hobby" value="영화">영화
         <input type="checkbox" name="hobby" value="음악">음악
         <input type="checkbox" name="hobby" value="낚시">낚시<br>
학력 : <select name="hak">
             <option value="대졸">대졸입니다</option>
             <option value="고졸">고졸입니다</option>
             <option value="기타">기타입니다</option>
        </select><br>
좋아하는 과목 :
       <select name="subject" multiple="multiple" size="5">
       		<option>자바</option>
       		<option>안드로이드</option>
       		<option>HTML</option>
       		<option>CSS</option>
       		<option>자바스크립트</option>
       		<option>서블릿</option>
       		<option>스프링</option>
       </select><br>
메모 : <textarea rows="5" cols="40" name="memo"></textarea>
<br>       
       <button>보내기</button>
</form>

</body>
</html>