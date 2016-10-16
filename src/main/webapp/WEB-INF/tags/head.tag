<%@tag import="java.util.ArrayList"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="var" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%
    ArrayList head = new ArrayList();
    head.add("자유");
    head.add("이용후기");
    
    
    
    String check="";
    String res="<select name='head'>";
    if(var!=null){
        check=var;
    }
    
    
    for(int i=0; i<head.size(); i++){
        if(head.get(i).equals(check)){
            res+="<option value='"+head.get(i)+"' selected='selected' >"+head.get(i);
        }else{
            res+="<option value='"+head.get(i)+"' >"+head.get(i);
        }
    }
    
    res+="</select>";
%>
<%=res%>