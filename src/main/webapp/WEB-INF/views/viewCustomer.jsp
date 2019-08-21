<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Details</title>
</head>
<body>
	<c:if test="${!empty customer.name}">
		<table>
			<tr>
				<th>Customer ID</th>
				<td>${customer.customerId}</td>
			</tr>
			<tr>
				<th>Name</th>
				<td>${customer.name}</td>
			</tr>
			<tr>
				<th>Address</th>
				<td>${customer.address}</td>
			</tr>
			<tr>
				<th>Email</th>
				<td>${customer.email}</td>
			</tr>
			<tr>
				<th>Phone</th>
				<td>${customer.phone}</td>
			</tr>
			<tr>
				<th>Salary</th>
				<td>${customer.salary}</td>
			</tr>
			<tr>
				<td><a href="<c:url value='/updateCustomer/${customer.customerId}' />" >Edit</a></td>
				<td><a href="<c:url value='/deleteCustomer/${customer.customerId}' />" >Delete</a></td>
			</tr>
		</table>
	</c:if>
	<c:if test="${!empty customer.account.accountId}">
		<table>
			<tr>
				<th>Account ID</th>
				<td>${customer.account.accountId}</td>
			</tr>
			<tr>
				<th>Account Number</th>
				<td>${customer.account.accountno}</td>
			</tr>
			<tr>
				<th>Account Balance</th>
				<td>${customer.account.balance}</td>
			</tr>
			<tr>
				<th>Branch Name</th>
				<td>${customer.account.branch.name}</td>
			</tr>
			<tr>
				<th>Branch Address</th>
				<td>${customer.account.branch.address}</td>
			</tr>
			<tr>
				<th>Branch IFSC</th>
				<td>${customer.account.branch.ifsc}</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${empty customer.account.accountId}">
	
		<a href="../createAccount"><button class="btn btn-primary">Add Account</button></a>
		
	</c:if>
	
</body>
</html>
