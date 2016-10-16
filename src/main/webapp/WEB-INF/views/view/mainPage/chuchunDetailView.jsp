<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
	.option{
		float: left;
		margin: 3px 5px 2px 10px;
	}
	


</style>

<script type="text/javascript" src="../../../resources/js/json.js"></script>
<script type="text/javascript" src="../../../resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../../../resources/js/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
<title>Insert title here</title>
</head>

<body onload="goDiary(${bean.nowyear},${bean.nowmonth },'${bean.pid }',${bean.nowday })">
	<table border="0" width="85%" align="center">
		<tr valign="top">
			<td colspan="3">
					<div><img src="../../../resources/menuimage/TopSerchTopBarOnly.png"></div>
			</td>
		</tr>

</table>
<table border="0" width="85%" align="center">
	<tr>
		<td width="50%">
			<div align="center" style="margin: 20px 20px 20px 20px;"><img width="300px" height="300px" src="../../../resources/menuimage/pentionimage/${bean.pentionResult.mainphoto }"></div>
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
<table border="0" width="85%" align="center">
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

<table border="0" width="85%" align="center">

	<tr>
		<td><div id="detailBoard"><a href="javascript:;" onclick="detailBoard('${bean.pid}',${bean.dPage })"><img border="0" style="margin-bottom: 50px;" src="../../../resources/menuimage/DetailContentBar.png"></a></div></td>
	</tr>

</table>

<table border="0" width="85%" align="center">

	<tr>
		<td><div id="mapTopbar"></div></td>
	</tr>
	<tr>
		<td><div  id="map-canvas" style="margin-bottom:100px; width: 100%; height: 340px" title="${bean.pentionResult.pentionName }"><a href="javascript:;" onclick="initialize('${bean.pentionResult.address1}','${bean.pentionResult.address2}')"><img border="0" style="margin-bottom: 50px;" src="../../../resources/menuimage/MapDetailBoardTopBar.jpg"></a></div></td>
	</tr>

</table>



</body>


</html>