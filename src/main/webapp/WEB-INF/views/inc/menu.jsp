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
	<c:if test="${bean.menu=='area'}">
			<tr>
				<td>
					<img src="../../../${bean.resource }areatop.gif">
				</td>
			</tr>
	</c:if>
	<c:if test="${bean.menu=='notice' }">
			<tr>
				<td>
					<img src="../../../${bean.resource }noticeSubTop.gif">
				</td>
			</tr>
	</c:if>
		
		
	<c:forEach items="${bean.menuList }" var="menu">
		<tr>
			<td width="100%">
			<c:choose>
			
			
			<c:when test="${bean.serviceKey eq menu.menukey}">
				<a  href="#" onclick="subMenu('${menu.topkey}','${menu.menuType }','${menu.topkey }Serch','${menu.menukey }')"><img border="0" src="../../../${bean.resource }${menu.menukey }c.gif"></a>
			</c:when>
			
			
			<c:when test="${bean.noticekey eq menu.menukey or bean.boardKey eq menu.menukey}">
				<a  href="#" onclick="subMenu('${menu.topkey}','${menu.menuType }','${menu.topkey }Serch','${menu.menukey }')"><img border="0" src="../../../${bean.resource }${menu.menukey }c.gif"></a>
			</c:when>
			
			
			<c:otherwise>
				<a  href="#" onclick="subMenu('${menu.topkey}','${menu.menuType }','${menu.topkey }Serch','${menu.menukey }')"><img border="0" src="../../../${bean.resource }${menu.menukey }.gif"></a>
			</c:otherwise>
			
			
			</c:choose>
			</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>