<%@tag import="java.util.Iterator"%>
<%@tag import="java.util.ArrayList"%>
<%@tag import="java.util.LinkedHashMap"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="option" required="false" type="java.lang.String" %>
<%
	LinkedHashMap<String,String> map = new LinkedHashMap();
	ArrayList<String> mylist = new ArrayList();
	String res="";
	String [] arr;

	map.put("norae","노래방");
	map.put("basket","농구장");
	map.put("shop","매점");
	map.put("bbq","바비큐");
	map.put("badminturn","배드민턴");
	map.put("work","산책로");
	map.put("food","식당");
	map.put("tent","야외텐트");
	map.put("workshop","워크샵");
	map.put("bike","자전거");
	map.put("mhouse","정자");
	map.put("foots","족구장");
	map.put("cafe","카페");
	map.put("camp","캠프");
	map.put("takgu","탁구대");
	map.put("teras","테라스");
	map.put("parasol","파라솔");
	map.put("pickup","픽업");
	Iterator key = map.keySet().iterator();
	
	
	if(option==null){
		for(int i=0; i<map.size(); i++){
			String k = (String)key.next();
			res+="<input type='checkbox' name='optionChoice' value='"+k+"'>"+map.get(k);
		}
	}else{
		arr = option.split(",");
		for(int i=0; i<arr.length; i++){
			if(!arr[i].equals("")){
				mylist.add(arr[i]);
			}
		}
		
		for(int i=0; i<map.size(); i++){
			String k = (String)key.next(); 
			res+="<input type='checkbox' name='optionChoice'";
				if(mylist.contains(k)){
					 res+="checked='checked'";
				}
			res+="value='"+k+"'>"+map.get(k);
		}
	}
	
%>

<%=res%>