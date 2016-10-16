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
	<table border="0" align="center" width="100%">
		<tr>
			<td>
				<div><img border="0" src="../../../resources/menuimage/moonWehagi.png"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div><img border="0" src="../../../resources/menuimage/detailBoardTopViewBar.png"></div>
			</td>
		</tr>
		
		
		<tr>
			<td align="left" width="100%">
				<input  style="width:86%; margin-left:13px; padding-left: 100px;" maxlength="15" type="text" name="dtitle" value="<c:out value='${ajaxbean.dBoardResult.dtitle }'/>">
			</td>
		</tr>
		
		
		<tr>
			<td><img src="../../../resources/menuimage/ContentDetailBoard.jpg"></td>
		</tr>
		
		
		<tr>
			<td align="center" width="100%">
				<textarea style=" margin-left:3px; padding-left:100px; width:86%; height: 100px;" name="dcontent" ><ct:repace2 var="${ajaxbean.dBoardResult.dcontent }"/></textarea>
			</td>
		</tr>
		
		<tr>
			<td align="right">
				<a href="javascript:;" onclick="detailBoardModifyWrite('${ajaxbean.no}','${ajaxbean.dPage}','${ajaxbean.pid }','${logchk.id }')"><img src="../../../resources/menuimage/detailBoardModifyGo.jpg"></a>
				<a href="javascript:;" onclick="goDetailBoard('${ajaxbean.pid }','${ajaxbean.dPage }','${ajaxbean.no}')"><img src="../../../resources/menuimage/detailBoardRollBack.jpg"></a>
			</td>
		</tr>
	</table>
</body>
</html>