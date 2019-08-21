<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Transfer</title>
</head>
<body>
	<form:form action="transfer/${fromAccountId}" modelAttribute="transfer">
		<c:out value=""></c:out>
		<table>
		<c:if test="${!empty transfer.id}">
	<tr>
		<td>
			<form:label path="id">
				<spring:message text="id"/>
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />

		</td> 
	</tr>
	</c:if>
			<%-- <tr>
				<td><form:label path="fromaccount">
						<spring:message text="fromaccount" />
					</form:label></td>
				<td><form:input path="fromaccount" /></td>
			</tr> --%>

			<tr>
				<td><form:hidden path="fromaccount" /></td>
			</tr>



			<tr>
				<td><form:label path="toaccount">
						<spring:message text="toaccount" />
					</form:label></td>
				<td><form:input path="toaccount" /></td>
			</tr>
			<tr>
				<td><form:label path="amount">
						<spring:message text="amount" />
					</form:label></td>
				<td><form:input path="amount" /></td>
			</tr>
			<%-- <tr>
				<td><form:label path="empId">
						<spring:message text="empId" />
					</form:label></td>
				<td><form:input path="empId" /></td>
			</tr>	 --%>	
		
		<tr>
		<td colspan="2">
			<c:if test="${!empty transfer.id}">
				<input type="submit"
					value="<spring:message text="Edit transfer"/>" />
			</c:if>
			<c:if test="${empty transfer.id}">
				<input type="submit"
					value="<spring:message text="transfer"/>" />
			</c:if>
		</td>
	</tr>
	</table>
	</form:form>
</body>
</html>
