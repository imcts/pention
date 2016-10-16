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
<table border="0" align="center">
	<c:choose>
		<c:when test="${bean.service eq 'idserch' and bean.userData.size() != 0 }">
		<td>
			<div style="margin: 20px 0 10px 70px;"><img alt="" src="../../../${bean.resource }idFindTop.png"></div>
			<div style="margin: 20px 0 10px 70px; float: left;"><img alt="" src="../../../${bean.resource }findIdResult.png"></div>
			
			
			
			<c:forEach items="${bean.userData }" var="id" varStatus="i" >
				<c:choose>
				<c:when test="${i.index < bean.userData.size() }">
					<div style="margin: 20px 0 10px 70px; color:red; float: left;">
						${id.id }
					</div>
				</c:when>
				<c:otherwise>
					<div style="margin: 20px 0 10px 70px; color:red; ">
						${id.id }
					</div>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			
		</td>
		<tr>
			<td><div style="margin: 0px 0 10px 70px;"><img alt="" src="../../../${bean.resource }ipnida.png"></div></td>
		</tr>
		
		<tr>
			<td>
				<div style="float: left; margin: 30px 20px 0px 310px"><img border="0" src="../../../resources/menuimage/dotbogi.gif"></div>
				<div style="float: left; margin: 30px 35px 0px 0"><a href="../../member/infoSerchForm/pwserchForm"><img border="0" src="../../../resources/menuimage/findpw.gif"></a></div>
				<div style="float: left; margin: 30px 35px 65px 0""><a href="../../member/yakgwanView/yakgwan"><img border="0" src="../../../resources/menuimage/newmember.gif"></a></div>
			</td>
		</tr>
		</c:when>
	
	
	
	
		<c:when test="${bean.service eq 'idserch' and bean.userData.size() == 0 }">
			
		<td>
			<div style="margin: 20px 0 10px 70px;"><img alt="" src="../../../${bean.resource }idFindTop.png"></div>
			<div style="margin: 80px 0 45px 270px;"><img alt="" src="../../../${bean.resource }noSerchAll.png"></div>
			
			<div style="float: left; margin: 30px 20px 0px 270px"><img border="0" src="../../../resources/menuimage/dotbogi.gif"></div>
			<div style="float: left; margin: 30px 35px 0px 0px"><a href="../../member/infoSerchForm/idserchForm"><img border="0" src="../../../resources/menuimage/findid.gif"></a></div>
			<div style="float: left; margin: 30px 35px 0px 0"><a href="../../member/infoSerchForm/pwserchForm"><img border="0" src="../../../resources/menuimage/findpw.gif"></a></div>
			<div style="float: left; margin: 30px 35px 65px 0""><a href="../../member/yakgwanView/yakgwan"><img border="0" src="../../../resources/menuimage/newmember.gif"></a></div>
		</td>
		
		
		</c:when>
		
		<c:when test="${bean.service eq 'pwserch' and bean.findPassword !=null }">
		<td>
			<div style="margin: 20px 0 10px 70px;"><img alt="" src="../../../${bean.resource }pwFindTop.png"></div>
			<div style="margin: 20px 0 10px 70px; float: left;"><img alt="" src="../../../${bean.resource }findPwResult.png"></div>
			<div style="margin: 20px 0 10px 70px; color:red; float: left;">			
				${bean.findPassword.password }
			</div>
		
		</td>
		<tr>
			<td><div style="margin: 0px 0 10px 70px;"><img alt="" src="../../../${bean.resource }ipnida.png"></div></td>
		</tr>
		<tr>
			<td>
				<div style="float: left; margin: 30px 20px 0px 310px"><img border="0" src="../../../resources/menuimage/dotbogi.gif"></div>
				<div style="float: left; margin: 30px 35px 0px 0px"><a href="../../member/infoSerchForm/idserchForm"><img border="0" src="../../../resources/menuimage/findid.gif"></a></div>
				<div style="float: left; margin: 30px 35px 65px 0""><a href="../../member/yakgwanView/yakgwan"><img border="0" src="../../../resources/menuimage/newmember.gif"></a></div>
			</td>
		</tr>
		</c:when>
		
		<c:when test="${bean.service eq 'pwserch' and bean.findPassword ==null }">
			<td>
			<div style="margin: 20px 0 10px 70px;"><img alt="" src="../../../${bean.resource }pwFindTop.png"></div>
			<div style="margin: 80px 0 45px 270px;"><img alt="" src="../../../${bean.resource }noSerchAll.png"></div>
			
			<div style="float: left; margin: 30px 20px 0px 270px"><img border="0" src="../../../resources/menuimage/dotbogi.gif"></div>
			<div style="float: left; margin: 30px 35px 0px 0px"><a href="../../member/infoSerchForm/idserchForm"><img border="0" src="../../../resources/menuimage/findid.gif"></a></div>
			<div style="float: left; margin: 30px 35px 0px 0"><a href="../../member/infoSerchForm/pwserchForm"><img border="0" src="../../../resources/menuimage/findpw.gif"></a></div>
			<div style="float: left; margin: 30px 35px 65px 0""><a href="../../member/yakgwanView/yakgwan"><img border="0" src="../../../resources/menuimage/newmember.gif"></a></div>
		</td>
		
		
		</c:when>
		
	</c:choose>
</table>
</body>
</html>