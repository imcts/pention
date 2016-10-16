<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="var" required="true" %>
<%=var.replaceAll("<br>","\n").trim() %>
