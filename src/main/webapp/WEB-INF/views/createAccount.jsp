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
	<form:form action="createAccount" modelAttribute="account">
		<table>
			<tr>
				<td><form:label path="customer.customerId">
						<spring:message text="Customer ID" />
					</form:label></td>
				<td><form:input path="customer.customerId" /></td>
			</tr>
			<tr>
				<td><form:label path="balance">
						<spring:message text="Balance" />
					</form:label></td>
				<td><form:input path="balance" /></td>
			</tr>
			<tr>
				<td><form:label path="branch.branchId">
						<spring:message text="Branch Id" />
					</form:label></td>
				<td><form:input path="branch.branchId" /></td>
			</tr>
				
		</table>
		<input type="submit" value="CreateAccount" />
	</form:form>
</body>
</html>