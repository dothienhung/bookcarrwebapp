<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Management</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/icon.css">
</head>
<body>

	<div class="h-100 d-flex flex-column">
		<nav class="navbar navbar-light bg-light py-3">
			<span class="navbar-brand"></span>
			<div>
				<a style="font-weight: bold;" href="<%=request.getContextPath()%>/views/carbooking/car_manager.jsp"><span class="fas fa-car"></span> Car manager</a>&emsp; <a style="font-weight: bold;"
					href="<%=request.getContextPath()%>/views/trip/trip_manager.jsp"><span class="fas fa-tachometer-alt"></span> Trip
					manager</a>
			</div>
		


			<div class="my-3 my-lg-0 text-primary">

				<span class="mr-sm-4">Welcome ${user.employeeName}</span> <span class="my-3 my-sm-0">
					<span class="fas fa-sign-out-alt"></span> <a href="/login">
						Logout</a>
				</span>
			</div>
		</nav>

		<div class="d-flex flex-grow-1">


			<div class="container-fluid px-0">
				<img src="images/car_manager.jpg" class="img-reponsive w-100">
			</div>

		</div>
	</div>

	<script src="jquery/jquery-3.4.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>