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
	<table border="0" align="center" width="100%">
	
			<tr>
				<td colspan="2">
					<img src="../../../resources/menuimage/MyPentionModifys.jpg">
				</td>
			</tr>
			<tr><td colspan="2" height="50px;"></td></tr>
			
			
			<tr>
				<td align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">펜션 이름 입력</font></td>
				<td align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;"><input type="text" name="pentionName" value="${bean.pentionResult.get(0).pentionName }"></font></td>
			</tr>
			<tr>
				<td colspan="3">
					<input name="idText" readonly="readonly" disabled="disabled" style=" width:500px; font-size:7pt; color: ${bean.color}; border: 0; background-color: white;"  value="${bean.idMsg }"  type="text"  onkeyup="testing()">
				</td>
			</tr>
			<tr>
				<td colspan="3"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			
			<tr>
				<td align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">펜션 대표사진</font></td>
				<td align="center" width="50%"><input type="file" id="mainfile" name=pentionPhoto></td>
			</tr>
			<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
		
		
			<tr>
				<td align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">주소 선택</font></td>
				<td align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;"><ct:choiceAddress address1="${bean.pentionResult.get(0).address1 }"/></font></td>
			</tr>
			<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			
			<tr>
				<td align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">상세 주소 입력</font></td>
				<td align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;"><input type="text" name="address2" value="${bean.pentionResult.get(0).address2}"></font></td>
			</tr>
			<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			
			
			
			<tr>
				<td align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">연락처</font></td>
				<td align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;"><input type="text" disabled="disabled" style="background-color: white;" name="tell" value="${logchk.tell }"></font></td>
			</tr>
			<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">테마 선택</font></td>
			</tr>
				<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">
					  <ct:themaChoice thema="${bean.pentionResult.get(0).thema }"/>
					</font>
				</td>
			</tr>
			<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">옵션 선택</font></td>
			</tr>
				<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">
					  <ct:choiceOption option="${bean.pentionResult.get(0).getThemaOptionTag() }"/>
					</font>
				</td>
			</tr>
			<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			
			<tr>
				<td align="center" width="50%"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">펜션 소개글</font></td>
				<td align="center" width="50%">
					<font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">
						<textarea style="width:400px;"  rows="20" cols="15" name="content"><ct:repace3 var="${bean.pentionResult.get(0).pcontent }"/></textarea>
					</font>
				</td>
			</tr>
			<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">주변 사진 등록</font></td>
			</tr>
			
			<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			
			
			<tr>
				<td align="center" colspan="2">
					<input type="file" id="areafile1" name="pentionPhoto">
					<input type="file" id="areafile2" name="pentionPhoto">
					<input type="file" id="areafile3" name="pentionPhoto">
					<input type="file" id="areafile4" name="pentionPhoto">
					<input type="file" id="areafile5" name="pentionPhoto">
				</td>	
			</tr>
				<tr>
				<td colspan="2"><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			
			
			<tr>
				<td align="right" height="80px" colspan="2">
					<a href="javascript:;" onclick="updatePentionAll()"><img  border="0"  src="../../../resources/menuimage/pentionInputButton.png"></a>
				</td>
			</tr>
			
			<tr>
				<td height="100px;"></td>
			</tr>
			
	</table>	
</body>
</html>