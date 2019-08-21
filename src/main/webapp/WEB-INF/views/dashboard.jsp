<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="UTF-8" />
	<title>Core Banking Application</title>
	<meta charset="ISO-8859-1">
	<title>Index</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link href="<c:url value='/assets/css/base_pre_login.css' />" rel="stylesheet">
	<link href="<c:url value='/assets/css/home.css' />" rel="stylesheet">
	<link href="<c:url value='/assets/css/sidebar.css' />" rel="stylesheet">
	
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
		
	<div class="row">
		<div class="col-sm-2  sidebar">
			<nav class="nav nav-tab flex-column">
  			<a class="nav-link nav-item active" href="#">Active</a>
     		<a class="nav-link nav-item" href="#">Link</a>
 			 <a class="nav-link nav-item" href="#">Link</a>
 			 <a class="nav-link disabled" href="#">Disabled</a>
 			 <a class="nav-link" href="#">Link</a>
 			 <a class="nav-link" href="#">Link</a>
 			 <a class="nav-link disabled" href="#">Disabled</a>
 			 <a class="nav-link" href="#">Link</a>
 			 <a class="nav-link" href="#">Link</a>
 			 <a class="nav-link disabled" href="#">Disabled</a>
</nav>
		</div>
	</div>
	
	<div>
		<jsp:include page="base_pre_login_footer.jsp"></jsp:include>
	</div>
	
</body>
</html>

