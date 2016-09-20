<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%!
    //6개의 번호 중 선택된 번호 넣기
    public int[] makeLotto(String[] select){
    	int[] num=new int[6];
    	int length=0;
    	
    	if(select!=null){
    		length=select.length;
    	}
    	
		for(int i=0; i<length; i++){
			num[i]=Integer.parseInt(select[i]);
		}
		
		for(int i=length; i<num.length; i++){
			num[i]=(int)(Math.random()*45)+1;
			for(int j=0; j<i; j++){
				if(num[j]==num[i])
					i--;
			}
		} 
		Arrays.sort(num);
		return num;
    }
    %>
    
	<%
	request.setCharacterEncoding("utf-8");
	
	String[] select=request.getParameterValues("checkbox");
	int cnt=Integer.parseInt(request.getParameter("cnt"));
	
	int[] lotto;
	
	lotto=makeLotto(select);
	
	%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	for(int i=0; i<cnt; i++){
		lotto=makeLotto(select);
		
		for(int j=0; j<lotto.length; j++){%>
		<%=lotto[j]%>
<%		}%>
		<br>
<%	}%>
</body>
</html>