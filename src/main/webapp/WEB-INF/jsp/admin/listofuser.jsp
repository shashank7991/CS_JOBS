<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CSJobs</title>
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
		<li><a href="../admin.html">Admin-Index</a></li>
		<li><a href="../admin/joblist.html">Job List</a></li>
		<li class="active">Applicant List</li>
	</ol>


	<h5>Welcome ${authenticatedUser.firstName}.</h5>
	<form action="<c:url value='/logout.html'/>" method="post">
		<input name="_csrf" type="hidden" value="${_csrf.token}" /> <input
			name="submit" type="submit" value="Logout" />
	</form>

	<div align="center">
		<div style="height: 700px; width: 500px;">
			<table class="table table-bordered">
				<tr align="center">
					<th>Applicant Name</th>
					<th>Application</th>
				</tr>
				<c:forEach items="${applications}" var="application">
					<tr align="center">
						<td>${application.applicant.firstName}
							${application.applicant.lastName}</td>
						<td><a
							href="../admin/details.html?id=${application.applicant.id}&jid=${application.job.id}">View</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>