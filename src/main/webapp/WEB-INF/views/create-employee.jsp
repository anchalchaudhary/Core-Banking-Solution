<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Employee</title>
</head>
<body>
	<%@include file="check_session.jsp"%>

	<jsp:include page="include-superadmin(dashboard).jsp"></jsp:include>
	<form:form action="add_employee" modelAttribute="employee">
		<c:out value=""></c:out>
		<table>
			<c:if test="${!empty employee.empName}">
				<tr>
					<td><form:label path="empId">
							<spring:message text="ID" />
						</form:label></td>
					<td><form:input path="empId" readonly="true" size="8"
							disabled="true" /> <form:hidden path="empId" /></td>
				</tr>
			</c:if>
			<tr>
				<td><form:label path="empName">
						<spring:message text="Name" />
					</form:label></td>
				<td><form:input path="empName" /></td>
			</tr>

			<tr>
				<td><form:label path="empUserName">
						<spring:message text="username" />
					</form:label></td>
				<td><form:input path="empUserName" /></td>
			</tr>
			<tr>
				<td><form:label path="empPassword">
						<spring:message text="Password" />
					</form:label></td>
				<td><form:input path="empPassword" /></td>
			</tr>

			<tr>
				<td colspan="2"><c:if test="${!empty employee.empName}">
						<input type="submit"
							value="<spring:message text="Edit Employee"/>" />
					</c:if> <c:if test="${empty employee.empName}">
						<input type="submit" value="<spring:message text="Add Employee"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
</body>
</html>
