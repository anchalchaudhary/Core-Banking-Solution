<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Employee</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link href="<c:url value='/assets/css/base_pre_login.css' />" rel="stylesheet">
	<link href="<c:url value='/assets/css/home.css' />" rel="stylesheet">
	<link href="<c:url value='/assets/css/sidebar.css' />" rel="stylesheet">
	<script src="<c:url value='/assets/js/validate.js' />"></script>
	<script>
	  $( function() {
	    $( document ).tooltip();
	  } );
  </script>
  <%
	    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
	    response.setHeader("Pragma","no-cache"); //HTTP 1.0
	    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
	%>
</head>
<body>
	<div>
		<jsp:include page="super_admin_post_login_header.jsp"></jsp:include>	
	</div>
	<div class="row">
			<jsp:include page="sidebar_super_admin.jsp"></jsp:include>
		<div class="col-sm-10" style="text-align: center;">
			<br /><br />
			<h3>Create Employee</h3>
				<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<form:form action="add_employee" modelAttribute="employee" onsubmit="return validateemployee();">	
				<div class="form-group row">		
				<c:if test="${!empty employee.empName}">
						<div class=col-sm-2>
						</div>
						<div class="col-sm-10">
							<form:hidden path="empId" />
						</div>
				</c:if>
				</div>
				
				<div class="form-group row">
					<form:label path="empName" class="col-sm-2 col-form-label">
						<spring:message text="Employee Name" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="empName" id="name" placeholder="Employee Name" class="form-control" />
						<span id="errname" style="color:red; display:none;">Enter name</span>
					</div>
				</div>

				<div class="form-group row">
					<form:label path="empUserName" class="col-sm-2 col-form-label">
						<spring:message text="User Name" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="empUserName" id="username" placeholder="User Name" class="form-control" />
						<span id="errusername" style="color:red; display:none;">Enter username</span>
					</div>
				</div>

				<div class="form-group row">
					<form:label path="empPassword" class="col-sm-2 col-form-label">
						<spring:message text="Password" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="empPassword" id="password" type="password" placeholder="Password" class="form-control" oninput="return validatepassword();" title="Password should be minimum 5 characters long and must contain atleast: 1 lowercase alphabet, 1 uppercase alphabet, 1 numeric character and 1 special symbol (#, @, $, !)"/>
						<span id="errpassword" style="color:red; display:none;"></span>
					</div>
				</div>
				<c:if test="${!empty employee.empName}">
					<input type="submit" class="btn btn-primary" style="margin-left:auto;margin-right:auto;" value="<spring:message text="Edit Employee"/>" />
				</c:if> 
				<c:if test="${empty employee.empName}">
					<input type="submit" class="btn btn-primary" style="margin-left:auto;margin-right:auto;" value="<spring:message text="Add Employee"/>" />
				</c:if>
			</form:form>
		</div>
		<div class="col-sm-3"></div>
	</div>
		</div>
	</div>	
	
	<div>
		<jsp:include page="base_pre_login_footer.jsp"></jsp:include>
	</div>
		<%@ include file="sessionCheck.jsp"%>
	
</body>
</html>
