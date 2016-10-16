<%@tag import="java.util.Iterator"%>
<%@tag import="java.util.LinkedHashMap"%>
<%@tag import="java.util.ArrayList"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute required="false" name="thema" type="java.lang.String"%>
<%
	LinkedHashMap<String,String> map = new LinkedHashMap();
	ArrayList<String> mylist = new ArrayList();
	String res="";
	String [] arr;
	
	map.put("skie","스키장");
	map.put("gyegok","계곡");
	map.put("spa","스파");
	map.put("pool","수영장");
	map.put("danche","단체");
	map.put("family","가족");
	map.put("couple","커플");
	map.put("karaban","카라반");
	map.put("pet","애완동물");
	map.put("sea","바다");
	
	Iterator key = map.keySet().iterator();
	
	
	if(thema==null){
		for(int i=0; i<map.size(); i++){
			String k = (String)key.next();
			res+="<input type='checkbox' name='themaChoice' value='"+k+"'>"+map.get(k);
		}
	}else{
		arr = thema.split(",");
		for(int i=0; i<arr.length; i++){
			if(!arr[i].equals("")){
				mylist.add(arr[i]);
			}
		}
		
		for(int i=0; i<map.size(); i++){
			String k = (String)key.next(); 
			res+="<input type='checkbox' name='themaChoice'";
				if(mylist.contains(k)){
					 res+="checked='checked'";
				}
			res+="value='"+k+"'>"+map.get(k);
		}
	}
	
	//일단 마이리스트에는 내가 가지고있는 리스트고 ㅇㅇ 기존 리스트는 .. 음... 값을 가지고있어야 되는구만. 그러면 기존 리스트수대로 뿌리는데, 포 안에 포가 들어가야되네; 이중포 시발;
	
	
	
	
	/* 
	
	if(!thema.equals("")  || !thema.equals("null") || thema!=null){ //만약 테마값이 있다면, 
	
	}else{  *///테마 값이 없다면.
		
	

%>

<%=res%>





