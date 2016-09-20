<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>study</title>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/res/css/board/article.css" type="text/css">
<script type="text/javascript">
function deleteBoard(num){
	if(confirm('게시물을 삭제 하시겠습니까?')){
		var url="<%=cp%>/bbs/delete.do?num="+num+"&page=${page}";
		location.href=url;
	}
}
</script>
</head>

<body>

<div class="board">
	<div class="board-title">
	  <img src="<%=cp%>/res/images/arrow.gif" alt="" style="padding-left: 5px; padding-right: 5px;">게시판
	</div>
	<div class="board-article">
		<div class="article-header">
			${dto.subject }
		</div>
		<div class="article-bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd>${dto.name }</dd>
				<dt>줄수</dt>
				<dd>${linesu }</dd>
			</dl>
		</div>
		<div class="article-bottomLine" style="border-color:#507CD1;">
			<dl>
				<dt>등록일</dt>
				<dd>${dto.created }</dd>
				<dt>조회수</dt>
				<dd>${dto.hitCount }</dd>
			</dl>
		</div>
		<div class="article-content">${dto.content }</div>
		<div class="article-bottomLine">
			이전글 : 
			<c:if test="${not empty preReadDTO}">
				<a href="<%=cp%>/bbs/article.do?num=${preReadDTO.num}&${params}">${preReadDTO.subject}</a>
			</c:if>
		</div>
		<div class="article-noLine">
			다음글 : 
			<c:if test="${not empty nextReadDTO}">
				<a href="<%=cp%>/bbs/article.do?num=${nextReadDTO.num}&${params}">${nextReadDTO.subject}</a>
			</c:if>
		</div>
	</div>
	<div class="article-noLine" style="text-align:right">
		    From : ${dto.ipAddr }
	</div>
	<div class="article-footer">
		<div class="left-footer">
               <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/update.do?num=${dto.num}&page=${page}';"> 수정 </button>
               <button type="button" class="btn" onclick="deleteBoard(${dto.num});"> 삭제 </button>
		</div>
		<div class="right-footer">
               <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/list.do?${params}';"> 리스트 </button>
		</div>
	</div>
</div>

</body>

</html>