<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		if (session.getAttribute("username") == null) {
			response.sendRedirect("super-admin-login");
		} else {
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
		}
	%>
	<jsp:include page="include-logout.jsp" />
</body>
</html>