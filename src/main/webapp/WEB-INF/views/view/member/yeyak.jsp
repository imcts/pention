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
	<table border="0" align="center" width="100%">

		<c:choose>
		
		<c:when test="${bean.hwanbulInfo==null || bean.hwanbulInfo.size()==0  }">
		<tr>
			<td colspan="7">
				<img src="../../../resources/menuimage/yeyakMitKyulje.png">
			</td>
		</tr>
		<tr>
			<td colspan="7">
				<img src="../../../resources/menuimage/younoyeyaknogylje.jpg">
			</td>
		</tr>
		<tr>
			<td height="20px"></td>
		</tr>
		</c:when>
	
	
		<c:otherwise>
		<tr>
			<td colspan="7">
				<img src="../../../resources/menuimage/yeyakMitKyulje.png">
			</td>
		</tr>
		<tr><td height="5px;"></td></tr>
		<tr>
			<td colspan="7">
				<img src="../../../resources/menuimage/yeyakGyuljeTopbar1.jpg">
			</td>
		</tr>
		<c:forEach items="${bean.hwanbulInfo }" var="list">
		<tr align="center">
			<td width="12%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">${list.yeyakDay }</font></td>
			<td width="25%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.yeyakpentionName }</font></td>
			<td width="25%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.yeyakroomname }</font></td>
			<td width="5%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.yeyakTerm }박</font></td>
			<td width="5%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.yeyakInwon }명</font></td>
			<td width="20%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.getYeyakTotalMoney() }원</font></td>
			<td width="10%">${list.yeyakMsg }</td>
			
		</tr>
			<tr>
				<td colspan="7"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
		</c:forEach>
		
		<tr>
			<td height="20px"></td>
		</tr>
		</c:otherwise>
		</c:choose>
		
	</table>
</body>
</html>