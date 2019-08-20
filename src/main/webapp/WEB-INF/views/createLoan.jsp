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
	<form:form action="addLoan" modelAttribute="loan">
		<c:out value=""></c:out>
		<table>
		<c:if test="${!empty loan.id}">
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
				<td><form:label path="amount">
						<spring:message text="amount" />
					</form:label></td>
				<td><form:input path="amount" /></td>
			</tr>
			
			<tr>
				<td><form:label path="tenure">
						<spring:message text="tenure" />
					</form:label></td>
				<td><form:input path="tenure" /></td>
			</tr>
			<tr>
				<td><form:label path="type">
						<spring:message text="type" />
					</form:label></td>
				<td><form:input path="type" /></td>
			</tr>
			<tr>
				<td><form:label path="rate">
						<spring:message text="rate" />
					</form:label></td>
				<td><form:input path="rate" /></td>
			</tr>
			<%-- <tr>
				<td><form:label path="empId">
						<spring:message text="empId" />
					</form:label></td>
				<td><form:input path="empId" /></td>
			</tr>	 --%>	
			<%-- <tr>
				<td><form:label path="customerId">
						<spring:message text="customerId" />
					</form:label></td>
				<td><form:input path="customerId" /></td>
			</tr>	 --%>		
		
		<tr>
		<td colspan="2">
			<c:if test="${!empty loan.id}">
				<input type="submit"
					value="<spring:message text="Edit loan"/>" />
			</c:if>
			<c:if test="${empty loan.id}">
				<input type="submit"
					value="<spring:message text="Add Branch"/>" />
			</c:if>
		</td>
	</tr>
	</table>
	</form:form>
</body>
</html>