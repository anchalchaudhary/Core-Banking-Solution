<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Account</title>
</head>
<body>
	<form:form action="addAccount" modelAttribute="account">
		<table>
			<tr>
				<td><form:label path="customerId">
						<spring:message text="customerId" />
					</form:label></td>
				<td><form:input path="customerId" /></td>
			</tr>
			<tr>
				<td><form:label path="balance">
						<spring:message text="balance" />
					</form:label></td>
				<td><form:input path="balance" /></td>
			</tr>
			<tr>
				<td><form:label path="branchId">
						<spring:message text="branchId" />
					</form:label></td>
				<td><form:input path="branchId" /></td>
			</tr>
				
		</table>
		<input type="submit" value="CreateAccount" />
	</form:form>
</body>
</html>