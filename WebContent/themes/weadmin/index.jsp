<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String dir = request.getParameter("page");
	String action = request.getParameter("action");
	String path = request.getParameter("path");
%>

<%@ include file="header.jsp" %>
<% if(dir != null && action != null) { %>
	<jsp:include flush="true" page='<%= dir + "/" + action + ".jsp" %>'></jsp:include>
<% } %>
<%@ include file="footer.jsp" %>