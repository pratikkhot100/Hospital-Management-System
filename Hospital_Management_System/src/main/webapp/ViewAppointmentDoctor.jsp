<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="conn.jsp"%>

<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<title>View Appointment</title>
<%@ include file="../component/allcss.jsp"%>
<%@ include file="../component/ViewAppointmentDoctorCSS.jsp"%>
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
						class="btn btn-secondary" href="viewReviewDoctor.jsp">View
							Feedback</a></li>
					<li class="nav-item" style="margin-right: 10px;"><a
						class="btn btn-warning" href="ViewDoctorslist.jsp">View
							Doctors</a></li>
					<li class="nav-item"><a class="btn btn-primary"
						href="index.jsp">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Search Box -->
	<div class="search-box">
		<form action="ViewAppointmentDoctor.jsp" method="post">
			<input type="text" name="searchQuery"
				placeholder="Search doctor or patient name" required>
			<button type="submit">Search</button>
		</form>
	</div>

	<%
	// Get the search query from the form submission
	String searchQuery = request.getParameter("searchQuery");

	// Query for appointments based on search query
	String query;
	if (searchQuery != null && !searchQuery.isEmpty()) {
		query = "SELECT * FROM appointment WHERE Full_name LIKE ? OR Specialist LIKE ?";
	} else {
		query = "SELECT * FROM appointment";
	}

	try (PreparedStatement psmt = conn.prepareStatement(query)) {
		// If search query is provided, apply LIKE clause with wildcards
		if (searchQuery != null && !searchQuery.isEmpty()) {
			psmt.setString(1, "%" + searchQuery + "%");
			psmt.setString(2, "%" + searchQuery + "%");
		}

		try (ResultSet rs = psmt.executeQuery()) {
			boolean foundAppointment = false;

			// Display header
			out.println("<h1>Patient Details</h1>");
			out.println("<div class='table-wrapper'>");
			out.println("<table>");
			out.println("<tr>");
			out.println("<th>ID</th>");
			out.println("<th>Patient Name</th>");
			out.println("<th>Email ID</th>");
			out.println("<th>Mobile No</th>");
			out.println("<th>Specialist</th>");
			out.println("<th>Appointment Date</th>");
			out.println("<th>Appointment Time</th>");
			out.println("</tr>");

			// Display rows from result set
			while (rs.next()) {
		foundAppointment = true;
		int appointmentId = rs.getInt("id");
		String fullName = rs.getString("Full_name");
		String emailid = rs.getString("Email_id");
		String mobileNo = rs.getString("Mobile_no");
		String specialist = rs.getString("Specialist");
		String appointmentDate = rs.getDate("Appointment_date").toString();
		String appointmentTime = rs.getTime("Appointment_time").toString();

		out.println("<tr>");
		out.println("<td>" + appointmentId + "</td>");
		out.println("<td>" + fullName + "</td>");
		out.println("<td>" + emailid + "</td>");
		out.println("<td>" + mobileNo + "</td>");
		out.println("<td>" + "Dr. " + specialist + "</td>");
		out.println("<td>" + appointmentDate + "</td>");
		out.println("<td>" + appointmentTime + "</td>");
		out.println("</tr>");
			}

			// If no appointments found
			if (!foundAppointment) {
		out.println("<tr><td colspan='7' style='color:red;'><center>No appointments found.</center></td></tr>");
			}

			out.println("</table>");
			out.println("</div>");

		} catch (Exception e) {
			out.println("<p>Error: " + e.getMessage() + "</p>");
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>