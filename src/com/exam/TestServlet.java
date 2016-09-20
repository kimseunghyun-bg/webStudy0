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
		initParams={@WebInitParam(name="name", value="자바")
					,@WebInitParam(name="city", value="서울")
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
		
		//해당 서블릿에 대한 환경 설정
		ServletConfig config=getServletConfig();
		
		//모든 서블릿에서 공유하는 환경 설정
		ServletContext context=getServletContext();
		
		String name=config.getInitParameter("name");
		String city=config.getInitParameter("city");
		
		String subject1=context.getInitParameter("subject1");
		String subject2=context.getInitParameter("subject2");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out=resp.getWriter();
		
		out.print("<html><body>");
		out.print("Servlet Config 예제<br>");
		out.print("이름 : "+name+"<br>");
		out.print("출신도 : "+city+"<br>");
		out.print("과목1 : "+subject1+"<br>");
		out.print("과목2 : "+subject2+"<br>");
		out.print("</body></html>");
	}

}
