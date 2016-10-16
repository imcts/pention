package com.model;

public class LoginUser {

	String id;

	String name;

	String tell;

	String email;

	Integer grade;

	Integer saupjaIndex;

	
	
	
	public LoginUser(String id, String name, Integer grade, String email, String tell,Integer saupjaIndex) {
		super();
		this.id = id;
		this.name = name;
		this.grade = grade;
		this.tell=tell;
		this.email=email;
		this.saupjaIndex=saupjaIndex;
	}

	

	public Integer getSaupjaIndex() {
		return saupjaIndex;
	}


	public void setSaupjaIndex(Integer saupjaIndex) {
		this.saupjaIndex = saupjaIndex;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
