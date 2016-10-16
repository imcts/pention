<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<select name="yeyakTerm">
	<c:choose>
		<c:when test="${ajaxbean.roomChoice == 0}">
			<option value="0">예약불가</option>
		</c:when>
		<c:otherwise>
			<c:forEach begin="1" end="${ajaxbean.roomChoice }" var="i" varStatus="index">
				<option value="${index.index }">${index.index }박</option>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</select>

