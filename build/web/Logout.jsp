<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
	session=request.getSession(false); //Open only existing session for current user
	if(session==null)
	{
		response.sendRedirect("LoginForm.jsp");
	}
	session.removeAttribute("role");
	session.removeAttribute("email");
	session.invalidate(); //remove session
	response.sendRedirect("LoginForm.jsp");
%>