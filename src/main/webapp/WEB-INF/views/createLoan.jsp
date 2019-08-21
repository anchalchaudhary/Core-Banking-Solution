<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Branch</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link href="<c:url value='/assets/css/base_pre_login.css' />" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">

</head>
<body>
	
	<div>
		<jsp:include page="base_post_login_header.jsp"></jsp:include>	
	</div>
	
	<br /><br /><br />
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<form:form action="addLoan" modelAttribute="loan">
				<c:if test="${!empty loan.id}">
					<div class="form-group row">
					<form:label path="id"
						class="col-sm-2 col-form-label">
						<spring:message text="ID" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="id" class="form-control" readonly="true" size="8"  disabled="true" />
						<form:hidden path="id" />
					</div>
					</div>
				</c:if>
				<div class="form-group row">
					<form:label path="amount" class="col-sm-2 col-form-label">
						<spring:message text="Amount" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="amount" class="form-control" />
					</div>
				</div>
				
				<div class="form-group row">
					<form:label path="tenure" class="col-sm-2 col-form-label">
						<spring:message text="Tenure" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="tenure" class="form-control" />
					</div>
				</div>
				
				<div class="form-group row">
					<form:label path="type" class="col-sm-2 col-form-label">
						<spring:message text="Type" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="type" class="form-control" />
					</div>
				</div>
				
				<div class="form-group row">
					<form:label path="rate" class="col-sm-2 col-form-label">
						<spring:message text="Rate" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="rate" class="form-control" />
					</div>
				</div>
				<c:if test="${!empty loan.id}">
					<input type="submit" class="btn btn-primary" value="<spring:message text="Edit loan"/>" />
				</c:if>
				<c:if test="${empty loan.id}">
					<input type="submit" class="btn btn-primary" value="<spring:message text="Add Branch"/>" />
				</c:if>
			</form:form>
		</div>
		<div class="col-sm-3"></div>
	</div>
	
	<div>
		<jsp:include page="base_pre_login_footer.jsp"></jsp:include>
	</div>
</body>
</html>