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
	<form:form action="addBranch" modelAttribute="branch">
		<c:out value=""></c:out>
		<table>
		<c:if test="${!empty branch.name}">
	<tr>
		<td>
			<form:label path="id">
				<spring:message text="ID"/>
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />
		</td> 
	</tr>
	</c:if>
		
			<tr>
				<td><form:label path="name">
						<spring:message text="Name" />
					</form:label></td>
				<td><form:input path="name" /></td>
			</tr>
			
			<tr>
				<td><form:label path="address">
						<spring:message text="Address" />
					</form:label></td>
				<td><form:input path="address" /></td>
			</tr>
			<tr>
				<td><form:label path="ifsc">
						<spring:message text="ifsc" />
					</form:label></td>
				<td><form:input path="ifsc" /></td>
			</tr>
			<%-- <tr>
				<td><form:label path="empId">
						<spring:message text="empId" />
					</form:label></td>
				<td><form:input path="empId" /></td>
			</tr>	 --%>		
		
		<tr>
		<td colspan="2">
			<c:if test="${!empty branch.name}">
				<input type="submit"
					value="<spring:message text="Edit Branch"/>" />
			</c:if>
			<c:if test="${empty branch.name}">
				<input type="submit"
					value="<spring:message text="Add Branch"/>" />
			</c:if>
		</td>
	</tr>
	</table>
	</form:form>
</body>
</html>