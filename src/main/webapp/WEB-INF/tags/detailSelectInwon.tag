<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<select name="yeyakInwon">
	<c:choose>
		<c:when test="${ajaxbean.roomChoice == 0}">
			<option value="0">예약불가</option>
		</c:when>
	
		<c:otherwise>
			<c:forEach begin="${ajaxbean.min }" end="${ajaxbean.max }" varStatus="i">
				<option value="${i.index }">${i.index }명</option>
			</c:forEach>
		</c:otherwise>
	</c:choose>

</select>