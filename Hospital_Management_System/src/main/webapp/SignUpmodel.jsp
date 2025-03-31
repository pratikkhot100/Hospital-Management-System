<%@page import="java.sql.Connection, java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="conn.jsp"%>

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