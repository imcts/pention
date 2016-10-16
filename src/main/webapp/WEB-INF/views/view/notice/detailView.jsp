<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <%@ taglib prefix="cc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<table width="100%" align="center" border="0" >

   <c:choose>
   	<c:when test="${bean.boardKey eq 'noticeboard' }">
   		 <img  src="../../../${bean.resource }/notice/notice_noticeboard_11.gif">
   	</c:when>
   	<c:when test="${bean.boardKey eq 'qna' }">
   	
   		 <img  src="../../../${bean.resource }/notice/notice_QnA_11.jpg">
   	
   	</c:when>			
   
   </c:choose>
   
   <c:forEach items="${bean.insertboard }" var="e">
   
   
   <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
   <input type="hidden" name="gid" value="${e.gid }">
      <input type="hidden" name="ref" value="${e.ref }">
      <input type="hidden" name="seq" value="${e.seq }">
      <input type="hidden" name="pname" value="${e.pname }">
      <input type="hidden" name="title" value="${e.title }">
      <input type="hidden" name="content" value="${e.content }">
   <!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
   <tr>
      <img src="../../../${bean.resource }notice/notice_detail.jpg">
   </tr>
   
   <tr > 
   	<td align="center" width="372px"><div style="float: reft; margin-right:-25px; "><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${e.title }</font></div></td>
   	<td align="center" width="60px"><div style="float: reft; margin-left:2px;"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${e.userid }</font></div></td>
   <td align="center"  width="370px" ><div style="float: reft; margin-left:-4px;"><fmt:formatDate value="${e.reg_date }" pattern="yy-MM-dd "/></div></td>
     <td align="center" width="70px" ><div style="float: reft; margin-left:-10px;">${e.cnt }</div></td>
   			
   </tr> 
  
   <tr>
      <td align="center" colspan="4"><img src="../../../${bean.resource }notice/contents.jpg">
      	
      </td>
   </tr>
   <tr>
   	<td height="25px"></td>
   </tr>
   <tr>
     
      <td colspan="5" align="center" >
      	<font color="black" face="dothum" style="font-size:10pt; font-weight: bold;">
      		<cc:noticereplace var="${e.content }"/>
      	</font>
      		<table>
      		
      		</table>
      </td>
   </tr>
   <tr>
   	<td height="30px"></td>
   </tr>
   <tr>
   		<td colspan="5">
   			<img border="0" src="../../../${bean.resource }notice/noticeboard_bar.jpg">
   		</td>
   </tr>
   <tr>
   	<td height="30px"></td>
   </tr>
    <tr>
         <c:choose>
            <c:when test="${bean.boardKey eq 'noticeboard'  && logchk.grade<2 }"><!--공지사항에 관리자 -->
               <td align="right" colspan="4">
	               <a href="#" onclick="noticemodify('noticeboard')"  ><img border="0" src="../../../${bean.resource }btn/modify.png"></a>
	              <a href="#" onclick="noticedelete('noticeboard')"  ><img border="0" src="../../../${bean.resource }btn/delete.jpg"></a>
	               <a href="#" onclick="back('${bean.boardKey}')" ><img border="0" src="../../../${bean.resource }btn/list.jpg"></a>
               </td>
            </c:when>
            <c:when test="${bean.boardKey eq 'qna'  && logchk.grade==1 }"><!--공지사항에 관리자 -->
              <td align="right" colspan="4"><a href="#" onclick="noticedelete('qna')"  ><img border="0" src="../../../${bean.resource }btn/delete.jpg"></a>
                <a href="#" onclick="reply('qna','${bean.noplus}')"><img border="0" src="../../../${bean.resource }btn/dab.jpg"></a> 
              <a href="#" onclick="back('${bean.boardKey}')"  ><img border="0" src="../../../${bean.resource }btn/list.jpg"></a>
               </td>
            </c:when>
           
           <c:when test="${bean.boardKey eq 'qna' && logchk.id eq e.userid }"><!--qna의 접속자  -->
                <td colspan="4" align="right">
                    <a href="#" onclick="reply('qna','${bean.noplus}')"><img border="0" src="../../../${bean.resource }btn/re.jpg"></a> 
                   <a href="#" onclick="noticemodify('qna')"  ><img  border="0" src="../../../${bean.resource }btn/modify.png"></a>
                     <a href="#" onclick="noticedelete('qna')"  ><img  border="0" src="../../../${bean.resource }btn/delete.jpg"></a>
                    <a href="#" onclick="back('${bean.boardKey}')"  ><img border="0" src="../../../${bean.resource }btn/list.jpg"></a></td>
           </c:when>
           
            <c:when test="${bean.boardKey eq 'qna' && logchk.grade <4 &&!(logchk.id eq e.userid)}">
             <td align="right" colspan="4">
               <a href="#" onclick="reply('qna','${bean.noplus}')"><img border="0" src="../../../${bean.resource }btn/re.jpg"></a>
              <a href="#" onclick="back('${bean.boardKey}')"  ><img  border="0" src="../../../${bean.resource }btn/list.jpg"></a></td>
            </c:when>
           <c:when test="${bean.boardKey eq 'qna' || bean.boardKey eq 'noticeboard' }"><!--  -->
            <td align="right" colspan="4"><a href="#" onclick="back('${bean.boardKey}')"  ><img border="0" src="../../../${bean.resource }btn/list.jpg"></a></td>
           </c:when>
      </c:choose>
   
   
   </c:forEach>



</table>
  
  
 
</body>
</html> 