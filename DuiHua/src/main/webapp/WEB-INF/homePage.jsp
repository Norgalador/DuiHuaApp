<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>Welcome Page</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <a
				class="navbar-brand" href="#">Duihua</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarText" aria-controls="navbarText"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<span class="navbar-text"> Discover the world. </span>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarText">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="/profileDetails/${currentUser.profile.id}">Profile</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Chat
							Rooms</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Discover
							Users</a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><form class="form-inline" id="logoutForm" method="POST"
							action="/logout">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input class="form-control mr-sm-2" type="submit" value="Logout" />
						</form></li>
				</ul>

			</div>
			</nav>
		</div>
		<h1>
			Welcome,
			<c:out value="${currentUser.username}"></c:out>
		</h1>
		<a class="" href="/chat">Test Chat Room</a>
		<p>
		<a class="" href="/newChatRoom">Create Your Own Chat Room</a>
		</p>
		<div class="row">

			<h3>All Chat Rooms</h3>
			<table class="table">
				<thead>
					<tr>
						<th>Chat Room Name</th>
						<th>Language</th>
						<!-- <th># Online</th> -->
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${chatRooms}" var="chatRoom">
						<tr>
							<td><a href="/chatRoom/${chatRoom.id}">${chatRoom.roomName}
							</a></td>
							<td>${chatRoom.language}</td>
							<%-- <td>${chatRoom.online.size()}</td> --%>
							<td>${chatRoom.description}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>



	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>