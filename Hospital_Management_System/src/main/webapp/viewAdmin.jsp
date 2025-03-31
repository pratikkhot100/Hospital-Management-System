<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Admin Page</title>
<%@ include file="../component/allcss.jsp"%>
<%@ include file="../component/ViewAdminCSS.JSP"%>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><i
				class="fa-solid fa-house-medical"></i> Global Hospital</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item" style="margin-right: 10px;"><a
						class="btn btn-warning" aria-current="page" href="ViewReview.jsp">View
							Feedback</a></li>
					<li class="nav-item"><a class="btn btn-primary"
						aria-current="page" href="index.jsp">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Admin Page Content -->
	<div class="container">

		<!-- First Row -->
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<h4>User Records</h4>
					<a href="#">Browse User Information</a>
					<button onclick="window.location.href='viewSignup.jsp'">View
						User Details</button>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<h4>Appointments Records</h4>
					<a href="#">Check Appointment Records</a>
					<button onclick="window.location.href='viewAppointment.jsp'">View
						Appointments</button>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<h4>Doctor Profiles</h4>
					<a href="#">Browse Doctor Profiles</a>
					<button onclick="window.location.href='viewDoctor.jsp'">View
						Doctor Details</button>
				</div>
			</div>
		</div>

		<!-- Second Row (Center Last Two Cards) -->
		<div class="row center-cards">
			<div class="col-md-4">
				<div class="card">
					<h4>New Doctor Registration</h4>
					<a href="#">Register a New Doctor</a>
					<button onclick="window.location.href='newDoctorAdd.jsp'">Register
						Doctor</button>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<h4>New Appointment Scheduling</h4>
					<a href="#">Schedule a New Appointment</a>
					<button onclick="window.location.href='appointment2.jsp'">Schedule
						Appointment</button>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<h4>Dashboard Overview</h4>
					<a href="#">Manage Appointment, Doctor, User and Patient</a>
					<button onclick="window.location.href='TotalDashboard.jsp'">Open
						Dashboard</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>