package com.util;

public class MyUtil {
	/**
	 * 데이터 개수에 따른 페이지 수 구하기
	 * @param numPerPage 한 화면에 표시할 데이터 개수
	 * @param dataCount 전체 데이터 개수
	 * @return
	 */
	public int pageCount(int numPerPage, int dataCount){
		int count=0;
		
		if(dataCount>0){
			count=dataCount/numPerPage;
			if(dataCount%numPerPage!=0)
				count++;
		}
		
		return count;
	}
	
	/**
	 * 페이징 처리
	 * @param current_page 	현재 화면에 표시되는 페이지
	 * @param total_page 	전체 페이지 수
	 * @param list_url 		링크를 설정할 uri
	 * @return 				페이징 처리 결과
	 */
	
	public String paging(int current_page, int total_page, String list_url){
		StringBuffer sb=new StringBuffer();
		
		int numPerBlock =10;
		int currentPageSetup;
		int n, page;
		
		if(current_page<1||total_page<1)
			return "";
		
		if(list_url.indexOf("?")!=-1){
			list_url+="&";
		} else {
			list_url+="?";
		}
		
		// currentPageSetup : 표시할 첫 페이지 -1
		currentPageSetup=current_page/numPerBlock*numPerBlock;
		if(current_page%numPerBlock==0)
			currentPageSetup=currentPageSetup-numPerBlock;
		
		// 처음페이지, 이전(앞으로 10페이지 이동)
		n=current_page-numPerBlock;
		if(total_page>numPerBlock&&currentPageSetup>0){
			sb.append("<a href ='"+list_url+"page=1'>[처음]</a>");
			sb.append("&nbsp;<a href ='"+list_url+"page="+n+"'>[이전]</a>");
		}
		
		// 페이징 처리
		page = currentPageSetup+1;
		while(page<=total_page&&page<=currentPageSetup+numPerBlock){
			if(page==current_page){
				sb.append("&nbsp;<span style='color:Fuchsia;'>"+page+"</span>");
			}else{
				sb.append("&nbsp;<a href ='"+list_url+"page="+page+"'>"+page+"</a>");
			}
			page++;
		}
		
		// 다음(뒤로 10페이지 이동), 마지막 페이지
		n=current_page+numPerBlock;
		if(n>total_page)n=total_page;
		
		if(total_page-currentPageSetup>numPerBlock){
			sb.append("&nbsp;<a href ='"+list_url+"page="+n+"'>[다음]</a>");
			sb.append("&nbsp;<a href ='"+list_url+"page="+total_page+"'>[끝]</a>");
		}
		
		return sb.toString();
	}
		
}