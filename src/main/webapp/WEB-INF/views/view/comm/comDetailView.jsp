<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
<%-- ${bean.fpage }  = 현재 페이지,
${bean.fstart } = 시작페이지,
${bean.fend } = 끝끝끝페이지,
${bean.fids } = 글번호,
${bean.fgid} = 그룹번호
 --%>
<table width="87%" align="center" border="0" >
      
      <!-- <input type="hidden" name="fgid" >
          <input type="hidden" name="fref">
        <input type="hidden" name="fseq" >
        <input type="hidden" name="ftitle" >
        <input type="hidden" name="fcontent" > -->
        
   <tr>
      <td colspan="6"><img src="../../../${bean.resource }/freeboard/freeboard.gif"></td>
   </tr>
   <tr>
      <td colspan="6">
         <img src="../../../${bean.resource }/freeboard/Findex.png">
      </td>
   </tr>
   
   <tr align="center">
  		<c:forEach items="${bean.freeboard }" var="f" varStatus="no">
      		<td width="50px">${f.fids }</td>
	      		<c:choose>
	           		<c:when test="${f.fhead==1 }">
	           			<td width="105px"><img src="../../../${bean.resource }/freeboard/free.gif"></td>
	           		</c:when>
	           		<c:when test="${f.fhead==2 }">
	           			<td width="105px"><img src="../../../${bean.resource }/freeboard/after.jpg"></td>
	           		</c:when>
	           		<c:when test="${f.fhead==0 }">
	           			<td colspan="1" width="120px"></td>
	           		</c:when>
	           	</c:choose>
      		<td width="240px" align="left">${f.ftitle }</td>
            <td width="55px">${ f.fuserid }</td>
            <td width="83px">${f.freg_date }</td>
            <td width="53px">${f.fcnt }</td>
      		
        </c:forEach>
   </tr>
   
   
   <tr>
      <td colspan="6">
         <img src="../../../${bean.resource }/freeboard/freecontent.png">
      </td>
   </tr>
   
    <c:forEach items="${bean.freeboard }" var="f">
    
           <c:if test="${f.getUpfileList().get(0) != '0' }">
			   <c:forEach items="${f.getUpfileList() }" var="list">
			   
				   <tr>
				   		<td colspan="6"><img src="../../../${bean.resource }/freeboard/img/${list}"></td>
				   </tr>
			   </c:forEach>
	   	  </c:if> 
     
   
    
   
   
    <tr>
         <td colspan="6"><ct:repace2 var="${f.fcontent }" /></td>  
  	</tr>
  
      	<tr>
				<td colspan="6"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
		</tr>
    <tr>
         <c:choose>
            <c:when test="${logchk.grade< 2}">
             <td align="right" colspan="6">
               <a href="#" onclick="freedelete(${f.fids},'${f.fuserid }',${bean.fpage})"  ><img border="0" src="../../../${bean.resource }btn/delete.jpg"></a>
               <a href="#" onclick="freeReplyForm(${bean.fpage},${f.fids})"><img border="0" src="../../../${bean.resource }btn/anser.jpg"></a>
               <a href="#" onclick="freelist(${bean.fpage})"><img src="../../../${bean.resource }/btn/list.jpg"></a>
             
               </td>
            </c:when>
            <c:when test="${logchk.id eq f.fuserid }"><!-- 작성자일때 작성자일떄 작성자 -->
              <td align="right" colspan="6"><a href="#" onclick="freedelete(${f.fids},'${f.fuserid }',${bean.fpage})"><img border="0" src="../../../${bean.resource }btn/delete.jpg"></a>
                <a href="#" onclick="freemodifyform(${bean.fpage},${f.fids},'${f.fuserid }')"><img border="0" src="../../../${bean.resource }/btn/modify.png"></a>
                <a href="#" onclick="freeReplyForm(${bean.fpage},${f.fids})"><img src="../../../${bean.resource }/btn/anser.jpg"></a>  
              <a href="#" onclick="freelist(${bean.fpage})"><img src="../../../${bean.resource }/btn/list.jpg"></a>
              
               </td>
            </c:when>
           
           <c:when test="${logchk.grade>=2&&logchk.grade<4  }"><!--리플리플  -->
                 <td colspan="6" align="right">
                    <a href="#" onclick="freeReplyForm(${bean.fpage},${f.fids})"><img src="../../../${bean.resource }/btn/anser.jpg"></a> 
                   	<a href="#" onclick="freelist(${bean.fpage})"><img src="../../../${bean.resource }/btn/list.jpg"></a></td>
          
           </c:when>
           <c:otherwise>
           	<td align="right" colspan="6"><a href="#" onclick="freelist(${bean.fpage})"><img src="../../../${bean.resource }/btn/list.jpg"></a></td>
           </c:otherwise>
           	   
  	      </c:choose>
   
   	</tr>

    </c:forEach>
   <tr><td height="50px;"></td></tr>
</table>

</body>
</html>