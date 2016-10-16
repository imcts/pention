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
	
	<table border="0" width="100%">
	 <tr>
		<td width="100%" colspan="6"><img src="../../../resources/menuimage/AreaRoomName.png"></td>
	</tr> 
			<c:forEach items="${ajaxbean.roomInfo }" var="room">		
				<tr align="center">
						<td width="210px" align="center">
							<div><a href="javascript:;" onclick="allYeyakload('${room.pid}','${room.roomname }',${ajaxbean.choiceYear },${ajaxbean.choiceMonth },${ajaxbean.choiceDay },'${room.money }')" style="text-decoration: none;"><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${room.roomname }</font></a></div>
						</td>
						<td width="50px">
						    <div style="float: left;"><a href="javascript:;" onclick="detainRoomPhotoPop('${room.pid }','${room.roomname }','${room.roomindex }','detainRoomPhoto')"><img border="0" src="../../../resources/menuimage/RoomVierGo.jpg"></a></div>						
						</td>
					
						<c:choose>
							<c:when test="${room.roomyeyak eq '예약완료' }">
								<td width="180px">
									<font color="red" face="dothum"   style="font-weight:bold; font-size:12pt;">${room.roomyeyak }</font>
								</td>
							</c:when>
							<c:otherwise>
								<td width="180px">
									<font color="72e890" face="dothum"   style="font-weight:bold; font-size:12pt;">${room.roomyeyak }</font>
								</td>
							</c:otherwise>
						</c:choose>
						<td width="70px"><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${room.min } / ${room.max }</font></td>
						<td width="55px"><font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${room.roomsize }평</font></td>
						<td>
							<font color="black" face="dothum"   style="font-weight:bold; font-size:12pt;">${room.yeyakAllRoomMoney() }원</font>
						</td>
						
				</tr>
				<tr>
					<td colspan="6" align="center"><img src="../../../resources/menuimage/roomAllViewBargray.jpg"></td>
				</tr>
			</c:forEach>
	</table>

</body>
</html>