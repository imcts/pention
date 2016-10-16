<%@tag import="com.model.DataBean"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${logchk.grade<4 }">
	<tr align="right">
		<td colspan="5">
			<a href="../../member/mainView/logOut"><img border="0" src="../../../${bean.resource }LogOutTop.gif"></a>&nbsp;&nbsp;
			<a href="../../member/myPageView/myPage"><img border="0" src="../../../${bean.resource }MyPageTop.gif"></a>
		</td>
	</tr>
	</c:when>
	
	<c:otherwise>
	<tr align="right">
		<td colspan="5">
			<a href="../../member/loginView/login"><img border="0" src="../../../${bean.resource }loginTop.gif"></a>&nbsp;&nbsp;
			<a href="../../member/yakgwanView/yakgwan"><img border="0" src="../../../${bean.resource }newMemberTop.gif"></a>
		</td>
	</tr>
	</c:otherwise>
</c:choose>