<%@page import="java.net.URLEncoder"%>
<%@page import="com.bbs.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.bbs.BoardDAO"%>
<%@page import="com.util.MyUtil"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
	
	MyUtil util=new MyUtil();
	BoardDAO dao=new BoardDAO();
	
	// 파라미터로 넘어오는 데이터 처리(반드시 넘어오지는 않음) : page, searchkey, searchValue
	String pageNum=request.getParameter("page");
	int current_page=1;
	if(pageNum!=null)
		current_page=Integer.parseInt(pageNum);
	
	//검색
	String searchKey=request.getParameter("searchKey");
	String searchValue=request.getParameter("searchValue");
	
	if(searchKey==null){
		searchKey="subject";
		searchValue="";
	}
	
	//GET 방식인 경우
	if(request.getMethod().equalsIgnoreCase("GET")){
		searchValue=URLDecoder.decode(searchValue, "UTF-8");	//디코딩. 브라우저 버전이 낮을 경우 한글은 E1A5이런식으로 나옴.
	}
	
	int dataCount=0;
	if(searchValue.length()==0)	// 검색이 아닌 경우
		dataCount=dao.dataCount();
	else	//검색인 경우
		dataCount=dao.dataCount(searchKey, searchValue);
	
	int numPerPage=3;
	int total_page=util.pageCount(numPerPage, dataCount);
	
	if(current_page>total_page)
		current_page=total_page;
	
	//데이터 가져오기
	int start=(current_page-1)*numPerPage+1;
	int end=current_page*numPerPage;
	
	List<BoardDTO> list=null;
	if(searchValue.length()==0)
		list=dao.listBoard(start, end);
	else
		list=dao.listBoard(start, end, searchKey, searchValue);
	
	// 글보기 및 글 리스트에 사용할 파라미터
	String params="";
	if(searchValue.length()!=0){
		params="searchKey="+searchKey;
		params+="&searchValue="+URLEncoder.encode(searchValue, "UTF-8");	//인코딩. 브라우저 버전이 낮을 경우 한글은 E1A5이런식으로 나옴.
	}
	
	//페이징 처리
	String listUrl=cp+"/bbs/list.jsp";
	String articleUrl=cp+"/bbs/article.jsp?page="+current_page;
	
	if(params.length()!=0){
		listUrl+="?"+params;
		articleUrl+="&"+params;
	}
	
	String paging=util.paging(current_page, total_page, listUrl);
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
.selectField {
	border:1px solid #999;
	padding:3px 6px;
	border-radius:4px;
	font-family: 나눔고딕, 맑은 고딕, 돋움, sans-serif;
	font-size: 9pt;
}
</style>

<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.action="<%=cp%>/bbs/list.jsp";
	f.submit();
}
</script>
</head>

<body>

<table style="width: 700px; margin: 30px auto 0px; border-spacing: 0px;">
<tr height="40">
	<td align="left" class="title">
		<img src="<%=cp%>/res/images/arrow.gif" alt="" style="padding-left: 5px; padding-right: 5px;">게시판
	</td>
</tr>
</table>

<table style="width: 700px; margin: 20px auto 0px; border-spacing: 0px;">
   <tr height="35">
      <td align="left" width="50%">
          <form name="searchForm" action="" method="post">
              <select name="searchKey" class="selectField">
                  <option value="subject">제목</option>
                  <option value="name">작성자</option>
                  <option value="content">내용</option>
                  <option value="created">등록일</option>
            </select>
            <input type="text" name="searchValue" class="boxTF">
            <input type="button" value=" 검 색 " class="btn" onclick="searchList()">
        </form>
      </td>
      <td align="right">
          <input type="button" value=" 글올리기 " class="btn" onclick="javascript:location.href='<%=cp%>/bbs/created.jsp';">
      </td>
   </tr>
</table>

<table style="width: 700px; margin: 0px auto; border-spacing: 0px;">
  <tr align="center" bgcolor="#507CD1" height="30"> 
      <td width="60" style="color: #ffffff;">번호</td>
      <td width="400" style="color: #ffffff;">제목</td>
      <td width="100" style="color: #ffffff;">작성자</td>
      <td width="80" style="color: #ffffff;">작성일</td>
      <td width="60" style="color: #ffffff;">조회수</td>
  </tr>
 
 <%for(BoardDTO dto : list) {%>
  <tr align="center" bgcolor="#ffffff" height="30"> 
      <td align="center"><%=dto.getNum()%></td>
      <td align="left" style="padding-left: 10px;">
           <a href="<%=articleUrl%>&num=<%=dto.getNum()%>"><%=dto.getSubject()%></a>
      </td>
      <td align="center"><%=dto.getName()%></td>
      <td align="center"><%=dto.getCreated()%></td>
      <td align="center"><%=dto.getHitCount()%></td>
  </tr>
  <tr><td height="1" colspan="5" bgcolor="#e4e4e4"></td></tr> 
<% } %>

</table>
 
<table style="width: 700px; margin: 0px auto; border-spacing: 0px;">
   <tr height="35">
	<td align="center">
        <%if(dataCount==0) {%>
        	등록된 게시물이 없습니다.
        <% } %>
        <%if(dataCount!=0) {%>
        	<%=paging %>
        <% } %>
	</td>
   </tr>
</table>

</body>
</html>