package com.test;

public class TestVO {
	
	private String id, pwd, name, gender, hak, memo;
	private String[] hobby;
	private int age;
	private String[] subject;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}

	public String getHak() {
		return hak;
	}

	public void setHak(String hak) {
		this.hak = hak;
	}

	public String[] getSubject() {
		return subject;
	}

	public void setSubject(String[] subject) {
		this.subject = subject;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String result(){
		String s="";
		s="���̵� : " + id;
		s+="<br>�н����� : " + pwd;
		s+="<br>�̸� : " + name;
		s+="<br>���� : " + age;
		s+="<br>���� : " + gender;
		s+="<br>��� : ";
		if(hobby!=null){
			for(String h:hobby){
				s+=h+" ";
			}
		}
		s+="<br>�з� : " + hak;
		s+="<br>�����ϴ� ���� : ";
		if(subject!=null){
			for(String h:subject){
				s+=h+" ";
			}
		}
		if(memo!=null)
		s+="<br>�޸� : " + memo.replaceAll("\n", "<br>");
		
		return s;
	}
}
