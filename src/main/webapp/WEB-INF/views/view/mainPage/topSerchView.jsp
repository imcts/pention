<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body onload="topserchstart()">
   <table border="0" align="center" width="60%">
   				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/TopSerchTopBarOnly.png"></td>
				</tr>
				<tr><td colspan="3"><img src="../../../${bean.resource }whitebar.gif" ></td></tr>
				
				<c:choose>
					<c:when test="${bean.pentionResult.size()==0 || bean.pentionResult==null }">
						<tr>
					<td colspan="3" align="center"><img src="../../../resources/menuimage/noSerchImage.jpg"></td>
				</tr>
					</c:when>
					
					
					<c:otherwise>
				<tr>
					<c:forEach items="${bean.pentionResult }" var="list" varStatus="i">
						<td width="33%" align="center">
							<a href="#" onclick="chuchunDetailGo('${list.pid }')"><img border="0" width="240px" height="240px" src="../../../${bean.resource }pentionimage/${list.mainphoto }"></a><br><br>
							<a href="#" onclick="chuchunDetailGo('${list.pid }')" style="text-decoration: none;" ><font color="#510000" face="dothum" style="font-weight:bold; font-size:8pt;">${list.pentionName }</font><br><font color="#510000" face="dothum" style="font-size:8pt;">[${list.address1 }]</font></a> 
							
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
			</tr>
					</c:otherwise>
				
				</c:choose>
				
				
				<tr>
					<td colspan="3"><img src="../../../resources/menuimage/iyongHoogiTopbarOnly.png"></td>
				</tr>
   </table>
   
   <table align="center">
      <div id="afterboardView"></div>
   </table>
</body>
</html>