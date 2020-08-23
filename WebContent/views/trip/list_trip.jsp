<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trip list</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/icon.css">
</head>
<body>


	<div class="h-100 d-flex flex-column">
		<nav class="navbar navbar-light bg-light py-3">
			<span class="navbar-brand"> <span class="fas fa-plane"></span>
				Trip <a style="margin-left: 210px;"
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
					<span class="fas fa-tachometer-alt"></span> Trip manager
				</p>
				<p class="pl-4">
					<span class="fas fa-list"></span><a
						href="<%=request.getContextPath()%>/listtrip"> Trip list</a>
				</p>
				<p class="pl-4">
					<span class="fas fa-plus"></span><a
						href="<%=request.getContextPath()%>/addtrip"> Add Trip</a>
				</p>
				<hr>
				<p>
					<span class="fas fa-ticket-alt"></span> Ticket manager
				</p>
				<p class="pl-4">
					<span class="fas fa-list"></span><a
						href="<%=request.getContextPath()%>/listticket"> Ticket list</a>
				</p>
			</div>

			<div class="col-md-10 border border-success">
				<div class="p-4">
					<h2>Trip List</h2>
					<hr>

					<form action="#" method="POST" class="form-group">
						<div class="d-flex justify-content-end">
							<div class="btn-group mr-4 w-25">
								<button class="btn bg-light" disabled id="btn-search">
									<span class="fas fa-search"></span>
								</button>
								<input type="text" name="search" id="search"
									class="form-control" placeholder="Trip search">
							</div>
							<div class="btn-group">
								<button class="btn bg-light d-flex" disabled id="filter-btn">
									<span class="fas fa-filter mt-2" style="font-size: 10px;"></span>
									&nbsp;Filter&nbsp;By
								</button>
								<select name="filter-option"
									class="custom-select btn btn-outline-light">
									<option value="destination">Destination</option>
									<option value="driver">Driver</option>
								</select>
							</div>
							<button class="btn btn-info ml-3" type="submit" value="search">Search</button>

						</div>
						<table class="table table-bordered table-striped mt-3" id="table">
							<thead class="thead-light">
								<tr>
									<th>No</th>
									<th>Destination</th>
									<th>Departure time</th>
									<th>Departure Date</th>
									<th>Driver</th>
									<th>Booked ticket number</th>
									<th>Action</th>
								</tr>
							</thead>
							<c:forEach items="${trip}" var="trip">
								<tr class="contentPage">
									<td>${trip.tripId}</td>
									<td>${trip.destination}</td>
									<td>${trip.departureTime}</td>
									<td>${trip.departureDate}</td>
									<td>${trip.driver}</td>
									<td>${trip.bookedTicketNumber}</td>
									<td><a
										href="<%=request.getContextPath()%>/edittrip?tripId=${trip.tripId}"><span
											class="fas fa-edit" style="font-size: 12px;"></span> Edit</a>&emsp;
										<a id="delete"
										href="<%=request.getContextPath()%>/delete_trip?tripId=${trip.tripId}"
										onclick="return deleteCar()"><span
											class="fas fa-trash-alt" style="font-size: 12px;"></span>
											Delete</a></td>

								</tr>
							</c:forEach>
						</table>
						<ul id="pagination"> </ul>
					</form>

				</div>
			</div>

		</div>
	</div>
	<script src="<%=request.getContextPath()%>/jquery/jquery-3.4.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.twbsPagination.js"></script>
	<script type="text/javascript">
		$(function() {
			var pageSize = 5;
			showPage = function(page) {
				$(".contentPage").hide();
				$(".contentPage").each(function(n) {
					if (n >= pageSize * (page - 1) && n < pageSize * page)
						$(this).show();
				});
			}
			showPage(1);
			var totalRows = document.getElementById("table").rows.length;
			var btnPage = 5;
			var iTotalPages = Math.ceil(totalRows / pageSize);

			var obj = $('#pagination').twbsPagination({
				totalPages : iTotalPages,
				visiblePages : btnPage,
				onPageClick : function(event, page) {
					console.info(page);
					showPage(page);
				}
			});
			console.info(obj.data());
		});
	</script>
	<script>
		function deleteCar() {
			return confirm("Are you sure you want to delete?");
		}
	</script>
</body>
</html>