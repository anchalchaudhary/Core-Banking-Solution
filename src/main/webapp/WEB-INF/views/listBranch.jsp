<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Branches List</h3>
	
<c:if test="${!empty list}">
	<table class="tg">
	<tr>
		<th width="80">Branch ID</th>
		<th width="120">Branch Name</th>
		<th width="120">Branch IFSC</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${list}" var="branch">
		<tr>
			<td><c:out value="${branch.id}"></c:out></td>
			<td>${branch.name}</td>
			<td>${branch.ifsc}</td>
			<td><a href="<c:url value='/updateBranch/${branch.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/deleteBranch/${branch.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>