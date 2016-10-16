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
		<tr>
			<td>
				<input type="hidden" name="saupjaGamangId">
				<input type="hidden" name="msgIndex">
			</td>
		</tr>
	<c:choose>
		<c:when test="${logchk.saupjaIndex==1 }">
				<tr>
					<td><img src="../../../resources/menuimage/SaupjaFaxMent.jpg"></td>
				</tr>
				<tr>
					<td><img src="../../../resources/menuimage/SaupjaFaxMentAfter.jpg"></td>
				</tr>
		
				<tr>
					<td align="center"><a href="javascript:;" onclick="userGamang('${logchk.id}')"><img src="../../../resources/menuimage/GamangGogogo.jpg"></a></td>
				</tr>
				<tr>
					<td height="100px;"></td>
				</tr>

	 	</c:when>
	
		<c:otherwise>
				<tr>
					<td><img src="../../../resources/menuimage/SaupjaFaxMentAfter.jpg"></td>
				</tr>
			
			<tr>
				<td height="50px" align="center">
					<img style="margin-bottom: 100px;" src="../../../resources/menuimage/GamangSinChungING.jpg">
				</td>
			</tr>
			
		</c:otherwise>
	
	</c:choose>
		


	</table>
</body>
</html>