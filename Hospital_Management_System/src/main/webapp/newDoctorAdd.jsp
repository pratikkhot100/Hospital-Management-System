<%@ page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="conn.jsp"%>

<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<title>Doctor Registration Page</title>
<!-- External Bootstrap CSS (you can use CDN if you don't have it locally) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<%@ include file="../component/allcss.jsp"%>
<%@ include file="../component/newDoctorAddCSS.jsp"%>
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
					<li class="nav-item"><a class="btn btn-dark"
						aria-current="page" href="viewAdmin.jsp">BACK</a></li>
				</ul>
			</div>
		</div>
	</nav>

<br><br>
	<!-- Main content section -->
	<div class="main-content">
		<div class="container">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-4 text-center" style="font-weight: bold;">Doctor
						Registration</p>

					<form action="newDoctorAdd.jsp" method="post" autocomplete="off">
						<!-- Full Name Field -->
						<div class="mb-3">
							<label class="form-label">Enter Full Name</label> <input
								type="text" name="fullName" class="form-control"
								placeholder="Full Name" required>
						</div>

						<!-- Email Field -->
						<div class="mb-3">
							<label class="form-label">Enter Email</label> <input type="email"
								name="email" class="form-control" placeholder="Email" required>
						</div>

						<!-- Password Field -->
						<div class="mb-3">
							<label class="form-label">Enter Password</label> <input
								type="password" name="password" class="form-control"
								placeholder="Password" required>
						</div>

						<!-- Contact Number Field -->
						<div class="mb-3">
							<label class="form-label">Enter Contact Number</label> <input
								type="text" name="contactNumber" class="form-control"
								placeholder="Contact Number" required>
						</div>

						<!-- Specialization Field -->
						<div class="mb-3">
							<label class="form-label">Specialization</label> <input
								type="text" name="specialization" class="form-control"
								placeholder="Specialization" required>
						</div>

						<!-- Date Field -->
						<div class="mb-3">
							<label class="form-label">Date</label> <input type="date"
								name="date" class="form-control" name="date" required
								min="<%=java.time.LocalDate.now().toString()%>"
								max="<%=java.time.LocalDate.now().toString()%>">
						</div>

						<!-- Submit Button -->
						<button type="submit">Register</button>
					</form>

					<%
					String fullName = request.getParameter("fullName");
					String email = request.getParameter("email");
					String password = request.getParameter("password");
					String contactNumber = request.getParameter("contactNumber");
					String specialization = request.getParameter("specialization");
					String date = request.getParameter("date");

					// Process form data after submission
					if (fullName != null && !fullName.trim().isEmpty() &&
                        email != null && !email.trim().isEmpty() && email.endsWith("@globalhospital.com") &&
   					    password != null && !password.trim().isEmpty() &&
                        contactNumber != null && !contactNumber.trim().isEmpty() &&
                        specialization != null && !specialization.trim().isEmpty()) {
						try {
							// Check if the email already exists
							String checkEmailQuery = "SELECT * FROM doctor WHERE Email_id = ?";
							PreparedStatement checkEmailPsmt = conn.prepareStatement(checkEmailQuery);
							checkEmailPsmt.setString(1, email);

							ResultSet rs = checkEmailPsmt.executeQuery();

							if (rs.next()) {
						// If email already exists, show an alert and stop registration
						out.println("<script>");
						out.println("alert('Email ID already exists! Please register with a different email.');");
						out.println("window.location='newDoctorAdd.jsp';");
						out.println("</script>");
							} else {
						// If email does not exist, proceed with registration
						String query = "INSERT INTO doctor (Full_name, Email_id, Password, Mobile_no, Specialization, Registration_date) VALUES (?, ?, ?, ?, ?, ?)";
						PreparedStatement psmt = conn.prepareStatement(query);

						psmt.setString(1, fullName);
						psmt.setString(2, email);
						psmt.setString(3, password);
						psmt.setString(4, contactNumber);
						psmt.setString(5, specialization);
						psmt.setString(6, date); // Corrected index for the date

						int result = psmt.executeUpdate();

						if (result > 0) {
							out.println("<script>");
							out.println("alert('New Doctor Successful Registered. ✅');");
							out.println("window.location='newDoctorAdd.jsp';");
							out.println("</script>");
						} else {
							out.println("<p class='alert-message text-danger'>Failed to register the doctor ❌❌</p>");
						}
							}
						} catch (Exception e) {
							out.println("<p class='alert-message text-danger'>Error: " + e.getMessage() + "</p>");
						}
					}
					%>
				</div>
			</div>
		</div>
	</div>

	<!-- External Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>