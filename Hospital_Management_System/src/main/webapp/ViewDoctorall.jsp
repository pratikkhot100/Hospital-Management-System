<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp"%>

<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<title>Global Hospital</title>
<%@ include file="../component/allcss.jsp"%>

<!-- CSS Styles -->
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    background-image: url("img/about.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    height: 37vh;
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
    text-align: center; /* Centers content in the entire table */
}

th, td {
    padding: 12px;
    text-align: center; /* Centers text in each table cell */
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

/* Centering content in the table wrapper */
.table-wrapper {
    overflow-x: auto;
    max-height: 400px;
    margin: 0 auto;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    text-align: center; /* Ensures the wrapper content is centered */
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
        overflow-x: auto;
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
                    <li class="nav-item"><a class="btn btn-dark" aria-current="page" href="index.jsp">BACK</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <!-- Search Form -->
        <div class="search-box">
            <form action="ViewDoctorall.jsp" method="get">
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
            out.println("<th>Doctor Name</th>");
            out.println("<th>Specialization</th>");
            out.println("</tr>");

            while (rs.next()) {
                foundDoctor = true;
                out.println("<tr>");
                out.println("<td>" + rs.getString("Full_name") + "</td>");
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
