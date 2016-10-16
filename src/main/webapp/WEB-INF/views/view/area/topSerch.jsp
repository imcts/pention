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
	<c:when test="${ajaxbean.suggestResult.size()==0 || ajaxbean.suggestResult==null }">
		
	</c:when>
	
	
	<c:otherwise>
	<c:choose>
		<c:when test="${ajaxbean.suggestResult.size()>10}">
			<div align="left" style="padding-top:5px; padding-bottom:5px; position: absolute; border: solid; border-color:#b3b3b3; background : #8ec323; z-index:3;  width:285px;  height:180px; margin-top:10px; margin-left: 380px;"">
				<c:forEach items="${ajaxbean.suggestResult }" var="list" varStatus="i">
					<c:if test="${i.index<10 }">
						<font color="black" face="dothum" style="color:white; margin-left:10px; font-weight:bold; font-size:11pt;"><a href="javascript:;" style="text-decoration: none; color: white;" onclick="suggestSerch('${list }')">${list }</a><br></font>		
					</c:if>	
			</c:forEach>
			</div>
		</c:when>
		<c:otherwise>
			<div align="left" style="padding-top:5px; padding-bottom:5px; position: absolute; border: solid; border-color: #b3b3b3; background : #8ec323; z-index:3;  width:285px;  height: ${ajaxbean.suggestMsg}px; margin-top:10px; margin-left: 380px;"">
				<c:forEach items="${ajaxbean.suggestResult }" var="list" varStatus="i">
					<c:if test="${i.index<10 }">
						<font color="black" face="dothum" style="color:white; margin-left:10px; font-weight:bold; font-size:11pt;"><a  href="javascript:;" style="text-decoration: none; color: white;"  onclick="suggestSerch('${list }')">${list }</a><br></font>		
					</c:if>	
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
	
	
		
	
	
	
	</c:otherwise>
</c:choose>

	


</body>
</html>