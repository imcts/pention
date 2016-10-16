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

	<c:choose>
		<c:when test="${ajaxbean.mainPageList.size()==0 || ajaxbean.mainPageList==null }">
			<table border="0" align="center" width="100%">
				
				<tr>
					<td><img src="../../../resources/menuimage/BESTOFBEST.jpg">
					</td>
				</tr>
				
				<tr>
					<td align="center">
						<img src="../../../resources/menuimage/noSerchImage.jpg">
					</td>
				</tr>
			</table>
		</c:when>
	
		<c:otherwise>
			<table border="0" width="100%" aling="center">
			
				<tr>
					<td><img src="../../../resources/menuimage/BESTOFBEST.jpg">
					</td>
				</tr>
				
				<tr>
					<td>
						<div onclick="mainPageDetail('${ajaxbean.mainPageOne.pid}')" style=" position: absolute; z-index: 3; padding-left:40px;  margin: 0 0 0 0; background-repeat:no-repeat; background-image:url('../../../resources/menuimage/mainPageDiaBack1.png'); opacity:0.8; width: 200px; height: 300px;">
							<br><br><br><br><br>
							<a style="text-decoration: none;" href="javascript:;" onclick="mainPageDetail('${ajaxbean.mainPageOne.pid}')"><font color="white" face="dothum"  style=" z-index:4;  font-size:9pt; font-weight: bold;">${ajaxbean.mainPageOne.address1 }</font></a>
							<a style="text-decoration: none;" href="javascript:;" onclick="mainPageDetail('${ajaxbean.mainPageOne.pid}')"><font color="#94caf6" face="굴림"  style="z-index:4; font-size:15pt; font-weight: bold;">
							<br><br>
							${ajaxbean.mainPageOne.pentionName }
							<br><br><br>
							</font></a>
							<a  style="text-decoration: none;" href="javascript:;" onclick="mainPageDetail('${ajaxbean.mainPageOne.pid}')"><font color="white" face="dothum"  style="z-index:4; font-size:8pt; font-weight: bold;">tell : ${ajaxbean.mainPageOne.ptell }</font></a>
						</div>
						<a href="javascript:;" onclick="mainPageDetail('${ajaxbean.mainPageOne.pid}')"><img border="0" style=" z-index:1; width: 800px; height: 300px;" src="../../../resources/menuimage/pentionimage/${ajaxbean.mainPageOne.mainphoto }"></a>
					</td>
					
					
					<td>
						<table border="0" width="100%" height="100%" align="center">
						<tr>
							<c:forEach items="${ajaxbean.mainPageList }" var="list" varStatus="i">
									<c:choose>
										<c:when test="${ajaxbean.mainPageOne.chuchunRank == list.chuchunRank || ajaxbean.mainPageOne.chuchunRank eq list.chuchunRank}">
											<td>
												<a href="javascript:;" onclick="mainPageChoice(${list.chuchunRank})"><img  border="0" style=" width: 100px; height: 97px;" src="../../../resources/menuimage/pentionimage/${list.mainphoto }"></a>
											</td>
										</c:when>
									
										<c:otherwise>
											<td>
												<a href="javascript:;" onclick="mainPageChoice(${list.chuchunRank})"><img  border="0" style="width: 100px; height: 97px; opacity:0.5;" src="../../../resources/menuimage/pentionimage/${list.mainphoto }"></a>
											</td>
										</c:otherwise>
										
									</c:choose>
									
										<c:if test="${(i.index+1) % 2 ==0 }">
												</tr><tr>									
										</c:if>
							</c:forEach>
							<c:if test="${ajaxbean.mainPageList.size() !=6 }">	
							<c:forEach begin="0" end="${5 - ajaxbean.mainPageList.size() }" varStatus="i">
									<td width="100px;" height="97px;"></td>
									<c:if test="${(i.index+1) % 2 ==0 }">
												</tr><tr>									
									</c:if>
							</c:forEach>
							</c:if>
						</tr>
						
						</table>
					</td>	
				</tr>
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/whitebar.gif"></td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>