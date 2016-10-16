<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>	
	
	<table>
		<tr>
			<td>
				<div><img src="../../../resources/menuimage/moonWehagi.png"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div><img src="../../../resources/menuimage/DetailBoardTopBar.jpg"></div>
			</td>
		</tr>
	</table>
	<table border="0" width="100%">
		<c:forEach items="${ajaxbean.dBoardResult }" var="list" varStatus="i">
			<tr>
				<td width="80px" align="center"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${list.no }</font></td>
				
				<td width="480px" align="left"><a href="javascript:;" onclick="goDetailBoard('${ajaxbean.pid }','${ajaxbean.dPage }','${list.no}')" style="text-decoration: none;">
					
					<c:forEach begin="1" end="${list.dref }" var="i">
						&nbsp;&nbsp;&nbsp;
					</c:forEach>
					<c:forEach begin="1" end="${list.dref }" var="i">
						<img src="../../../resources/menuimage/gohwasalpyo.jpg">
					</c:forEach>
					
					<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${list.dtitle }</font></a>
				</td>
				
				<td align="center" width="100px"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${list.duser }</font></td>
				<td align="center" width="110px"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${list.dtoday }</font></td>
				<td align="center"><font color="black" face="dothum"  style="font-size:9pt; font-weight: bold;">&nbsp;&nbsp;${list.dcount }</font></td>
			</tr>
			<tr>
				<td colspan="5"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
		</c:forEach>
		
</table>

<table border="0" align="center" width="100%">	
	
	<tr>
		<td width="350px;" height="50px" valign="middle" align="right"> 
		<c:if test="${ajaxbean.dPage > ajaxbean.dpageLimit }">
			<div style="float: left; margin-left: 290px;"><a href="javascript:;" onclick="detailBoard('${ajaxbean.pid}','1')"><img border="0" src="../../../resources/menuimage/leftGoGoGo.png"></a></div>
			<div style="float: left; margin-left: 5px;"><a href="javascript:;" onclick="detailBoard('${ajaxbean.pid}','${ajaxbean.dStartPage-1}')"><img border="0" src="../../../resources/menuimage/leftGogo.png"></a></div>
	   	</c:if>
	    </td>
	
		<td align="center" valign="middle">
			<c:forEach begin="${ajaxbean.dStartPage }" end="${ajaxbean.dEndPage }" var="i" varStatus="j">
				<c:choose>
					<c:when test="${ajaxbean.dPage == i && i <= ajaxbean.dtotalPage }">
						<font color="red" face="dothum"  style="font-size:10pt; font-weight: bold;">${i }</font>
					</c:when>
					<c:when test="${ajaxbean.dPage != i && i <= ajaxbean.dtotalPage }">
						<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;"><a style="text-decoration: none; color: black;" href="javascript:;" onclick="detailBoard('${ajaxbean.pid}','${i}')">${i }</a></font>
					</c:when>	
				</c:choose>
			</c:forEach>
		</td>
		
		<td width="350px;" align="left" valign="middle">
		<c:if test="${ajaxbean.dEndPage < ajaxbean.dtotalPage }">
			<div style="float: left; margin-left: 5px;"><a href="javascript:;" onclick="detailBoard('${ajaxbean.pid}','${ajaxbean.dEndPage+1}')" ><img border="0" src="../../../resources/menuimage/rightGogo.png"></a></div>
			<div style="float: left; margin-left: 5px;"><a href="javascript:;" onclick="detailBoard('${ajaxbean.pid}','${ajaxbean.dtotalPage}')"><img border="0" src="../../../resources/menuimage/rightGoGoGo.png"></a></div>
		</c:if>
			<c:if test="${logchk.grade < 4 }">
			<div style="float: left; margin-left: 200px;"><a href="javascript:;" onclick="detailWriteView('${ajaxbean.pid}','${ajaxbean.dPage}')"><img border="0" src="../../../resources/menuimage/detailWriteButton.jpg"></a></div>
		</c:if>	
		</td>
	</tr>
		
		

			
	
		
	</table>
</body>
</html>