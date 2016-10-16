<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<tr align="center">
		<c:forEach items="${bean.topList }" var="top">
			<td width="20%"><a href="../../${top.menukey }/${top.topkey}/${top.topservice }">
			<c:choose>
			<c:when test="${bean.menu eq top.menukey }">
				<img height="53" width="102%" src="../../../${bean.resource }${top.menukey }c.gif" border="0">
			</c:when>
			<c:otherwise>
				<img height="53" width="102%" src="../../../${bean.resource }${top.menukey }.gif" border="0">
			</c:otherwise>
			</c:choose>
			</a></td>
		</c:forEach>
	</tr>
	

