<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="0" align="center" width="100%">
		<c:choose>
			<c:when test="${bean.pentionResult == 'null' || bean.pentionResult==null || bean.pentionResult.size()==0 }">
			<tr>
				<td>
					<img src="../../../resources/menuimage/gaipChuChunpentionS.jpg">
				</td>
			</tr>
			
			<tr>
				<td>
					<img src="../../../resources/menuimage/youpentionNONOhave.jpg">
				</td>
			</tr>
			<tr>
				<td><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			</c:when>
			
			
			
			
			<c:otherwise>
			<tr>
				<td>
					<img src="../../../resources/menuimage/gaipChuChunpentionS.jpg">
				</td>
			</tr>
			<tr><td height="5px;"></td></tr>
			<tr>
				<td><img src="../../../resources/menuimage/ChuChunpentionTopbar1.jpg"></td>
			</tr>
			
			<tr>
				<td><img src="../../../resources/menuimage/ChuChunpentionTopbar2.jpg"></td>
			</tr>
			<tr>
				<td><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			<tr>
				<td><img src="../../../resources/menuimage/ipchalMunGu.jpg"></td>
			</tr>
			<tr>
				<td><img src="../../../resources/menuimage/thisMonthMentEnd.png"></td>
			</tr>
			<tr>
				<td><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			<tr>
				<td>
					<div style="float: left;  margin: 7px 0 0 300px;"><font color="#510000" face="dothum" style="font-weight:bold; font-size:11pt;">입찰액 입력 : </font></div>
					<div style="float: left; margin-top:4px; margin-left: 10px;"><input type="text" name="serchMsg"></div>
					<div style="float: left; margin-left: 10px;"><a href="javascript:;" onclick="chuchunIpchal()"><img border="0" src="../../../resources/menuimage/ipchalhagiiii.jpg"></a></div>
				</td>
			</tr>
			<tr>
				<td><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
			<tr>
				<td><a href="javascript:;" onclick="chuchunIpChalList()"><img src="../../../resources/menuimage/ChuChunListLookat.jpg"></a></td>
			</tr>
			
			<tr><td height="50px;"></td></tr>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>