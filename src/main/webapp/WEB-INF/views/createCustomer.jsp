<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Customer</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link href="<c:url value='/assets/css/base_pre_login.css' />" rel="stylesheet">
	<link href="<c:url value='/assets/css/home.css' />" rel="stylesheet">
	<link href="<c:url value='/assets/css/sidebar.css' />" rel="stylesheet">
	<script src="<c:url value='/assets/js/validate.js' />"></script>
	<script src="<c:url value='/assets/js/defaultvalues.js' />"></script>

</head>
<body onload="preventdefaultcustomer();">


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
			<form:form action="addCustomer" modelAttribute="customer" onsubmit="return validatecustomer();">	
				<div class="form-group row">
						<c:if test="${customer.customerId ne 0}">
				<form:label path="customerId" class="col-sm-2 col-form-label">
							<spring:message text="Customer ID" />
						</form:label>
						<div class="col-sm-10">
							<form:input path="customerId" class="form-control"	readonly="true" size="8" disabled="true" />
							<form:hidden path="customerId" />
						</div>
				</c:if>
				</div>
				
				<div class="form-group row">
					<form:label path="name"
						class="col-sm-2 col-form-label">
						<spring:message text="Name" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="name" id="name" class="form-control" />
						<span id="errname" style="color:red; display:none;">Enter Name</span>
					</div>
				</div>

				<div class="form-group row">
					<form:label path="phone" class="col-sm-2 col-form-label">
						<spring:message text="Contact Number" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="phone" id="phone" class="form-control" onblur="return validatephone();"/>
						<span id="errphone" style="color:red; display:none;"></span>
					</div>
				</div>

				<div class="form-group row">
					<form:label path="address" class="col-sm-2 col-form-label">
						<spring:message text="Address" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="address" id="address" class="form-control" />
						<span id="erraddress" style="color:red; display:none;">Enter Address</span>
					</div>
				</div>

				<div class="form-group row">
					<form:label path="email" class="col-sm-2 col-form-label">
						<spring:message text="Email" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="email" id="email" class="form-control" onblur="return validateemail();" />
						<span id="erremail" style="color:red; display:none;"></span>
					</div>
				</div>
				
				<div class="form-group row">
					<form:label path="salary" class="col-sm-2 col-form-label">
						<spring:message text="Salary" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="salary" type="number" id="salary" class="form-control" />
						<span id="errsalary" style="color:red; display:none;">Enter Salary</span>
					</div>
				</div>
				
				
				<input type="submit" class="btn btn-primary" style="margin-left:auto;margin-right:auto;" value="Create" />
			</form:form>
		</div>
		<div class="col-sm-3"></div>
	</div>
	
		</div>
	</div>
	<div style="position: relative; min-height: 17.5vh;">
		<jsp:include page="base_pre_login_footer.jsp"></jsp:include>
	</div>
	
		<%@ include file="sessionCheck.jsp"%>
	
</body>
</html>
