<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<table width="100%" border="0">

		<ct:top_logChk/>
		
		 <tr>
			<td colspan="5">
					<div style="margin:10px 10px 20px 240px; float:left; ">
						<a href="#" onclick="mainLogo()"><img size="100%" border="0"  src="../../../${bean.resource }topLogo.gif"></a>
					</div>
					<div style="float:left; margin-top:40px; margin-right: 15px; margin-left: 10px;">
						<input border="0" type="text" name="topSerch" maxlength="13" value="펜션 / 지역만 검색됩니다." onkeyup="suggestingLoad()" onfocus="serchClear(this)" style="background-image: url('../../../${bean.resource }serchbar.gif'); background-repeat: no-repeat;  height: 35px; border: 0; padding-left: 10px; width: 285px; color:#ffffff;" >
					</div>
					<div style="margin-top: 40px;"><a href="#"  onclick="topSerch('topSerch')"><img border="0" src="../../../${bean.resource }serchButton.gif"></a></div>
					<div id="suggestTop"></div>
			</td>
		</tr>
		
	
		
		<ct:topmenu/>
	
		
	</table>
</body>
</html>