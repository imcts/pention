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

<table border="0" width="100%">
		<tr>
			<td width="110" valign="top">
				<div style="margin-bottom: 4px;"><img src="../../../${bean.resource }areatop.gif"></div>
				<c:forEach items="${bean.themaMenuList }" var="area" varStatus="i">
				<c:if test="${i.index < 9 }">
				<c:choose>
					<c:when test="${bean.thameAreaKey eq area.topservice }">
						<div style="height: 44px; margin: 1px 0 2px 0;"><a href="#" onclick="themaSerchDetail('skie','${area.topservice}')"><img border="0" src="../../../${bean.resource }${area.topservice }c.gif"></a></div>				
					</c:when>
					
					<c:otherwise>
						<div style="height: 44px; margin: 1px 0 2px 0;"><a href="#" onclick="themaSerchDetail('skie','${area.topservice}')"><img border="0" src="../../../${bean.resource }${area.topservice }.gif"></a></div>
					</c:otherwise>				
				</c:choose>
				</c:if>
				</c:forEach>
			</td>
			
			<td valign="top">
				<div style="height: 45px; background-repeat: no-repeat; background-image: url('../../../resources/menuimage/themaBackGraund.jpg');">
					<div><img src="../../../${bean.resource }areasubmenu/top${bean.thameAreaKey }.gif"></div>
					
					<c:forEach items="${bean.themaMenuList }" var="menu">
					
					<div style="margin: 20px 0 5px 20px; float: left;">
						<c:choose>
							<c:when test="${bean.themaSerchKey eq menu.topkey }">
								<a href="#" onclick="themaSerchDetail('${menu.topkey}','${bean.thameAreaKey }')"><img border="0" src="../../../resources/menuimage/themasubmenu/${menu.topkey }c.gif"></a>
							</c:when>
							<c:otherwise>
								<a href="#" onclick="themaSerchDetail('${menu.topkey}','${bean.thameAreaKey }')"><img border="0" src="../../../resources/menuimage/themasubmenu/${menu.topkey }.gif"></a>
							</c:otherwise>
						</c:choose>
					</div>
					</c:forEach>
				</div>
				
				<table border="0" width="100%">
				<tr>
							<c:choose>
								<c:when test="${bean.themaSerchList.size() != 0}">
									<c:forEach items="${bean.themaSerchList }" var="list" varStatus="i">
										<td width="33%" align="center">
											<a href="#" onclick="themaDetailGo('${bean.themaSerchKey}','${bean.thameAreaKey }','${list.pid }')"><img border="0" width="240px" height="240px" src="../../../${bean.resource }pentionimage/${list.mainphoto }"></a><br><br>
											<a href="#" onclick="themaDetailGo('${bean.themaSerchKey}','${bean.thameAreaKey }','${list.pid }')" style="text-decoration: none;" ><font color="#510000" face="dothum" style="font-size:10pt; font-weight: bold;">${list.pentionName }</font><br><font color="#510000" face="dothum" style="font-size:8pt;">[${list.address1 }]</font></a> 
											
											<c:if test="${(i.index+1 % 3) %3 == 0}">
												</tr><tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr><tr>
											</c:if>
										</td>
									</c:forEach>
									
									<c:if test="${bean.themaSerchList.size() < 3  and  bean.themaSerchList.size()!=0}">
										<c:forEach begin="0" end="${bean.areaSerchList.size() }" varStatus="i">
											<td></td>
										</c:forEach>
									</c:if>
									
								</c:when>
								
								<c:when test="${bean.themaSerchList.size() == 0 || bean.areaSerchList.size()==null }">
									<td width="100%" align="center">
										<img src="../../../${bean.resource }noSerchImage.jpg">
									</td>
								</c:when>
							</c:choose>
						</tr>
								</table>
								
								
							</td>
							
							
						</tr>
						
						
						
	
		</table>
</body>
</html>