<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>${display_name}'sDashboard</h1>
	<%
		if (session.getAttribute("username") == null) {
			response.sendRedirect("super-admin-login");
		} else {
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
		}
	%>
	<jsp:include page="include-logout.jsp" />
	<ul>
		<li><a href="create_branch">Create Branch</a></li>
		<li><a href="delete_branch">Delete Branch</a></li>
		<li><a href="update_branch">Update Branch</a></li>
	</ul>
</body>
</html>