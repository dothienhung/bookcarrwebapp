<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Car</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/icon.css">
</head>
<body>
	<div class="h-100 d-flex flex-column">
		<nav class="navbar navbar-light bg-light py-3">
			<span class="navbar-brand"> <span class="fas fa-car"></span>
				Car <a style="margin-left: 210px;"
				href="<%=request.getContextPath()%>/views/carbooking/car_manager.jsp">
					Car Park Manager</a> <a class="pl-4"
				href="<%=request.getContextPath()%>/views/trip/trip_manager.jsp">
					Trip Manager</a>
			</span> 
			<div class="my-3 my-lg-0 text-primary">
				<span class="mr-sm-4">Welcome ${user.employeeName}</span> <span
					class="my-3 my-sm-0"> <span class="fas fa-sign-out-alt"></span>
					<a href="<%=request.getContextPath()%>/login"> Logout</a>
				</span>
			</div>
		</nav>

		<div class="d-flex flex-grow-1">
			<div class="col-md-2 bg-light flex-grow-1 text-primary">
				<p>
					<span class="fas fa-tachometer-alt"></span> Car park manager
				</p>
				<hr>
				<p>
					<span class="fas fa-car"></span> Car Manager
				</p>
				<p class="pl-4">
					<span class="fas fa-list"></span><a
						href="<%=request.getContextPath()%>/listcar"> Car list</a>
				</p>
				<p class="pl-4">
					<span class="fas fa-plus"></span><a
						href="<%=request.getContextPath()%>/addcar"> Add Car</a>
				</p>
				<hr>
				<p>
					<span class="fas fa-shopping-cart"></span> Booking Office manager
				</p>
				<p class="pl-4">
					<span class="fas fa-list"></span><a
						href="<%=request.getContextPath()%>/list_bookingoffice">
						Booking office list</a>
				</p>
				<p class="pl-4">
					<span class="fas fa-plus"></span><a
						href="<%=request.getContextPath()%>/add_bookingoffice"> Add
						Booking office</a>
				<hr>
				<p>
					<span class="fas fa-map-marker-alt"></span>Parking lot manager
				</p>
				<p class="pl-4">
					<span class="fas fa-list"></span><a
						href="<%=request.getContextPath()%>/list_parkinglot"> Parking
						lot list</a>
				</p>
				<p class="pl-4">
					<span class="fas fa-plus"></span><a
						href="<%=request.getContextPath()%>/add_parkinglot"> Add
						Parking lot</a>
				</p>

			</div>

			<div class="col-md-10 border border-success">
				<div class="p-4">
					<h2>Car List</h2>
					<hr>
					<form action="#" method="post" class="form-group">
						<table class="table table-borderless">
							<tr class="">
								<td class="w-25"><b> Licence plate(*)</b></td>
								<td><input type="text" name="licencePlate"
									id="licencePlate" class="form-control w-25"
									placeholder="Enter Licence plate"></td>
							</tr>

							<tr>
								<td><b>Car type</b></td>
								<td><input type="text" name="carType" id="carType"
									class="form-control w-25" placeholder="Enter car type"></td>
							</tr>

							<tr>
								<td><b>Car color</b></td>
								<td><input type="text" name="carColor" id="carColor"
									placeholder="Enter car color" class="form-control w-25"></td>
							</tr>
							<tr>
								<td><b>Company(*)</b></td>
								<td><select name="company" id="company"
									class="custom-select w-25">
										<option value="Phuong Trang">Phuong Trang</option>
										<option value="Hoang Ha">Hoang Ha</option>
										<option value="Toan Thang">Toan Thang</option>
										<option value="Newmen">Newmen</option>
										<option value="Dai Nhat Nam">Dai Nhat Nam</option>
								</select></td>
							</tr>
							<tr>
								<td><b>Parking lot(*)</b></td>
								<td><select name="parkinglot" id="parkinglot"
									class="custom-select w-25">
										<c:forEach items="${parking}" var="parking">
											<option value="${parking.parkId}">${parking.parkName}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<div>
										<button class="btn btn-warning" name="action">Reset</button>
										<button class="btn btn-success" type="submit" name="action"
											value="add">Add</button>
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