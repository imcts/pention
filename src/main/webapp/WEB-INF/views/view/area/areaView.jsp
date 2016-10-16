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
	<table border="0" width="100%" >
		
		<tr valign="top">
			<td colspan="3" width="100%">
				<div style="height: 45px; background-repeat: no-repeat; background-image: url('../../../resources/menuimage/areaBackGraund.jpg');">
					<div><img src="../../../${bean.resource }areasubmenu/top${bean.areaMenuList.get(0).menutype }.gif"></div>
					<c:forEach items="${bean.areaMenuList }" var="menu">
					
					<div style="margin: 20px 0 5px 10px; float: left;">
					
					<c:choose>
						<c:when test="${bean.areaSerchKey eq menu.topkey }">
							<a href="#" onclick="areaSerchDetail('${menu.topkey}','${bean.serviceKey }')"><img border="0" src="../../../resources/menuimage/areasubmenu/${menu.topkey }c.gif"></a>
						</c:when>
						<c:otherwise>
							<a href="#" onclick="areaSerchDetail('${menu.topkey}','${bean.serviceKey }')"><img border="0" src="../../../resources/menuimage/areasubmenu/${menu.topkey }.gif"></a>
						</c:otherwise>
					</c:choose>
					</div>
					
					</c:forEach>
				</div>
			</td>
		</tr>
	</table>	
	<br>
	<table align="center" border="0"  width="100%" >	
		<tr>
			<c:choose>
				<c:when test="${bean.areaSerchList.size() != 0}">
					<c:forEach items="${bean.areaSerchList }" var="list" varStatus="i">
						<td width="33%" align="center">
							<a href="#" onclick="areaDetailGo('${bean.areaSerchKey}','${bean.serviceKey }','${list.pid }')"><img border="0" width="240px" height="240px" src="../../../${bean.resource }pentionimage/${list.mainphoto }"></a><br><br>
							<a href="#" onclick="areaDetailGo('${bean.areaSerchKey}','${bean.serviceKey }','${list.pid }')" style="text-decoration: none;" ><font color="#510000" face="dothum" style="font-size:10pt; font-weight: bold;">${list.pentionName }</font><br><font color="#510000" face="dothum" style="font-size:8pt;">[${list.address1 }]</font></a> 
							
							<c:if test="${(i.index+1 % 3) %3 == 0}">
								</tr><tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr><tr>
							</c:if>
						</td>
					</c:forEach>
					
					<c:if test="${bean.areaSerchList.size() < 3 and bean.areaSerchList.size()!=0 }">
						<c:forEach begin="0" end="${bean.areaSerchList.size() }">
							<td></td>
						</c:forEach>
					</c:if>
				</c:when>
				
				<c:when test="${bean.areaSerchList.size() == 0 || bean.areaSerchList.size()==null }">
					<td width="100%" align="center">
						<img src="../../../${bean.resource }noSerchImage.jpg">
					</td>
				</c:when>
			</c:choose>
		</tr>
	</table>
		
		
</body>
</html>