<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="0" width="100%" >	
	<tr >
		<td align="center" colspan="2" >
			<div style="margin: 0 30px 70px 25px;">
				<img alt="" src="../../../${bean.resource }/member/Membermilige.png">
			</div>	
			
			<div style="margin: 0 15px 20px 35px; font-size: 30pt;color: red;" >
				${logchk.id } 
				<img alt="" src="../../../${bean.resource }/member/e.png">
				${bean.getPointformat() } 
				<img alt="" src="../../../${bean.resource }/member/kk.png">
			</div>
		</td>
		
	</tr>	
	<tr>
		<td height="50px"></td>
	</tr>
</table>
</body>
</html>