<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="com.score.ScoreDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	ScoreDAO dao=new ScoreDAO();

	int result=dao.insertScore(dto);
	
	if(result==1){
		response.sendRedirect("list.jsp");
		return;
	}
%>

<script type="text/javascript">
	alert("학번 중복으로 데이터를 추가하지 못했습니다.");
	history.back();
</script>