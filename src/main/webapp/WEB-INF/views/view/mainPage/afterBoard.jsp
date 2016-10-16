<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	a{
		text-decoration: none;
	}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<table width="100%" align="center">
	
		<tr>
			<td align="center" colspan="6"><img src="../../../${ajaxbean.resource }/freeboard/Aindex.png"></td>
		</tr>
		<tr><td height="3px"></td></tr>
		<c:forEach items="${ajaxbean.afterBoard }" var="f" varStatus="num">
		<tr>
		<td align="center" width="82px"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${f.fids }</font></td>
	      <td width="90">
	       		 <div style="margin: 0 0 0 18px;">
	        		<img src="../../../${ajaxbean.resource }/freeboard/after.jpg">
	        	</div>
	        
	      </td>
	      <td align="left" width="555px">
       		 <c:forEach begin="1" end="${f.fref }" >&nbsp;&nbsp;</c:forEach>
                     <c:if test="${f.fref>0 }"><img src="../../../${bean.resource }notice/notice_re.jpg"></c:if>
            <a href="#" onclick="freeDetail('${f.fids}',${ajaxbean.fpage })"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${f.ftitle }</font></a>
          </td>
         
        
            <td align="center" width="75px" >
            	<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${f.fuserid }</font>
            </td>
         
			<td align="center" width="110px">
				<div style="margin-left:20px;"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${f.freg_date }</font></div>
			</td>
			<td align="center">
				<div style="margin-left:15px;"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${f.fcnt }</font></div>
			</td>
		</tr>
		<tr>
			<td colspan="6" height="10px"><img src="../../../${ajaxbean.resource }/freeboard/Abar.png"></td>
		</tr>
   
      
   </c:forEach>
	   
	  	<tr>
			<td colspan="6" height="20px"></td>
		</tr>	
		
	</table>
	<table align="center">
	
		<tr>
			<td>
				<c:if test="${ajaxbean.a_page > ajaxbean.a_limitPage }">
					<a href="javascript:;" onclick="topSerchStart(1)"><img src="../../../resources/menuimage/btn/pyosi_left_left.png"></a>
					<a href="javascript:;" onclick="topSerchStart(${ajaxbean.a_startPage-1})"><img src="../../../resources/menuimage/btn/pyosi_left.png"></a>
				</c:if>
			</td>
			<td align="center">
			
				<c:forEach begin="${ajaxbean.a_startPage }" end="${ajaxbean.a_endPage }" var="i">
					
					<c:choose>
					<c:when test="${ajaxbean.a_page == i && i <= ajaxbean.a_maxPage }">
						<font color="red" face="dothum"  style="font-size:10pt; font-weight: bold;">${i }</font>
					</c:when>
					<c:when test="${ajaxbean.a_page != i && i <= ajaxbean.a_maxPage }">
						<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;"><a style="text-decoration: none; color: black;" href="javascript:;" onclick="topserchload(${i})">${i }</a></font>
					</c:when>	
				</c:choose>
				</c:forEach>
			</td>
			<td>
				<c:if test="${ajaxbean.a_endPage < ajaxbean.a_maxPage }">
					<div style="float: left; margin-left: 5px;"><a href="javascript:;" onclick="topserchload('${ajaxbean.a_endPage+1}')" > <img border="0" src="../../../resources/menuimage/rightGogo.png"></a></div>
					<div style="float: left; margin-left: 5px;"><a href="javascript:;" onclick="topserchload('${ajaxbean.a_maxPage}')"><img border="0" src="../../../resources/menuimage/rightGoGoGo.png"></a></div>
				</c:if>
			</td>
			

	</tr>
	
	</table>

</body>
</html>