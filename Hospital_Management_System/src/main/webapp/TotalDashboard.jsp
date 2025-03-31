<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="javax.sql.DataSource"%>
<%@ include file="conn.jsp"%>

<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hospital Dashboard</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- FontAwesome for Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<%@ include file="../component/allcss.jsp"%>
<%@ include file="../component/TotalDashboardCSS.jsp"%>
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

<%
    // Declare variables
    int totalAppointments = 0;
    int totalDoctors = 0;
    int totalRegistrations = 0;
    int totalPatients = 0;
    Connection conn1 = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Establishing the connection to the database
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital", "root", "password");

        // Query to get total appointments
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT COUNT(*) AS totalAppointments FROM appointment");
        if (rs.next()) {
            totalAppointments = rs.getInt("totalAppointments");
        }

        // Query to get total doctors
        rs = stmt.executeQuery("SELECT COUNT(*) AS totalDoctors FROM doctor");
        if (rs.next()) {
            totalDoctors = rs.getInt("totalDoctors");
        }

        // Query to get total registrations
        rs = stmt.executeQuery("SELECT COUNT(*) AS totalRegistrations FROM registration");
        if (rs.next()) {
            totalRegistrations = rs.getInt("totalRegistrations");
        }

        // Query to get total patients (distinct patient_id from appointment)
        rs = stmt.executeQuery("SELECT COUNT(*) AS totalPatients FROM appointment");
        if (rs.next()) {
            totalPatients = rs.getInt("totalPatients");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
  
  
<br>  <h1 style="color: white;">Healthcare Administration Overview</h1>
<div class="container">
    <div class="row d-flex justify-content-center">
        <!-- Total Appointments Card -->
        <div class="col-md-3 col-sm-6 mb-4">
            <div class="card">
                <div class="card-header">Appointments Overview</div>
                <div class="card-body">
                    <h3 class="card-title"><%= totalAppointments %></h3>
                    <button onclick="window.location.href='viewAppointment.jsp'">View Appointments</button>
                </div>
            </div>
        </div>

        <!-- Total Doctors Card -->
        <div class="col-md-3 col-sm-6 mb-4">
            <div class="card">
                <div class="card-header">Registered Doctors</div>
                <div class="card-body">
                    <h3 class="card-title"><%= totalDoctors %></h3>
                    <button onclick="window.location.href='viewDoctor.jsp'">View Doctors</button>
                </div>
            </div>
        </div>

        <!-- Total Registrations Card -->
        <div class="col-md-3 col-sm-6 mb-4">
            <div class="card">
                <div class="card-header">New User Registrations</div>
                <div class="card-body">
                    <h3 class="card-title"><%= totalRegistrations %></h3>
                    <button onclick="window.location.href='viewSignup.jsp'">View Registrations</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>