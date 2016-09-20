<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="com.bbs.BoardDTO"%>
<%@ page import="com.bbs.BoardDAO"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
	
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("page");
	
	String searchKey=request.getParameter("searchKey");
	String searchValue=request.getParameter("searchValue");
	if(searchKey==null) {
		searchKey="subject";
		searchValue="";
	}
	
	if(request.getMethod().equalsIgnoreCase("GET")) {
		searchValue=URLDecoder.decode(searchValue, "utf-8");
	}
	
	BoardDAO dao=new BoardDAO();
	
	dao.updateHitCount(num); // 조회수 증가
	
	BoardDTO dto=dao.readBoard(num);
	
	if(dto==null) { // 다른클라이언트에의해 삭제된 경우
		response.sendRedirect(cp+"/bbs/list.jsp?page="+pageNum);
	    return;
	}
	int linesu=dto.getContent().split("\n").length;

	dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	
	// 이전글/다음글
	BoardDTO preReadDto = dao.preReadBoard(num, searchKey, searchValue);
    BoardDTO nextReadDto = dao.nextReadBoard(num, searchKey, searchValue);
	
	String params = "page="+pageNum;
	if(!searchValue.equals("")) {
	    params += "&searchKey=" + searchKey + 
	              "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
	}
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
function deleteBoard(num) {
	if(confirm("위 자료를 삭제 하시겠습니까 ?")) {
		var url="<%=cp%>/bbs/delete.jsp?num="+num+"&page=<%=pageNum%>";
		location.href=url;
	}
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

<table style="width: 600px; margin: 20px auto 0px; border-spacing: 0px;">
<tr><td colspan="4" height="3" bgcolor="#507CD1"></td></tr>

<tr height="35">
    <td colspan="4" align="center">
	   <%=dto.getSubject()%>
    </td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#507CD1" ></td></tr>

<tr height="30">
    <td width="80" bgcolor="#EEEEEE" align="center">작성자</td>
    <td width="220" align="left" style="padding-left:10px;">
         <%=dto.getName()%>
    </td>
    <td width="80" bgcolor="#EEEEEE" align="center">줄&nbsp;&nbsp;수</td>
    <td width="220" align="left" style="padding-left:10px;">
         <%=linesu%>
     </td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#DBDBDB"></td></tr>

<tr height="30">
    <td width="80" bgcolor="#EEEEEE" align="center">등록일</td>
    <td width="220" align="left" style="padding-left:10px;">
        <%=dto.getCreated()%>
    </td>
    <td width="80" bgcolor="#EEEEEE" align="center">조회수</td>
    <td width="220" align="left" style="padding-left:10px;">
        <%=dto.getHitCount()%>
    </td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#507CD1"></td></tr>

<tr>
  <td colspan="4" align="left" style="padding: 20px 50px 20px 50px;" valign="top" height="200">
        <%=dto.getContent()%>
   </td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#507CD1"></td></tr>

<tr height="30">
    <td width="80" bgcolor="#EEEEEE" align="center">이전글</td>
    <td width="520" align="left" style="padding-left:10px;" colspan="3">
       <%if(preReadDto!=null) {%>
              <a href="<%=cp%>/bbs/article.jsp?<%=params%>&num=<%=preReadDto.getNum()%>"><%=preReadDto.getSubject()%></a>
		<%}%>
	</td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#DBDBDB"></td></tr>

<tr height="30">
    <td width="80" bgcolor="#EEEEEE" align="center">다음글</td>
    <td width="520" align="left" style="padding-left:10px;" colspan="3">
       <%if(nextReadDto!=null) {%>
              <a href="<%=cp%>/bbs/article.jsp?<%=params%>&num=<%=nextReadDto.getNum()%>"><%=nextReadDto.getSubject()%></a>
		<%}%>
    </td>
</tr>
<tr><td colspan="4" height="3" bgcolor="#507CD1" align="center"></td></tr>

<tr height="30">
   <td colspan="4" align="right">
       From : <%=dto.getIpAddr()%>
   </td>
</tr>
</table>

<table style="width: 600px; margin: 0px auto; border-spacing: 0px;">
<tr height="35">
    <td width="50%" align="left">
          <input type="button" value=" 수정 " class="btn" onclick="javascript:location.href='<%=cp%>/bbs/update.jsp?num=<%=dto.getNum()%>&page=<%=pageNum%>';">
          <input type="button" value=" 삭제 " class="btn" onclick="deleteBoard('<%=dto.getNum()%>');">
    </td>

    <td align="right">
           <input type="button" value=" 리스트 " class="btn" onclick="javascript:location.href='<%=cp%>/bbs/list.jsp?<%=params%>';">
    </td>
</tr>
</table>

</body>

</html>