<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<style>
h1 {
	background-color: #6495ed;
}

th {
	background-color: #b0c4de;
}
</style>
</head>
<body>
	<div align="center">
		<h1>CS Jobs</h1>
	</div>
	<ol class="breadcrumb">
		<li class="active">Admin-Index</li>
	</ol>
	<form action="<c:url value='/logout.html'/>" method="post">
		<input name="_csrf" type="hidden" value="${_csrf.token}" /> <input
			name="submit" type="submit"  class="btn btn-primary pull-right" value="Logout" />
	</form>
	<h5>Welcome ${authenticatedUser.firstName}.</h5>
	
	<h5 align="center">
		<a href="<c:url value='/job/add.html' />">Click here to Add New
			Job.</a>
	</h5>
	<h5 align="center">
		<a href="<c:url value='/admin/joblist.html' />">Click here to View all Job Aplication.</a>
	</h5>
	
	<div align="center">
		<div style="height: 700px; width: 500px;">
			<table class="table table-bordered">
				<tr align="center">
					<th>Job</th>
					<th>Publish Date</th>
					<th>Close Date</th>
					<th>Operations</th>
				</tr>
				<c:forEach items="${jobs}" var="job">
					<tr>
						<td><a
							href="<c:url value='/job/viewjob.html?id=${job.id}' />">${job.title}</a>
						</td>
						<td>${job.publishDate}</td>
						<td>${job.closeDate}</td>
						<td><a href="<c:url value='/job/edit.html?id=${job.id}' />">Edit</a></td>
					</tr>
				</c:forEach>
			</table>

		</div>
	</div>

</body>
</html>
