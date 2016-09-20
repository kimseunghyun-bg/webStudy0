package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class GugudanTag extends TagSupport{
	private static final long serialVersionUID = 1L;
	
	private int num;

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public int doStartTag() throws JspException {
		
		try {
			JspWriter out=pageContext.getOut();
			
			if(num<1||num>9)
				throw new JspException("�������� 1~9�ܱ����� �����մϴ�.");
			
			String s;
			out.print("<br><b>"+num+"��</b><br>");
			for(int i=1; i<=9; i++){
				s=i+"*"+num+"="+i*num+"<br>";
				out.print(s);
			}
			
		} catch (Exception e) {
			throw new JspException(e);
		}
		
		return SKIP_BODY;
	}
	
	
}
