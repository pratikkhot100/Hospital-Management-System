<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ include file="conn.jsp"%>

<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Global Hospital</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
<!-- Leaflet CSS -->
<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />

<%@ include file="../component/allcss.jsp"%>
<%@ include file="../component/contact_usCSS.jsp"%>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><i
				class="fa-solid fa-house-medical"></i> Global Hospital</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="btn btn-dark" aria-current="page" href="index.jsp">BACK</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<br>
	<div id="contact" class="container my-3">
		<h1 class="text-center mb-3">Contact Us</h1>
		<div class="row">
			<div class="col-md-6">
				<div id="map"></div>
			</div>
			<div class="col-md-6">
				<h3>We would love to hear from you!</h3>
				<p>If you have any inquiries, feedback, or need assistance, feel free to reach out to us. Our team is dedicated to providing the best care and services for you.</p>
				<form action="contact_us.jsp" method="post">
					<div class="mb-2">
						<label for="name" class="form-label">Full Name</label> 
						<input type="text" class="form-control" id="name" name="name" placeholder="Enter your full name" required>
					</div>
					<div class="mb-2">
						<label for="email" class="form-label">Email Address</label> 
						<input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
					</div>
					<div class="mb-2">
						<label for="message" class="form-label">Your Message</label>
						<textarea class="form-control" id="message" name="message" rows="4" placeholder="Please enter your message here" required
						 maxlength="500"></textarea>
						<small class="form-text text-muted">Max 500 characters</small>
					</div>
					<button type="submit" class="btn btn-primary mt-2">Submit</button>
				</form>

				<%
				// Handling form submission with JDBC
				if ("POST".equalsIgnoreCase(request.getMethod())) {
					// Step 1: Get form data
					String fullName = request.getParameter("name");
					String email = request.getParameter("email");
					String message = request.getParameter("message");

					// Step 2: Establish JDBC connection and insert data into database
					Connection conn1 = null;
					PreparedStatement stmt = null;
					String url = "jdbc:mysql://localhost:3306/Hospital"; // Change with your database details
					String dbUser = "root"; // Your MySQL username
					String dbPassword = "password"; // Your MySQL password

					try {
						// Step 3: Load JDBC driver (optional for newer versions of MySQL)
						Class.forName("com.mysql.cj.jdbc.Driver");

						// Step 4: Establish connection
						conn = DriverManager.getConnection(url, dbUser, dbPassword);

						// Step 5: Prepare the SQL query
						String sql = "INSERT INTO contact_submissions (full_name, email, message) VALUES (?, ?, ?)";
						stmt = conn.prepareStatement(sql);
						stmt.setString(1, fullName);
						stmt.setString(2, email);
						stmt.setString(3, message);

						// Step 6: Execute the query
						int result = stmt.executeUpdate();

						if (result > 0) {
					out.println("<script>");
					out.println("alert('Thank you for your message');");
					out.println("window.location='contact_us.jsp';");
					out.println("</script>");
						} else {
					out.println("<script>");
					out.println("alert('There was an error submitting your message. Please try again later.');");
					out.println("window.location='contact_us.jsp';");
					out.println("</script>");
						}
					} catch (Exception e) {
						e.printStackTrace();
						out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
					} finally {
						// Close the resources
						try {
					if (stmt != null)
						stmt.close();
					if (conn != null)
						conn.close();
						} catch (SQLException e) {
					e.printStackTrace();
						}
					}
				}
				%>
			</div>
		</div>
	</div>
	<br>

	<%@ include file="../component/footer.jsp"%>

	<!-- Leaflet JS -->
	<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var map = L.map('map').setView([ 19.0760, 72.8777 ], 12); // Mumbai coordinates

			L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
				attributionControl : false
			}).addTo(map);

			L.marker([ 19.0760, 72.8777 ]).addTo(map)
					.bindPopup('Mumbai, India').openPopup();
		});
	</script>

	<!-- Bootstrap JS (optional) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>