<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp"%>

<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<title>View Sign-ups</title>
<%@ include file="../component/allcss.jsp"%>
<%@ include file="../component/viewSignupCSS.jsp"%>
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
                    <li class="nav-item"><a class="btn btn-dark" aria-current="page" href="viewAdmin.jsp">BACK</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Search Box -->
    <div class="search-box">
        <form action="viewSignup.jsp" method="post">
            <input type="text" name="searchQuery" placeholder="Search by Name" required>
            <button type="submit">Search</button>
        </form>
    </div>

    <%
    // Get the search query from the form submission
    String searchQuery = request.getParameter("searchQuery");

    try {
        String query;

        if (searchQuery != null && !searchQuery.isEmpty()) {
            query = "SELECT * FROM registration WHERE Full_name LIKE ?";
        } else {
            query = "SELECT * FROM registration";
        }

        PreparedStatement psmt = conn.prepareStatement(query);

        // If search query is provided, apply LIKE clause with wildcards
        if (searchQuery != null && !searchQuery.isEmpty()) {
            psmt.setString(1, "%" + searchQuery + "%");
        }

        ResultSet rs = psmt.executeQuery();
        boolean foundRegistration = false;
        // Start table
        out.println("<h1>User Registration Details</h1>");
        out.println("<div class='table-wrapper'>"); 
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>ID</th>");
        out.println("<th>Name</th>");
        out.println("<th>Email ID</th>");
        out.println("<th>Password</th>");
        out.println("<th>Date</th>");
        out.println("</tr>");

        while (rs.next()) {
            foundRegistration = true;
            out.println("<tr>");
            out.println("<td>" + rs.getInt("id") + "</td>");
            out.println("<td>" + rs.getString("Full_name") + "</td>");
            out.println("<td>" + rs.getString("Email_id") + "</td>");
            out.println("<td>" + rs.getString("password") + "</td>");
            out.println("<td>" + rs.getString("Date") + "</td>");
            out.println("</tr>");
        }

        if (!foundRegistration) {
            out.println("<tr><td colspan='4' style='color:red;'><center>No registration found.</center></td></tr>");
        }
        out.println("</table>");
        out.println("</div>"); 

    } catch (Exception e) {
        out.println("<p>Error occurred while fetching registration data: " + e.getMessage() + "</p>");
    }
    %>
</body>
</html>