<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%!
    NumberFormat nf=NumberFormat.getCurrencyInstance();
    
    public String ddi(String birth){
    	String[] ddi={"원숭이", "닭", "개", "돼지", "쥐", "소", "호랑이", "토끼", "용", "뱀", "말", "양"};
    	int year=Integer.parseInt(birth.split("-")[0]); 
    	int num=year%12;
    	
    	return ddi[num];
    }
    
    public int age(String birth){
    	Calendar cal=Calendar.getInstance();
    	int year=Integer.parseInt(birth.split("-")[0]); 
    	int month=Integer.parseInt(birth.split("-")[1])-1;
    	int day=Integer.parseInt(birth.split("-")[2]);
    	int age=0;
    	
    	if(cal.get(Calendar.MONTH)>month)
    		age=cal.get(Calendar.YEAR)-year;
    	else if(cal.get(Calendar.MONTH)==month && cal.get(Calendar.DATE)>=day)
    		age=cal.get(Calendar.YEAR)-year;
    	else
    		age=cal.get(Calendar.YEAR)-year-1;
    	
    	return age;
    }
    
    public int tax(int basicpay, int extrapay){
    	int total=basicpay+extrapay;
    	double tax=0;
    	if(total>=3000000)
    		tax=total*0.03;
    	else if(total>=2000000)
    		tax=total*0.02;
    	
    	return (int)tax;
    }
    %>
    
    <%
    request.setCharacterEncoding("UTF-8");
    
    String name=request.getParameter("name");
    String birth=request.getParameter("birth");
    String tel=request.getParameter("tel");
    int basicpay=Integer.parseInt(request.getParameter("basicpay"));
    int extrapay=Integer.parseInt(request.getParameter("extrapay"));

    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span><label>이름</label><%=name %></span><br>
	<span><label>생년월일</label><%=birth %></span><br>
	<span><label>띠</label></span><%=ddi(birth) %><br>
	<span><label>나이</label></span><%=age(birth) %><br>
	<span><label>전화번호</label><%=tel %></span><br>
	<span><label>기본급</label><%=nf.format(basicpay) %></span><br>
	<span><label>수당</label><%=nf.format(extrapay) %></span><br>
	<span><label>세금</label><%=nf.format(tax(basicpay,extrapay)) %></span><br>
	<span><label>실급여</label><%=nf.format((basicpay+extrapay)-tax(basicpay,extrapay)) %></span><br>
</body>
</html>