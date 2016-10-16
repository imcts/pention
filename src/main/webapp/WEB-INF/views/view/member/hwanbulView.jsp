<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<img src="../../../resources/menuimage/hwanbulnaeyuk.jpg">
			</td>
		</tr>
		<tr>
			<td>
				<img src="../../../resources/menuimage/persentHwanBul.jpg">
			</td>
		</tr>
	</table>
	
	<table border="0" align="center" width="100%">
	<input type="hidden" name="milige">
		<tr>
			<td colspan="6">
				<img src="../../../resources/menuimage/hwanbulTopBars.jpg">
			</td>
		</tr>
		<tr align="center">
			<td width="10%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">${bean.hwanbulInfo.getStartdayFormat() }</font></td>
			<td width="20%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">${bean.hwanbulInfo.yeyakpentionName }</font></td>
			<td width="20%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">${bean.hwanbulInfo.yeyakroomname }</font></td>
			<td width="10%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">${bean.hwanbulInfo.hwanbulSusu }%</font></td>
			<td width="20%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">${bean.hwanbulInfo.getHwanbulMoneyFormat() }원</font></td>
			<td width="20%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">${bean.hwanbulInfo.getYeyakTotalMoney() }</font></td>	
		</tr>
		<tr>
			<td colspan="6">
				<a href="javascript:;" onclick="hwanbulUpdate(${bean.roomindex},${bean.milige },'${bean.hwanbulInfo.pid }')"><img border="0" src="../../../resources/menuimage/hwanBulButton.jpg"></a>
			</td>
		</tr>
	</table>
</body>
</html>