<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs</title>
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
		<li class="active">Applicant-Home</li>
	</ol>


	<h5>Welcome ${authenticatedUser.firstName}.</h5>
	
<form action="<c:url value='/logout.html'/>" method="post">
  <input name="_csrf" type="hidden" 
		value="${_csrf.token}" />
  <input name="submit" type="submit" value="Logout" />
</form>

	<div align="center">
		<div style="height: 700px; width: 500px;">
			<table class="table table-bordered">
				<tr align="center">
					<th colspan="2" align="center">Job Positions Applied</th>
				</tr>
				<c:if test="${user.applications.size() > 0}">
					<ul>
						<c:forEach items="${user.applications}" var="application">
							<tr align="center">
								<td><a
									href="<c:url value='/job/view.html?id=${application.job.id}' />">${application.job.title}</a></td>
								<td>[<a
									href="<c:url value='/application/view.html?id=${application.id}' />">View Application</a>]
								</td>
							</tr>
						</c:forEach>
					</ul>
				</c:if>
			</table>
		
			<table class="table table-bordered">
				<tr align="center">
					<th colspan="2" align="center">Job Positions Available</th>
				</tr>

				<c:if test="${availableJobs.size() > 0}">
					<ul>
						<c:forEach items="${availableJobs}" var="job">
							<tr align="center">
								<td><a href="<c:url value='/job/view.html?id=${job.id}' />">${job.title}</a></td>
								<td>[<a
									href="<c:url value='/application/apply.html?jobId=${job.id}' />">Apply</a>]
								</td>
							</tr>
						</c:forEach>
					</ul>
				</c:if>
			</table>
			<h5>Click on the job position to view Job details.</h5>
		</div>
	</div>
</body>
</html>
