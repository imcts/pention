<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	if(${logchk==null}){
		alert('ID 또는 PW가 일치하지 않습니다.');
		location.href="../../member/loginView/login";
	}else if(${logchk!=null}){
		if(${logchk.grade < 4}){
			alert("찾아 주셔서 감사합니다^-^");
			location.href="../../mainPage/mainView/mainPage";
		}else{
		alert('해당ID는 탈퇴처리, 또는 블랙리스트로 등록 되었습니다.\n 관리자에게 문의하시기 바랍니다.');
		location.href="../../member/loginView/login";
		}
	}
</script>