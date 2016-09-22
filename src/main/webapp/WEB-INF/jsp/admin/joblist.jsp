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
	<li><a href="../admin.html">Admin-Index</a></li>
		<li class="active">Job List</li>
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
					<th>Job Name</th>
					<th>Applicant List</th>
				</tr>

				<c:forEach items="${jobs}" var="rjob">
					<tr align="center">
						<td><style="list-style: none;"><a
								style="color: blue;"
								href="<c:url value='/job/viewjob.html?id=${rjob.id}' />">
									${rjob.title}&nbsp;&nbsp; </a></td>
						<td><a style="color: red;"
							href="<c:url value='/admin/listofuser.html?id=${rjob.id}' />">
								[View] </a>
						</td>
					</tr>
				</c:forEach>
</body>
</html>
