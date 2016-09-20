package com.tag;

import java.util.Calendar;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MyCalendar extends TagSupport {
	private static final long serialVersionUID = 1L;
	
	private Integer year, month, colWidth, rowHeight;

	public void setYear(Integer year) {
		this.year = year;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	public void setColWidth(Integer colWidth) {
		this.colWidth = colWidth;
	}
	public void setRowHeight(Integer rowHeight) {
		this.rowHeight = rowHeight;
	}

	@Override
	public int doStartTag() throws JspException {
		JspWriter out=pageContext.getOut();
		
		try {
			if(colWidth==null)
				colWidth=30;
			if(rowHeight==null)
				rowHeight=25;
			
			int width=colWidth*7;
			
			Calendar now=Calendar.getInstance();
			now.set(year, month-1, 1);
			int week=now.get(Calendar.DAY_OF_WEEK);
			int endDay=now.getActualMaximum(Calendar.DATE);

			out.println("<style type='text/css'>");
			out.println("td {font-size: 9pt; font-family:±¼¸²;}");
			out.println("</style>");
			
			/*
			out.println("<table style='width: "+width+"px; border-spacing: 0; border-collapse: collapse;'>");
			out.println("<tr height=30>");
			out.print("<td align='center'>");
			out.print(year + "Ò´ " + month + "êÅ");
			out.println("</td>");
			out.println("</tr>");
			out.println("</table>");
			*/
			
			out.println("<table border='1' style='width: "+width+"px; border-spacing: 0; border-collapse: collapse;'>");
			out.println("<tr bgcolor='#E4E4E4' height='"+rowHeight+"'>");
			out.print("<td align='center' width='"+colWidth+"'>");
			out.print("<span style='color:red;'>ÀÏ</span>");
			out.println("</td>");
			out.println("<td align='center' width='"+colWidth+"'>¿ù</td>");
			out.println("<td align='center' width='"+colWidth+"'>È­</td>");
			out.println("<td align='center' width='"+colWidth+"'>¼ö</td>");
			out.println("<td align='center' width='"+colWidth+"'>¸ñ</td>");
			out.println("<td align='center' width='"+colWidth+"'>±Ý</td>");
			out.println("<td align='center' width='"+colWidth+"'>");
			out.print("<span style='color:blue;'>Åä</span>");
			out.println("</td>");
			out.println("</tr>");
			
			out.println("<tr height='"+rowHeight+"'>");
			for(int i=1; i<week; i++) {
				out.println("<td>&nbsp;</td>");
			}
			
			for(int i=1; i<=endDay; i++) {
				out.print("<td align='center'>");
				if(week%7==1)
					out.print("<span style='color:red;'>"+i+"</span>");
				else if(week%7==0)
					out.print("<span style='color:blue;'>"+i+"</span>");
				else
					out.print("<span style='color:black;'>"+i+"</span>");
				out.println("</td>");
				
				if(i!=endDay) {
					week++;
					if(week%7==1) {
						out.println("</tr>");
						out.println("<tr height='"+rowHeight+"'>");
					}
				}
			}
			
			if(week%7!=0) {
				for(int i=week%7+1; i<=7; i++)
					out.println("<td>&nbsp;</td>");
			}
			out.println("</tr>");
			out.println("</table>");
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return SKIP_BODY;
	}
}
