<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<style type="text/css">
	.menu{
		float: left;
		margin: 10px 30px 10px 75px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table  width="100%" border="0">
	<tr>
		<td>
		
			<div class="menu"><a href="#" onclick="bottomMenu('info')"><img border="0" src="../../../${bean.resource }infoBottom.gif"></a></div>
			<div class="menu"><a href="#" onclick="bottomMenu('question')"><img  border="0"src="../../../${bean.resource }gamangBottom.gif"></a></div>
			<div class="menu"><a href="#" onclick="bottomMenu('question')"><img  border="0"src="../../../${bean.resource }gwanggoBottom.gif"></a></div>
			<div class="menu"><a href="#" onclick="bottomMenu('question')"><img  border="0"src="../../../${bean.resource }hompageBottom.gif"></a></div>			
			<!--얘네 둘은 팝업으로 처리.  -->
			<div class="menu"><a href="#" onclick="pop('yakgwanBottom')"><img  border="0"src="../../../${bean.resource }yakgwanBottom.gif"></a></div>
			<div class="menu"><a href="#" onclick="pop('infomationService')"><img  border="0"src="../../../${bean.resource }selfinfoBottom.gif"></a></div>
		
		</td>
		
	</tr>
	
	<tr>
		<td width="100%"><img width="100%" border="0" src="../../../${bean.resource }bottom.png"></td>
	</tr>
</table>
</body>
</html>