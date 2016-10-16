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
	<table border="0" align="center">
	
	<c:choose>
		<c:when test="${bean.service eq 'idserchForm' }">
	<tr>
		<td>
			<input type="hidden" name="nameIndex" value="${bean.nameIndex }">
			<input type="hidden" name="emailIndex" value="${bean.emailIndex }">
			<input type="hidden" name="emailNumberIndex" value="${bean.emailNumberIndex }">
		<td>
	</tr>
				
		<td>
			<div style="margin: 20px 0 10px 70px;"><img alt="" src="../../../${bean.resource }idFindTop.png"></div>
			<div style="margin: 5px 0 60px 70px;"><img alt="" src="../../../${bean.resource }SerchMent.png"></div>
		</td>
		
		<tr>
		
			<td>
				
				<div style="margin: 0 0 0 365px;" ><input maxlength="5" onkeyup="newMemberName()" border="0" type="text" name="name" value="${bean.name }" style="border:0; padding-left:10px; padding-top:5px; width:265px; height:60px; background-image: url('../../../${bean.resource }membershipName.gif'); background-repeat: no-repeat;"></div>
				<div style="margin: 0 0 15px 370px;"><input name="nameText" readonly="readonly" disabled="disabled" style="width:500px; font-size:7pt; color:red; border: 0; background-color: white;"  value=""  type="text"  onkeyup="testing()"></div>
				
				
				<div style="margin: 0 0 0 365px;" ><input onkeyup="newMemberEmail()" border="0" type="text" name="email" value="${bean.email }" style="float:left; border:0; padding-left:10px; padding-top:5px; width:265px; height:60px; background-image: url('../../../${bean.resource }membershipMail.gif'); background-repeat: no-repeat;"></div>
				<div style="margin: 35px 0 0 50px;"><a href="#" onclick="idFindEmailGo()"><img border="0" src="../../../${bean.resource }MemberShipEmail.jpg"></a></div>
				<div style="margin: 0 0 15px 370px;"><input name="emailText" readonly="readonly" disabled="disabled" style="width:500px;font-size:7pt; color:red; border: 0; background-color: white;"  value=""  type="text"  onkeyup="testing()"></div>
			
				<div style="margin: 0 0 0 365px;" ><input border="0" type="text" name="emailNumber" value="" style="float:left; border:0; padding-left:10px; padding-top:5px; width:265px; height:60px; background-image: url('../../../${bean.resource }membershipEmailNumber.jpg'); background-repeat: no-repeat;"></div>
				<div style="margin: 35px 0 0 50px;"><a href="#" onclick="newMemberEmailNumber()"><img border="0" src="../../../${bean.resource }membershipConf.gif"></a></div>
				<div style="margin: 0 0 15px 370px;"><input name="emailNumberText" readonly="readonly" disabled="disabled" style="width:500px;font-size:7pt; color:red; border: 0; background-color: white;"  value=""  type="text"  onkeyup="testing()"></div>
			</td>
		</tr>	
		
	
				
		<tr>
			<td align="center">
				<div style="margin: 8px 10px 0 400px; float: left;"><a href="#" onclick="findId()"><img border="0" src="../../../${bean.resource }membershipConf.gif"></a></div>
				<div style="margin: 6px 10px 5px 20px; float: left"><a href="#" onclick="gotoMain()"><img border="0" src="../../../${bean.resource }membershipCancle.gif"></a></div>
			</td>
		</tr>
			<tr>
			<td>
				<div style="float: left; margin: 30px 20px 0px 380px"><img border="0" src="../../../resources/menuimage/dotbogi.gif"></div>
				<div style="float: left; margin: 30px 35px 0px 0"><a href="../../member/infoSerchForm/pwserchForm"><img border="0" src="../../../resources/menuimage/findpw.gif"></a></div>
				<div style="float: left; margin-top: 30px;"><a href="../../member/yakgwanView/yakgwan"><img border="0" src="../../../resources/menuimage/newmember.gif"></a></div>
			</td>
		</tr>	
		</c:when>
		
		
		
		
		
		<c:when test="${bean.service eq 'pwserchForm' }">
	<tr>
		<td>
			<input type="hidden" name="idIndex" value="${bean.idIndex }">
			<input type="hidden" name="emailIndex" value="${bean.emailIndex }">
			<input type="hidden" name="emailNumberIndex" value="${bean.emailNumberIndex }">
		<td>
	</tr>
		
			<td>
				<div style="margin: 20px 0 10px 70px;"><img alt="" src="../../../${bean.resource }pwFindTop.png"></div>
				<div style="margin: 5px 0 60px 70px;"><img alt="" src="../../../${bean.resource }SerchMent.png"></div>
			</td> 
		<tr>
			<td>
				<div style="margin: 0 0 0 365px;"><input maxlength="8" value="${bean.id }" onkeyup="newMemberID()" border="0" type="text" name="id" value="" style="float:left; border:0; padding-left:10px; padding-top:5px; width:265px; height:60px; background-image: url('../../../${bean.resource }membershipID.gif'); background-repeat: no-repeat;"></div>					
				<div style="margin: 0 0 15px 370px;"><input name="idText" readonly="readonly" disabled="disabled" style=" width:500px; font-size:7pt; color: ${bean.color}; border: 0; background-color: white;"  value="${bean.idMsg }"  type="text"  onkeyup="testing()"></div>
				
				
				<div style="margin: 0 0 0 365px;" ><input onkeyup="newMemberEmail()" border="0" type="text" name="email" value="${bean.email }" style="float:left; border:0; padding-left:10px; padding-top:5px; width:265px; height:60px; background-image: url('../../../${bean.resource }membershipMail.gif'); background-repeat: no-repeat;"></div>
				<div style="margin: 35px 0 0 50px;"><a href="#" onclick="pwFindEmailGo()"><img border="0" src="../../../${bean.resource }MemberShipEmail.jpg"></a></div>
				<div style="margin: 0 0 15px 370px;"><input name="emailText" readonly="readonly" disabled="disabled" style="width:500px;font-size:7pt; color:red; border: 0; background-color: white;"  value=""  type="text"  onkeyup="testing()"></div>
			
				<div style="margin: 0 0 0 365px;" ><input border="0" type="text" name="emailNumber" value="" style="float:left; border:0; padding-left:10px; padding-top:5px; width:265px; height:60px; background-image: url('../../../${bean.resource }membershipEmailNumber.jpg'); background-repeat: no-repeat;"></div>
				<div style="margin: 35px 0 0 50px;"><a href="#" onclick="newMemberEmailNumber()"><img border="0" src="../../../${bean.resource }membershipConf.gif"></a></div>
				<div style="margin: 0 0 15px 370px;"><input name="emailNumberText" readonly="readonly" disabled="disabled" style="width:500px;font-size:7pt; color:red; border: 0; background-color: white;"  value=""  type="text"  onkeyup="testing()"></div>
			</td>
		</tr>		
		
	
				
		<tr>
			<td align="center">
				<div style="margin: 8px 10px 0 400px; float: left;"><a href="#" onclick="findPassword()"><img border="0" src="../../../${bean.resource }membershipConf.gif"></a></div>
				<div style="margin: 6px 10px 5px 20px; float: left"><a href="#" onclick="gotoMain()"><img border="0" src="../../../${bean.resource }membershipCancle.gif"></a></div>
			</td>
		</tr>
			<tr>
			<td>
				<div style="float: left; margin: 30px 20px 0px 380px"><img border="0" src="../../../resources/menuimage/dotbogi.gif"></div>
				<div style="float: left; margin: 30px 35px 0px 0px"><a href="../../member/infoSerchForm/idserchForm"><img border="0" src="../../../resources/menuimage/findid.gif"></a></div>
				<div style="float: left; margin-top: 30px;"><a href="../../member/yakgwanView/yakgwan"><img border="0" src="../../../resources/menuimage/newmember.gif"></a></div>
			</td>
		</tr>	
		</c:when>
		
		</c:choose>
		
	</table>
</body>
<script type="text/javascript">


function newMemberEmailNumber(){
		var servernum = ${bean.emailNumber};
		 
		if(servernum == document.form.emailNumber.value && servernum != 0){
			document.form.emailNumberText.style.color="#41b431";
			document.form.emailNumberText.value="본인인증에 성공하셨습니다 ^^-";
			document.form.emailNumberIndex.value="1";
		}
		else{
			document.form.emailNumberText.style.color="red";
			document.form.emailNumberText.value="인증 번호가 일치하지 않습니다.";
			document.form.emailNumberIndex.value="0";
		} 
}


</script>
</html>