<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>


<html lang="en">
<head>

<title>Login</title>
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
		<li><a href="/csjobs-exam/index.html">Home</a></li>
		<li class="active">Login</li>
	</ol>
	<div align="center">
		<div style="height: 500px; width: 900px;">
			<c:if test="${error==false}">
				<p style="color: red">Invalid UserName or Password.</p>
			</c:if>
			<form action="login" method="post" class="form-horizontal">
				<br />
				<div class="form-group">
					<label class="col-sm-3 control-label">User Name :</label>
					<div class="col-sm-6">
						<input type="text" name="username" placeholder="User Name" class="col-size-10 form-control" />
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-3 control-label">Password :</label>
					<div class="col-sm-6">
						<input type="password" name="password" placeholder="Password" class="form-control" />
						<input type="hidden" name="_csrf" value="${_csrf.token}" />
					</div>
				</div>

				<br /> <input type="submit" value="Submit"
					class="btn btn-primary btn-lg"></input> <br />

			</form>
		</div>
	</div>
</body>
</html>
