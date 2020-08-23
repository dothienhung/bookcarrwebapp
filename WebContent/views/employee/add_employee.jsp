<%@page import="model.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"crossorigin="anonymous">
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
						href="<%=request.getContextPath()%>/add_employee">
						Add employee</a>
				</p>

			</div>
			<div class="col-md-10 border border-success">
				<div class="p-4">
					<h2>Add Employee</h2>
					<hr>
					<form action="<%=request.getContextPath()%>/add_employee"
						method="post" class="form-group">
						<table class="table table-borderless">
							<tr class="">
								<td class="w-25"><b> Full name(*)</b></td>
								<td><input type="text" name="fullName" id="fullName"
									class="form-control w-25" placeholder="Enter full name"></td>
							</tr>
							<tr>
								<td><b>Phone number(*)</b></td>
								<td><input type="text" name="phoneNumber" id="phoneNumber"
									class="form-control w-25" placeholder="Enter phone number"></td>
							</tr>
							<tr>
								<td><b>Date of birth(*)</b></td>
								<td><input type="date" name="date" id="date"
									class="form-control w-25" placeholder="dd/mm/yyyy"></td>
							</tr>
							<tr>
								<td><b>Sex(*)</b></td>
								<td><input type="radio" name="sex" value="male"><b>Male</b>
									<input type="radio" name="sex" value="female" class="ml-2"><b>Female</b>
								</td>
							</tr>
							<tr>
								<td><b>Address</b></td>
								<td><input type="text" name="address" id="address"
									class="form-control w-25" placeholder="Enter address"></td>
							</tr>
							<tr>
								<td><b>Email</b></td>
								<td><input type="text" name="email" id="email"
									class="form-control w-25" placeholder="Enter email"></td>
							</tr>
							<tr>
								<td><b>Account(*)</b></td>
								<td><input type="text" name="account" id="account"
									class="form-control w-25" placeholder="Enter account"></td>
							</tr>
							<tr>
								<td><b>Password</b></td>
								<td><input type="password" name="password" id="password"
									class="form-control w-25" placeholder="Enter password"></td>
							</tr>
							<tr>
								<td><b>Department(*)</b></td>
								<td><select name="department" id="department"
									class="custom-select w-25">
										<option value="employee">Employee</option>
										<option value="parking">Parking</option>
										<option value="service">Service</option>
								</select></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<div>
										<button class="btn btn-primary" name="action" value="Back">Back</button>
										<button class="btn btn-warning" name="action" value="Reset">Reset</button>
										<button class="btn btn-success" name="action" value="Add">Add</button>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>

		</div>
	</div>

	<script src="<%=request.getContextPath()%>/jquery/jquery-3.4.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>