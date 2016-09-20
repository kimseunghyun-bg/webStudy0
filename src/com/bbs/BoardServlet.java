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

//게시판을 서블릿으로 변경할 것. jsp도 다시 짜야함.
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
	
	//출력은 JSP에 넘길 것이다. redirect는 초기화 되버림.
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String path) throws ServletException, IOException {
		// 포워딩 끝...RequsetDispatcher객체가 알아서 해줌...
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String uri=req.getRequestURI();	//내가 타자를 쳐서 주소를 쓴 것  URI는 /study/bbs/list.do		// URL은 http://localhost:9090/study/bbs/list.do
		String cp=req.getContextPath();
		
		BoardDAO dao=new BoardDAO();
		MyUtil util=new MyUtil();
		
		if(uri.indexOf("list.do")!=-1){	//list.do는 엿장수 마음대로 정함.
			//글 리스트
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
			if(searchValue.length()==0)	// 검색이 아닌 경우
				dataCount=dao.dataCount();
			else	//검색인 경우
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
						"&searchValue="+URLEncoder.encode(searchValue, "UTF-8"); //인코딩. 브라우저 버전이 낮을 경우 한글은 E1A5이런식으로 나옴.
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
			//글 쓰기 폼
			
			req.setAttribute("mode", "created");	//포워드 하는 곳에 attribute를 추가해서 넘김
			
			forward(req, resp, "/WEB-INF/views/bbs/created.jsp");	// 포워딩에서 /는 cp까지 contextpath http://local~9090/study
		}else if(uri.indexOf("created_ok.do")!=-1){
			//글 저장
			BoardDTO dto=new BoardDTO();
			dto.setName(req.getParameter("name"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setPwd(req.getParameter("pwd"));
			
			dto.setIpAddr(req.getRemoteAddr());
			
			dao.insertBoard(dto);
			
			resp.sendRedirect(cp+"/bbs/list.do");	//html은 http://local~9090/부터
		}else if(uri.indexOf("article.do")!=-1){
			//글 보기
			int num=Integer.parseInt(req.getParameter("num"));
			String page=req.getParameter("page");
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue");
			if(searchKey==null){
				searchKey="subject";
				searchValue="";
			}
			searchValue=URLDecoder.decode(searchValue, "UTF-8");
			
			//조회수 증가
			dao.updateHitCount(num);
			
			//게시물 가져오기
			BoardDTO dto=dao.readBoard(num);
			if(dto==null){
				resp.sendRedirect(cp+"/bbs/list.do?page="+page);
				return;
			}
			
			int linesu=dto.getContent().split("\n").length;
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			//이전글, 다음글
			BoardDTO preReadDTO=dao.preReadBoard(num, searchKey, searchValue);
			BoardDTO nextReadDTO=dao.nextReadBoard(num, searchKey, searchValue);
			
			// 글리스트, 이전글 다음글에서 사용할 파라미터
			String params="page="+page;
			if(searchValue.length()!=0){
				params+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"UTF-8");
			}
			
			//포워딩 jsp에 넘길 데이터
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("preReadDTO", preReadDTO);
			req.setAttribute("nextReadDTO", nextReadDTO);
			req.setAttribute("linesu", linesu);
			//param은 el 예약어로 사용중이기 때문에 사용하면 안됨.
			req.setAttribute("params", params);
			
			forward(req, resp, "/WEB-INF/views/bbs/article.jsp");
		}else if(uri.indexOf("update.do")!=-1){
			//글 수정 폼
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
			//글 수정 완료
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
			//글 삭제
			int num=Integer.parseInt(req.getParameter("num"));
			String page=req.getParameter("page");
			
			dao.deleteBoard(num);
			
			
			resp.sendRedirect(cp+"/bbs/list.do?page="+page);
		}
	}
	
}
