<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs - Add Job</title>
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
		<li><a href="/csjobs-exam/admin.html">Admin-Index</a></li>
		<li class="active">Add Job</li>
	</ol>
	<h5>Welcome ${authenticatedUser.firstName}.</h5>
	<form action="<c:url value='/logout.html'/>" method="post">
		<input name="_csrf" type="hidden" value="${_csrf.token}" /> <input
			name="submit" type="submit" value="Logout" />
	</form>
	<div align="center">
		<div style="height: 500px; width: 400px;">

			<form:form modelAttribute="job" class="form-horizontal">
				<table border="1" class="table table-bordered">
					<tr>
						<th>Title:</th>
						<td><form:input path="title" /></td>
					</tr>
					<tr>
						<th>Description:</th>
						<td><form:textarea path="description" /></td>
					</tr>
					<tr>
						<th>Publish Date:</th>
						<td><form:input path="publishDate" /></td>
					</tr>
					<tr>
						<th>Close Date:</th>
						<td><form:input path="closeDate" /></td>
					</tr>

					<tr>
						<th>Committee Chair:</th>
						<td><select name="cmtchair">
								<c:forEach items="${reviewers}" var="cmtchair">
									<option id="${cmtchair.id}" value="${cmtchair.id}">${cmtchair.firstName }</option>
								</c:forEach>
						</select></td>
					</tr>

					<tr>
						<th>Committee Members:</th>
						<td><c:forEach items="${reviewers}" var="reviewers">
								<input type="checkbox" name="committeeMembers"
									value="${reviewers.id}">${reviewers.firstName } <BR>
							</c:forEach></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="submit"
							name="save" value="Create" /></td>
					</tr>
				</table>
			</form:form>
</body>
</html>