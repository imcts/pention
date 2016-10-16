<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<script type="text/javascript" src="../../../resources/js/json.js"></script>
<script type="text/javascript" src="../../../resources/js/function_all.js"></script>
<script type="text/javascript" src="../../../resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
<body>


<form name="form" method="post" enctype="multipart/form-data">
   <table border="0"  width="1024" align="center" >
<tr>
	<td>
      <!--내가 쓰는 변수들.   -->
      <input type="hidden" name="serviceKey">
      <input type="hidden" name="areaSerchKey">
      <input type="hidden" name="themaSerchKey">
      <input type="hidden" name="thameAreaKey">
      <input type="hidden" name="pid">
      <input type="hidden" name="yeyakInwon">
      <input type="hidden" name="yeyakTerm">
      <input type="hidden" name="yeyakMoney">
      <input type="hidden" name="yeyakDay">
      <input type="hidden" name="yeyakmin">
      <input type="hidden" name="yeyakAddMoney">
      <input type="hidden" name="yeyakid">
      <input type="hidden" name="yeyakroomname">
      <input type="hidden" name="yeyakpentionName">
      <input type="hidden" name="card">
      <input type="hidden" name="bank">
      <input type="hidden" name="roomindex">
   
      <!--추가한것들  -->
       	<input type="hidden" name="noticekey"  >
        <input type="hidden" name="ids" value="${bean.ids }">  
        <input type="hidden" name="boardKey" >
        <input type="hidden" name="userid" value="${bean.userid }">
        <input type="hidden" name="noticePage" value="${bean.noticePage }">
        <input type="hidden" name="qnaPage" value="${bean.qnaPage }">
        <input type="hidden" name="noplus" >
        <input type="hidden" name="chgrade">
        
               
      <!-- ////커뮤니티 템플레이트추가//////// --> 
 <!-- ////커뮤니티 템플레이트추가//////// --> 
       <input type="hidden" name="fuserid">
       <input type="hidden" name="fpage">
       <input type="hidden" name="fids">
       
       <!-- ////커뮤니티 템플레이트추가//////// -->
	</td>

</tr>
      
      
      <tr>
         <td width="100%" colspan="2" ><jsp:include page="inc/top.jsp"></jsp:include></td>
      </tr>
      
      <c:choose>
      <c:when test="${bean.menu=='area'  || bean.menu=='notice' }">
      
      <tr>
         <td width="13%" valign="top"><jsp:include page="inc/menu.jsp"></jsp:include></td>
         <td valign="top"><jsp:include page="view/${bean.menu }/${bean.main }.jsp"></jsp:include></td>
      </tr>
      </c:when>
      
      <c:otherwise>
      <tr>
         <td valign="top"><jsp:include page="view/${bean.menu }/${bean.main }.jsp"></jsp:include>
      </tr>
      </c:otherwise>
      </c:choose>
      
      <tr>
         <td align="center" colspan="5"><jsp:include page="inc/bottom.jsp"></jsp:include></td>
      </tr>
   </table>
</form>
</body>
</html>