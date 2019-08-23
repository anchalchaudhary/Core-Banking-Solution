<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Details</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link href="<c:url value='/assets/css/base_pre_login.css' />" rel="stylesheet">
	<link href="<c:url value='/assets/css/home.css' />" rel="stylesheet">
	<link href="<c:url value='/assets/css/sidebar.css' />" rel="stylesheet">
	<%
	    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
	    response.setHeader("Pragma","no-cache"); //HTTP 1.0
	    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
	%>
</head>
<body>

	<div>
		<jsp:include page="base_post_login_header.jsp"></jsp:include>	
	</div>


	<div class="row">
		<jsp:include page="sidebar_employee.jsp"></jsp:include>
		<div class="col-sm-5" style="text-align: center;">
			<br />
			<br />
			<h3>Customer List</h3>
			<br />
			<c:if test="${customer.customerId ne 0}">
				<table class="tg" style="margin-left:auto;margin-right:auto;">
					<tr>
						<th width="120">Customer ID</th>
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
		</div>
		<div class="col-sm-5" style="text-align: center;">
			<br /><br />
			<h3>Linked Account</h3>
			<br />
			<c:if test="${!empty customer.account.accountId}">
				<table class="tg" style="margin-left:auto;margin-right:auto;">
					<tr>
						<th>Account ID</th>
						<td>${customer.account.accountId}</td>
					</tr>
					<tr>
						<th width="150">Account Number</th>
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
						<td><a
							href="<c:url value='/depositMoney/${customer.account.accountId}' />">Deposit
								Money</a></td>
						<td><a
							href="<c:url value='/withdrawMoney/${customer.account.accountId}' />">Withdraw
								Money</a></td>
						<td><a
							href="<c:url value='/transfer/${customer.account.accountId}' />">Transfer
								Money</a></td>
					</tr>
				</table>
			</c:if>
			<c:if test="${empty customer.account.accountId}">

				<h4>No Account Added</h4>

				<br />
				<a href="../createAccount/${customer.customerId }">
						<button class="btn btn-primary" style="margin-left:auto;margin-right:auto;">Add Account</button></a>


			</c:if>
		</div>
	</div>
	<div style="position: relative; min-height: 45vh;">
		<jsp:include page="base_pre_login_footer.jsp"></jsp:include>
	</div>
		<%@ include file="sessionCheck.jsp"%>
	
</body>
</html>
