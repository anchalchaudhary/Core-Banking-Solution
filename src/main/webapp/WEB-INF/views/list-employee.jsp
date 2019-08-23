<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee List</title>
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
		<jsp:include page="super_admin_post_login_header.jsp"></jsp:include>	
	</div>
	<div class="row">
		<jsp:include page="sidebar_super_admin.jsp"></jsp:include>
		<br /><br /><br />
		<div class="col-sm-2"></div>
		<div class="col-sm-6" style="text-align: center;">
			<br />
			<br />
			<h3>Employee List</h3>
			<br />

			<c:if test="${!empty list}">
				<table class="tg" style="margin-left:auto;margin-right:auto;">
					<tr>
						<th width="80">Employee ID</th>
						<th width="120">Employee Name</th>
						<th width="120">Employee UserName</th>
						<th width="60">Edit</th>
						<th width="60">Delete</th>
					</tr>
					<c:forEach items="${list}" var="employee">
						<tr>
							<td><c:out value="${employee.empId}"></c:out></td>
							<td>${employee.empName}</td>
							<td>${employee.empUserName}</td>
							<td><a
								href="<c:url value='/update_employee/${employee.empId}' />">Edit</a></td>
							<td><a
								href="<c:url value='/delete_employee/${employee.empId}' />">Delete</a></td>
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
