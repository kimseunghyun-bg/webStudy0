package com.calc;

public class Calc {
	private int num1, num2;
	private String oper;

	public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	public int getNum2() {
		return num2;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	public String getOper() {
		return oper;
	}
	public void setOper(String oper) {
		this.oper = oper;
	}

	public String result(){
		if(oper==null)
			return "";

		String s="";
		if(oper.equals("+"))
			s=String.format("%d+%d=%d", num1, num2, (num1+num2));
		else if(oper.equals("-"))
			s=String.format("%d+%d=%d", num1, num2, (num1-num2));
		else if(oper.equals("*"))
			s=String.format("%d+%d=%d", num1, num2, (num1*num2));
		else if(oper.equals("/"))
			s=String.format("%d+%d=%d", num1, num2, (num1/num2));
		
		return s;
	}
}
