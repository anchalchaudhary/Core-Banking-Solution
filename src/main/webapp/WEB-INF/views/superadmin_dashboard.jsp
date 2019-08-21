<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>${display_name}'s Dashboard</h1>
	<jsp:include page="include-logout.jsp" />
	<ul>
		<li><a href="add_employee">Create Employee</a></li>
		<li><a href="list_employee">List Employees</a></li>
		<li><a href="addBranch">Create Branch</a></li>
		<li><a href="listBranch">List Branch</a></li>

	</ul>
</body>
</html>