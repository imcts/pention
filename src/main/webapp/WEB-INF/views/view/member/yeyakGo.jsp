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
	<table border="0" align="center">
	<input type="hidden" name="cardCheck1" value="0">
	<input type="hidden" name="cardCheck2" value="0">
	<input type="hidden" name="cardCheck3" value="0">
	<input type="hidden" name="cardCheck4" value="0">
		<tr>
			<td align="center" colspan="7">
				<img style="width:100%;" src="../../../resources/menuimage/CashGogo.jpg">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="7">
				<img style="width:100%; height: 30px;" src="../../../resources/menuimage/yeyakGoBar11.png">
			</td>
		</tr>
		<tr align="center" height="30px">
			<td height="40px" width="20%"><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${bean.yeyakpentionName }</font></td>
			<td width="20%"><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${bean.yeyakroomname }</font></td>
			<td width="10%"><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${bean.yeyakDay }</font></td>
			<td><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${bean.yeyakTerm }박</font></td>
			<td><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${bean.yeyakInwon }명</font></td>
			<td><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${bean.yeyakOverInwon }명</font></td>
			<td><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${bean.getYeyakTotalMoney() }원</font></td>
		
		</tr>
		
		<tr>
			<td align="center" colspan="7">
				<img style="width:100%;height: 30px;" src="../../../resources/menuimage/yeyakGoBar2.png">
			</td>
		</tr>

		
		<tr align="center">
			<td height="40px" colspan="7">
				<div style="float: left; margin-left: 225px;"><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${logchk.name }</font></div>
				<div style="float: left; margin-left: 190px;"><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${logchk.email }</font></div>
				<div style="float: left; margin-left: 140px;"><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${logchk.tell }</font></div>
			</td>
		</tr>
		
		<tr>
			<td align="center" colspan="7">
				<img style="width:100%;" src="../../../resources/menuimage/hwanbulList.png">
			</td>
		</tr>
		
		
		<tr>
			<td align="center" colspan="7">
				<img style="width:100%;" src="../../../resources/menuimage/yeyakCard.png">
			</td>
		</tr>
	
		<tr align="center">
			<td colspan="7" width="10%"><div style="float: left; margin-top: 30px; margin-left: 40px;"><ct:selectCard/></div>
				<div style="width:150px;float: left; margin-left: 35px;"><input onkeyup="carcheck1()" maxlength="4" border="0" type="text" name="card1" style="width:150px;font-size: 15px; color: white; border:0; padding-left:10px; padding-top:10px; width:265px; height:60px; background-image: url('../../../${bean.resource }cardNumber.jpg'); background-repeat: no-repeat;"></div>
				<div style="width:150px;float: left; margin-left: 45px;"><input onkeyup="carcheck2()" maxlength="4" border="0" type="text" name="card2" style="width:150px;font-size: 15px; color: white; border:0; padding-left:10px; padding-top:10px; width:265px; height:60px; background-image: url('../../../${bean.resource }cardNumber.jpg'); background-repeat: no-repeat;"></div>
				<div style="width:150px;float: left; margin-left: 45px;"><input onkeyup="carcheck3()" maxlength="4" border="0" type="text" name="card3" style="width:150px;font-size: 15px; color: white; border:0; padding-left:10px; padding-top:10px; width:265px; height:60px; background-image: url('../../../${bean.resource }cardNumber.jpg'); background-repeat: no-repeat;"></div>
				<div style="width:150px;float: left; margin-left: 45px;"><input onkeyup="carcheck4()" maxlength="4" border="0" type="text" name="card4" style="width:150px;font-size: 15px; color: white; border:0; padding-left:10px; padding-top:10px; width:265px; height:60px; background-image: url('../../../${bean.resource }cardNumber.jpg'); background-repeat: no-repeat;"></div>				
			</td>
		</tr>
		
		
  
		<tr>
			<td colspan="7" align="center">
				<div  style="float: left; margin-left: 700px;"><a href="javascript:;" onclick="yeyakOk('${bean.pid}','${bean.yeyakroomname }','${bean.yeyakpentionName }','${bean.yeyakid }','${bean.yeyakMoney }','${bean.yeyakDay }','${bean.yeyakInwon }','${bean.yeyakTerm }')">
				<img src="../../../resources/menuimage/yeyakGylje.png"></a></div>
				<div  style="float: left; margin-left: 50px;"><a href="javascript:;" onclick="gotoMain()"><img src="../../../resources/menuimage/yeyakCancle.png"></a></div>			
			</td>
		</tr>
	</table>
</body>
</html>