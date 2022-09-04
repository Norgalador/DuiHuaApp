<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>Create Your Profile</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<a class="navbar-brand" href="#">DuiHua</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarText" aria-controls="navbarText"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<span class="navbar-text"> Discover the world. </span>
				<div class="collapse navbar-collapse justify-content-end"
					id="navbarText">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link"
							href="/profileDetails/${currentUser.profile.id}">Profile</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Chat
								Rooms</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Discover
								Users</a></li>
						<li class="nav-item"><a class="nav-link" href="#">About</a></li>
						<li class="nav-item"><form class="form-inline"
								id="logoutForm" method="POST" action="/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input class="form-control mr-sm-2"
									type="submit" value="Logout" />
							</form></li>
					</ul>

				</div>
			</nav>
		</div>
		<div class="row">
			<div class="card col-6 offset-3">
				<div class="card-body">
					<h1 class="card-title">Create your Profile</h1>
					<form:form action="/createProfile" method="POST"
						modelAttribute="profile">
						<div class="form-floating mb-3">
							<form:errors class="text-danger mb-5" path="languagesSpoken" />
							<form:input type="text" class="form-control"
								path="languagesSpoken" placeholder="I speak..." />
							<form:label path="languagesSpoken">Languages Spoken</form:label>
						</div>
						<div class="form-floating mb-3">
							<form:errors class="text-danger" path="languagesLearning" />
							<form:input type="text" class="form-control"
								path="languagesLearning" placeholder="I am learning..." />
							<form:label path="languagesLearning">Languages Learning</form:label>
						</div>
						<div class="form-floating mb-3">
							<form:errors class="text-danger" path="interests" />
							<form:textarea type="text" class="form-control" path="interests"
								placeholder="My interests are..." />
							<form:label path="interests">My interests are...</form:label>
						</div>
						<div class="form-floating mb-3">
							<form:errors class="text-danger" path="description" />
							<form:textarea type="text" class="form-control"
								path="description" placeholder="A little about me..." />
							<form:label path="description">A little about me...</form:label>
						</div>
						<!-- Hidden Input for userId -->
						<form:input type="hidden" value="${currentUser.id}" path="user" />

						<a href="/" role="button" class="btn btn-primary">Cancel</a>
						<input type="submit" class="btn btn-primary" value="Submit" />
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>