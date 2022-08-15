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
<title>Profile Page</title>
</head>
<body>
<div class="card col-md-6 mx-auto">
			<div class="card-header">
				<h3 class="">${currentUser.username}</h3>
			</div>
			<div class="card-body">
				<p class="card-text"><strong>Languages Spoken: </strong> ${currentUser.profile.languagesSpoken}</p>
				<p class="card-text"><strong>Languages Learning: </strong>${currentUser.profile.languagesLearning}</p>
				<p class="card-text"><strong>Interests:</strong> 
				${currentUser.profile.interests}</p>
				<p class="card-text"><strong>Description:</strong> 
				${currentUser.profile.description}</p>
				<div class="btn-group">
					 <%-- <c:if test="${song.user.id==userLoggedIn.id}"> --%>
						<a class="btn btn-primary m-2" role="button"
							href="/editProfile/${currentUser.profile.id}">Edit</a>
						<form:form action="/deleteProfile/${myProfile.id}" method="delete">
							<button class="btn btn-danger">Delete Profile</button>
						</form:form>
					<%--  </c:if> --%>
				</div>
				
				
				<div class="m-2"></div>
			</div>
		</div>

<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"></script>
</body>
</html>