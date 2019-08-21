<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Employee List</h3>
	
<c:if test="${!empty list}">
	<table class="tg">
	<tr>
		<th width="80">Employee ID</th>
		<th width="120">Employee Name</th>
		<th width="120">Employee UserName</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${list}" var="employee">
		<tr>
			<td><c:out value="${employee.empId}"></c:out></td>
			<td>${employee.empName}</td>
			<td>${employee.empUserName}</td>
			<td><a href="<c:url value='/update_employee/${employee.empId}' />" >Edit</a></td>
			<td><a href="<c:url value='/delete_employee/${employee.empId}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>