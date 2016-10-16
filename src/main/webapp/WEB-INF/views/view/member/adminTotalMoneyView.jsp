<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="cc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="0" width="100%" align="center">
	
			<input type="hidden" name="payYear">
			<input type="hidden" name="payMonth">
			<input type="hidden" name="upId">
	
	
	<tr>
		<td colspan="6">
			<img  src="../../../${bean.resource }/member/luckyStrike.jpg">
		</td>
	</tr>
	
	<c:choose>
		<c:when test="${bean.memSuchList.size()==0 || bean.memSuchList==null }">
		
		<tr>
			<td colspan="6">
				<img  src="../../../${bean.resource }nonokyuljenaeyuknono.png">
			</td>
		</tr>
		
		<tr>
			<td colspan="6">
				<img border="0" src="../../../${bean.resource }notice/noticeboard_bar.jpg">
			</td>
		</tr>
			
		</c:when>
	<c:otherwise>
	<tr>
		<td colspan="6">
			<img  src="../../../${bean.resource }JungSanTopBarAll.png">
		</td>
	</tr>

	<c:forEach items="${bean.memSuchList }" var="i" >
				
				<tr>
					<td align="center" width="25%">
						<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.id }</font>
					</td>
					
					<td align="center" width="15%" >
						<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.name }</font>
					</td>
					
					<td align="center" width="23%">
						<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.email }</font>
					</td>
					
					<td align="center" width="20%">
						<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.tell }</font>
					</td>
					<td align="center" width="17%">
						<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.getPointformat()}</font>
					</td>	
		
					<td width="10%" align="center" >
						<a href="#" onclick="subgiveme('${i.id}')">
								<img border="0" src="../../../${bean.resource }JungsanHagiwi.jpg">
						</a>
						
					</td>
								
								
						
					</tr>
					<tr>
						<td colspan="6">
							<img border="0" src="../../../${bean.resource }notice/noticeboard_bar.jpg">
						</td>
					</tr>
							
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>	


<table border="0" align="center" width="100%">
	<tr>
		<td align="center" width="60%">
			<div style="float: left; margin-left: 300px;"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">검색하실 년도 선택</font></div>
			<div style="float: left;margin-left: 20px;"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;"><cc:jungsanTag var="1">년</cc:jungsanTag></font></div>
		</td>
	</tr>
	
	
	<tr>
		<td colspan="6">
			<img border="0" src="../../../${bean.resource }notice/noticeboard_bar.jpg">
		</td>
	</tr>

	<tr>
		<td align="center">
			<div style="float: left; margin-left: 300px;"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">검색하실 월 선택</font></div>
			<div style="float: left;margin-left: 35px;"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;"><cc:jungsanTag var="2">월</cc:jungsanTag></font></div>
		</td>
	</tr>
	
	<tr>
		<td colspan="6">
			<img border="0" src="../../../${bean.resource }notice/noticeboard_bar.jpg">
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<a href="javascript:;" onclick="yse()"><img border="0" src="../../../${bean.resource }JungSanSerchButton.png"></a>
		</td>
	</tr>
	<tr>
		<td colspan="2" height="50px"></td>
	</tr>
</table>
</body>
</html>