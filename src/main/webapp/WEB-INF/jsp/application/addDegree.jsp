<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
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
	text-align: center;
	background-color: #b0c4de;
}
</style>
</head>
<body>
	<div align="center">
		<h1>CS Jobs</h1>
	</div>
	<ol class="breadcrumb">
		<li><a href="/csjobs-exam/applicant.html">Applicant-Index</a></li>
		<li><a
			href="/csjobs-exam/application/apply.html?jobId=${application.job.id}">Current-Job-Info</a></li>
		<li class="active">Add Degree</li>
	</ol>
	<h5>Welcome ${authenticatedUser.firstName}.</h5>
	<form action="<c:url value='/logout.html'/>" method="post">
		<input name="_csrf" type="hidden" value="${_csrf.token}" /> <input
			name="submit" type="submit" value="Logout" />
	</form>

	<h3>Job Title : ${application.job.title}</h3>
	<div align="center">
		<div style="height: 500px; width: 570px;">

			<form:form modelAttribute="degree">
				<table border="1" class="table table-bordered">
					<tr>
						<th>Degree</th>
						<th>School</th>
						<th>Year</th>
					</tr>
					<c:forEach items="${application.degrees}" var="degree">
						<tr>
							<td>${degree.name}</td>
							<td>${degree.school}</td>
							<td>${degree.year}</td>
						</tr>
					</c:forEach>
					<tr>
						<td><form:input path="name" /></td>
						<td><form:input path="school" /></td>
						<td><form:input path="year" /></td>
					</tr>
				</table>
				<p>

					<input type="submit" name="add" value="Add"
						class="btn btn-primary btn-lg"></input>

					<h3>
						<a href="upload.html?applicationId=${application.id}">File
							Upload</a> <br />
					</h3>
					<h3>
						<a href="../applicant.html">Click here</a> to submit Application.
					</h3>
				</p>
			</form:form>
</body>
</html>
