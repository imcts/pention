<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function email()
{
    var add = document.form.To.value
    var subject = document.form.Subject.value
    document.form.action="mailto:sirupe89@gmail.com"+add+"?subject="+subject;

}

</script>

</head>
<body>
<FORM METHOD="post" NAME="form" ACTION="" onSubmit="email();return true" ENCTYPE="text/plain">
<TABLE BORDER=0>
  <TR>
   <TD ALIGN="right"><B>받는사람:</B></TD>
   <TD ALIGN="left"><INPUT TYPE="text" NAME="To" SIZE=30></TD>
  </TR>
  <TR>
   <TD ALIGN="right"><B>제목:</B></TD>
   <TD ALIGN="left"><INPUT TYPE="text" NAME="Subject" SIZE=30></TD>
  </TR>
  <TR>
   <TD ALIGN="right"><B>회신 주소:</B></TD>
   <TD ALIGN="left"><INPUT TYPE="text" NAME="Reply-to" SIZE=30></TD>
  </TR>
  <TR>
   <TD VALIGN="top"><B>내용:</B></TD>
   <TD ALIGN="left"><TEXTAREA COLS=40 ROWS=20 NAME="Message"></TEXTAREA>
</TD>
  </TR>
  <TR>
   <TD COLSPAN=2 ALIGN="center"><INPUT TYPE="submit" VALUE="Send it!" ><INPUT TYPE="reset" VALUE="Reset Form"></TD>
  </TR>
</TABLE>
</FORM>

</body>
</html>