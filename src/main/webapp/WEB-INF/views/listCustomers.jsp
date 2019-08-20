<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Customers List</h3>
	
<c:if test="${!empty list}">
	<table class="tg">
	<tr>
		<th width="80">Customer ID</th>
		<th width="120">Customer Name</th>
		<th width="120">Phone</th>
	</tr>
	<c:forEach items="${list}" var="customer">
		<tr>
 			<td><a href="<c:url value='/viewCustomer/${customer.customerId}' />" >${customer.customerId}</a></td>
			<td>${customer.name}</td>
			<td>${customer.phone}</td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>