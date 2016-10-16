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
	<c:choose>
		<c:when test="${bean.pentionResult.size()==0 or bean.pentionResult == null }">
			<table border="0" width="100%" align="center">
				<tr>
					<td><img src="../../../resources/menuimage/GoldBestTopBarOnly.png"></td>
				</tr>
				<tr>
					<td><img src="../../../resources/menuimage/DiaGrade.jpg"></td>
				</tr>
				<tr>
					<td align="center"><img src="../../../resources/menuimage/noSerchMyChuchunPention.jpg"></td>
				</tr>
				<tr>
					<td><img src="../../../resources/menuimage/jakdegiLong.png"></td>
				</tr>
				
				
				
				<tr>
					<td><img src="../../../resources/menuimage/PlatinumGrade.jpg"></td>
				</tr>
				<tr>
					<td align="center"><img src="../../../resources/menuimage/noSerchMyChuchunPention.jpg"></td>
				</tr>
				<tr>
					<td><img src="../../../resources/menuimage/jakdegiLong.png"></td>
				</tr>
				
			
				<tr>
					<td><img src="../../../resources/menuimage/GoldGrade.jpg"></td>
				</tr>
				<tr>
					<td align="center"><img src="../../../resources/menuimage/noSerchMyChuchunPention.jpg"></td>
				</tr>
				<tr>
					<td><img src="../../../resources/menuimage/jakdegiLong.png"></td>
				</tr>
				
			</table>
		</c:when>
		
		
		
		
		
		
		<c:when test="${bean.pentionResult.size() > 0 and bean.pentionResult.size() <= 6 }">
			<table border="0" width="100%" align="center">
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/GoldBestTopBarOnly.png"></td>
				</tr>
				<tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr>
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/DiaGrade.jpg"></td>
				</tr>
				<tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr>
				
				
				<c:forEach items="${bean.pentionResult }" var="list" varStatus="i">
						<td width="33%" align="center">
							<a href="#" onclick="chuchunDetailGo('${list.pid }')"><img border="0" width="240px" height="240px" src="../../../${bean.resource }pentionimage/${list.mainphoto }"></a><br><br>
							<a href="#" onclick="chuchunDetailGo('${list.pid }')" style="text-decoration: none;" ><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">${list.pentionName }</font><br><font color="#510000" face="dothum" style="font-size:8pt;">[${list.address1 }]</font></a> 
							
							<c:if test="${(i.index+1 % 3) %3 == 0}">
								</tr><tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr><tr>
							</c:if>
						</td>
					</c:forEach>
					
					<c:if test="${bean.pentionResult.size() < 3 and bean.pentionResult.size()!=0 }">
						<c:forEach begin="0" end="${bean.pentionResult.size() }">
							<td width="33%"></td>
						</c:forEach>
					</c:if>
				
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/PlatinumGrade.jpg"></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><img src="../../../resources/menuimage/noSerchMyChuchunPention.jpg"></td>
				</tr>
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/jakdegiLong.png"></td>
				</tr>
				
				
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/GoldGrade.jpg"></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><img src="../../../resources/menuimage/noSerchMyChuchunPention.jpg"></td>
				</tr>
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/jakdegiLong.png"></td>
				</tr>
				
			</table>
		</c:when>
		
		
		
		
		
		<c:when test="${bean.pentionResult.size() > 6 and bean.pentionResult.size() <= 15 }">
			<table border="0" width="100%" align="center">
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/GoldBestTopBarOnly.png"></td>
				</tr>
				<tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr>
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/DiaGrade.jpg"></td>
				</tr>
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/jakdegiLong.png"></td>
				</tr>
				<tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr>
			
			
				<c:forEach items="${bean.pentionResult }" var="list" varStatus="i">
					<c:choose>
						<c:when test="${i.index+1 <= 6 }">
							<td width="33%" align="center">
										<a href="#" onclick="chuchunDetailGo('${list.pid }')"><img border="0" width="240px" height="240px" src="../../../${bean.resource }pentionimage/${list.mainphoto }"></a><br><br>
										<a href="#" onclick="chuchunDetailGo('${list.pid }')" style="text-decoration: none;" ><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">${list.pentionName }</font><br><font color="#510000" face="dothum" style="font-size:8pt;">[${list.address1 }]</font></a> 
									
									<c:if test="${(i.index+1 % 3) %3 == 0}">
										</tr><tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr><tr>
									</c:if>
								
									<c:if test="${bean.pentionResult.size() < 3 and bean.pentionResult.size()!=0 }">
									<c:forEach begin="0" end="${bean.pentionResult.size() }">
										<td width="33%"></td>
									</c:forEach>
								</c:if>
							</td>
						</c:when>
						
						
						
						<c:when test="${i.index+1 > 6 and i.index+1 <=15 }">
						
 						<c:if test="${i.index+1==7 }">
							<tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr>
							<tr>
								<td colspan="3"><img src="../../../resources/menuimage/PlatinumGrade.jpg"></td>
							</tr>
							<tr>
								<td colspan="3"><img src="../../../resources/menuimage/jakdegiLong.png"></td>
							</tr>
							<tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr>
						</c:if> 


							<td width="33%" align="center">
										<a href="#" onclick="chuchunDetailGo('${list.pid }')"><img border="0" width="240px" height="240px" src="../../../${bean.resource }pentionimage/${list.mainphoto }"></a><br><br>
										<a href="#" onclick="chuchunDetailGo('${list.pid }')" style="text-decoration: none;" ><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">${list.pentionName }</font><br><font color="#510000" face="dothum" style="font-size:8pt;">[${list.address1 }]</font></a> 
									
									<c:if test="${(i.index+1 % 3) %3 == 0}">
										</tr><tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr><tr>
									</c:if>
								
									<c:if test="${bean.pentionResult.size() < 3 and bean.pentionResult.size()!=0 }">
									<c:forEach begin="0" end="${bean.pentionResult.size() }">
										<td width="33%"></td>
									</c:forEach>
								</c:if>
							</td>
						</c:when>
						
						<c:otherwise>
							<tr>
								<td colspan="3"><img src="../../../resources/menuimage/GoldGrade.jpg"></td>
							</tr>
							<tr>
								<td colspan="3" align="center"><img src="../../../resources/menuimage/noSerchMyChuchunPention.jpg"></td>
							</tr>
							<tr>
								<td colspan="3"><img src="../../../resources/menuimage/jakdegiLong.png"></td>
							</tr>
						</c:otherwise>		
					</c:choose>
						
					</c:forEach>
					
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/GoldGrade.jpg"></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><img src="../../../resources/menuimage/noSerchMyChuchunPention.jpg"></td>
				</tr>
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/jakdegiLong.png"></td>
				</tr>
				
			</table>
		</c:when>
		
		
		
		
		<c:otherwise>
			<table border="0" width="100%" align="center">
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/GoldBestTopBarOnly.png"></td>
				</tr>
				<tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr>
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/DiaGrade.jpg"></td>
				</tr>
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/jakdegiLong.png"></td>
				</tr>
				<tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr>
			
			
				<c:forEach items="${bean.pentionResult }" var="list" varStatus="i">
					<c:choose>
						<c:when test="${i.index+1 <= 6 }">
							<td width="33%" align="center">
										<a href="#" onclick="chuchunDetailGo('${list.pid }')"><img border="0" width="240px" height="240px" src="../../../${bean.resource }pentionimage/${list.mainphoto }"></a><br><br>
										<a href="#" onclick="chuchunDetailGo('${list.pid }')" style="text-decoration: none;" ><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">${list.pentionName }</font><br><font color="#510000" face="dothum" style="font-size:8pt;">[${list.address1 }]</font></a> 
									
									<c:if test="${(i.index+1 % 3) %3 == 0}">
										</tr><tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr><tr>
									</c:if>
								
									<c:if test="${bean.pentionResult.size() < 3 and bean.pentionResult.size()!=0 }">
									<c:forEach begin="0" end="${bean.pentionResult.size() }">
										<td width="33%"></td>
									</c:forEach>
								</c:if>
							</td>
						</c:when>
						
						
						
					<c:when test="${i.index+1 > 6 and i.index+1 <=15 }">
						
 						<c:if test="${i.index+1==7 }">
							<tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr>
							<tr>
								<td colspan="3"><img src="../../../resources/menuimage/PlatinumGrade.jpg"></td>
							</tr>
							<tr>
								<td colspan="3"><img src="../../../resources/menuimage/jakdegiLong.png"></td>
							</tr>
							<tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr>
						</c:if> 


							<td width="33%" align="center">
										<a href="#" onclick="chuchunDetailGo('${list.pid }')"><img border="0" width="240px" height="240px" src="../../../${bean.resource }pentionimage/${list.mainphoto }"></a><br><br>
										<a href="#" onclick="chuchunDetailGo('${list.pid }')" style="text-decoration: none;" ><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">${list.pentionName }</font><br><font color="#510000" face="dothum" style="font-size:8pt;">[${list.address1 }]</font></a> 
									
									<c:if test="${(i.index+1 % 3) %3 == 0}">
										</tr><tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr><tr>
									</c:if>
								
									<c:if test="${bean.pentionResult.size() < 3 and bean.pentionResult.size()!=0 }">
									<c:forEach begin="0" end="${bean.pentionResult.size() }">
										<td width="33%"></td>
									</c:forEach>
								</c:if>
							</td>
						</c:when>
						
						<c:when test="${i.index+1 > 15 and i.index+1 <=24 }">
						
 						<c:if test="${i.index+1==16 }">
							<tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr>
							<tr>
								<td colspan="3"><img src="../../../resources/menuimage/GoldGrade.jpg"></td>
							</tr>
							<tr>
								<td colspan="3"><img src="../../../resources/menuimage/jakdegiLong.png"></td>
							</tr>
							<tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr>
						</c:if> 


							<td width="33%" align="center">
										<a href="#" onclick="chuchunDetailGo('${list.pid }')"><img border="0" width="240px" height="240px" src="../../../${bean.resource }pentionimage/${list.mainphoto }"></a><br><br>
										<a href="#" onclick="chuchunDetailGo('${list.pid }')" style="text-decoration: none;" ><font color="#510000" face="dothum" style="font-weight:bold; font-size:10pt;">${list.pentionName }</font><br><font color="#510000" face="dothum" style="font-size:8pt;">[${list.address1 }]</font></a> 
									
									<c:if test="${(i.index+1 % 3) %3 == 0}">
										</tr><tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr><tr>
									</c:if>
								
									<c:if test="${bean.pentionResult.size() < 3 and bean.pentionResult.size()!=0 }">
									<c:forEach begin="0" end="${bean.pentionResult.size() }">
										<td width="33%"></td>
									</c:forEach>
								</c:if>
							</td>
						</c:when>
					</c:choose>
						
					</c:forEach>
		
			</table>
			
			
		</c:otherwise>
	</c:choose>
</body>
</html>