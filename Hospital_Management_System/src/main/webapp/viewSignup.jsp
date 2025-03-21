<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp"%>

<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<title>View Sign-ups</title>

<%@ include file="../component/allcss.jsp"%>

<!-- CSS Styles -->
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    background-image: url("img/Hospital2.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    height: 75vh;
    margin: 0;
}

h1 {
    text-align: center;
    color: Black; /* White color for text */
    font-size: 36px; /* Larger font size */
    font-weight: bold; /* Bold text */
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.6); /* Subtle text shadow for better visibility */
    margin-top: 50px; /* Margin for spacing */
}

/* Search Box */
.search-box {
    text-align: center;
    margin: 20px;
}

.search-box input {
    padding: 8px;
    font-size: 16px;
    width: 50%;
    max-width: 400px;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-right: 10px;
}

.search-box button {
    padding: 8px 16px;
    font-size: 16px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.search-box button:hover {
    background-color: #45a049;
}

/* Table */
table {
    width: 100%;
    margin: 20px auto;
    border-collapse: collapse;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 10px;
    overflow: hidden;
}

th, td {
    padding: 12px;
    text-align: left;
    border: 1px solid #ddd;
}

th {
    background-color: #4CAF50;
    color: white;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #ddd;
}

/* Scrollable Table Wrapper */
.table-wrapper {
    overflow-x: auto;
    max-height: 400px; /* Adjust the height as needed */
    margin: 0 auto;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

/* Container */
.container {
    max-width: 90%;
    margin: 0 auto;
}

/* Button */
.button-container {
    text-align: center;
    margin-top: 50px;
}

button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 10px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #45a049;
}

/* Navbar */
.navbar {
    margin-bottom: 20px;
}

.navbar-nav .nav-item .nav-link {
    transition: 0.3s;
}

/* Ensure the table is scrollable on smaller devices */
@media (max-width: 768px) {
    table {
        width: 100%;
        margin: 10px auto;
    }

    table th, table td {
        padding: 8px 10px;
    }

    /* Navbar responsive adjustment */
    .navbar-nav .nav-item {
        margin-right: 10px;
    }
}
</style>
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
