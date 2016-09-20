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
		//Ŭ���̾�Ʈ�� GET ������� ��û�� ���
		
		String name=req.getParameter("name");
		int age=Integer.parseInt(req.getParameter("age"));
		
		String s=name + "���� ���̴� " +age+ "�̰�";
		if(age>=19)
			s+="�����Դϴ�.";
		else
			s+="�̼������Դϴ�.";
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.print("<html><body>");
		out.print("GET ������� �����߽��ϴ�.<br>");
		out.print(s);
		out.print("</body></html>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Ŭ���̾�Ʈ�� POST ������� ��û�� ���
		
		req.setCharacterEncoding("UTF-8");
		
		String name=req.getParameter("name");
		int age=Integer.parseInt(req.getParameter("age"));
		
		String s=name + "���� ���̴� " +age+ "�̰�";
		if(age>=19)
			s+="�����Դϴ�.";
		else
			s+="�̼������Դϴ�.";
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.print("<html><body>");
		out.print("POST ������� �����߽��ϴ�.<br>");
		out.print(s);
		out.print("</body></html>");
		
	}
	
}
