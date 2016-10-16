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

<table border="0" align="center" width="100%">
	
	<tr>
		<td><input type="hidden" name="idup"></td>
	</tr>
	<tr> 
		<td colspan="6">
			<img  src="../../../${bean.resource }/member/selectup.png">
		</td>
	</tr>
	<c:choose>
				
		<c:when test="${bean.memSuchList == null || bean.memSuchList.size()==0 }">
			<tr>
				<td> 
					 <img  src="../../../${bean.resource }/member/noplz.jpg">
				</td>
			</tr>
			<tr>
				<td><img src="../../../resources/menuimage/jakdagiya.jpg"></td>
			</tr>
		</c:when>
		<c:otherwise>
	
	<tr>
		<td colspan="6">
			<img  src="../../../${bean.resource }/member/selectbaba.jpg">
		
		</td>
	
	
	</tr>
				
				<c:forEach items="${bean.memSuchList }" var="i" >
				
							<tr>
								<td align="center" width="37px">
									<img  src="../../../${bean.resource }/member/userok.jpg">
										
								</td>
								
								
								<td align="center" width="178px">
									<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.id }</font>
								</td>
								
								<td align="center" width="155px">
									<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.name }</font>
								</td>
								
								<td align="center" width="171px">
									<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.email }</font>
								</td>
								
								<td align="center" width="140px">
									<font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i.tell }</font>
								</td>	
								
								<td align="center" width="100px">
									<a href="#" onclick="saupjaUp('${i.id}')">
										<img  src="../../../${bean.resource }/member/yes.jpg">
					
									</a>
									
								</td>
								
								
								
							</tr>
							<tr>
								<td colspan="6">
									<img border="0" src="../../../${bean.resource }notice/noticeboard_bar.jpg">
								</td>
							</tr>
							
				</c:forEach>
		
		
		
		</c:otherwise>	
	
	</c:choose>
	
	<tr>
		<td height="60px"></td>
	
	</tr>
</table>
</body>
</html>