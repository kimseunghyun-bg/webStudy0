package com.bbs;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyUtil;

//�Խ����� �������� ������ ��. jsp�� �ٽ� ¥����.
@WebServlet("/bbs/*")
public class BoardServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
		
	}
	
	//����� JSP�� �ѱ� ���̴�. redirect�� �ʱ�ȭ �ǹ���.
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String path) throws ServletException, IOException {
		// ������ ��...RequsetDispatcher��ü�� �˾Ƽ� ����...
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String uri=req.getRequestURI();	//���� Ÿ�ڸ� �ļ� �ּҸ� �� ��  URI�� /study/bbs/list.do		// URL�� http://localhost:9090/study/bbs/list.do
		String cp=req.getContextPath();
		
		BoardDAO dao=new BoardDAO();
		MyUtil util=new MyUtil();
		
		if(uri.indexOf("list.do")!=-1){	//list.do�� ����� ������� ����.
			//�� ����Ʈ
			String page=req.getParameter("page");
			int current_page=1;
			if(page!=null)
				current_page=Integer.parseInt(page);
			
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue");
			
			if(searchKey==null){
				searchKey="subject";
				searchValue="";
			}
			
			if(req.getMethod().equalsIgnoreCase("GET")){
				searchValue=URLDecoder.decode(searchValue, "UTF-8");
			}
			
			int dataCount, total_page;
			if(searchValue.length()==0)	// �˻��� �ƴ� ���
				dataCount=dao.dataCount();
			else	//�˻��� ���
				dataCount=dao.dataCount(searchKey, searchValue);
			
			int numPerPage=10;
			total_page=util.pageCount(numPerPage, dataCount);
			
			if(current_page>total_page)
				current_page=total_page;
			
			int start=(current_page-1)*numPerPage+1;
			int end=current_page*numPerPage;
			
			List<BoardDTO> list=null;
			if(searchValue.length()==0)
				list=dao.listBoard(start, end);
			else
				list=dao.listBoard(start, end, searchKey, searchValue);
			
			String params="";
			if(searchValue.length()!=0){
				params="searchKey="+searchKey+
						"&searchValue="+URLEncoder.encode(searchValue, "UTF-8"); //���ڵ�. ������ ������ ���� ��� �ѱ��� E1A5�̷������� ����.
			}
			
			String listUrl=cp+"/bbs/list.do";
			String articleUrl=cp+"/bbs/article.do?page="+current_page;
			
			if(params.length()!=0){
				listUrl+="?"+params;
				articleUrl+="&"+params;
			}
			
			String paging=util.paging(current_page, total_page, listUrl);
			
			req.setAttribute("list", list);
			req.setAttribute("page", current_page);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("total_page", total_page);
			req.setAttribute("paging", paging);
			
			forward(req, resp, "/WEB-INF/views/bbs/list.jsp");
		}else if(uri.indexOf("created.do")!=-1){
			//�� ���� ��
			
			req.setAttribute("mode", "created");	//������ �ϴ� ���� attribute�� �߰��ؼ� �ѱ�
			
			forward(req, resp, "/WEB-INF/views/bbs/created.jsp");	// ���������� /�� cp���� contextpath http://local~9090/study
		}else if(uri.indexOf("created_ok.do")!=-1){
			//�� ����
			BoardDTO dto=new BoardDTO();
			dto.setName(req.getParameter("name"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setPwd(req.getParameter("pwd"));
			
			dto.setIpAddr(req.getRemoteAddr());
			
			dao.insertBoard(dto);
			
			resp.sendRedirect(cp+"/bbs/list.do");	//html�� http://local~9090/����
		}else if(uri.indexOf("article.do")!=-1){
			//�� ����
			int num=Integer.parseInt(req.getParameter("num"));
			String page=req.getParameter("page");
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue");
			if(searchKey==null){
				searchKey="subject";
				searchValue="";
			}
			searchValue=URLDecoder.decode(searchValue, "UTF-8");
			
			//��ȸ�� ����
			dao.updateHitCount(num);
			
			//�Խù� ��������
			BoardDTO dto=dao.readBoard(num);
			if(dto==null){
				resp.sendRedirect(cp+"/bbs/list.do?page="+page);
				return;
			}
			
			int linesu=dto.getContent().split("\n").length;
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			//������, ������
			BoardDTO preReadDTO=dao.preReadBoard(num, searchKey, searchValue);
			BoardDTO nextReadDTO=dao.nextReadBoard(num, searchKey, searchValue);
			
			// �۸���Ʈ, ������ �����ۿ��� ����� �Ķ����
			String params="page="+page;
			if(searchValue.length()!=0){
				params+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"UTF-8");
			}
			
			//������ jsp�� �ѱ� ������
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("preReadDTO", preReadDTO);
			req.setAttribute("nextReadDTO", nextReadDTO);
			req.setAttribute("linesu", linesu);
			//param�� el ������ ������̱� ������ ����ϸ� �ȵ�.
			req.setAttribute("params", params);
			
			forward(req, resp, "/WEB-INF/views/bbs/article.jsp");
		}else if(uri.indexOf("update.do")!=-1){
			//�� ���� ��
			int num=Integer.parseInt(req.getParameter("num"));
			String page=req.getParameter("page");
			
			BoardDTO dto=dao.readBoard(num);
			if(dto==null){
				resp.sendRedirect(cp+"/bbs/list.do?page="+page);
				return;
			}
			
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("mode", "update");
			
			forward(req, resp, "/WEB-INF/views/bbs/created.jsp");
			
		}else if(uri.indexOf("update_ok.do")!=-1){
			//�� ���� �Ϸ�
			BoardDTO dto=new BoardDTO();
			int num=Integer.parseInt(req.getParameter("num"));
			dto.setNum(num);
			dto.setName(req.getParameter("name"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setPwd(req.getParameter("pwd"));
			
			String page=req.getParameter("page");
			
			dao.updateBoard(dto);
			
			//resp.sendRedirect(cp+"/bbs/list.do?page="+page);
			resp.sendRedirect(cp+"/bbs/list.do?num="+num+"&page="+page);
			
		}else if(uri.indexOf("delete.do")!=-1){
			//�� ����
			int num=Integer.parseInt(req.getParameter("num"));
			String page=req.getParameter("page");
			
			dao.deleteBoard(num);
			
			
			resp.sendRedirect(cp+"/bbs/list.do?page="+page);
		}
	}
	
}
