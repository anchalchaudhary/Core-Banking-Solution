<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
	<meta charset="UTF-8" />
	<title>Core Banking Application</title>
	<meta charset="ISO-8859-1">
	<title>Dashboard</title>
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
		<jsp:include page="base_post_login_header.jsp"></jsp:include>	
	</div>
		<div class="row pannel1">
			<div id = "homeImgWrapper">
				<br /><br />
				<img src="<c:url value="/assets/img/img2.png" />" alt="Hello" />
			</div>
	</div>
		
	<div>
		<jsp:include page="sidebar_employee.jsp"></jsp:include>
	</div>
	
	<div style="position: relative; min-height: 45vh;">
		<jsp:include page="base_pre_login_footer.jsp"></jsp:include>
	</div>
		<%@ include file="sessionCheck.jsp"%>
	
</body>
</html>

