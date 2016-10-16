<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="cc"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="0" width="65%"  align="center">
  
   <input type="hidden" name="id" value="${logchk.id }">
   <input type="hidden" name="name" value="${logchk.name }">
   <input type="hidden" name="grade" value="${logchk.grade }"> 
   
   <cc:choose>
   	<cc:when test="${bean.serviceKey eq 'noticeboard' }">
   		 <img  src="../../../${bean.resource }/notice/notice_noticeboard_11.gif">   
   	</cc:when>
   	<cc:when test="${bean.serviceKey eq 'qna' }">
   		 <img  src="../../../${bean.resource }/notice/notice_QnA_11.jpg">
   	
   	</cc:when>
   
   </cc:choose>
      <cc:choose>
         <cc:when test="${bean.boardKey eq 'modify' }">
        
            <tr>
      
               <td align="center" ><img  src="../../../${bean.resource }/notice/notice_wrtie_title.jpg"></td>
            </tr>
            <tr>   
               <td align="center">
               
                  <input type="text" name="title" value="${bean.title }" maxlength="15" style="width: 100%"/>
               
               </td>
            
            </tr>
            <tr>
               <td align="center"><img  src="../../../${bean.resource }/notice/contents.jpg"></td>
             </tr>
             <tr>  
               <td>
                  <textarea rows="10" name="content"  style="width: 100%" >${bean.content }</textarea>
               
               </td>
            
            </tr>
         </cc:when>
         <cc:otherwise>
         
            <tr>
      
         <td align="center"><img  src="../../../${bean.resource }/notice/notice_wrtie_title.jpg"></td>
         </tr>
         <tr>
         <td align="center">
         
            <input type="text" name="title" maxlength="15"  style="width: 100%" />
         
         </td>
      
      </tr>
      <tr>
         <td align="center"> <img  src="../../../${bean.resource }/notice/contents.jpg"></td>
       </tr>
       <tr> 
         <td >
         
            <textarea rows="10" name="content" style="width: 100%"></textarea>
            
         
         </td>
      
      </tr>
      
         </cc:otherwise>
      
      </cc:choose>
        <cc:choose>
        
     
       <cc:when test="${bean.noticekey eq 'write' }">
       		
         <tr>
            
           
               
           <td  align="center" 	><a href="#" style="text-decoration: none;" onclick="detailwrite('${bean.serviceKey}')">
											<img border="0" src="../../../${bean.resource }btn/complete.png"></a>
        	<a href="#" onclick="back('${bean.serviceKey}')"  ><img border="0" src="../../../${bean.resource }btn/goback.jpg"></a>
            </td>
         	
         </tr>
          <tr>
      	<td height="150"></td>
      </tr>
      </cc:when>
      
      <cc:when test="${bean.boardKey eq 'reply' }">
        
         <tr>
            <input type="hidden" name="seq" value="${bean.seq }">
            <input type="hidden" name="gid" value="${bean.gid }">
            <input type="hidden" name="ref" value="${bean.ref }">
            
            <td  align="center">
          
                <a href="#" style="text-decoration: none;" onclick="replywrite('${bean.serviceKey}','replycom','${bean.noplus }')">
                		<img border="0" src="../../../${bean.resource }btn/complete.png">
                									</a>
            	  <a href="#" onclick="goback('${bean.ids }','${bean.serviceKey }')"  ><img border="0" src="../../../${bean.resource }btn/goback.jpg"></a>
            </td>
         
         </tr>
          <tr>
      	<td height="150"></td>
      </tr>
      </cc:when>
      <cc:when test="${bean.boardKey eq 'modify' }">
      
         <tr>
            <input type="hidden" name="seq" value="${bean.seq }">
            <input type="hidden" name="gid" value="${bean.gid }">
            <input type="hidden" name="ref" value="${bean.ref }">
            <td  align="center">
              <a href="#" style="text-decoration: none;" onclick="noticeModifyWrite('${bean.serviceKey}','noticeModifyWrite')">
              		<img border="0" src="../../../${bean.resource }btn/complete.png">
              	</a>
            
            	 <a href="#" onclick="gogoback('${bean.ids }','${bean.serviceKey }')"  ><img border="0" src="../../../${bean.resource }btn/goback.jpg"></a>
            </td>
         
         </tr>
       <tr>
      	<td height="150"></td>
      </tr>
      </cc:when>      
      </cc:choose>
     
   </table>
   
</body>
</html>