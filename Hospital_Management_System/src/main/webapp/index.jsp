<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="conn.jsp"%>

<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Global Hospital</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />

<%@include file="../component/allcss.jsp"%>
<%@include file="../component/indexCSS.jsp"%>
</head>
<body>
	<!--  navbar start -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house-medical"></i> Global Hospital</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="#about">About Us</a></li>
					<li class="nav-item"><a class="nav-link" href="#doctor">Specialists</a></li>
					<li class="nav-item"><a class="nav-link" href="ViewDoctorall.jsp">Doctors</a></li>
					
					<li class="nav-item"><a class="nav-link" type="button" class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#departmentsModal">Departments</a></li>
                    
                    <li class="nav-item"><a class="nav-link" type="button" class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#serviceModal">Services</a></li>
                    
                    <li class="nav-item"><a class="nav-link" type="button" class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#loginModal">Login</a></li>
					
					<li class="nav-item"><a class="nav-link" type="button" class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#signupModal">Sign Up</a></li>
				    <li class="nav-item"><a class="nav-link" href="contact_us.jsp">Contact Us</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--  navbar end -->

	<!-- Bootstrap Modal -->
	<div class="modal fade" id="serviceModal" tabindex="-1" aria-labelledby="serviceModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" style="max-width: 69%;">
			<div class="modal-content">
				<div class="modal-header bg-primary text-white">
					<h5 class="modal-title" id="serviceModalLabel">Our Services</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
					<img src="img/services.jpg" alt="Hospital Services" class="img-fluid rounded">
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Structure -->
	<div class="modal fade" id="departmentsModal" tabindex="-1"
		aria-labelledby="departmentsModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="departmentsModalLabel">Hospital Departments and Staff Management</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<!-- Departments Table -->
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Department</th>
								<th>Email</th>
								<th>Phone Number</th>
							</tr>
						</thead>
						<tbody id="departmentTable">
							<tr>
								<td>Emergency</td>
								<td><a href="mailto:emergency@globalhospital.com" target="_self">emergency@globalhospital.com</a></td>
								<td><a href="tel:+1 800-123-4567" target="_self">+1 800-123-4567</a></td>
							</tr>
							<tr>
								<td>Cardiology</td>
								<td><a href="mailto:cardiology@globalhospital.com" target="_self">cardiology@globalhospital.com</a></td>
								<td><a href="tel:+1 800-987-6543" target="_self">+1 800-987-6543</a></td>
							</tr>
							<tr>
								<td>Neurology</td>
								<td><a href="mailto:neurology@globalhospital.com" target="_self">neurology@globalhospital.com</a></td>
								<td><a href="tel:+1 800-456-7890" target="_self">+1 800-456-7890</a></td>
							</tr>
							<tr>
								<td>Orthopedics</td>
								<td><a href="mailto:orthopedics@globalhospital.com" target="_self">orthopedics@globalhospital.com</a></td>
								<td><a href="tel:+1 800-234-5678" target="_self">+1 800-234-5678</a></td>
							</tr>
							<tr>
								<td>Oncology</td>
								<td><a href="mailto:oncology@globalhospital.com" target="_self">oncology@globalhospital.com</a></td>
								<td><a href="tel:+1 800-345-6789" target="_self">+1 800-345-6789</a></td>
							</tr>
							<tr>
								<td>Pediatrics</td>
								<td><a href="mailto:pediatrics@globalhospital.com" target="_self">pediatrics@globalhospital.com</a></td>
								<td><a href="tel:+1 800-567-8901" target="_self">+1 800-567-8901</a></td>
							</tr>
							<tr>
								<td>Gynecology and Obstetrics</td>
								<td><a href="mailto:gynecology@globalhospital.com" target="_self">gynecology@globalhospital.com</a></td>
								<td><a href="tel:+1 800-678-9012" target="_self">+1 800-678-9012</a></td>
							</tr>
							<tr>
								<td>Urology</td>
								<td><a href="mailto:urology@globalhospital.com" target="_self">urology@globalhospital.com</a></td>
								<td><a href="tel:+1 800-789-0123" target="_self">+1 800-789-0123</a></td>
							</tr>
							<tr>
								<td>Radiology</td>
								<td><a href="mailto:radiology@globalhospital.com" target="_self">radiology@globalhospital.com</a></td>
								<td><a href="tel:+1 800-890-1234" target="_self">+1 800-890-1234</a></td>
							</tr>
							<tr>
								<td>Dermatology</td>
								<td><a href="mailto:dermatology@globalhospital.com" target="_self">dermatology@globalhospital.com</a></td>
								<td><a href="tel:+1 800-901-2345" target="_self">+1 800-901-2345</a></td>
							</tr>
							<tr>
								<td>Psychiatry</td>
								<td><a href="mailto:psychiatry@globalhospital.com" target="_self">psychiatry@globalhospital.com</a></td>
								<td><a href="tel:+1 800-345-6780" target="_self">+1 800-345-6780</a></td>
							</tr>
							<tr>
								<td>Anesthesiology</td>
								<td><a href="mailto:anesthesiology@globalhospital.com" target="_self">anesthesiology@globalhospital.com</a></td>
								<td><a href="tel:+1 800-123-5678" target="_self">+1 800-123-5678</a></td>
							</tr>
							<tr>
								<td>Gastroenterology</td>
								<td><a href="mailto:gastro@globalhospital.com" target="_self">gastro@globalhospital.com</a></td>
								<td><a href="tel:+1 800-654-3210" target="_self">+1 800-654-3210</a></td>
							</tr>
							<tr>
								<td>Nephrology</td>
								<td><a href="mailto:nephrology@globalhospital.com" target="_self">nephrology@globalhospital.com</a></td>
								<td><a href="tel:+1 800-234-0987" target="_self">+1 800-234-0987</a></td>
							</tr>
							<tr>
								<td>Pulmonology</td>
								<td><a href="mailto:pulmonology@globalhospital.com" target="_self">pulmonology@globalhospital.com</a></td>
								<td><a href="tel:+1 800-890-4321" target="_self">+1 800-890-4321</a></td>
							</tr>
							<tr>
								<td>Ophthalmology</td>
								<td><a href="mailto:ophthalmology@globalhospital.com" target="_self">ophthalmology@globalhospital.com</a></td>
								<td><a href="tel:+1 800-123-8901" target="_self">+1 800-123-8901</a></td>
							</tr>
							<tr>
								<td>ENT (Ear, Nose, Throat)</td>
								<td><a href="mailto:ent@globalhospital.com" target="_self">ent@globalhospital.com</a></td>
								<td><a href="tel:+1 800-345-2109" target="_self">+1 800-345-2109</a></td>
							</tr>
							<tr>
								<td>Plastic and Reconstructive Surgery</td>
								<td><a href="mailto:plasticsurgery@globalhospital.com" target="_self">plasticsurgery@globalhospital.com</a></td>
								<td><a href="tel:+1 800-987-3210" target="_self">+1 800-987-3210</a></td>
							</tr>
							<tr>
								<td>General Surgery</td>
								<td><a href="mailto:generalsurgery@globalhospital.com" target="_self">generalsurgery@globalhospital.com</a></td>
								<td><a href="tel:+1 800-654-9870" target="_self">+1 800-654-9870</a></td>
							</tr>
							<tr>
								<td>Medical Records and Billing</td>
								<td><a href="mailto:billing@globalhospital.com" target="_self">billing@globalhospital.com</a></td>
								<td><a href="tel:+1 800-567-4321" target="_self">+1 800-567-4321</a></td>
							</tr>
							<tr>
								<td>HR and Staff Management</td>
								<td><a href="mailto:hr@globalhospital.com" target="_self">hr@globalhospital.com</a></td>
								<td><a href="tel:+1 800-789-6543" target="_self">+1 800-789-6543</a></td>
							</tr>
							<tr>
								<td>Housekeeping and Maintenance</td>
								<td><a href="mailto:housekeeping@globalhospital.com" target="_self">housekeeping@globalhospital.com</a></td>
								<td><a href="tel:+1 800-890-7654" target="_self">+1 800-890-7654</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!--  MODEL START -->

	<!-- Login Modal -->
	<div class="container">
		<div class="modal fade" id="loginModal" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Login</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						<form action="Loginmodel.jsp" method="POST">
							<div class="mb-3">
								<label class="form-label">Email address</label>
								<div class="input-group">
									<input type="email" name="email" class="form-control" placeholder="Enter email id" required> 
										<span class="input-group-text"> </span>
								</div>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label>
								<div class="input-group">
									<input type="password" name="password" class="form-control" placeholder="Enter your password" required> 
									<span class="input-group-text password-toggle"> </span>
								</div>
							</div>
							<div class="form-check">
								<a href="forgot_password.jsp" class="text-decoration-none">Forgot Password?</a>
							</div>
							<button type="submit" class="btn btn-login text-white">Sign In</button>
							<div class="register-link">
								<a class="nav-link" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#signupModal">
								<span style="color: black;">Create an Account </span>Register Now</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- MODEL END -->

	<!--  Carousel -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/hos.jpg" class="d-block w-100" alt="..." height="576px">
			</div>
			<div class="carousel-item">
				<img src="img/Appointment.jpg" class="d-block w-100" alt="..." height="576px">
			</div>
			<div class="carousel-item">
				<img src="img/hos3.jpg" class="d-block w-100" alt="..." height="576px">
			</div>
			<div class="carousel-item">
				<img src="img/hos2.jpg" class="d-block w-100" alt="..." height="576px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> 
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- MODEL END -->

	<div class="container p-3">
		<p id="about" class="text-center fs-2" style="font-weight: bold;">About Hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5" style="font-weight: bold;">100% Safety</p>
								<p>Advanced security systems ensure your well-being dedicated to the highest standards of patient safety.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5" style="font-weight: bold;">Clean Environment</p>
								<p>Rigorous hygiene protocols for a healthy environment a clean and comfortable space for your healing.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5" style="font-weight: bold;">Friendly Doctors</p>
								<p>Compassionate care from experienced professionals approachable and caring doctors dedicated to you.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5" style="font-weight: bold;">Medical</p>
								<p>Comprehensive range of medical services available cutting-edge technology for advanced treatments.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5" style="font-weight: bold;">Experienced Doctors</p>
								<p>Our highly skilled and friendly medical professionals provide personalized care supportive experience for every patient.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5" style="font-weight: bold;">Uncompromising Safety</p>
								<p>Our advanced security systems and stringent protocols prioritize patient well-being, ensuring a secure and reliable
								   health care environment. .</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5" style="font-weight: bold;">Comfortable Environment</p>
								<p>We maintain rigorous hygiene protocols to create a clean, safe, and comfortable space for healing and recovery.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5" style="font-weight: bold;">Cutting-Edge Medical Services</p>
								<p>We offer a comprehensive range of treatments, integrating the latest technology and innovations in modern health care.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<img alt="" src="img/about.jpg" width="427px" height="727px">
			</div>
		</div>
	</div>


	<div class="container p-2">
		<p id="doctor" class="text-center fs-2" style="font-weight: bold;">Top Specialist Doctors</p>
		<div class="row">
			<!-- Doctor 1 -->
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doctor1.jpg" width="250px" height="300px" data-bs-toggle="modal" data-bs-target="#doctorModal1" alt="Dr. Naresh Trehan">
						<p class="fs-bold fs-5" style="font-weight: bold;">Dr. Naresh Trehan</p>
						<p class="fs-7">(Cardiovascular and Cardiothoracic Surgery Specialist)</p>
					</div>
				</div>
			</div>
			<!-- Doctor 2 -->
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doctor2.jpg" width="250px" height="300px" data-bs-toggle="modal" data-bs-target="#doctorModal2" alt="Dr. Anthony Fauci">
						<p class="fs-bold fs-5" style="font-weight: bold;">Dr. Anthony Fauci</p>
						<p class="fs-7">(Immunology and Infectious Diseases Specialist)</p>
					</div>
				</div>
			</div>
			<!-- Doctor 3 -->
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doctor3.jpg" width="250px" height="300px" data-bs-toggle="modal" data-bs-target="#doctorModal3" alt="Dr. Aparna Hegde">
						<p class="fs-bold fs-5" style="font-weight: bold;">Dr. Aparna Hegde</p>
						<p class="fs-7">(Obstetrician and Gynecologist OB/GYNs Specialist)</p>
					</div>
				</div>
			</div>
			<!-- Doctor 4 -->
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doctor4.jpg" width="250px" height="300px" data-bs-toggle="modal" data-bs-target="#doctorModal4" alt="Dr. Jennifer Ashton">
						<p class="fs-bold fs-5" style="font-weight: bold;">Dr. Jennifer Ashton</p>
						<p class="fs-7">(Psychiatrist and Orthopedic Surgeon Specialist)</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for Doctor 1 -->
	<div class="modal fade" id="doctorModal1" tabindex="-1"
		aria-labelledby="doctorModalLabel1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="doctorModalLabel1">Dr. Naresh Trehan</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<img src="img/doctor1.jpg" class="img-fluid mb-3" alt="Dr. Naresh Trehan">
					<p> <strong>Specialization:</strong> Cardiovascular and Cardiothoracic Surgery </p>
					<p> <strong>Experience:</strong> Over 30 years of experience in heart surgeries and specialized care. </p>
					<p> <strong>Education:</strong> MD, MBBS from AIIMS, India. </p>
					<p> <strong>Clinic Address:</strong> Heart Care Clinic, New York City,USA. </p>
					<p> <strong>Contact:</strong> +1 (800) 123-4567 </p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for Doctor 2 -->
	<div class="modal fade" id="doctorModal2" tabindex="-1"
		aria-labelledby="doctorModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="doctorModalLabel2">Dr. Anthony Fauci</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<img src="img/doctor2.jpg" class="img-fluid mb-3" alt="Dr. Anthony Fauci">
					<p> <strong>Specialization:</strong> Immunology and Infectious Diseases </p>
					<p> <strong>Experience:</strong> Leading expert on infectious diseases with over 40 years of experience. </p>
					<p> <strong>Education:</strong> MD from Cornell University, New York, USA. </p>
					<p> <strong>Clinic Address:</strong> NIH, Bethesda, Maryland, USA. </p>
					<p> <strong>Contact:</strong> +1 (800) 987-6543 </p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for Doctor 3 -->
	<div class="modal fade" id="doctorModal3" tabindex="-1"
		aria-labelledby="doctorModalLabel3" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="doctorModalLabel3">Dr. Aparna Hegde</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<img src="img/doctor3.jpg" class="img-fluid mb-3" alt="Dr. Aparna Hegde">
					<p> <strong>Specialization:</strong> Obstetrics and Gynecology </p>
					<p> <strong>Experience:</strong> Over 20 years of experience in women's health and childbirth. </p>
					<p> <strong>Education:</strong> MD, Obstetrics and Gynecology from AIIMS, India. </p>
					<p> <strong>Clinic Address:</strong> Women's Health Clinic, Mumbai, India. </p>
					<p> <strong>Contact:</strong> +91 22 1234 5678 </p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for Doctor 4 -->
	<div class="modal fade" id="doctorModal4" tabindex="-1"
		aria-labelledby="doctorModalLabel4" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="doctorModalLabel4">Dr. Jennifer Ashton</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<img src="img/doctor4.jpg" class="img-fluid mb-3" alt="Dr. Jennifer Ashton">
					<p> <strong>Specialization:</strong> Psychiatry and Orthopedic Surgery </p>
					<p> <strong>Experience:</strong> Over 25 years of expertise in psychiatry and orthopedic care. </p>
					<p> <strong>Education:</strong> MD, Psychiatry from Harvard University, USA. </p>
					<p> <strong>Clinic Address:</strong> ABC Hospital, Los Angeles, USA. </p>
					<p> <strong>Contact:</strong> +1 (310) 123-4567 </p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>

	<%@include file="component/footer.jsp"%>

	<!-- SignUp Modal -->
	<div class="container">
		<div class="modal fade" id="signupModal" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Sign Up</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						<form action="SignUpmodel.jsp" method="POST">
							<div class="mb-3">
								<label class="form-label">Full Name</label>
								<div class="input-group">
									<input type="text" name="fullname" class="form-control" placeholder="Enter Full Name is required" required> 
									<span class="input-group-text"> </span>
								</div>
							</div>
							<div class="mb-3">
								<label class="form-label">Email address</label>
								<div class="input-group">
									<input type="email" name="Email" class="form-control" placeholder="Enter Email ID" required> 
									<span class="input-group-text"> </span>
								</div>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label>
								<div class="input-group">
									<input type="password" name="Password" class="form-control" placeholder="Enter your password" required> 
									<span class="input-group-text password-toggle"> </span>
								</div>
							</div>
							<br>
							<button type="submit" class="btn btn-login text-white">Create Account</button>
							<br>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- MODEL END -->

	<!-- Bootstrap 5 JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>