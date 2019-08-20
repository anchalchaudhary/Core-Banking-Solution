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
	<h3>Loan List</h3>
	
<c:if test="${!empty list}">
	<table class="tg">
	<tr>
		<th width="80">Loan ID</th>
		<th width="120">Loan Rate</th>
		<th width="120">Loan Tenure</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${list}" var="branch">
		<tr>
			<td><c:out value="${loan.id}"></c:out></td>
			<td>${loan.rate}</td>
			<td>${loan.tenure}</td>
			<td><a href="<c:url value='/updateLoan/${loan.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/deleteLoan/${loan.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>