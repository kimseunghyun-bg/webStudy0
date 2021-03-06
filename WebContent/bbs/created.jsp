<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
   request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
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
.boxTA {
	border:1px solid #999;
	height:150px;
	padding:3px 6px;
	border-radius:4px;
	background-color:#ffffff;
	font-family: 나눔고딕, "맑은 고딕", 돋움, sans-serif;
	font-size: 9pt;
}
</style>

<script type="text/javascript">
  // 좌우의 공백을 제거하는 함수
  String.prototype.trim = function(){
	  var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
	  return this.replace(TRIM_PATTERN, "");
  };

  function sendBoard() {
        var f = document.boardForm;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return;
        }

	    str = f.name.value;
        if(!str) {
            alert("이름을 입력하세요. ");
            f.name.focus();
            return;
        }

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }

    	str = f.pwd.value;
        if(!str) {
            alert("패스워드를 입력하세요. ");
            f.pwd.focus();
            return;
        }
    	
        f.action = "<%=cp%>/bbs/created_ok.jsp";
            
        f.submit();
  }
</script>

</head>

<body>

<table style="width: 600px; margin: 30px auto 0px; border-spacing: 0px;">
<tr height="40">
	<td align="left" class="title">
		<img src="<%=cp%>/res/images/arrow.gif" alt="" style="padding-left: 5px; padding-right: 5px;">게시판
	</td>
</tr>
</table>

<form name="boardForm" method="post">
  <table style="width: 600px; margin: 20px auto 0px; border-spacing: 0px;">
  <tr><td colspan="2" height="3" bgcolor="#507CD1"></td></tr>

  <tr align="left" height="40"> 
      <td width="100" bgcolor="#EEEEEE" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
      <td width="500" style="padding-left:10px;"> 
        <input type="text" name="subject" size="75" maxlength="100" class="boxTF">
      </td>
  </tr>

   <tr><td colspan="2" height="1" bgcolor="#DBDBDB"></td></tr>

  <tr align="left" height="40"> 
      <td width="100" bgcolor="#EEEEEE" style="text-align: center;">작성자</td>
      <td width="500" style="padding-left:10px;"> 
        <input type="text" name="name" size="35" maxlength="20" class="boxTF">
      </td>
  </tr>

   <tr><td colspan="2" height="1" bgcolor="#DBDBDB"></td></tr>

  <tr align="left"> 
      <td width="100" bgcolor="#EEEEEE" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
      <td width="500" valign="top" style="padding:5px 0px 5px 10px;"> 
        <textarea name="content" cols="75" rows="12" class="boxTA"></textarea>
      </td>
  </tr>

   <tr><td colspan="2" height="1" bgcolor="#DBDBDB"></td></tr>

  <tr align="left" height="40" >
      <td width="100" bgcolor="#EEEEEE" style="text-align: center;">패스워드</td>
      <td width="500" style="padding-left:10px;"> 
           <input type="password" name="pwd" size="35" maxlength="7" class="boxTF">&nbsp;(게시물 수정 및 삭제시 필요 !!!)
       </td>
  </tr> 

  <tr><td colspan="2" height="3" bgcolor="#507CD1"></td></tr>
  </table>

  <table style="width: 600px; margin: 0px auto; border-spacing: 0px;">
     <tr height="45"> 
      <td align="center" >
        <input type="button" value=" 등록하기 " class="btn" onclick="sendBoard();">
        <input type="reset" value=" 다시입력 " class="btn" onclick="document.boardForm.subject.focus();">
        <input type="button" value=" 등록취소 " class="btn" onclick="javascript:location.href='<%=cp%>/bbs/list.jsp';">
      </td>
    </tr>
  </table>
</form>

</body>
</html>