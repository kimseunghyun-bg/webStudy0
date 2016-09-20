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
		
		//Ŭ���̾�Ʈ�� ���� ������ �޴´�.
		String sage=req.getParameter("age");
		int age=Integer.parseInt(sage);
		
		String result="����";
		if(age<19)
			result="�̼�����";
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		
		out.println("<html><body>");
		out.println("�ݰ����� ����<br>");
		out.println("���� �ð��� " + s +"�Դϴ�.<br>");
		out.println("����� ���̴�" + age +"�̰� "+result+"�Դϴ�.<br>");
		out.println("</body></html>");
		
	}

}
