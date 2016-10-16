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
	<table border="0" width="100%" align="center">
	<tr>
		<td>
			<input type="hidden" name="idIndex" value="${bean.idIndex }">
			<input type="hidden" name="idCheckIndex" value="${bean.idCheckIndex }">
			<input type="hidden" name="passwordIndex" value="${bean.passwordIndex }">
			<input type="hidden" name="tellIndex" value="${bean.tellIndex }">
			<input type="hidden" name="nameIndex" value="${bean.nameIndex }">
			<input type="hidden" name="emailIndex" value="${bean.emailIndex }">
			<input type="hidden" name="emailNumberIndex" value="${bean.emailNumberIndex }">
		<td>
	</tr>
	<tr>
		<td colspan="2">
			<c:choose>
				<c:when test="${bean.idCheckIndex == '0' }">
						<div style="margin: 20px 0 25px 110px;"><img alt="" src="../../../${bean.resource }InputInfo.jpg"></div>
				</c:when>
				<c:otherwise>
						<div style="margin: 20px 0 25px 110px;"><img alt="" src="../../../${bean.resource }InputInjeung.png"></div>
				</c:otherwise>
				
			
			</c:choose>
			
		</td>
	</tr>
	<tr>
		<td colspan="2" >
			<div style="margin: 20px 0 25px 380px;"><img alt="" src="../../../${bean.resource }membershipTop.gif"></div>
		</td>		
	</tr>
		<tr>
			<td colspan="2" >
				<div style="margin: 0 0 0 365px;"><input maxlength="8" value="${bean.id }" onkeyup="newMemberID()" border="0" type="text" name="id" value="" style="float:left; border:0; padding-left:10px; padding-top:5px; width:265px; height:60px; background-image: url('../../../${bean.resource }membershipID.gif'); background-repeat: no-repeat;"></div>
				<div style="margin: 20px 0 0 50px;"><a href="#" onclick="idMatchingCheck()"><img border="0" src="../../../${bean.resource }memberShipIdCheck.jpg"></a></div>					
				<div style="margin: 0 0 15px 370px;"><input name="idText" readonly="readonly" disabled="disabled" style=" width:500px; font-size:7pt; color: ${bean.color}; border: 0; background-color: white;"  value="${bean.idMsg }"  type="text"  onkeyup="testing()"></div>
				
				<div style="margin: 0 0 0 365px;"><input maxlength="15" onkeyup="newMemberPw()" border="0" type="password" name="password" value="${bean.password }" style="border:0; padding-left:10px; padding-top:5px; width:265px; height:60px; background-image: url('../../../${bean.resource }membershipPw.gif'); background-repeat: no-repeat;"></div>
				<div style="margin: 0 0 0 365px;" ><input maxlength="15" onkeyup="newMemberPw()" border="0"type="password" name="password1" value="${bean.password1 }" style="border:0; padding-left:10px; padding-top:5px; width:265px; height:60px; background-image: url('../../../${bean.resource }membershipPwRe.gif'); background-repeat: no-repeat;"></div>
				<div style="margin: 0 0 15px 370px;"><input name="passwordText" readonly="readonly" disabled="disabled" style="width:500px;font-size:7pt; color:red; border: 0; background-color: white;"  value=""  type="text"  onkeyup="testing()"></div>
				
				
				<div style="margin: 0 0 0 365px;" ><input maxlength="5" onkeyup="newMemberName()" border="0" type="text" name="name" value="${bean.name }" style="border:0; padding-left:10px; padding-top:5px; width:265px; height:60px; background-image: url('../../../${bean.resource }membershipName.gif'); background-repeat: no-repeat;"></div>
				<div style="margin: 0 0 15px 370px;"><input name="nameText" readonly="readonly" disabled="disabled" style="width:500px; font-size:7pt; color:red; border: 0; background-color: white;"  value=""  type="text"  onkeyup="testing()"></div>
				
				<div style="margin: 0 0 0 365px;" ><input onkeyup="newMemberPhone()" border="0" type="text" name="tell" value="${bean.tell }" style="border:0; padding-left:10px; padding-top:5px; width:265px; height:60px; background-image: url('../../../${bean.resource }membershipPhone.gif'); background-repeat: no-repeat;"></div>
				<div style="margin: 0 0 15px 370px;"><input name="tellText" readonly="readonly" disabled="disabled" style="width:500px; font-size:7pt; color:red; border: 0; background-color: white;"  value=""  type="text"  onkeyup="testing()"></div>
				
				<div style="margin: 0 0 0 365px;" ><input onkeyup="newMemberEmail()" border="0" type="text" name="email" value="${bean.email }" style="float:left; border:0; padding-left:10px; padding-top:5px; width:265px; height:60px; background-image: url('../../../${bean.resource }membershipMail.gif'); background-repeat: no-repeat;"></div>
				<div style="margin: 35px 0 0 50px;"><a href="#" onclick="emailGo()"><img border="0" src="../../../${bean.resource }MemberShipEmail.jpg"></a></div>
				<div style="margin: 0 0 15px 370px;"><input name="emailText" readonly="readonly" disabled="disabled" style="width:500px;font-size:7pt; color:red; border: 0; background-color: white;"  value=""  type="text"  onkeyup="testing()"></div>
				
				
				<div style="margin: 0 0 0 365px;" ><input border="0" type="text" name="emailNumber" value="" style="float:left; border:0; padding-left:10px; padding-top:5px; width:265px; height:60px; background-image: url('../../../${bean.resource }membershipEmailNumber.jpg'); background-repeat: no-repeat;"></div>
				<div style="margin: 35px 0 0 50px;"><a href="#" onclick="newMemberEmailNumber()"><img border="0" src="../../../${bean.resource }membershipConf.gif"></a></div>
				<div style="margin: 0 0 15px 370px;"><input name="emailNumberText" readonly="readonly" disabled="disabled" style="width:500px;font-size:7pt; color:red; border: 0; background-color: white;"  value=""  type="text"  onkeyup="testing()"></div>
			</td>
		</tr>
		
	
		<tr>
			<td align="center">
				<div style="margin: 8px 10px 0 400px; float: left;"><a href="#" onclick="newMemberGaip()"><img border="0" src="../../../${bean.resource }membershipConf.gif"></a></div>
				<div style="margin: 6px 10px 5px 20px; float: left"><a href="#" onclick="gotoMain()"><img border="0" src="../../../${bean.resource }membershipCancle.gif"></a></div>
			</td>
		</tr>
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
