package com.demo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user")
public class UserServlet extends HttpServlet{
	private static final long serialVersionUID = 3593870855177604185L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//클라이언트가 GET 방식으로 요청한 경우
		
		String name=req.getParameter("name");
		int age=Integer.parseInt(req.getParameter("age"));
		
		String s=name + "님의 나이는 " +age+ "이고";
		if(age>=19)
			s+="성인입니다.";
		else
			s+="미성년자입니다.";
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.print("<html><body>");
		out.print("GET 방식으로 접근했습니다.<br>");
		out.print(s);
		out.print("</body></html>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//클라이언트가 POST 방식으로 요청한 경우
		
		req.setCharacterEncoding("UTF-8");
		
		String name=req.getParameter("name");
		int age=Integer.parseInt(req.getParameter("age"));
		
		String s=name + "님의 나이는 " +age+ "이고";
		if(age>=19)
			s+="성인입니다.";
		else
			s+="미성년자입니다.";
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.print("<html><body>");
		out.print("POST 방식으로 접근했습니다.<br>");
		out.print(s);
		out.print("</body></html>");
		
	}
	
}
