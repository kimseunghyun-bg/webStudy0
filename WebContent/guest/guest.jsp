<%@page import="com.guest.GuestDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.guest.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	GuestDAO dao=new GuestDAO();
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
	
	List<GuestDTO> list=dao.listGuest(start, end);
	
	String listUrl="guest.jsp";
	String pagin = util.paging(current_page, total_page, listUrl);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function deleteGuest(num){
	var url="delete.jsp?num="+num;
	
	if(confirm("방명록을 삭제 하시겠습니까?")){
		location.href=url;
	}
}

function check(){
	var f=document.guestForm;
	
	if(!f.name.value){
		alert("이름을 입력해주세요.");
		f.name.focus();
		return false;
	}
	
	if(!f.content.value){
		alert("내용을 입력해주세요.");
		f.content.focus();
		return false;
	}
	
	return true;
}
</script>

<style type="text/css">
*{
	margin: 0px; padding: 0px;
}
span {

}

</style>

</head>
<body>
<div style="width: 720px; height: auto; margin: 0px auto;">

<form action="guest_ok.jsp" method="post" name="guestForm" onsubmit="return check();">
<div style="margin : 10px 0px 0px 0px; padding : 0px 0px 10px 0px; border-bottom: 2px solid gray;">
<span>이름 : <input type="text" name="name"></span></div><br>
<div><span>내용<br><textarea rows="20" cols="100" name="content"></textarea></span></div>
<input type="submit" value="등록"><br><br>
</form>

<% for(GuestDTO dto: list) { %>
<div>
이름 : <span><%=dto.getName()%></span><span style="float: right;">등록 시간 : <%=dto.getDate()%></span></span><br>
내용 : <textarea rows="20" cols="100" readonly="readonly"><%=dto.getContent()%></textarea><br>
<input type="button" name="delete" value="삭제" onclick="deleteGuest('<%=dto.getNum()%>')" ><br><br>
</div>
<%} %>
</div>
</body>
</html>