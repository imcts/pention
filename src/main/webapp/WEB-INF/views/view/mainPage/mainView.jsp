<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>

<body onload="mainPageLoad(1)">	
	<input type="hidden" id="rankindex" value="0">
	<input type="hidden" id="rankindexMax" value="${bean.chuchunRank }">
	<div id="mainPageRanking"></div>
	
	<table width="100%" align="center" border="0">
		<tr>
			<td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td>
		</tr>
		<tr>
			<td>
				<img src="../../../resources/menuimage/HOTBESTTT.png">
			</td>
		</tr>
		
		<c:choose>

		<c:when test="${bean.pentionResult.size()==0 || bean.pentionResult==null }">
				<tr>
					<td colspan="3" align="center"><img src="../../../resources/menuimage/noSerchImage.jpg"></td>
				</tr>
		</c:when>
					
					
		<c:otherwise>
				<tr>
					<c:forEach items="${bean.pentionResult }" var="list" varStatus="i">
						<td width="33%" align="center">
							<a href="#" onclick="GoldDetailGo('${list.pid }')"><img border="0" width="240px" height="240px" src="../../../${bean.resource }pentionimage/${list.mainphoto }"></a><br><br>
							<a href="#" onclick="GoldDetailGo('${list.pid }')" style="text-decoration: none;" ><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">${list.pentionName }</font><br><font color="#510000" face="dothum" style="font-size:8pt;">[${list.address1 }]</font></a> 
							
							<c:if test="${(i.index+1 % 3) %3 == 0}">
								</tr><tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr><tr>
							</c:if>
						</td>
					</c:forEach>
					
					<c:if test="${bean.pentionResult.size() < 3 and bean.pentionResult.size()!=0 }">
						<c:forEach begin="0" end="${bean.pentionResult.size() }">
							<td width="33%"></td>
						</c:forEach>
					</c:if>
			</tr>
		</c:otherwise>
		</c:choose>
	</table>
	
	<table border="0" align="center" width="100%" height="180px" style="background: #f5faf4;">
		<tr>
			<td align="center" width="50%"  valign="top">
				<table border="0" width="100%" align="center">
					<tr>
						<td>
							<img style="margin-left: 90px;" src="../../../resources/menuimage/mainPageQNA.png">
						</td>
					</tr>
					
					<c:forEach items="${bean.areaSerchList }" var="list" varStatus="i">
						<c:if test="${i.index<5}">
						<tr>
							<td align="center">
								<a href="javascript:;" onclick="noticedetail('${list.title }',${list.ids},'qna',1)" style="text-decoration:none; "><font color="black" face="dothum"   style="font-weight:bold; font-size:11pt;">${list.title }</font></a>
							</td>
						</tr>
						<tr>
							<td align="center"><img  src="../../../resources/menuimage/mainpageJakdegi.png"></td>
						</tr>	
						</c:if>
					</c:forEach>
				</table>
			</td>
			
			
			<td>
				<img  src="../../../resources/menuimage/serojakdaegiya.jpg">
			</td>
			
			
			<td align="center" width="50%" valign="top">
				<table border="0" width="100%" align="center">
					<tr>
						<td>
							<img style="margin-left: 90px;" style="z-index: 1;" src="../../../resources/menuimage/mainPageNOtice.png">
						</td>
					</tr>
					
					<c:forEach items="${bean.themaSerchList }" var="list" varStatus="i">
						<c:if test="${i.index<5}">
						<tr>
							<td align="center">
								<a href="javascript:;"  style="text-decoration:none; " onclick="noticedetail('${list.title }',${list.ids},'noticeboard',1)"><font color="black" face="dothum"   style="  font-weight:bold; font-size:11pt;">${list.title }</font></a>
							</td>
						</tr>
						<tr>
							<td align="center"><img  src="../../../resources/menuimage/mainpageJakdegi.png"></td>
						</tr>	
						</c:if>
					</c:forEach>
					
				</table>

			</td>
		</tr>
	</table>
	
</body>
</html>