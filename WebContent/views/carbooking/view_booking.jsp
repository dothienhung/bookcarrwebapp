<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book office</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/icon.css">

</head>
<body>
	<div class="h-100 d-flex flex-column">
		<nav class="navbar navbar-light bg-light py-3">
			<span class="navbar-brand"> <span class="fas fa-shopping-cart"></span>
				Booking office <a style="margin-left: 115px;"
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
				</p>
				<hr>
				<p>
					<span class="fas fa-map-marker-alt"></span> Parking lot manager
				</p>
				<p class="pl-4">
					<span class="fas fa-list"></span><a
						href="<%=request.getContextPath()%>/list_parkinglot"> Parking
						lot list</a>
				</p>
				<p class="pl-4">
					<span class="fas fa-plus"></span><a
						href="<%=request.getContextPath()%>/add_parkinglost"> Add
						Parking lot</a>
				</p>

			</div>

			<div class="col-md-10 border border-success">
				<div class="p-4">
					<h2>View Booking office</h2>
					<hr>
					<form
						action="<%=request.getContextPath()%>/view_booking?officeId=${booking.officeId}"
						method="get" class="form-group">
						<table class="table table-borderless">
							<tr class="">
								<td class="w-25"><b> Booking office name(*)</b></td>
								<td><input type="text" name="bookingOfficeName"
									id="bookingOfficeName" class="form-control w-50"
									value="${booking.officeName}"></td>
							</tr>
							<tr>
								<td><b>Trip (*)</b></td>
								<td><select name="trip" id="trip"
									class="custom-select w-50">
										<option>${booking.destination}</option>
										<c:forEach items="${trip}" var="trip">
											<option value="${trip.tripId}">${trip.destination}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td><b>Phone number(*)</b></td>
								<td><input type="text" name="phoneNumber" id="phoneNumber"
									class="form-control w-50" value="${booking.officePhone}"></td>
							</tr>

							<tr>
								<td><b>Place (*)</b></td>
								<td><select name="place" id="place"
									class="custom-select w-50">
										<option>${booking.officePlace}</option>
										<option value="Quay so 1">Quay so 1</option>
										<option value="Quay so 2">Quay so 2</option>
										<option value="Quay so 3">Quay so 3</option>
										<option value="Quay so 4">Quay so 4</option>
								</select></td>
							</tr>

							<tr>
								<td><b>Price(*)</b></td>
								<td><input type="text" name="price" id="price"
									class="form-control w-50 d-inline-block"
									value="${booking.officePrice}">&emsp;<b>(VND)</b></td>
							</tr>

							<tr>
								<td><b>Contract deadline(*)</b></td>
								<td><div class="btn-group w-50">
										<button class="btn bg-light d-flex border-secondary" disabled
											id="filter-btn">&nbsp;From&nbsp;date</button>
										<input type="date" name="fromDate" id="fromDate"
											class="form-control" value="${booking.startContractDeadline}">
									</div></td>

							</tr>

							<tr>
								<td></td>
								<td><div class="btn-group w-50">
										<button
											class="btn bg-light d-flex border-secondary pr-4 pl-3 w-25"
											disabled id="filter-btn">&nbsp;To&nbsp;date</button>
										<input type="date" name="toDate" id="toDate"
											class="form-control" value="${booking.endContractDeadline}">
									</div></td>

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