<%@page import="com.util.MyUtil"%>
<%@page import="com.score.ScoreDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
	ScoreDAO dao=new ScoreDAO();
	//List<ScoreDTO> list=dao.listScore();
	
	MyUtil util=new MyUtil();
	
	String pageNum=request.getParameter("page");
	int current_page=1;
	if(pageNum!=null)
		current_page=Integer.parseInt(pageNum);
	
	int dataCount;
	int total_page;
	int numPerPage=5;
	
	dataCount=dao.dataCount();
	total_page=util.pageCount(numPerPage, dataCount);
	
	if(current_page>total_page)
		current_page=total_page;
	
	int start=(current_page-1)*numPerPage+1;
	int end=current_page*numPerPage;
	
	List<ScoreDTO> list=dao.listScore(start, end);
	
	String listUrl="list.jsp";
	String paging = util.paging(current_page, total_page, listUrl);
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
</style>

<script type="text/javascript">
function deleteList() {
	var f=document.listForm;
	var cnt=0;
	
	if(f.haks==undefined) {
		return;		
	}
	
	if(f.haks.length!=undefined) {// 체크박스가 둘 이상인 경우
		for(var i=0; i<f.haks.length; i++) {
			if(f.haks[i].checked)
				cnt++;
		}
	} else {
		// 체크박스가 하나인 경우
		if(f.haks.checked)
			cnt++;
	}
	
	if(cnt==0) {
		alert("선택한 항목이 없습니다.");
		return;
	}
	
	if(confirm("선택한 자료를 삭제 하시겠습니까?")){
		f.action="deleteList.jsp";
		f.submit();
	}
	
}

function check() {
	var f=document.listForm;
	
	if(f.haks==undefined)
		return;
	
	if(f.haks.length!=undefined) { // 체크박스가 둘 이상인 경우
		for(var i=0; i<f.haks.length; i++) {
			if(f.chkAll.checked)
				f.haks[i].checked=true;
			else
				f.haks[i].checked=false;
		}
	} else { // 체크박스가 하나인 경우
		if(f.chkAll.checked)
			f.haks.checked=true;
		else
			f.haks.checked=false;
	}
}

function deleteScore(hak) {
	var url="delete.jsp?hak="+hak;
	
	if(confirm("자료를 삭제 하시겠습니까 ?")){
		location.href=url;
	}
}

function updateScore(hak) {
	var url="update.jsp?hak="+hak;
	location.href=url;
}
</script>

</head>
<body>

<div style="margin: 0px auto; margin-top: 30px;">
<table style="width: 700px; margin: 0px auto; border-spacing: 0px;">
<tr height="35">
   <td align="left" class="title">
		▣ 성적처리
	</td>
</tr>
</table>

<table style="width: 700px; margin: 10px auto 0px; border-spacing: 0px;">
<tr height="35">
   <td align="left">
       <input type="button" value="삭제" class="btn" onclick="deleteList();">
   </td>
   <td align="right">
       <input type="button" value="  등록하기  " class="btn" onclick="javascript:location.href='write.jsp';">
   </td>
</tr>
</table>

<form method="post" name="listForm">
<table style="width: 700px; margin: 0px auto; border-spacing: 1px; background: #cccccc;">
<tr height="25" bgcolor="#e4e6e4" align="center">
	<td width="35">
	    <input type="checkbox" name="chkAll" value="all" onclick="check();">
	</td>
	<td width="60">학번</td>
	<td width="100">이름</td>
	<td width="80">생년월일</td>
	<td width="60">국어</td>
	<td width="60">영어</td>
	<td width="60">수학</td>
	<td width="60">총점</td>
	<td width="60">평균</td>
	<td width="60">석차</td>
	<td width="100">수정</td>
</tr>

<% for(ScoreDTO dto : list) { %>
<tr height="35" bgcolor="#ffffff" align="center">
	<td>
	    <input type="checkbox" name="haks" value="<%=dto.getHak()%>">
	</td>
	<td><%=dto.getHak()%></td>
	<td><%=dto.getName()%></td>
	<td><%=dto.getBirth()%></td>
	<td><%=dto.getKor()%></td>
	<td><%=dto.getEng()%></td>
	<td><%=dto.getMat()%></td>
	<td><%=dto.getTot()%></td>
	<td><%=dto.getAve()%></td>
	<td><%=dto.getRank()%></td>
	<td>
		<input type="button" value="수정" onclick="updateScore('<%=dto.getHak()%>')" class="btn">
		<input type="button" value="삭제" onclick="deleteScore('<%=dto.getHak()%>')" class="btn">
	</td>
</tr>
<%} %>

</table>
</form>

<table style="width: 700px; margin: 10px auto 0px; border-spacing: 0px;">
	<tr height="35px">
		<td align="center">
			<%=paging %>
		</td>
	</tr>
</table>



</div>

</body>
</html>