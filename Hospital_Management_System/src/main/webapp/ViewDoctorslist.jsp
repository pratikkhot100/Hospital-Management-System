<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp"%>

<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<title>View Doctor</title>
<%@ include file="../component/allcss.jsp"%>
<%@ include file="../component/ViewDoctorslistCSS.jsp"%>
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
            <form action="ViewDoctorslist.jsp" method="get">
                <input type="text" name="searchQuery" placeholder="Search by name or specialization" required>
                <button type="submit">Search</button>
            </form>
        </div>

        <%
        String searchQuery = request.getParameter("searchQuery"); // Get search query from form

        try {
            String q;

            // If a search query is provided, use LIKE clause; otherwise, select all doctors
            if (searchQuery != null && !searchQuery.isEmpty()) {
                q = "SELECT * FROM doctor WHERE Full_name LIKE ? OR Specialization LIKE ?";
            } else {
                q = "SELECT * FROM doctor"; // Default query to fetch all doctors
            }

            PreparedStatement psmt = conn.prepareStatement(q);

            // If searchQuery is provided, set parameters for LIKE clause
            if (searchQuery != null && !searchQuery.isEmpty()) {
                psmt.setString(1, "%" + searchQuery + "%"); // Use % for wildcard search (anywhere in the string)
                psmt.setString(2, "%" + searchQuery + "%"); // Apply the search to both Full_name and Specialization
            }

            ResultSet rs = psmt.executeQuery();

            boolean foundDoctor = false;

            out.println("<h1>Doctor Details</h1>");
            out.println("<div class='table-wrapper'>"); 
            out.println("<table>");
            out.println("<tr>");
            out.println("<th>ID</th>");
            out.println("<th>Doctor Name</th>");
            out.println("<th>Email ID</th>");
            out.println("<th>Specialization</th>");
            out.println("</tr>");

            while (rs.next()) {
                foundDoctor = true;
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id") + "</td>");
                out.println("<td>" +"Dr. "+rs.getString("Full_name") + "</td>");
                out.println("<td>" + rs.getString("Email_id") + "</td>");
                out.println("<td>" + rs.getString("Specialization") + "</td>");
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