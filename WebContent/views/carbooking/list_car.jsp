<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Car list</title>
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
					<span class="fas fa-shopping-cart"></span>Booking Office manager
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
					<span class="fas fa-map-marker-alt"></span> Parking lot manager
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

					<form action="<%=request.getContextPath()%>/listcar" method="POST"
						class="form-group">
						<div class="d-flex justify-content-end">
							<div class="btn-group mr-4 w-25">
								<button class="btn bg-light" disabled id="btn-search">
									<span class="fas fa-search"></span>
								</button>
								<input type="text" name="search" id="search"
									class="form-control" placeholder="Car search">
							</div>
							<div class="btn-group">
								<button class="btn bg-light d-flex" disabled id="filter-btn">
									<span class="fas fa-filter mt-2" style="font-size: 10px;"></span>
									&nbsp;Filter&nbsp;By
								</button>
								<select name="filter-option"
									class="custom-select btn btn-outline-light">
									<option value="licencePlate">Licence plate</option>
									<option value="company">Company</option>
									<option value="carType">Car Type</option>
								</select>
							</div>
							<button class="btn btn-info ml-3" type="submit" value="search">Search</button>

						</div>
						<table class="table table-bordered table-striped mt-3" id="table">
							<thead class="thead-light">
								<tr>
									<th>Licence plate</th>
									<th>Car tpye</th>
									<th>Car color</th>
									<th>Company</th>
									<th>Parking lot</th>
									<th>Action</th>
								</tr>
							</thead>
							<c:forEach items="${car}" var="car">
								<tr class="contentPage">
									<td>${car.licensePlate}</td>
									<td>${car.carType}</td>
									<td>${car.carColor}</td>
									<td>${car.company}</td>
									<td>${car.parkName}</td>
									<td><a
										href="<%=request.getContextPath()%>/editcar?liecensePl=${car.licensePlate}"><span
											class="fas fa-edit" style="font-size: 12px;"></span> Edit</a>&emsp;
										<a
										href="<%=request.getContextPath()%>/delete_car?liecensePl=${car.licensePlate}"
										onclick="return deleteCar()"><span
											class="fas fa-trash-alt" style="font-size: 12px;"></span>
											Delete</a></td>

								</tr>
							</c:forEach>
						</table>
						<ul id="pagination">
						</ul>
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