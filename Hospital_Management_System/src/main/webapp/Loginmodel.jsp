<%@page import="java.sql.Connection, java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="conn.jsp"%>

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
		psmtDoctor.setString(1, email); // Corrected line
		psmtDoctor.setString(2, password); // Corrected line
		ResultSet rsDoctor = psmtDoctor.executeQuery();

		// Check admin
		String queryAdmin = "SELECT * FROM admin WHERE Email_id = ? AND password = ?";
		PreparedStatement psmtAdmin = conn.prepareStatement(queryAdmin);
		psmtAdmin.setString(1, email); // Corrected line
		psmtAdmin.setString(2, password); // Corrected line
		ResultSet rsAdmin = psmtAdmin.executeQuery();

		// Check if the user is a match in any of the tables
		if (rsUser.next()) {
	// If it's a user
	out.println("<script>");
	out.println(
			"alert('Login Successful Redirecting To Your Dashboard. ✅ All fields are required. Please complete the form before proceeding ');");
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
