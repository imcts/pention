<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="0" align="center" width="100%">
		<tr>
			<td>
				<div><img border="0" src="../../../resources/menuimage/moonWehagi.png"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div><img border="0" src="../../../resources/menuimage/DetailBoardTopBar.jpg"></div>
			</td>
		</tr>
	</table>
	<table border="0" align="center" width="100%">
		<tr align="center">
			<td width="80px"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${ajaxbean.dBoardResult.no }</font></td>
			<td width="480px"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${ajaxbean.dBoardResult.dtitle }</font></td>
			<td width="100px"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${ajaxbean.dBoardResult.duser }</font></td>
			<td width="110px"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${ajaxbean.dBoardResult.dtoday }</font></td>
			<td><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${ajaxbean.dBoardResult.dcount }</font></td>
		</tr>
	</table>
	<table border="0" align="center" width="100%"> 
		<tr>
			<td><img border="0" style="height: 30px;"  src="../../../resources/menuimage/ContentDetailBoard.jpg"></td>
		</tr>
		<tr>
			<td>
				<font color="black" face="dothum"  style="font-size:12pt; font-weight: bold;"><ct:repace2 var="${ajaxbean.dBoardResult.dcontent }"/></font>
			</td>
		</tr>
		
			<tr>
				<td><img border="0" src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
		
		
		
		<c:choose>
			<c:when test="${logchk.id eq ajaxbean.dBoardResult.duser }">
				<tr>
				<td align="right">
					<div style="float: left; margin-left: 610px;"><a href="javascript:;" onclick="detailBoardReplyGo('${ajaxbean.dBoardResult.pid }','${ajaxbean.dBoardResult.no}','${ajaxbean.dPage}')"><img border="0" src="../../../resources/menuimage/detailBoardReplyGo.jpg"></a></div>
					<div style="float: left;"><a href="javascript:;" onclick="detailBoardModifyGo('${ajaxbean.dBoardResult.pid }','${ajaxbean.dBoardResult.no}','${ajaxbean.dPage}')"><img border="0" src="../../../resources/menuimage/detailBoardModifyGo.jpg"></a></div>
					<div style="float: left;"><a href="javascript:;" onclick="detailBoardDelete('${ajaxbean.dBoardResult.pid}','${ajaxbean.dBoardResult.no}')"><img border="0" src="../../../resources/menuimage/detailBoardDeleteGo.jpg"></a></div>
					<div style="float: left;"><a href="javascript:;" onclick="detailBoard('${ajaxbean.pid}','${ajaxbean.dPage}')"><img border="0" src="../../../resources/menuimage/DetailBoardListGo.jpg"></a></div>
				</td>
			</tr>
				
			</c:when>
			
			
			<c:when test="${logchk.grade==1 }">
				<tr>
				<td align="right">
					<div style="float: left; margin-left: 730px;"><a href="javascript:;" onclick="detailBoardDelete('${ajaxbean.dBoardResult.pid}','${ajaxbean.dBoardResult.no}')"><img border="0" src="../../../resources/menuimage/detailBoardDeleteGo.jpg"></a></div>
					<div style="float: left;"><a href="javascript:;" onclick="detailBoard('${ajaxbean.pid}','${ajaxbean.dPage}')"><img border="0" src="../../../resources/menuimage/DetailBoardListGo.jpg"></a></div>
				</td>
			</tr>
				
			</c:when>
			
			<c:when test="${logchk.grade < 4 && logchk.grade >1 }">
			<tr>
				<td align="right">
					<div style="float: left; margin-left: 750px;"><a href="javascript:;" onclick="detailBoardReplyGo('${ajaxbean.dBoardResult.pid }','${ajaxbean.dBoardResult.no}','${ajaxbean.dPage}')"><img border="0" src="../../../resources/menuimage/detailBoardReplyGo.jpg"></a></div>
					<div style="float: left;"><a href="javascript:;" onclick="detailBoard('${ajaxbean.pid}','${ajaxbean.dPage}')"><img border="0" src="../../../resources/menuimage/DetailBoardListGo.jpg"></a></div>
				</td>
			</tr>
			</c:when>
			
			
			<c:otherwise>
			<tr>
				<td align="right">
					<a href="javascript:;" onclick="detailBoard('${ajaxbean.pid}','${ajaxbean.dPage}')"><img border="0" src="../../../resources/menuimage/DetailBoardListGo.jpg"></a>
				</td>
			</tr>
			</c:otherwise>		
		
		</c:choose>
		
		
		
		
		<tr><td height="50px;"></td></tr>
	</table>
</body>
</html>