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
<link rel="stylesheet" href="<%=cp%>/res/css/board/created.css" type="text/css">

<script type="text/javascript" src="<%=cp%>/res/js/util.js"></script>
<script type="text/javascript">
    function sendBoard() {
        var f = document.boardForm;

    	var str = f.subject.value;
    	// str = str.trim();
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return false;
        }
    	// f.subject.value = str;

	    str = f.name.value;
        if(!str) {
            alert("이름을 입력하세요. ");
            f.name.focus();
            return false;
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
            return false;
        }
    	
        var mode="${mode}";//setattribute한 것을 가져올 목적으로 하는 것.	//쌍따옴표 없으면 언디파인드 뜸. created라는 변수가 없기 때문에.
        
        if(mode=="created")
        	f.action = "<%=cp%>/bbs/created_ok.do";
        else if(mode=="update")
        	f.action = "<%=cp%>/bbs/update_ok.do";
        
        f.submit();
    }
</script>

</head>

<body>

<div class="board">
	<div class="board-title">
	  <img src="<%=cp%>/res/images/arrow.gif" alt="" style="padding-left: 5px; padding-right: 5px;">게시판
	</div>

	<form name="boardForm" method="post" action="">
	<div class="board-form">
		<div class="form-bottomLine">
			<dl>
				<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
				<dd>
				      <input type="text" name="subject" size="75" maxlength="100"  class="boxTF" value="${dto.subject}">
				</dd>
			</dl>
		</div>

		<div class="form-bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd>
				      <input type="text" name="name" size="35" maxlength="20" class="boxTF" value="${dto.name}">
				</dd>
			</dl>
		</div>

		<div class="form-content">
			<dl>
				<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
				<dd>
				      <textarea name="content" cols="75" rows="12" class="boxTA">${dto.content}</textarea>
				</dd>
			</dl>
		</div>

		<div class="form-noLine">
			<dl>
				<dt>패스워드</dt>
				<dd>
				      <input type="password" name="pwd" size="35" maxlength="7" class="boxTF">&nbsp;(게시물 수정 및 삭제시 필요 !!!)
				</dd>
			</dl>
		</div>
	</div>
	
	<div class="form-footer">
			<c:if test="${mode=='update'}">
				<input type="hidden" name="num" value="${dto.num}">
				<input type="hidden" name="page" value="${page}">
			</c:if>
            <button type="button" class="btn" onclick="sendBoard();"> ${mode=="created"?"등록하기":"수정완료"} </button>
            <button type="reset" class="btn"> 다시입력 </button>
            <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/list.do';"> ${mode=="created"?"등록취소":"수정취소"} </button>
    </div>
	
    </form>
</div>

</body>

</html>