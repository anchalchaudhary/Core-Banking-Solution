<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Withdraw Money</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link href="<c:url value='/assets/css/base_pre_login.css' />" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
	<link href="<c:url value='/assets/css/sidebar.css' />" rel="stylesheet">
	
</head>
<body>
	<div>
		<jsp:include page="base_post_login_header.jsp"></jsp:include>	
	</div>
	<div class="row">
		<jsp:include page="sidebar_employee.jsp"></jsp:include>
		<div class="col-sm-10" style="text-align: center;">
			<br /><br />
			<h3>Withraw Money</h3>
			<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<br /><br />
			<form:form action="withdrawMoney/${accountId}" modelAttribute="personalTransaction">
				<div class="form-group row">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
						<form:hidden path="ptId" />
					</div>
				</div>

				<div class="form-group row">
					<form:label path="sum" class="col-sm-2 col-form-label">
						<spring:message text="Amount" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="sum" class="form-control" />
					</div>
				</div>
			<input type="submit" class="btn btn-primary" style="margin-left:auto;margin-right:auto;" value="<spring:message text="Withdraw"/>" />
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