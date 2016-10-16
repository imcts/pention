<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="0" width="100%" align="center">

	<tr>
		<td colspan="7" align="center">
			<div style="background-image:url('../../../resources/menuimage/yeyakTopBar.jpg'); "><font color="#e7e7e7" face="dothum" style=" font-weight:bold; font-size:12pt;">${ajaxbean.roomname } 예약 현황</font></div>
		</td>
	</tr>
	<tr align="center">
		<c:forEach items="${ajaxbean.yeyakInfo }" var="info">
			<td>
				<font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${info.key }</font><br>
				
				<c:choose>
					<c:when test="${info.topkey eq '예약완료' }">
						<font color="red" face="dothum"	style="font-weight: bold; font-size: 12pt;">${info.topkey }</font>
					</c:when>
					<c:otherwise>
						<font color="72e890" face="dothum"	style="font-weight: bold; font-size: 12pt;">${info.topkey }</font>
					</c:otherwise>
				</c:choose>
				
				</td>
		</c:forEach>
	</tr>
	
	<tr>
		<td colspan="7" align="center">
			<div><img src="../../../resources/menuimage/detailYeyakStateBar.png"></div>
		</td>
	</tr>
	
	<tr>
		<td colspan="8" align="center">
			<div style="float: left; width:22%;"><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${ajaxbean.roomname }</font></div>
			<div style="float: left; width:15%;"><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${ajaxbean.choiceYear }년 ${ajaxbean.choiceMonth }월 ${ajaxbean.choiceDay }일</font></div>
			<div style="float: left; width:20%;"><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;"><ct:detailSelect /></font></div>
			<div style="float: left; width:14%;"><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;"><ct:detailSelectInwon /></font></div>
			<div style="float: left; width:25%"><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${ajaxbean.yeyakDetailAddMoney() }원</font></div>
		<td>
	</tr>
	
	<tr>
		<td colspan="7" align="center">
			<c:choose>
				<c:when test="${ajaxbean.yeyakInfo.get(0).topkey eq '예약가능' && logchk.grade < 4}"> <!--로그인이고, 예약이 가능할때. 예약하기   -->
					<a href="javascript:;" onclick="yeyakGo('${ajaxbean.choiceYear }','${ajaxbean.choiceMonth }','${ajaxbean.choiceDay }','${ajaxbean.min }','${ajaxbean.addmoney}','${ajaxbean.money }','${logchk.id }','${ajaxbean.pid }','${ajaxbean.roomname }','${ajaxbean.pentionName }')" ><img border="0" src="../../../resources/menuimage/yeyakButton.jpg"></a>
				</c:when>
			
				<c:when test="${ajaxbean.yeyakInfo.get(0).topkey eq '예약완료' && logchk.grade < 4}">
					<img border="0" src="../../../resources/menuimage/yeyaknonohada.jpg"> 
				</c:when>
				
				<c:otherwise>
					<img border="0" src="../../../resources/menuimage/YeyakLoginMentGo.jpg"> 
				</c:otherwise>
			</c:choose>
		</td>
	</tr>




	</table>
</body>
</html>