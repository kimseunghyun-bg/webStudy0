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
<link rel="stylesheet" href="<%=cp%>/res/css/board/list.css" type="text/css">
<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.action="<%=cp%>/bbs/list.do";
	f.submit();
}
</script>
</head>

<body>
<div class="board">
	<div class="board-title">
	  <img src="<%=cp%>/res/images/arrow.gif" alt="" style="padding-left: 5px; padding-right: 5px;">게시판
	</div>

	<div class="board-header">
		<div class="left-header">
		  <form name="searchForm" method="post" action="">
			<select name="searchKey" class="selectField">
				<option value="subject">제목</option>
				<option value="name">작성자</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchValue" class="boxTF">
			<button type="button" class="btn" onclick="searchList();">검색</button>
		  </form>
		</div>
		<div class="right-header">
			<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/created.do';"> 글쓰기 </button>
		</div>
	</div>
	
	<div class="board-list">
		<div class="list-title">
			<dl>
				<dt class="num">번호</dt>
				<dt class="subject">제목</dt>
				<dt class="name">작성자</dt>
				<dt class="created">작성일</dt>
				<dt class="hitCount">조회수</dt>
			</dl>
		</div>
		<div class="list-row">
		<c:forEach var="dto" items="${list}">
			<dl>
				<dd class="num">${dto.num}</dd>
				<dd class="subject"><a href="${articleUrl}&num=${dto.num}">${dto.subject}</a></dd>
				<dd class="name">${dto.name}</dd>
				<dd class="created">${dto.created}</dd>
				<dd class="hitCount">${dto.hitCount}</dd>
			</dl>
		</c:forEach>
		</div>
	</div>
		
	<div class="board-paging">
			<p>
				<c:if test="${dataCount==0 }">
					등록된 게시물이 없습니다.
				</c:if>
				<c:if test="${dataCount!=0 }">
					${paging }
				</c:if>
			</p>
	</div>
</div>
</body>

</html>