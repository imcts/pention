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
						<td colspan="7"><img src="../../../resources/menuimage/MyPentionRoomModify.png"></td>
					</tr>
			<tr>
				<td align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; color:red; font-size:8pt;">방 이름은 수정이 불가능합니다.</font></td>
				<td align="center" width="30%%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;"><input readonly="readonly" style="border:0; background-color: white;" size="30px;" type="text" name="roomname" value=${bean.roomname }></font></td>
				
			</tr>
			
			<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
	</table>
	<table border="0" align="center" width="100%">		
			
			<tr>
				<td height="8px;" align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">최대 인원 입력</font></td>
				<td height="8px;" align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">최소 인원 입력</font></td>
				<td height="8px;" align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">방 사이즈 입력</font></td>
			</tr>
			<tr>
				<td colspan="3"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			
			
			<tr>
				<td align="center" width="50%"><font color="#510000" face="dothum" style=" font-weight:bold; font-size:8pt;"><input size="3px;" type="text" id="max" name="max" value="${bean.roomResult.max }">명</font></td>
				<td align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;"><input size="3px;" type="text" id="min" name="min" value="${bean.roomResult.min }">명</font></td>
				<td align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;"><input size="3px;" type="text" name="roomsize" value="${bean.roomResult.roomsize }">평</font></td>
			</tr>
			<tr>
				<td colspan="3"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			
	</table>
	<table border="0" align="center" width="100%">
			<tr>
				<td height="8px;" align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">요금 (1박기준)</font></td>
				<td height="8px;" align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">추가요금(1인기준)</font></td>
			</tr>
			<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			<tr>
				<td align="center" width="50%"><font color="#510000" face="dothum" style=" font-weight:bold; font-size:8pt;"><input  type="text" name="money" value="${bean.roomResult.money }">원</font></td>
				<td align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;"><input  type="text" name="addmoney" value="${bean.roomResult.addmoney }">원</font></td>
			</tr>
			<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			<tr>
				<td colspan="2" height="8px;" align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">객실 사진 등록</font></td>
			</tr>
			
			<tr>
				<td align="center" colspan="2">
					<input type="file" id="roomfile1" name="pentionPhoto">
					<input type="file" id="roomfile2" name="pentionPhoto">
					<input type="file" id="roomfile3" name="pentionPhoto">
					<input type="file" id="roomfile4" name="pentionPhoto">
					<input type="file" id="roomfile5" name="pentionPhoto">
				</td>	
			</tr>
			<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="javascript:;" onclick="updatePentionRoom(${bean.roomindex})"><img src="../../../resources/menuimage/modifyBoutton.png"></a>
					<a href="javascript:;" onclick="returnPentionG()"><img border="0"  src="../../../resources/menuimage/cancleModifyForm.png"></a>
				</td>
			</tr>
			
	</table>
</body>
</html>