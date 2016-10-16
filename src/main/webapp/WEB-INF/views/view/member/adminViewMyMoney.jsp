<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="cc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="0" width="100%">
		<input type="hidden" name="payYear">
		<input type="hidden" name="payMonth">
<tr>
	<td colspan="5">
		<img style="margin-left: 30px" src="../../../${bean.resource }/member/luckyStrike.jpg">
	</td>
</tr>
</table>



<c:choose>
<c:when test="${bean.memSuchList == null || bean.memSuchList.size()==0 ||bean.memSuchList eq 'null'}">
	
<table border="0" align="center" width="30%">

	 <tr>
	 	<td height="50px" colspan="3"><img border="0" src="../../../${bean.resource }nonoSerchResultAll.jpg"></td>
	 </tr>
	 <tr>
		<td><img border="0" src="../../../resources/menuimage/jakdagiya.jpg"></td>
	</tr>
</table>	

<table border="0" align="center" width="100%">
	<tr>
		<td align="center" width="60%">
			<div style="float: left; margin-left: 300px;"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">검색하실 년도 선택</font></div>
			<div style="float: left;margin-left: 20px;"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;"><cc:jungsanTag var="1">년</cc:jungsanTag></font></div>
		</td>
	</tr>
	<tr>
		<td colspan="6">
			<img border="0" src="../../../${bean.resource }notice/noticeboard_bar.jpg">
		</td>
	</tr>

	<tr>
		<td align="center">
			<div style="float: left; margin-left: 300px;"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">검색하실 월 선택</font></div>
			<div style="float: left;margin-left: 35px;"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;"><cc:jungsanTag var="2">월</cc:jungsanTag></font></div>
		</td>
	</tr>
	
	<tr>
		<td colspan="6">
			<img border="0" src="../../../${bean.resource }notice/noticeboard_bar.jpg">
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<a href="javascript:;" onclick="yse()"><img border="0" src="../../../${bean.resource }JungSanSerchButton.png"></a>
		</td>
	</tr>
	<tr>
		<td colspan="2" height="50px"></td>
	</tr>
</table>	
</c:when>




<c:otherwise>
	<table border="0" width="100%">
			<tr>
				<td colspan="6">
					<img border="0" src="../../../${bean.resource }JungSanTopBar1.gif">
				</td>
			</tr>
				<c:forEach items="${bean.memSuchList }" var="i" varStatus="no">
					<tr>
						<td align="center" width="12%">
							<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.getPayDayFormat() }</font>
						</td>
						<td align="center" width="20%">
							<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.saupid }</font>
						</td>
						<td align="center" width="20%">
							<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.ibglmoneyformat() }</font>
						</td>
						<td align="center" width="20%">
							<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.mymoneyformat() }</font>
						</td>
						<td  align="center" width="20%">
							<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;"> ${i.summoney()}</font>
						</td>
						
						<c:choose>
							<c:when test="${i.ibgmMoney == 0}">
								<td width="10%" align="center"><font color="#3059c2" face="dothum"  style="font-size:10pt; font-weight: bold;">경매매출</font></td>
							</c:when>
							<c:otherwise>
								<td width="10%" align="center"><font color="#bd710e" face="dothum"  style="font-size:10pt; font-weight: bold;">예약매출</font></td>
							</c:otherwise>
						</c:choose>	
							
					</tr>
					 <tr>
						<td colspan="6"><img border="0" src="../../../resources/menuimage/jakdagiya.jpg"></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4" align="center">
						<font color="red" face="dothum"  style="font-size:10pt; font-weight: bold;">당월 회사 매출 총액</font>
					</td>	
					<td align="center">
						<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${bean.summymoney() } 원</font>
					</td>
				</tr>
				 <tr>
					<td colspan="6"><img border="0" src="../../../resources/menuimage/jakdagiya.jpg"></td>
				</tr>
	</table>

<table border="0" align="center" width="100%">
	<tr>
		<td align="center" width="60%">
			<div style="float: left; margin-left: 300px;"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">검색하실 년도 선택</font></div>
			<div style="float: left;margin-left: 20px;"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;"><cc:jungsanTag var="1">년</cc:jungsanTag></font></div>
		</td>
	</tr>
	
	
	<tr>
		<td colspan="6">
			<img border="0" src="../../../${bean.resource }notice/noticeboard_bar.jpg">
		</td>
	</tr>

	<tr>
		<td align="center">
			<div style="float: left; margin-left: 300px;"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">검색하실 월 선택</font></div>
			<div style="float: left;margin-left: 35px;"><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;"><cc:jungsanTag var="2">월</cc:jungsanTag></font></div>
		</td>
	</tr>
	
	<tr>
		<td colspan="6">
			<img border="0" src="../../../${bean.resource }notice/noticeboard_bar.jpg">
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<a href="javascript:;" onclick="yse()"><img border="0" src="../../../${bean.resource }JungSanSerchButton.png"></a>
		</td>
	</tr>
	<tr>
		<td colspan="2" height="50px"></td>
	</tr>
</table>
					
</c:otherwise>				
</c:choose>	

</body>
</html>