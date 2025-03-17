<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="conn.jsp"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Global Hospital</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

<%@include file="../component/allcss.jsp"%>
<style type="text/css">
/* Add color transition effects to cards */
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
}

.paint-card:hover {
	transform: scale(1.05); /* Slightly enlarge the card on hover */
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
	/* Make shadow more prominent */
	background-color: #f0f8ff; /* Light blue background on hover */
}

.paint-card.active {
	background-color: #d3f9d8; /* Light green when active */
	border: 2px solid #4CAF50; /* Green border when active */
}

.navbar-nav .nav-item .nav-link {
	transition: 0.3s;
	color: white; /* Default text color */
}

.navbar-nav .nav-item .nav-link:hover {
	color: #ff5733 !important; /* Change color on hover */
	background-color: rgba(255, 87, 51, 0.2); /* Background effect */
	border-radius: 5px;
}

/* Card text color transition */
.paint-card .card-body p {
	transition: color 0.3s;
}

.paint-card:hover .card-body p {
	color: #007bff; /* Blue color for text on hover */
}

.paint-card:active .card-body p {
	color: #d9534f; /* Red color for text when active */
}

/* Specific card styles for hover */
.paint-card:hover .card-body {
	background-color: #eaf7ff;
	/* Slight light blue background for the content */
}

/* Add smooth transitions to other card elements */
.card-body {
	transition: background-color 0.3s, color 0.3s;
}

/* Additional hover effects for doctor images */
.card img {
	transition: transform 0.3s ease-in-out;
}

.card:hover img {
	transform: scale(1.1); /* Slight zoom effect on image hover */
}

.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
/* General modal styling */
.modal-content {
    border: none;
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    overflow: hidden;
}

.modal-header {
    background: linear-gradient(135deg, #0062cc, #0096ff);
    padding: 20px;
    border: none;
    color: white;
}

.modal-title {
    font-weight: 600;
}

.modal-body {
    padding: 30px;
}

.btn-close {
    filter: brightness(0) invert(1);
}

.form-control {
    padding: 12px 15px;
    border-radius: 10px;
    border: 2px solid #eee;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: #0062cc;
    box-shadow: none;
}

.input-group-text {
    border: none;
    background: transparent;
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    z-index: 4;
    color: #666;
}

.input-group {
    position: relative;
}

.btn-login {
    padding: 12px 20px;
    background: linear-gradient(135deg, #0062cc, #0096ff);
    border: none;
    border-radius: 10px;
    font-weight: 500;
    width: 100%;
    transition: all 0.3s ease;
}

.btn-login:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0, 98, 204, 0.3);
}

.social-login {
    display: flex;
    gap: 10px;
    margin-top: 20px;
}

.btn-social {
    flex: 1;
    padding: 12px;
    border-radius: 10px;
    border: 2px solid #eee;
    background: white;
    transition: all 0.3s ease;
}

.btn-social:hover {
    background: #f8f9fa;
    transform: translateY(-2px);
}

.btn-social i {
    margin-right: 10px;
}

.divider {
    text-align: center;
    margin: 20px 0;
    position: relative;
}

.divider::before {
    content: '';
    position: absolute;
    left: 0;
    top: 50%;
    width: 45%;
    height: 1px;
    background: #eee;
}

.divider::after {
    content: '';
    position: absolute;
    right: 0;
    top: 50%;
    width: 45%;
    height: 1px;
    background: #eee;
}

.divider span {
    background: white;
    padding: 0 10px;
    color: #666;
    font-size: 0.9rem;
}

.form-check {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 15px 0;
}

.password-toggle {
    cursor: pointer;
}

.register-link {
    text-align: center;
    margin-top: 20px;
    font-size: 0.9rem;
}

input[type="text"], input[type="password"] {
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 100%;
	box-sizing: border-box;
}

input[type="text"]:focus, input[type="password"]:focus {
	border-color: #007bff;
	outline: none;
}

input[type="submit"] {
	background-color: #007bff;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

.btn-close {
	background-color: transparent;
	border: none;
	font-size: 1.5rem;
}

.btn-close:focus {
	outline: none;
}

@media ( max-width : 768px) {
	.modal-dialog {
		max-width: 90%;
	}
}
</style>
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
				<li class="nav-item"><a class="nav-link" href="#about">About</a></li>
				<li class="nav-item"><a class="nav-link" href="#doctor">Top Specialist</a></li>
				<li class="nav-item"><a class="nav-link" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#loginModal">Login</a></li>
				<li class="nav-item"><a class="nav-link" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#signupModal">SignUp</a></li>
			</ul>
		</div>
	</div>
</nav>
<!--  navbar end -->

<!--  MODEL START -->

<!-- Modal -->
<div class="container">
  <div class="modal fade" id="loginModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Login</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <form>
            <div class="mb-3">
              <label class="form-label">Email address</label>
              <div class="input-group">
                <input type="email" name="email" class="form-control" placeholder="Enter email id" required>
                <span class="input-group-text">
                  </span>
              </div>
            </div>
            <div class="mb-3">
              <label class="form-label">Password</label>
              <div class="input-group">
                <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
                <span class="input-group-text password-toggle">
                  </span>
              </div>
            </div>

            <div class="form-check">
              <a href="forgot_password.jsp" class="text-decoration-none">Forgot Password?</a>
            </div>
            <button type="submit" class="btn btn-login text-white">Sign In</button>
            <div class="register-link">
             <a class="nav-link" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#signupModal"><span style="color: black;">Create an Account  </span>Register Now</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

    <% 
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email != null && password != null) {
            try {
            	// Check user
            	String queryUser = "SELECT * FROM registration WHERE Email_id = ? AND password = ?";
            	PreparedStatement psmtUser = conn.prepareStatement(queryUser);
            	psmtUser.setString(1, email);
            	psmtUser.setString(2, password);
            	ResultSet rsUser = psmtUser.executeQuery();

            	// Check doctor
            	String queryDoctor = "SELECT * FROM doctor WHERE Email_id = ? AND Password = ?";
            	PreparedStatement psmtDoctor = conn.prepareStatement(queryDoctor);
            	psmtDoctor.setString(1, email);  // Corrected line
            	psmtDoctor.setString(2, password); // Corrected line
            	ResultSet rsDoctor = psmtDoctor.executeQuery();

            	// Check admin
            	String queryAdmin = "SELECT * FROM users WHERE Email_id = ? AND password = ?";
            	PreparedStatement psmtAdmin = conn.prepareStatement(queryAdmin);
            	psmtAdmin.setString(1, email);  // Corrected line
            	psmtAdmin.setString(2, password);  // Corrected line
            	ResultSet rsAdmin = psmtAdmin.executeQuery();

                // Check if the user is a match in any of the tables
                if (rsUser.next()) {
                    // If it's a user
                    out.println("<script>");
                    out.println("alert('Login Successful Redirecting To Your Dashboard. ✅ All fields are required. Please complete the form before proceeding ');");
                    out.println("window.location='appointment.jsp';");
                    out.println("</script>");
                } else if (rsDoctor.next()) {
                    // If it's a doctor
                    out.println("<script>");
                    out.println("alert('Welcome, Doctor Redirecting To Your Dashboard. ✅');");
                    out.println("window.location='ViewAppointmentDoctor.jsp';");
                    out.println("</script>");
                } else if (rsAdmin.next()) {
                    // If it's an admin
                    out.println("<script>");
                    out.println("alert('Welcome, Admin Redirecting To The Admin Panel. ✅');");
                    out.println("window.location='viewAdmin.jsp';");
                    out.println("</script>");
                } else {
                    // If no match found
                    out.println("<script>");
                    out.println("alert('Invalid Credentials. Please Check your Email and Password and Try again.');");
                    out.println("window.location='index.jsp';");
                    out.println("</script>");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>
<!-- MODEL END -->

<!--  Carousel -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
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
		<p id="about" class="text-center fs-2" style="font-weight: bold;">About
			Hospital</p>

		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5" style="font-weight: bold;">100% Safety</p>
								<p>Advanced security systems ensure your well-being
									dedicated to the highest standards of patient safety.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5" style="font-weight: bold;">Clean Environment</p>
								<p>Rigorous hygiene protocols for a healthy environment a
									clean and comfortable space for your healing.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5" style="font-weight: bold;">Friendly Doctors</p>
								<p>Compassionate care from experienced professionals
									approachable and caring doctors dedicated to you.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5" style="font-weight: bold;">Medical</p>
								<p>Comprehensive range of medical services available
									cutting-edge technology for advanced treatments.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<img alt="" src="img/doct3.jpg" width="390px" height="385px">
			</div>
		</div>
	</div>

	<br>

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
<div class="modal fade" id="doctorModal1" tabindex="-1" aria-labelledby="doctorModalLabel1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="doctorModalLabel1">Dr. Naresh Trehan</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <img src="img/doctor1.jpg" class="img-fluid mb-3" alt="Dr. Naresh Trehan">
        <p><strong>Specialization:</strong> Cardiovascular and Cardiothoracic Surgery</p>
        <p><strong>Experience:</strong> Over 30 years of experience in heart surgeries and specialized care.</p>
        <p><strong>Education:</strong> MD, MBBS from AIIMS, India.</p>
        <p><strong>Clinic Address:</strong> Heart Care Clinic, New York City, USA.</p>
        <p><strong>Contact:</strong> +1 (800) 123-4567</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal for Doctor 2 -->
<div class="modal fade" id="doctorModal2" tabindex="-1" aria-labelledby="doctorModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="doctorModalLabel2">Dr. Anthony Fauci</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <img src="img/doctor2.jpg" class="img-fluid mb-3" alt="Dr. Anthony Fauci">
        <p><strong>Specialization:</strong> Immunology and Infectious Diseases</p>
        <p><strong>Experience:</strong> Leading expert on infectious diseases with over 40 years of experience.</p>
        <p><strong>Education:</strong> MD from Cornell University, New York, USA.</p>
        <p><strong>Clinic Address:</strong> NIH, Bethesda, Maryland, USA.</p>
        <p><strong>Contact:</strong> +1 (800) 987-6543</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal for Doctor 3 -->
<div class="modal fade" id="doctorModal3" tabindex="-1" aria-labelledby="doctorModalLabel3" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="doctorModalLabel3">Dr. Aparna Hegde</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <img src="img/doctor3.jpg" class="img-fluid mb-3" alt="Dr. Aparna Hegde">
        <p><strong>Specialization:</strong> Obstetrics and Gynecology</p>
        <p><strong>Experience:</strong> Over 20 years of experience in women's health and childbirth.</p>
        <p><strong>Education:</strong> MD, Obstetrics & Gynecology from AIIMS, India.</p>
        <p><strong>Clinic Address:</strong> Women's Health Clinic, Mumbai, India.</p>
        <p><strong>Contact:</strong> +91 22 1234 5678</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal for Doctor 4 -->
<div class="modal fade" id="doctorModal4" tabindex="-1" aria-labelledby="doctorModalLabel4" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="doctorModalLabel4">Dr. Jennifer Ashton</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <img src="img/doctor4.jpg" class="img-fluid mb-3" alt="Dr. Jennifer Ashton">
        <p><strong>Specialization:</strong> Psychiatry and Orthopedic Surgery</p>
        <p><strong>Experience:</strong> Over 25 years of expertise in psychiatry and orthopedic care.</p>
        <p><strong>Education:</strong> MD, Psychiatry from Harvard University, USA.</p>
        <p><strong>Clinic Address:</strong> ABC Hospital, Los Angeles, USA.</p>
        <p><strong>Contact:</strong> +1 (310) 123-4567</p>
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
          <form>
            <div class="mb-3">
              <label class="form-label">Full Name</label>
              <div class="input-group">
                <input type="text" name="fullname" class="form-control" placeholder="Enter Full Name is required" required>
                <span class="input-group-text">
                  </span>
              </div>
            </div>
            <div class="mb-3">
              <label class="form-label">Email address</label>
              <div class="input-group">
                <input type="email" name="Email" class="form-control" placeholder="Enter Email ID" required>
                <span class="input-group-text">
                  </span>
              </div>
            </div>
            <div class="mb-3">
              <label class="form-label">Password</label>
              <div class="input-group">
                <input type="password" name="Password" class="form-control" placeholder="Enter your password" required>
                <span class="input-group-text password-toggle">
                  </span>
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

<%
    String fullname = request.getParameter("fullname");
    String Email = request.getParameter("Email");
    String Password = request.getParameter("Password");

    if (fullname == null || fullname.trim().isEmpty()) {
        return;
    }

    try {
        // Check if the email already exists
        String checkEmailQuery = "SELECT * FROM registration WHERE Email_id = ?";
        PreparedStatement checkEmailPsmt = conn.prepareStatement(checkEmailQuery);
        checkEmailPsmt.setString(1, Email);

        ResultSet rs = checkEmailPsmt.executeQuery();

        if (rs.next()) {
            // If the email already exists
            out.println("<script>");
            out.println("alert('Email ID already exists! Please register with a different email.');");
            out.println("window.location='index.jsp';");
            out.println("</script>");
        } else {
            // Proceed with the registration if email is not found
            String q = "INSERT INTO registration(Full_name, Email_id, password) VALUES(?, ?, ?)";
            PreparedStatement psmt = conn.prepareStatement(q);

            psmt.setString(1, fullname);
            psmt.setString(2, Email);
            psmt.setString(3, Password);

            int result = psmt.executeUpdate();

            if (result > 0) {
                out.println("<script>");
                out.println("alert('Registration Successful ✅');");
                out.println("window.location='index.jsp';");
                out.println("</script>");
            } else {
                out.println("<p>Error❌❌</p>");
            }
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<!-- MODEL END -->

    
</body>
</html>
