package com.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(
		urlPatterns="/test",
		initParams={@WebInitParam(name="name", value="�ڹ�")
					,@WebInitParam(name="city", value="����")
		}
)
public class TestServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//�ش� ������ ���� ȯ�� ����
		ServletConfig config=getServletConfig();
		
		//��� �������� �����ϴ� ȯ�� ����
		ServletContext context=getServletContext();
		
		String name=config.getInitParameter("name");
		String city=config.getInitParameter("city");
		
		String subject1=context.getInitParameter("subject1");
		String subject2=context.getInitParameter("subject2");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out=resp.getWriter();
		
		out.print("<html><body>");
		out.print("Servlet Config ����<br>");
		out.print("�̸� : "+name+"<br>");
		out.print("��ŵ� : "+city+"<br>");
		out.print("����1 : "+subject1+"<br>");
		out.print("����2 : "+subject2+"<br>");
		out.print("</body></html>");
	}

}
