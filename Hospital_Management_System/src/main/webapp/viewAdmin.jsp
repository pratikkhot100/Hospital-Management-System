<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Admin Page</title>

<%@ include file="../component/allcss.jsp"%>

<style>
/* Global Styles */
body {
	font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    background-image: url("img/hos3.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    min-height: 100vh;
    margin: 0;
}

/* Navbar */
.navbar {
	margin-bottom: 20px;
}

/* Navbar links styling */
.navbar-nav .nav-item .nav-link {
	transition: 0.3s;
}

/* Adjust container for full height */
.container {
	max-width: 1140px;
	margin: 0 auto;
	padding: 0 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
	z-index: 10; /* Ensure content is above background */
	padding-bottom: 20px;
}

/* Row Flexbox Setup */
.row {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	gap: 20px;
	margin-top: 20px;
	width: 100%;
}

/* Center the last two cards */
.row.center-cards {
	justify-content: center;
}

/* Column Setup */
.col-md-4 {
	flex: 1 1 300px;
	margin: 10px;
	max-width: 30%;
	box-sizing: border-box;
}

/* Card Styles */
.card {
	border-radius: 12px;
	padding: 20px;
	text-align: center;
	background-color: rgba(255, 255, 255, 0.8);
	/* Transparent background */
	backdrop-filter: blur(10px);
	/* Optional: Adds a blur effect to the background behind the card */
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease, background-color
		0.3s ease;
	cursor: pointer;
	height: auto;
	width: 100%;
}

/* Hover Effect on Cards */
.card:hover {
	transform: scale(1.05) rotate(2deg);
	box-shadow: 0 20px 30px rgba(0, 0, 0, 0.2);
	background-color: rgba(240, 248, 255, 0.9);
	/* Slightly more opaque on hover */
}

/* Card Title (h4) */
.card h4 {
	color: #333;
	font-weight: bold;
	font-size: 24px;
	margin-bottom: 20px;
	transition: color 0.3s ease, transform 0.3s ease;
}

/* Hover Effect on Card Title */
.card:hover h4 {
	color: #007bff;
	transform: translateY(-5px);
}

/* Card Link */
.card a {
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
	transition: color 0.3s ease, transform 0.3s ease;
	display: block;
	margin-bottom: 15px;
}

/* Hover Effect on Link */
.card:hover a {
	color: #0056b3;
	transform: translateX(5px);
}

/* Button Styling Inside Cards */
.card button {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 14px 36px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.3s ease;
	margin-top: 20px;
}

/* Hover Effect on Button */
.card button:hover {
	background-color: #45a049;
	transform: scale(1.1);
}

/* Responsive Adjustment */
@media ( max-width : 768px) {
	.col-md-4 {
		flex: 1 1 100%;
		max-width: 100%;
	}
	.card {
		padding: 20px;
	}
	.navbar-nav .nav-item .nav-link {
		font-size: 14px;
	}
}

@media ( max-width : 576px) {
	.navbar-nav .nav-item .nav-link {
		font-size: 12px;
	}
	.card h4 {
		font-size: 20px;
	}
	.card button {
		font-size: 14px;
		padding: 12px 30px;
	}
}
</style>

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
				<li class="nav-item" style="margin-right:10px;"><a class="btn btn-warning"
						aria-current="page" href="ViewReview.jsp">View Feedback</a></li>
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
