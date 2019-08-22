<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loan List</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link href="<c:url value='/assets/css/base_pre_login.css' />" rel="stylesheet">
	<link href="<c:url value='/assets/css/home.css' />" rel="stylesheet">
	<link href="<c:url value='/assets/css/sidebar.css' />" rel="stylesheet">
	
</head>
<body>
	
	<div>
		<jsp:include page="base_post_login_header.jsp"></jsp:include>	
	</div>
	
	<div class="row">
		<jsp:include page="sidebar_employee.jsp"></jsp:include>	
		<br /><br /><br />
			<div class="col-sm-2"></div>
			<div class="col-sm-6" style="text-align: center;">
				<br /><br />
				<h3>Loan List</h3>
			<br />
			<c:if test="${!empty list}">
				<table class="tg" style="margin-left:auto;margin-right:auto;">
					<tr>
						<th width="80">Loan ID</th>
						<th width="120">Loan Amount</th>
						<th width="120">Loan Rate</th>
						<th width="120">Loan Tenure</th>
						<th width="60">Edit</th>
						<th width="60">Delete</th>
					</tr>
					<c:forEach items="${list}" var="loan">
						<tr>
							<td><c:out value="${loan.id}"></c:out></td>
							<td>${loan.amount}</td>
							<td>${loan.rate}</td>
							<td>${loan.tenure}</td>
							<td><a href="<c:url value='/updateLoan/${loan.id}' />">Edit</a></td>
							<td><a href="<c:url value='/deleteLoan/${loan.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			</div>
			<div class="col-sm-2"></div>
		</div>
	
	<div style="position: relative; min-height: 45vh;">
		<jsp:include page="base_pre_login_footer.jsp"></jsp:include>
	</div>
		<%@ include file="sessionCheck.jsp"%>
	
</body>
</html>