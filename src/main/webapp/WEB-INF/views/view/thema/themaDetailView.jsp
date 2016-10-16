<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	.option{
		float: left;
		margin: 3px 5px 2px 10px;
	}
	


</style>
<script type="text/javascript" src="../../../resources/js/json.js"></script>
<script type="text/javascript" src="../../../resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../../../resources/js/jquery-ui-1.8.23.custom.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onload="goDiary(${bean.nowyear},${bean.nowmonth },'${bean.pid }',${bean.nowday })">

	<table border="0" width="100%">
		<tr>
			<td width="110" valign="top">
				<div style="margin-bottom: 4px;">
					<img src="../../../${bean.resource }areatop.gif">
				</div> <c:forEach items="${bean.themaMenuList }" var="area" varStatus="i">
					<c:if test="${i.index < 9 }">
						<c:choose>
							<c:when test="${bean.thameAreaKey eq area.topservice }">
								<div style="height: 44px; margin: 1px 0 2px 0;">
									<a href="#"
										onclick="themaSerchDetail('skie','${area.topservice}')"><img
										border="0"
										src="../../../${bean.resource }${area.topservice }c.gif"></a>
								</div>
							</c:when>

							<c:otherwise>
								<div style="height: 44px; margin: 1px 0 2px 0;">
									<a href="#"
										onclick="themaSerchDetail('skie','${area.topservice}')"><img
										border="0"
										src="../../../${bean.resource }${area.topservice }.gif"></a>
								</div>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
			</td>

		
			<td valign="top">
		
			<table border="0" width="100%">
			<tr>
				<td>
				<div style="height: 45px; background-repeat: no-repeat; background-image: url('../../../resources/menuimage/themaBackGraund.jpg');">
					<div>
						<img src="../../../${bean.resource }areasubmenu/top${bean.thameAreaKey }.gif">
					</div>

					<c:forEach items="${bean.themaMenuList }" var="menu">

						<div style="margin: 20px 0 5px 20px; float: left;">
							<c:choose>
								<c:when test="${bean.themaSerchKey eq menu.topkey }">
									<a href="#"
										onclick="themaSerchDetail('${menu.topkey}','${bean.thameAreaKey }')"><img
										border="0"
										src="../../../resources/menuimage/themasubmenu/${menu.topkey }c.gif"></a>
								</c:when>
								<c:otherwise>
									<a href="#"
										onclick="themaSerchDetail('${menu.topkey}','${bean.thameAreaKey }')"><img
										border="0"
										src="../../../resources/menuimage/themasubmenu/${menu.topkey }.gif"></a>
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
					</div>
				</td>
			</tr>
				
			<tr>
				<td>
					
<table border="0" width="100%">
	<tr>
		<td width="50%">
			<div align="center" style="margin: 20px 20px 20px 20px;"><img width="300px" height="300px" width="80%" src="../../../resources/menuimage/pentionimage/${bean.pentionResult.mainphoto }"></div>
			<div align="center" style="margin-bottom: 20px;"><a href="#" onclick="areaPentionPhotoPop('${bean.pid}','areaPhotoPopup')"><img border="0" src="../../../resources/menuimage/pentionOutView.jpg"></a></div>
		</td>
		
		<td valign="top">
			<div style="margin: 20px 10px 10px 10px;"><font color="black" face="dothum"  style="font-size:9pt; font-weight: bold;">[${bean.pentionResult.address1}] ${bean.pentionResult.pentionName }</font></div>
			<div style="margin: 0px 10px 10px 12px;"><img src="../../../resources/menuimage/DetailBar_.jpg"></div>
			<div style="margin: 10px 10px 10px 10px;"><font color="black" face="dothum"  style="font-size:9pt; font-weight: bold;">상세주소 : ${bean.pentionResult.address2 }</font></div>
			<br>
			
		    <c:forEach items="${bean.pentionResult.themaoption }" var="option">
				<div style="margin-left: 10px;" class="option">
					<img src="../../../resources/menuimage/option/${option }.jpg">
				</div>
			</c:forEach>		
		</td>
	</tr>
	
	<tr>
		<td>
			<div id="diary"></div>
		</td>
		<td align="center">
			<img src="../../../resources/menuimage/warrning.jpg"> 
			
			<div  id="choiceDiary" style="font: 'dothum'; color:black; font-size: 12pt; margin-top: 50px; margin-left: -20px;">선택하신 날자 : ${bean.nowyear}년 ${bean.nowmonth }월 ${bean.nowday }일</div>
		</td>
	</tr>
		
	<tr>
		<td colspan="2">
			<div id="allRoomList"></div>
		</td>
	</tr>
		
	<tr>
		<td colspan="2">
			<div id="yeyakList"></div>
		</td>
	</tr>
		
</table>

<table border="0" align="center" width="100%">
	<tr>
		<td>
			 <img src="../../../resources/menuimage/DetailAnneBar.png">
		</td>
	</tr>
	<tr>
		<td>
			<div style=" width:100%;"><ct:replace var="${bean.pentionResult.pcontent }"/></div>
			<div><img src="../../../resources/menuimage/pentionContentBack.png"></div>
		</td>
	</tr>
</table>

<table border="0" align="center" width="100%">

	<tr>
		<td><div id="detailBoard"><a href="javascript:;" onclick="detailBoard('${bean.pid}',${bean.dPage })"><img border="0" style="margin-bottom: 50px;" src="../../../resources/menuimage/DetailContentBar.png"></a></div></td>
	</tr>

</table>

<table border="0" align="center" width="100%">

	<tr>
		<td><div id="mapTopbar"></div></td>
	</tr>
	<tr>
		<td><div  id="map-canvas" style="margin-bottom:100px; width: 100%; height: 340px" title="${bean.pentionResult.pentionName }"><a href="javascript:;" onclick="initialize('${bean.pentionResult.address1}','${bean.pentionResult.address2}')"><img border="0" style="margin-bottom: 50px;" src="../../../resources/menuimage/MapDetailBoardTopBar.jpg"></a></div></td>
	</tr>

</table>


</body>
</html>