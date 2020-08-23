<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List</title>
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
			<span class="navbar-brand"> <span class="fas fa-user-friends"></span>
				Employee
			</span>
			<div class="my-3 my-lg-0 text-primary">
				<span class="mr-sm-4">Welcome: ${admin.employeeName} </span> <span
					class="my-3 my-sm-0"> <span class="fas fa-sign-out-alt"></span>
					<a href="<%=request.getContextPath()%>/login"> Logout</a>
				</span>
			</div>
		</nav>

		<div class="d-flex h-100">
			<div class="col-md-2 bg-light h-100 flex-grow-1 text-primary">
				<p>
					<span class="fas fa-tachometer-alt"></span> Dashboard
				</p>
				<hr>
				<p>
					<span class="fas fa-chart-bar"></span> Employee Manager
				</p>
				<p>
					<span class="fas fa-list"></span><a
						href="<%=request.getContextPath()%>/list_employee">
						Employee list</a>
				</p>
				<p>
					<span class="fas fa-plus"></span><a
						href="<%=request.getContextPath()%>/add_employee">
						Add employee</a>
				</p>

			</div>

			<div class="col-md-10 border border-success">
				<div class="p-4">
					<h2>List Employee</h2>
					<hr>

					<form action="<%=request.getContextPath()%>/list_employee" method="post" class="form-group">
						<div class="d-flex justify-content-end">
							<div class="btn-group mr-4">
								<button class="btn bg-light" disabled id="btn-search">
									<span class="fas fa-search"></span>
								</button>
								<input type="text" name="search" id="search" class="form-control"
									placeholder="User search">
							</div>
							<div class="btn-group">
								<button class="btn bg-light d-flex" disabled id="filter-btn">
									<span class="fas fa-filter fs-xs mt-2" style="font-size: 10px;"></span>
									&nbsp;Filter&nbsp;By 
								</button>
								<select name="filter-option"
									class="custom-select btn btn-outline-light">
									<option value="Name">Name</option>
									<option value="Department">Department</option>
								</select>
							</div>
							<button class="btn btn-info ml-3" type="submit" value="search" name="search">Search</button>

						</div>
						<table class="table table-bordered table-striped mt-3" id="table">
							<thead class="thead-light">
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Date of Birth</th>
									<th>Address</th>
									<th>Phone number</th>
									<th>Email</th>
									<th>Department</th>
									<th>Action</th>
								</tr>
							</thead>
							<c:forEach items="${employee}" var="employee">
							<tr class="contentPage">
									<td>${employee.employeeId}</td>
									<td>${employee.employeeName}</td>
									<td>${employee.employeeBirthdate}</td>
									<td>${employee.employeeAddress}</td>
									<td>${employee.employeePhone}</td>
									<td>${employee.employeeEmail}</td>
									<td>${employee.department}</td>
									<td><a href="<%=request.getContextPath()%>/view_employee?employeeId=${employee.employeeId}"><span class="fas fa-eye" style="font-size: 12px;"></span> view</a></td>
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
		$(function(){
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
			totalPages: iTotalPages,
			visiblePages: btnPage,
			onPageClick: function (event, page) {
				 console.info(page); 
				showPage(page);
			}
		});
			console.info(obj.data());
	});
	</script>
</body>
</html>