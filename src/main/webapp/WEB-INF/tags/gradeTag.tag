<%@tag import="java.util.Iterator"%>
<%@tag import="java.util.HashMap"%>

<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="var" required="true" type="java.lang.Integer" %>
<%@ attribute name="identiti" required="true" type="java.lang.Integer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%
   HashMap grade =new HashMap();
    
    grade.put(2, "사업자");
    grade.put(3, "유저 ");
    grade.put(4, "블랙리스트");
   
    
    
    String res="<select name='head' id='"+identiti+"'>";
 
     
    Iterator it = grade.keySet().iterator();
    
    
    for(int i=0; i<grade.size(); i++){
       int key = (Integer)it.next();
       
       res+="<option value='"+key+"'";  
       
       if(var==key){
          res+=" selected=\"selected\"";
       }
             
       res+=">"+grade.get(key);
    }
    res+="</select>";
%>
<%=res%>