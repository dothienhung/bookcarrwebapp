<%@page import="model.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Manager</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
</head>
<body>
	<div class="h-100">
		<nav class="navbar navbar-light bg-light py-3">
			<span class="navbar-brand"><span class="fas fa-user-friends"></span>
				Employee</span>
			<div class="my-3 my-lg-0 text-primary">
				<span class="mr-sm-4">Welcome: ${admin.employeeName} </span> <span
					class="my-3 my-sm-0"><span class="fas fa-sign-out-alt"></span><a
					href="<%=request.getContextPath()%>/login"> Logout</a></span>
			</div>
		</nav>
    </div>
		<div class="d-flex h-100">
			<div class="col-md-2 bg-light h-100 flex-grow-1 text-primary">
				<p>
					<span class="fas fa-tachometer-alt"></span> Dashboard
				</p>
				<hr>
				<div></div>
				<p>
					<span class="fas fa-chart-bar"></span> Employee Manager
				</p>
				<p>
					<span class="fas fa-list"></span><a
						href="<%=request.getContextPath()%>/list_employee"> Employee
						list</a>
				</p>
				<p>
					<span class="fas fa-plus"></span><a
						href="<%=request.getContextPath()%>/add_employee"> Add
						employee</a>
				</p>

			</div>
			<div class = "container-fluid px-0">
				<img src="<%=request.getContextPath()%>/images/car_manager.jpg" class="img-reponsive w-100">
			</div>
		</div>


		<script src="<%=request.getContextPath()%>/jquery/jquery-3.4.1.js"></script>
		<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>