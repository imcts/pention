<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="var" required="true" %>
<%
	String res = var.replaceAll("\n", "<br>");
%>


<div style="padding-left: 30px; padding-top: 25px;"><font color="black" face="dothum"   style="font-weight:bold; font-size:8pt;"><%=res %></font></div>
 
