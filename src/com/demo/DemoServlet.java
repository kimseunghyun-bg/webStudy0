package com.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class DemoServlet extends GenericServlet{
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		Calendar cal=Calendar.getInstance();
		String s=String.format("%tF %tT", cal, cal);
		
		//클라이언트가 보낸 정보를 받는다.
		String sage=req.getParameter("age");
		int age=Integer.parseInt(sage);
		
		String result="성인";
		if(age<19)
			result="미성년자";
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		
		out.println("<html><body>");
		out.println("반가워요 ㅎㅎ<br>");
		out.println("지금 시간은 " + s +"입니다.<br>");
		out.println("당신의 나이는" + age +"이고 "+result+"입니다.<br>");
		out.println("</body></html>");
		
	}

}
