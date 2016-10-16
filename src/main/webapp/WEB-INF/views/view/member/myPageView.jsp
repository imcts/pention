<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.submenu {
	margin: 2px 0 2px 0;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<table border="0" width="100%" align="center">
	<input type="hidden" name="admin">
	<input type="hidden" name="saupja">
	<input type="hidden" name="user">
	<input type="hidden" name="adminViewPage">
	<input type="hidden" name="saupjaViewPage">
	<input type="hidden" name="userViewPage">

		<tr>
			<c:choose>
				<c:when test="${logchk.grade==1 }">
					<td valign="top" width="110">
						<div style="margin: 5px 0 5px 2px;"><img src="../../../resources/menuimage/mypage/myTopSub.gif"></div> 
						<c:forEach items="${bean.mypageMenuList }" var="sub">
						<c:choose>
							<c:when test="${bean.admin eq sub.menukey }">
							<div class="submenu">
								<a href="#" onclick="adminMypageGo('${sub.menukey}','${sub.topservice }')"><img border="0"	src="../../../resources/menuimage/mypage/${sub.menukey }c.gif"></a>
							</div>
							</c:when>
							<c:otherwise>
								<div class="submenu">
								<a href="#" onclick="adminMypageGo('${sub.menukey}','${sub.topservice }')"><img border="0"	src="../../../resources/menuimage/mypage/${sub.menukey }.gif"></a>
							</div>
							</c:otherwise>	
						</c:choose>		
						</c:forEach>
					</td>
					
					<td valign="top" colspan="5"><jsp:include page="${bean.adminViewPage }.jsp"/> </td>
				</c:when>
				
				
				
				
				
				<c:when test="${logchk.grade==2 }">
					<td valign="top" width="110">
						<div style="margin: 5px 0 5px 2px;"><img src="../../../resources/menuimage/mypage/myTopSub.gif"></div> 
						<c:forEach items="${bean.mypageMenuList }" var="sub">
							<c:choose>
							<c:when test="${bean.saupja eq sub.menukey }">
							<div class="submenu">
								<a href="#" onclick="saupjaMypageGo('${sub.menukey}','${sub.topservice }')"><img border="0"	src="../../../resources/menuimage/mypage/${sub.menukey }c.gif"></a>
							</div>
							</c:when>
							<c:otherwise>
								<div class="submenu">
								<a href="#" onclick="saupjaMypageGo('${sub.menukey}','${sub.topservice }')"><img border="0"	src="../../../resources/menuimage/mypage/${sub.menukey }.gif"></a>
							</div>
							</c:otherwise>	
						</c:choose>		
						</c:forEach>
					</td>
					
					<td valign="top" colspan="5"><jsp:include page="${bean.saupjaViewPage }.jsp"/> </td>
					
				</c:when>
				
				
				
				   
				
				<c:when test="${logchk.grade==3 }">
					<td valign="top" width="110">
						<div style="margin: 5px 0 5px 2px;"><img src="../../../resources/menuimage/mypage/myTopSub.gif"></div> 
						<c:forEach items="${bean.mypageMenuList }" var="sub">
							<c:choose>
							<c:when test="${bean.user eq sub.menukey }">
							<div class="submenu">
								<a href="#" onclick="userMypageGo('${sub.menukey}','${sub.topservice }')"><img border="0"	src="../../../resources/menuimage/mypage/${sub.menukey }c.gif"></a>
							</div>
							</c:when>
							<c:otherwise>
								<div class="submenu">
								<a href="#" onclick="userMypageGo('${sub.menukey}','${sub.topservice }')"><img border="0"	src="../../../resources/menuimage/mypage/${sub.menukey }.gif"></a>
							</div>
							</c:otherwise>	
						</c:choose>		
						</c:forEach>
					</td>
					
					<td valign="top" colspan="5"><jsp:include page="${bean.userViewPage }.jsp"/> </td>
				
				</c:when>
				
			</c:choose>
		</tr>

	</table>
</body>
</html>