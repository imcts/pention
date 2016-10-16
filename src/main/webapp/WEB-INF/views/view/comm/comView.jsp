<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
a {text-decoration: none;}
</style>
</head>
<body>
<%-- ${bean.fpage }  = 현재 페이지,
${bean.fstart } = 시작페이지,
${bean.fend } = 끝끝끝페이지,
${bean.fids } = 글번호,
${bean.fgid} = 그룹번호,
 --%>
<table width="87%" align="center" border="0">
<tr>

    	
      <td colspan="6"><img src="../../../${bean.resource }/freeboard/freeboard.gif"></td>
   </tr>
   <tr>
      <td colspan="6">
         <img src="../../../${bean.resource }/freeboard/Findex.png">
      </td>
   </tr>
   <c:forEach items="${bean.freeboard }" var="f" varStatus="no">
   <tr>
      <td align="center" width="80px"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${f.fids}</font></td>
         <td width="120px">
         <c:choose>
           <c:when test="${f.fhead==1 }">
              <div style="margin: 0 0 0 60px;">
                 <img src="../../../${bean.resource }/freeboard/free.gif">
              </div>
           </c:when>
           <c:when test="${f.fhead==2 }">
                 <div style="margin: 0 0 0 50px;">
                 <img src="../../../${bean.resource }/freeboard/after.jpg">
              </div>
          </c:when>
         </c:choose>        
         </td>
        <td align="left" width="390px">
        <c:forEach begin="1" end="${f.fref }" >&nbsp;&nbsp;</c:forEach>
                     <c:if test="${f.fref>0 }"><img src="../../../${bean.resource }notice/notice_re.jpg"></c:if>
            <a href="#" onclick="freeDetail(${f.fids},${bean.fpage },'${f.ftitle }')"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${f.ftitle }</font></a></td>
         
        
            <td align="center" width="70px"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${f.fuserid }</font></td>
         
            <td align="center" width="100px"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${f.freg_date }</font></td>
            <td align="center"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${f.fcnt }</font></td>
   </tr>
   <tr><td colspan="6" height="10px"><img src="../../../${bean.resource }/freeboard/bar.jpg"></td></tr>
   
      
   </c:forEach>
   
   
   <!-- 글쓰기글쓰기글쓰기글쓰기글쓰기글쓰기글쓰기글쓰기글쓰기글쓰기글쓰기글쓰기 -->
   
   
   
</table>

<table width="87%" align="center">
<tr>
      <td width="30%" height="20px" valign="middle" align="right"> 
      <c:if test="${bean.fstartpage>1 }">
         <a href="#" onclick="fPaging(1)"><img border="0" src="../../../resources/menuimage/leftGoGoGo.png"></a>
         <a href="#" onclick="fPaging(${bean.fstartpage-1})"><img border="0" src="../../../resources/menuimage/leftGogo.png"></a>
         </c:if>
       </td>
   
      <td align="center" valign="middle" >
         <c:forEach begin="${bean.fstartpage}" end="${bean.fendpage }" var="i" varStatus="j">
            <c:choose>
               <c:when test="${bean.fpage == i}">
                  <font color="red" face="dothum"  style="font-size:10pt; font-weight: bold;">${i }</font>
               </c:when>
               <c:otherwise>
                  <font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;"><a style="text-decoration: none; color: black;" href="javascript:;" onclick="fPaging(${i})">${i }</a></font>
               </c:otherwise>
            </c:choose>
         </c:forEach>
      </td>
      
      <td width="30%" align="left" valign="middle">
      <c:if test="${bean.fendpage < bean.ftotalpage}">
         <a href="#" onclick="fPaging(${bean.fendpage+1})" ><img border="0" src="../../../resources/menuimage/rightGogo.png"></a>
         <a href="#" onclick="fPaging(${bean.ftotalpage})"><img border="0" src="../../../resources/menuimage/rightGoGoGo.png"></a>
      </c:if>
      
      </td>
   </tr>
   <c:if test="${logchk.grade > 1 && logchk.grade<4 }">
         <tr>
              <td colspan="6" align="right"><a href="#" onclick="freewriteForm(${bean.fpage})"><img src="../../../${bean.resource }/btn/write.jpg"></a></td>
         </tr>
   </c:if>
   <tr><td height="50px;"></td></tr>
</table>

</body>
</html>