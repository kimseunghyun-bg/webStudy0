package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class SumTag extends TagSupport{
	private static final long serialVersionUID = 1L;
	
	private int num;
	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public int doStartTag() throws JspException{
		
		try {
			int s=0;
			for(int i=1; i<=num; i++)
				s+=i;
			
			pageContext.getOut().print(s);
			
		} catch (Exception e) {
			throw new JspException();
		}
		
		return SKIP_BODY;
	}
	
	
}
