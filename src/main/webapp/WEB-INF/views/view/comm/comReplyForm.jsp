<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%-- ${bean.fpage }  = 현재 페이지,
${bean.fstart } = 시작페이지,
${bean.fend } = 끝끝끝페이지,
${bean.fids } = 글번호,
${bean.fgid} = 그룹번호
 --%>
 

<table width="87%" align="center">
	<tr>
		<td colspan="3"><img src="../../../${bean.resource }/freeboard/freeboard.gif"></td>
	</tr>
	<tr>
		<td colspan="4"><img src="../../../${bean.resource }/freeboard/freetitle.jpg"></td>
	</tr>
	
	<tr>
		
		<td align="center"><input type="text" name="ftitle" maxlength="15" size="121"/></td>
	</tr> 
	
	<tr>
		<td colspan="3"><img src="../../../${bean.resource }/freeboard/freecontent.png"></td>
	</tr>
	<tr>
	    <td colspan="3">
             <textarea rows="10" name="fcontent"  style="width: 100%" ></textarea>               
        </td>	
	</tr>


    <tr align="center">
    	<!-- 작성완료작성완료작성완료작성완료작성완료작성완료작성완료작성완료작성완료 -->
    	<td colspan="3" align="right">
    		<a href="#" onclick="freeReplywrite(${bean.fids },'${logchk.id}',${bean.fpage })"><img src="../../../${bean.resource }/btn/complete.png"></a>
    		<a href="#" onclick="freelist(${bean.fpage})"><img src="../../../${bean.resource }/btn/list.jpg"></a>
    	</td>
    </tr>
    
	 
	
</table>

</body>
</html>