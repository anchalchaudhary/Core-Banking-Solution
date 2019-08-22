<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link href="<c:url value='/assets/css/base_pre_login.css' />" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/assets/css/super_admin_post_login.css' />" />
	<link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
	<script src="<c:url value='/assets/js/validate.js' />"></script>
</head>
<body>
	
	<div>
		<jsp:include page="base_pre_login_header.jsp"></jsp:include>
	</div>
	
	<div class="container">
		<br /><br /><br />
		<div class="card" style="width: 20rem;">
			<div class="card-body">
				<h4 class="card-title">Login</h4>
				<form:form action="login" modelAttribute="employee" onsubmit="return validatelogin();">
					<c:if test="${employee.empId != 0}">
						<div class="form-group">
						
						<form:label path="empId">
							<spring:message text="Employee Id" />
						</form:label>
						<div>
							<form:input path="empId" class="form-control" placeholder="Employee Id" />
							<form:hidden path="empId" />
						</div>
					</div>
					</c:if>
					<div class="form-group">
						<form:label path="empUserName">
							<spring:message text="Employee User Name" />
						</form:label>
						<div>
							<form:input path="empUserName" id="username" class="form-control" placeholder="Employee User Name" />
							<span id="errusername" style="color:red; display:none;">Enter Username</span>
						</div>
					</div>
					<div class="form-group">
						<form:label path="empPassword">
							<spring:message text="Employee Password" />
						</form:label>
						<div>
							<form:input path="empPassword" id="password" type="password" class="form-control" placeholder="password" />
							<span id="errpassword" style="color:red; display:none;">Enter Password</span>
						
						</div>
					</div>
					<c:if test="${ employee.empId != 0}">
				<input type="submit" class="btn btn-primary card-link" value="<spring:message text="login again"/>" />
			</c:if>
			<c:if test="${employee.empId == 0}">
				<input type="submit" class="btn btn-primary card-link" value="<spring:message text="login"/>" />
			</c:if>
				</form:form>
			</div>
		</div>

	</div>
	
	<div>
		<jsp:include page="base_pre_login_footer.jsp"></jsp:include>
	</div>

</body>
</html>
