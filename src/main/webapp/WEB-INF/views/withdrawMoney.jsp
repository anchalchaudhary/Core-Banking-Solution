<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Withdraw Money</title>
</head>
<body>
	<form:form action="withdrawMoney/${accountId}" modelAttribute="personalTransaction">
		<c:out value=""></c:out>
		<form:hidden path="ptId" />
		<form:label path="sum">
			<spring:message text="Amount" />
		</form:label>
		<form:input path="sum" />
		<input type="submit" value="<spring:message text="Withdraw"/>" />
	</form:form>
</body>
</html>