<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function check(){
	
	var f=document.calForm;
	
	if(!/^-?(\d+)$/.test(f.num1.value)){
		alert("첫번째 수...");
		f.num1.focus();
		return false;
	}
	
	if(!/^-?(\d+)$/.test(f.num2.value)){
		alert("두번째 수...");
		f.num2.focus();
		return false;
	}
	
	return true;
	
}

</script>

</head>
<body>

<form action="cal_ok.jsp" method="post" name="calForm" onsubmit="return check();">
<input type="text" name="num1">

<select name="san">
<option>산술기호</option>
<option value="+">더하기</option>
<option value="-">빼기</option>
<option value="/">나누기</option>
<option value="*">곱하기</option>
</select>

<input type="text" name="num2">=
<input type="submit" value="계산">
</form>

</body>
</html>