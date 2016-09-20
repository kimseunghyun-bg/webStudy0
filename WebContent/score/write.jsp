<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>study</title>
<style type="text/css">
*{
	margin: 0px; padding: 0px;
}
body {
	font-size: 9pt; font-family: 돋움;
}
a{
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}
a:active, a:hover {
	text-decoration: underline;
	color: tomato;
}
.title {
	font-weight: bold;
	font-size:13pt;
	margin-bottom:10px;
	font-family: 나눔고딕, 맑은 고딕, 돋움, sans-serif;
}
.btn {
	 font-size: 12px;
	 color:#333;
 	 font-weight:500;
	 font-family: 나눔고딕, 맑은 고딕, 돋움, sans-serif;
	 border:1px solid #ccc;
	 background-color:#FFF;
	 vertical-align:middle;
	 text-align:text-align;
	 cursor:cursor;
	 padding:4px 8px;
	 border-radius:4px;
	 margin-bottom: 3px;
}
.btn:active, .btn:focus, .btn:hover {
	 background-color:#e6e6e6;
	 border-color: #adadad;
	 color: #333;
}
.boxTF {
	border:1px solid #999;
	padding:4px 6px;
	border-radius:4px;
	background-color:#ffffff;
	font-family: 나눔고딕, 맑은 고딕, 돋움, sans-serif;
	font-size: 9pt;
}
</style>

<script type="text/javascript">
String.prototype.trim = function() {
	var p=/(^\s*)|(\s*$)/g;
	return this.replace(p, "");
};

function isValidDate(date) {
	// var f=/[12][0-9]{3}-[01][0-9]-[0-3][0-9]/;
	var f=/\d{4}-\d{2}-\d{2}/;
	
	if(! f.test(date))
		return false;
	
	var days=new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	
	var y=date.substr(0, 4);
	var m=date.substr(5, 2);
	var d=date.substr(8, 2);
	
	y=parseInt(y);
	if(m.charAt(0)=='0')
		m=m.charAt(1);
	m=parseInt(m);
	if(d.charAt(0)=='0')
		d=d.charAt(1);
	d=parseInt(d);
	
	if(y%4==0&&y%100!=0||y%400==0)
		days[1]=29;
	else
		days[1]=28;
	
	if(y<1900)
		return false;
	
	if(m<1||m>12)
		return false;
	
	if(d<1||d>days[m-1])
		return false;
	
	return true;
}

function check() {
	var f=document.forms[0];
	var format, s;
	
	format=/^\d{4,10}$/;
	if(! format.test(f.hak.value)) {
		alert("학번은 4~10이내의 숫자만 가능 합니다.");
		f.hak.focus();
		return false;
	}
	
	s=f.name.value;
	s=s.trim();
	if(! s) {
		alert("이름을 입력 하세요.");
		f.name.focus();
		return false;
	}
	f.name.value=s;

	if(! isValidDate(f.birth.value)) {
		alert("생년월일을 입력 하세요(yyyy-mm-dd).");
		f.birth.focus();
		return false;
	}
	
	if(! /^(\d+)$/.test(f.kor.value) || parseInt(f.kor.value)<0 || parseInt(f.kor.value)>100) {
		alert("점수는 0~100 사이의 숫자만 가능합니다.");
		f.kor.focus();
		return false;
	}

	if(! /^(\d+)$/.test(f.eng.value) || parseInt(f.eng.value)<0 || parseInt(f.eng.value)>100) {
		alert("점수는 0~100 사이의 숫자만 가능합니다.");
		f.eng.focus();
		return false;
	}

	if(! /^(\d+)$/.test(f.mat.value) || parseInt(f.mat.value)<0 || parseInt(f.mat.value)>100) {
		alert("점수는 0~100 사이의 숫자만 가능합니다.");
		f.mat.focus();
		return false;
	}
	
	f.action="write_ok.jsp";

	return true;
}
</script>

</head>
<body>

<div style="margin: 0px auto; margin-top: 30px;">
<table style="width: 500px; margin: 0px auto; border-spacing: 0px;">
<tr height="40">
   <td align="left" class="title">
		▣ 성적처리
	</td>
</tr>
</table>

<form action="" method="post" onsubmit="return check();">
<table style="width: 500px; margin: 10px auto 0px; border-spacing: 0px;">
<tr height="2" bgcolor="#cccccc"><td colspan="2"></td></tr>
<tr height="40">
	<td width="100" bgcolor="#e4e6e4" align="center">학번</td>
	<td bgcolor="#ffffff" style="padding-left: 10px;">
		<input type="text" name="hak" class="boxTF" size="30" maxlength="10">
	</td>
</tr>
<tr height="1" bgcolor="#cccccc"><td colspan="2"></td></tr>

<tr height="40">
	<td width="100" bgcolor="#e4e6e4" align="center">이름</td>
	<td bgcolor="#ffffff" style="padding-left: 10px;">
		<input type="text" name="name" class="boxTF" size="30" maxlength="10">
	</td>
</tr>
<tr height="1" bgcolor="#cccccc"><td colspan="2"></td></tr>

<tr height="40">
	<td width="100" bgcolor="#e4e6e4" align="center">생년월일</td>
	<td bgcolor="#ffffff" style="padding-left: 10px;">
		<input type="text" name="birth" class="boxTF" size="30" maxlength="10">
	</td>
</tr>
<tr height="1" bgcolor="#cccccc"><td colspan="2"></td></tr>

<tr height="40">
	<td width="100" bgcolor="#e4e6e4" align="center">국어</td>
	<td bgcolor="#ffffff" style="padding-left: 10px;">
		<input type="text" name="kor" class="boxTF" size="30" maxlength="3">
	</td>
</tr>
<tr height="1" bgcolor="#cccccc"><td colspan="2"></td></tr>

<tr height="40">
	<td width="100" bgcolor="#e4e6e4" align="center">영어</td>
	<td bgcolor="#ffffff" style="padding-left: 10px;">
		<input type="text" name="eng" class="boxTF" size="30" maxlength="3">
	</td>
</tr>
<tr height="1" bgcolor="#cccccc"><td colspan="2"></td></tr>

<tr height="40">
	<td width="100" bgcolor="#e4e6e4" align="center">수학</td>
	<td bgcolor="#ffffff" style="padding-left: 10px;">
		<input type="text" name="mat" class="boxTF" size="30" maxlength="3">
	</td>
</tr><tr height="2" bgcolor="#cccccc"><td colspan="2"></td></tr>

</table>

<table style="width: 500px; margin: 0px auto; border-spacing: 0px;">
<tr height="45">
	<td align="center">
		<input type="submit" value=" 등록완료 " class="btn">	
		<input type="reset" value=" 다시입력 " class="btn">	
		<input type="button" value=" 등록취소 " class="btn" onclick="javascript:location.href='list.jsp';">	
	</td>
</tr>
</table>
</form>

</div>

</body>
</html>