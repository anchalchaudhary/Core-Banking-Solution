<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Branch</title>
</head>
<body>
	<form:form action="login" modelAttribute="employee">
		<c:out value=""></c:out>
		<table>
		<c:if test="${employee.empId != 0}">
	<tr>
		<td>
			<form:label path="empId">
				<spring:message text="empId"/>
			</form:label>
		</td>
		<td>
			<form:input path="empId" readonly="true" size="8"  disabled="true" />
			<form:hidden path="empId" />

		</td> 
	</tr>
	</c:if>
			<tr>
				<td><form:label path="empUserName">
						<spring:message text="empUserName" />
					</form:label></td>
				<td><form:input path="empUserName" /></td>
			</tr>
			
			<tr>
				<td><form:label path="empPassword">
						<spring:message text="empPassword" />
					</form:label></td>
				<td><form:input path="empPassword" /></td>
			</tr>
			
			
		
		<tr>
		<td colspan="2">
			<c:if test="${ employee.empId != 0}">
				<input type="submit"
					value="<spring:message text="login again"/>" />
			</c:if>
			<c:if test="${employee.empId == 0}">
				<input type="submit"
					value="<spring:message text="login"/>" />
			</c:if>
		</td>
	</tr>
	</table>
	</form:form>
</body>
</html>
