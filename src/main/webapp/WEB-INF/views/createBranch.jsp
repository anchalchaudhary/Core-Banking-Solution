<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Branch</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link href="<c:url value='/assets/css/base_pre_login.css' />"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@include file="check_session.jsp"%>
	<jsp:include page="include-superadmin(dashboard).jsp"></jsp:include>

	<div>
		<jsp:include page="base_post_login_header.jsp"></jsp:include>
	</div>
	<br />
	<br />
	<br />
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<form:form action="addBranch" modelAttribute="branch">
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
						<spring:message text="Name" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="name" class="form-control" />
					</div>
				</div>

				<div class="form-group row">
					<form:label path="address" class="col-sm-2 col-form-label">
						<spring:message text="Address" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="address" class="form-control" />
					</div>
				</div>

				<div class="form-group row">
					<form:label path="ifsc" class="col-sm-2 col-form-label">
						<spring:message text="IFSC" />
					</form:label>
					<div class="col-sm-10">
						<form:input path="ifsc" class="form-control" />
					</div>
				</div>
				<%-- <tr>
				<td><form:label path="empId">
						<spring:message text="empId" />
					</form:label></td>
				<td><form:input path="empId" /></td>
			</tr>	 --%>


				<c:if test="${!empty branch.name}">

					<input type="submit" class="btn btn-primary" value="<spring:message text="Edit Branch"/>" />
				</c:if>
				<c:if test="${empty branch.name}">
					<input type="submit" class="btn btn-primary" value="<spring:message text="Add Branch"/>" />
				</c:if>
			</form:form>
		</div>
		<div class="col-sm-3"></div>

					<input type="submit" class="btn btn-primary"
						value="<spring:message text="Edit Branch"/>" />
				</c:if>
				<c:if test="${empty branch.name}">
					<input type="submit" class="btn btn-primary"
						value="<spring:message text="Add Branch"/>" />
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
