<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp"%>

<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<title>Global Hospital</title>
<%@ include file="../component/allcss.jsp"%>
<%@ include file="../component/viewReviewDoctorCSS.jsp"%>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><i class="fa-solid fa-house-medical"></i> Global Hospital</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="btn btn-dark" aria-current="page" href="ViewAppointmentDoctor.jsp">BACK</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <!-- Search Form -->
        <div class="search-box">
            <form action="viewReviewDoctor.jsp" method="get">
                <input type="text" name="searchQuery" placeholder="Search by name or email" required>
                <button type="submit">Search</button>
            </form>
        </div>

        <%
        String searchQuery = request.getParameter("searchQuery"); // Get search query from form

        try {
            String q;

            // If a search query is provided, use LIKE clause; otherwise, select all doctors
            if (searchQuery != null && !searchQuery.isEmpty()) {
                q = "SELECT * FROM contact_submissions WHERE full_name LIKE ? OR email LIKE ?";
            } else {
                q = "SELECT * FROM contact_submissions"; // Default query to fetch all doctors
            }

            PreparedStatement psmt = conn.prepareStatement(q);

            // If searchQuery is provided, set parameters for LIKE clause
            if (searchQuery != null && !searchQuery.isEmpty()) {
                psmt.setString(1, "%" + searchQuery + "%"); // Use % for wildcard search (anywhere in the string)
                psmt.setString(2, "%" + searchQuery + "%"); // Apply the search to both Full_name and Specialization
            }

            ResultSet rs = psmt.executeQuery();
            boolean foundDoctor = false;
            out.println("<h1>User Feedback</h1>");
            out.println("<div class='table-wrapper'>"); 
            out.println("<table>");
            out.println("<tr>");
            out.println("<th>User Name</th>");
            out.println("<th>Message</th>");
            out.println("</tr>");

            while (rs.next()) {
                foundDoctor = true;
                out.println("<tr>");
                out.println("<td>" + rs.getString("full_name") + "</td>");
                out.println("<td>" + rs.getString("message") + "</td>");
                out.println("</tr>");
            }

            if (!foundDoctor) {
                out.println("<tr><td colspan='4' style='text-align:center; color:red;'>No doctor found!</td></tr>");
            }
            out.println("</table>");
            out.println("</div>"); 
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
        %>
    </div>
</body>
</html>