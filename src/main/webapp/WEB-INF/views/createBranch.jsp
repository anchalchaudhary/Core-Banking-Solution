<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Branch</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link href="<c:url value='/assets/css/base_pre_login.css' />" rel="stylesheet">
	<link href="<c:url value='/assets/css/home.css' />" rel="stylesheet">
	<link href="<c:url value='/assets/css/sidebar.css' />" rel="stylesheet">
	<script src="<c:url value='/assets/js/validate.js' />"></script>
</head>
<body>
	<div>
		<jsp:include page="super_admin_post_login_header.jsp"></jsp:include>
	</div>

	<div class="row">
		<jsp:include page="sidebar_super_admin.jsp"></jsp:include>
		<div class="col-sm-10" style="text-align: center;">
			<br />
			<br />
			<h3>Create Branch</h3>
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<form:form action="addBranch" modelAttribute="branch" onsubmit="return validatebranch();">
						<div class="form-group row">
							<c:if test="${!empty branch.name}">
								<form:label path="branchId" class="col-sm-2 col-form-label">
									<spring:message text="ID" />
								</form:label>
								<div class="col-sm-10">
									<form:input path="branchId" readonly="true" size="8"
										disabled="true" />
									<form:hidden path="branchId" />
								</div>
							</c:if>
						</div>
						<div class="form-group row">
							<form:label path="name" class="col-sm-2 col-form-label">
								<spring:message text="Branch Name" />
							</form:label>
							<div class="col-sm-10">
								<form:input path="name" id="name" class="form-control" />
								<span id="errname" style="color:red; display:none;">Enter Branch Name</span>
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
							<form:label path="ifsc" class="col-sm-2 col-form-label">
								<spring:message text="IFSC" />
							</form:label>
							<div class="col-sm-10">
								<form:input path="ifsc" id="ifsc" class="form-control" />
								<span id="errifsc" style="color:red; display:none;">Enter IFSC</span>
							</div>
						</div>
						<%-- <tr>
				<td><form:label path="empId">
						<spring:message text="empId" />
					</form:label></td>
				<td><form:input path="empId" /></td>
			</tr>	 --%>


						<c:if test="${!empty branch.name}">
							<input type="submit" class="btn btn-primary" style="margin-left:auto;margin-right:auto;" value="<spring:message text="Edit Branch"/>" />
						</c:if>
						<c:if test="${empty branch.name}">
							<input type="submit" class="btn btn-primary" style="margin-left:auto;margin-right:auto;" value="<spring:message text="Add Branch"/>" />
						</c:if>
					</form:form>
				</div>

				<div class="col-sm-3"></div>

			</div>
		</div>
	</div>

	<div style="position: relative; min-height: 34vh;" id="footerdiv">
		<jsp:include page="base_pre_login_footer.jsp"></jsp:include>
	</div>
	
		<%@ include file="sessionCheck.jsp"%>
</body>
</html>
