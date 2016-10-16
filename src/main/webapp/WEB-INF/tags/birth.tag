
<%@tag import="java.util.Calendar"%>
<%@tag import="java.util.ArrayList"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute  name="d" type="java.lang.Integer"  required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

 Calendar cal=Calendar.getInstance();
	int yyear = cal.get ( cal.YEAR );
	int year=yyear-19;
	int month =12 ;
	int date = 31 ; 
	String res="";
	
	
	ArrayList<String> mail=new ArrayList();
	mail.add("naver.com");
	mail.add("hanmail.net");
	mail.add("nate.com");
	mail.add("google.com");
	

	if(d==1){
        res="<select name='year'>";
    for(int i=1950; i<=year;i++){
            res+="<option value='"+year+"'>"+i+"년";
        }
     }else if(d==2){
        res="<select name='month'>";
        for(int i=1; i<=month;i++){
            res+="<option value='"+month+"'>"+i+"월";
        }
    }else if(d==3){
    	res="<select name='day'>";
        for(int i=1; i<=date;i++){
            res+="<option value='"+date+"'>"+i+"일";
        }
    }else if(d==4){
		
    	res="<select name='mail2'>";
    
    	for(int i=0; i<mail.size();i++){
        res+="<option value='"+mail.get(i)+"'>"+mail.get(i);
    }
}
    res+="</select>";
    
%>
<%=res %>
