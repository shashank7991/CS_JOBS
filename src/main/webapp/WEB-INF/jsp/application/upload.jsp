<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CSJOBS</title>
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
		<li><a
			href="/csjobs-exam/application/addDegree.html?applicationId=${application.id}">Add-Degree</a></li>
		<li class="active">Upload Docs</li>
	</ol>
	<h5>Welcome ${authenticatedUser.firstName}.</h5>
	<form action="<c:url value='/logout.html'/>" method="post">
		<input name="_csrf" type="hidden" value="${_csrf.token}" /> <input
			name="submit" type="submit" value="Logout" />
	</form>
	<h3>Job Title : ${application.job.title}</h3>

	<div align="center">
		<div style="height: 500px; width: 600px;">
			<form action="upload.html?${_csrf.parameterName}=${_csrf.token}"
				method="post" enctype="multipart/form-data">
				<table border="1" class="table table-bordered">
					<tr>
						<th>CV:</th>
						<td><input type="file" name="cv" /><input type="hidden"
							name="applicationId" value="${applicationId}"></td>
					</tr>
					<tr>
						<th>Teaching Satement:</th>
						<td><input type="file" name="teachingStatement" /><input
							type="hidden" name="applicationId" value="${applicationId}"></td>
					</tr>
					<tr>
						<th>Research Statement:</th>
						<td><input type="file" name="researchStatement" /><input
							type="hidden" name="applicationId" value="${applicationId}"></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="submit"
							name="upload" value="upload" /></td>
					</tr>

				</table>
				<h3>
					<a href="../applicant.html">Click here</a> to submit Application.
				</h3>
			</form>
		</div>
	</div>
</body>
</html>