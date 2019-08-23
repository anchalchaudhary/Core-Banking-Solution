<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transfer Money</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link href="<c:url value='/assets/css/base_pre_login.css' />" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
	<link href="<c:url value='/assets/css/sidebar.css' />" rel="stylesheet">
	<script src="<c:url value='/assets/js/validate.js' />"></script>
	<script src="<c:url value='/assets/js/defaultvalues.js' />"></script>
</head>
<body onload="preventdefaulttransfer();">
	
	<div>
		<jsp:include page="base_post_login_header.jsp"></jsp:include>	
	</div>
	
	<div class="row">
		<jsp:include page="sidebar_employee.jsp"></jsp:include>
		<div class="col-sm-10" style="text-align: center;">
			<br /><br />
			<h3>Create Customer</h3>
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<form:form action="transfer/${fromAccountId}" modelAttribute="transfer" onsubmit="return validatetransfer();">	
				<div class="form-group row">
						<c:if test="${transfer.id != 0}">
								<form:hidden path="id" />
					</c:if>
				</div>
			
				<div class="form-group row">
					<form:hidden path="fromaccount" />
				</div>
				
				<div class="form-group row">
					<form:label path="toaccount"
						class="col-sm-2 col-form-label">
						<spring:message text="To Account" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="toaccount" id="toaccount" placeholder="To Account" class="form-control" />
						<span id="errtoaccount" style="color:red; display:none;">Enter account of receiver</span>
					</div>
				</div>

				<div class="form-group row">
					<form:label path="amount" class="col-sm-2 col-form-label">
						<spring:message text="Amount" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="amount" type="number" id="amount" min="1" placeholder="Amount" class="form-control" />
						<span id="erramount" style="color:red; display:none;">Enter amount to transfer</span>
					</div>
				</div>
				<c:if test="${!empty transfer.id}">
				<input type="submit" style="margin-left:auto;margin-right:auto;" class="btn btn-primary" value="<spring:message text="Edit transfer"/>" />
			</c:if>
			<c:if test="${empty transfer.id}">
				<input type="submit" style="margin-left:auto;margin-right:auto;" class="btn btn-primary" value="<spring:message text="transfer"/>" />
			</c:if>
			</form:form>
		</div>
		<div class="col-sm-3"></div>
	</div>
	
		</div>
	</div>
	<div style="position: relative; min-height: 45vh;">
		<jsp:include page="base_pre_login_footer.jsp"></jsp:include>
	</div>
		<%@ include file="sessionCheck.jsp"%>
	
</body>
</html>
