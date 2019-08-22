
<%
	if (request.getSession(false).getAttribute("username") == null) {
		response.sendRedirect("super-admin-login");
	}
%>