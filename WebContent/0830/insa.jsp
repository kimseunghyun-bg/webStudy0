<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function send(){
	
	var f=document.insaForm
	
	if(! /^[\uac00-\ud7a3]*$/g.test(f.name.value)){
		alert("이름을 입력하세요.")
		f.name.focus();
		return;
	}
	
	if(! /[12][0-9]{3}-[0-9]{2}-[0-9]{2}/.test(f.birth.value)){
		alert("생년월일을 입력하세요.")
		f.birth.focus();
		return;
	}
	
	if(!f.tel.value){
		alert("전화번호을 입력하세요.")
		f.tel.focus();
		return;
	}
	
	if(!/^(\d+)$/.test(f.basicpay.value)){
		alert("기본급을 입력하세요.")
		f.basicpay.focus();
		return;
	}
	
	if(!/^(\d+)$/.test(f.extrapay.value)){
		alert("수당을 입력하세요.")
		f.extrapay.focus();
		return;
	}
	
	f.submit();
	
}
</script>

<style type="text/css">
* {
	margin: 0px; padding: 0px;
}

span {
	width: 400px; height: 25px;
}

form {
	width: 400px; height: 125px;
}


input {
	width: 300px; height: 25px; padding: 3px;
}

</style>

</head>
<body>

<form action="insa_ok.jsp" name="insaForm" method="post">
	<span><label>이름</label></span><span><input type="text" name="name"></span><br>
	<span><label>생년월일</label><input type="text" name="birth"></span><br>
	<span><label>전화번호</label><input type="text" name="tel"></span><br>
	<span><label>기본급</label><input type="text" name="basicpay"></span><br>
	<span><label>수당</label><input type="text" name="extrapay"></span><br>
	<button type="button" onclick="send();">등록하기</button>
</form>

</body>
</html>