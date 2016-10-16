<%@tag import="java.util.Calendar"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute  name="var" type="java.lang.Integer"  required="true"%>
<%
   
   
   Calendar cal=Calendar.getInstance();
   
   Integer year = cal.get ( cal.YEAR );
   
   Integer month =cal.get(cal.MONTH)+1;

   String res="";
   


   
   if(var==1){
       res="<select name='Year'>";
      
       for(int i=14; i<=16;i++){
          res+="<option value='"+i+"'";
          if(i ==14){
                    res+=" selected=\"selected\"";
                 
          }
          res+=">20"+i+'년';
       }
   }else if(var==2){
       res="<select name='Month'>";
       for(int i=1;i<=12;i++){
          res+="<option value='"+i+"'";
          if(i ==month){
                    res+=" selected=\"selected\"";
                 
          }
          res+=">"+i+'월';
       }
       }
   

    res+="</select>";

%>
<%=res%>