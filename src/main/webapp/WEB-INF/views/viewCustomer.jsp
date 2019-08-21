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
	<c:if test="${customer.customerId ne 0}">
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
				<td><a
					href="<c:url value='/updateCustomer/${customer.customerId}' />">Edit</a></td>
				<td><a
					href="<c:url value='/deleteCustomer/${customer.customerId}' />">Delete</a></td>
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
			<tr>

				<td><a href="<c:url value='/depositMoney/${customer.account.accountId}' />" >Deposit Money</a></td>
				<td><a href="<c:url value='/withdrawMoney/${customer.account.accountId}' />" >Withdraw Money</a></td>
				<td><a href="<c:url value='/transfer/${customer.account.accountId}' />" >Transfer Money</a></td>

				<td><a
					href="<c:url value='/depositMoney/${customer.account.accountId}' />">Deposit
						Money</a></td>
				<td><a
					href="<c:url value='/withdrawMoney/${customer.account.accountId}' />">Withdraw
						Money</a></td>
				<td><a href="<c:url value='/transfer/${customer.account.accountId}' />">Transfer Money</a></td>

			</tr>
		</table>
	</c:if>
	<c:if test="${empty customer.account.accountId}">

		<h4>No Account Added</h4>


		<a href="../createAccount/${customer.customerId }"><button
				class="btn btn-primary">Add Account</button></a>


	</c:if>

</body>
</html>
