<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="ct" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" name="roomname">
<input type="hidden" name="roomsize">
<input type="hidden" name="max">
<input type="hidden" name="min">
<input type="hidden" name="pentionName">
	<c:choose>
		<c:when test="${bean.pentionResult == 'null' || bean.pentionResult==null || bean.pentionResult.size()==0 }">
			
		<table border="0" align="center" width="100%" >
			<tr>
				<td>
					<img src="../../../resources/menuimage/PentionHaveLook.jpg">
				</td>
			</tr>
			<tr>
				<td>
					<img src="../../../resources/menuimage/youpentionNONOhave.jpg">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="80px">
					<a href="javascript:;" onclick="goToPentionForm()"><img  border="0"  src="../../../resources/menuimage/pentionInputButton.png"></a>
				</td>
			</tr>
			
			<tr>
				<td height="100px;"></td>
			</tr>
			
		</table>
		</c:when>
		
		
		
		
		<c:otherwise>
			
		<table border="0" align="center" width="100%" >
			<tr>
				<td>
					<img src="../../../resources/menuimage/PentionHaveLook.jpg">
				</td>
			</tr>
			<tr>
				<td>
					<img src="../../../resources/menuimage/pentionTopBarSa.png">
				</td>
			</tr>
		</table>
			<table border="0" align="center" width="100%">
				<tr align="center">
					<td width="25%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${bean.pentionResult.get(0).pentionName }</font></td>
					<td width="40%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${bean.pentionResult.get(0).address1 } ${bean.pentionResult.get(0).address2 }</font></td>
					<td width="15%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${bean.pentionResult.get(0).ptell }</font></td>
					<td width="15%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${logchk.email }</font></td> 
				</tr>
				<tr>
					<td colspan="4" height="55px;" align="center"><a href="javascript:;" onclick="modifyMypention()"><img border="0" src="../../../resources/menuimage/ModifyMyPention.png"></a></td>
				</tr>
				
			</table>
				
					
					<c:choose>
					
					<c:when test="${bean.roomResult==null || bean.roomResult eq 'null' || bean.roomResult.size()==0 }"> <!-- 펜션방이 없다면 -->
					<table border="0" align="center" width="100%">
					<tr>
						<td colspan="7"><img src="../../../resources/menuimage/myPentionRoomGwanfi.png"></td>
					</tr>
					<tr>
						<td colspan="7"><img src="../../../resources/menuimage/MyPentionRoomTopBar.png"></td>
					</tr>
					<tr>
						<td><a href="javascript:;" onclick="makeRoomForm('${bean.pentionResult.get(0).pentionName}')"><img src="../../../resources/menuimage/AddRoomButton.png"></a></td>
					</tr>
						
					</table>
					</c:when>
					
					
					<c:otherwise>
					
					<table border="0" align="center" width="100%">
					<tr>
						<td colspan="7"><img src="../../../resources/menuimage/myPentionRoomGwanfi.png"></td>
					</tr>
					
					<tr>
						<td colspan="7"><img src="../../../resources/menuimage/MyPentionRoomTopBar.png"></td>
					</tr>
					
						<c:forEach items="${bean.roomResult }" var="list">
							<tr align="center">
								<td width="17%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.roomname }</font></td>
								<td width="6%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.max }명</font></td>
								<td width="6%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.min }명</font></td>
								<td width="6%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.roomsize }평</font></td>
								<td width="15%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.getMoneyMy() }원</font></td>
								<td width="15%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.getaddMoneyMy() }원</font></td>
								<td width="10%"><a href="javascript:;" onclick="pentionRoomModify('${list.roomname}','${list.roomsize }','${list.max }','${list.min }',${list.roomindex } )"><img src="../../../resources/menuimage/modifyBoutton.png"></a>
									<a href="javascript:;" onclick="deleteMyRoom(${list.roomindex})"><img src="../../../resources/menuimage/DeleteButtonS.jpg"></a>
								</td>
							</tr>
							<tr>
								<td colspan="7"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
							</tr>
						</c:forEach>
						<tr>
						<td colspan="7" align="center">
							<a href="javascript:;" onclick="makeRoomForm('${bean.pentionResult.get(0).pentionName}')"><img src="../../../resources/menuimage/AddRoomButton.png"></a>
						</td>
					</tr>
					</table>
		
					<table border="0" align="center" width="100%">
					<tr>
						<td colspan="7">
							<img src="../../../resources/menuimage/yeyakMitKyulje1.png"></td>
					</tr>
					<tr>
						<td colspan="7">
							<img src="../../../resources/menuimage/yeyakGyuljeTopbar3.jpg">
						</td>
					</tr>
				
					
					<c:choose>
					<c:when test="${bean.yeyakInfo==null || bean.yeyakInfo.size()==0    }">
						<tr>
							<td colspan="7" align="center">
								<img src="../../../resources/menuimage/younoyeyaknogylje.jpg">
							</td>
						</tr>
						<tr>
							<td colspan="7"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
						</tr>
					</c:when>
					
					<c:otherwise>
						
					<c:forEach items="${bean.yeyakInfo }" var="list">
					<tr align="center">
						<td width="12%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:9pt;">${list.getStartdayFormat() }</font></td>
						<td width="25%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.userid }</font></td>
						<td width="25%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.yeyakroomname }</font></td>
						<td width="5%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.yeyakTerm }박</font></td>
						<td width="5%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.yeyakInwon }명</font></td>
						<td width="20%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.getYeyakTotalMoney() }원</font></td>
						
						<c:choose>
							<c:when test="${list.hwanbulMsg eq '예약완료'}">
								<td width="10%"><font color="#ffc000" face="dothum" style="font-weight:bold; font-size:11pt;">${list.hwanbulMsg }</font></td>
							</c:when>
							<c:otherwise>
								<td width="10%"><font color="red" face="dothum" style="font-weight:bold; font-size:11pt;">${list.hwanbulMsg }</font></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td colspan="7"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
					</tr>
					</c:forEach>
					</table>
					</c:otherwise>
				
						</c:choose>			
					</c:otherwise>
					</c:choose>
					
			</c:otherwise>
	</c:choose>



</body>
</html>