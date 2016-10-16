<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="cc" tagdir="/WEB-INF/tags" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		

<table border="0" align="center" width="100%">
	<tr>
		<td><input type="hidden" name="upId"></td>	 
	</tr>
	<tr> 
		<td colspan="6">
			<img  src="../../../${bean.resource }/member/memmem.gif">
		</td>
	</tr>
	
<c:choose>

<c:when test="${bean.memSuchList == null || bean.memSuchList.size()==0 }">
	<tr>
		<td> 
			<img  src="../../../${bean.resource }/member/suchx.png">
		</td>
		<tr>
			<td><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
		</tr>
	</tr>
</c:when>

<c:otherwise>
	<tr>
		<td colspan="6"> 
			<img  src="../../../${bean.resource }/member/memCHgrade.png"> 
		</td>
		
		
	</tr>
	<c:forEach items="${bean.memSuchList }" var="i" varStatus="no">
	
				<tr>
					<td align="center" width="100px">
						<cc:gradeTag var="${i.grade }"  identiti="${no.index }"></cc:gradeTag>
					</td>
					<td align="center" width="170px">
						<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.id }</font>
					</td>
					
					<td align="center" width="149px">
						<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.name }</font>
					</td>
					
					<td align="center" width="160px">
						<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.email }</font>
					</td>
					
					<td align="center" width="140px">
						<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.tell }</font>
					</td>	
					
					<td align="center" width="100px">
						<a href="#" onclick="gradeUp('${no.index}','${i.id }')">
							<img  src="../../../${bean.resource }/member/change.png">
		
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

<table border="0" width="100%">
	
	<tr>
		<td>
			
			<div style="margin: 20px 0 100px 280px;">
				<input maxlength="8"  border="0" type="text" name="suchId" value="" style="float:left; border:0; padding-left:10px; padding-top:5px; width:265px; height:60px; background-image: url('../../../${bean.resource }membershipID.gif'); background-repeat: no-repeat;">
				<a href="#" onclick="memberSuch()"><img style="float: left; margin-top: 20px;" border="0" src="../../../${bean.resource }/member/search.jpg"></a>
			</div>
				
		</td>
	
	</tr>
		<tr>
			<td><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
		</tr>
	<tr>
		<td width="150px"></td>
	</tr>
	
</table>
</body>
</html>