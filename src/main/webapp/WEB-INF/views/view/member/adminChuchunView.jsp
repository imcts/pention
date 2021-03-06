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
	<c:choose>
		<c:when test="${bean.chuchunResult==null || bean.chuchunResult.size()==0   }">
		<table border="0" width="100%" align="center">
			<tr>
				<td colspan="4"><img src="../../../resources/menuimage/ChuchunIpchalList.png"></td>
			</tr>
			<tr>
				<td colspan="4"><img src="../../../resources/menuimage/nonoipchalja.jpg"></td>
			</tr>
			<tr>
				<td colspan="4"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			<tr><td height="30px;"></td></tr>
		</table>
		</c:when>
		<c:otherwise>
		<table border="0" width="100%" align="center">
		<tr>
			<td colspan="4"><img src="../../../resources/menuimage/ChuchunIpchalList.png"></td>
		</tr>
		
		<tr>
			<td colspan="4"><img src="../../../resources/menuimage/ipchalTopBarList1.png"></td>
		</tr>
		
		<c:forEach items="${bean.chuchunResult }" var="list" varStatus="i">
			<tr align="center">
				<td width="15%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${i.index+1 }등</font></td>
				<td width="15%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.pid }</font></td>
				<td width="35%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.pentionName }</font></td>
				<td width="35%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.getchuchunPointFormat() }</font></td>
			</tr>
			<tr>
				<td colspan="4"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
		</c:forEach>
		<tr><td height="10px;"></td></tr>
			<tr>
				<td colspan="4"><a href="javascript:;" onclick="refreshChuChunPention()"><img src="../../../resources/menuimage/refreshChuChunPention.jpg"></a></td>
			</tr>
		
		<tr><td height="30px;"></td></tr>
		</table>
		</c:otherwise>
	
	</c:choose>
</body>
</html>