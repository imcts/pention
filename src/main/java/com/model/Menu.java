package com.model;

import org.apache.ibatis.type.Alias;

public class Menu {

	String key="" ;

	String topkey="";

	String service="";

	
	
	
	
	public Menu(String key, String topkey, String service) {
		this.key = key;
		this.topkey = topkey;
		this.service = service;
	}
	
	public Menu(String key, String topkey) {
		this.key = key;
		this.topkey = topkey;
	}
	
	

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}


	public String getTopkey() {
		return topkey;
	}

	public void setTopkey(String topkey) {
		this.topkey = topkey;
	}


	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}
}

	