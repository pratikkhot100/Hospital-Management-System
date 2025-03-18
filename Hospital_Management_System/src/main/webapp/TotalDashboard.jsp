<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="javax.sql.DataSource"%>
<%@ include file="conn.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hospital Dashboard</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- FontAwesome for Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<%@ include file="../component/allcss.jsp"%>
<style>
/* General Body Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    background-image: url("img/Adminimage.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    min-height: 100vh;
    margin: 0;
}

/* Navbar */
.navbar {
    margin-bottom: 20px;
}

.navbar-nav .nav-item .nav-link {
    transition: 0.3s;
}

.navbar-brand {
    font-weight: bold;
}

/* Header */
h1 {
    text-align: center;
    color: black;
    font-size: 36px;
    font-weight: bold;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.6);
    margin-top: 50px;
}

/* Card Styles */
.card {
    margin: 20px;
    border-radius: 15px;
    transition: all 0.3s ease-in-out;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: transparent;
    color: white;
}

.card-header {
    background-color: #007bff;
    color: white;
    font-weight: bold;
    text-align: center;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    padding: 15px;
}

.card-body {
    text-align: center;
    padding: 30px;
    background-color: rgba(200, 200, 200, 0.5);
    border-bottom-left-radius: 15px;
    border-bottom-right-radius: 15px;
}

.card-title {
    font-size: 4rem;
    color: black;
}

.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
}

/* Button */
button {
    background-color: black;
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin-top: 10px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 300s;
}

button:hover {
    background-color: #45a049;
}

/* Container */
.container {
    max-width: 90%;
    margin: 0 auto;
}

/* Table Styles */
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

/* Scrollable Table */
.table-wrapper {
    overflow-x: auto;
    max-height: 400px;
    margin: 0 auto;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

/* Responsive Styling */
@media (max-width: 768px) {
    .card-columns {
        column-count: 1;
    }

    .card {
        margin-bottom: 20px;
    }

    .navbar-nav .nav-item {
        margin-right: 10px;
    }
}

@media (max-width: 480px) {
    h1 {
        font-size: 28px;
    }

    .card-title {
        font-size: 2rem;
    }

    .search-box input {
        width: 80%;
    }

    .search-box button {
        width: 20%;
    }

    .navbar-brand {
        font-size: 1.2rem;
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
  
  
<br>  <h1 style="color: white;">Total Collection Data</h1>
<div class="container">
    <div class="row d-flex justify-content-center">
        <!-- Total Appointments Card -->
        <div class="col-md-3 col-sm-6 mb-4">
            <div class="card">
                <div class="card-header">Total Appointments</div>
                <div class="card-body">
                    <h3 class="card-title"><%= totalAppointments %></h3>
                    <button onclick="window.location.href='viewAppointment.jsp'">View Appointments</button>
                </div>
            </div>
        </div>

        <!-- Total Doctors Card -->
        <div class="col-md-3 col-sm-6 mb-4">
            <div class="card">
                <div class="card-header">Total Doctors</div>
                <div class="card-body">
                    <h3 class="card-title"><%= totalDoctors %></h3>
                    <button onclick="window.location.href='viewDoctor.jsp'">View Doctors</button>
                </div>
            </div>
        </div>

        <!-- Total Registrations Card -->
        <div class="col-md-3 col-sm-6 mb-4">
            <div class="card">
                <div class="card-header">Total Registrations</div>
                <div class="card-body">
                    <h3 class="card-title"><%= totalRegistrations %></h3>
                    <button onclick="window.location.href='viewSignup.jsp'">View Registrations</button>
                </div>
            </div>
        </div>

        <!-- Total Patients Card -->
        <div class="col-md-3 col-sm-6 mb-4">
            <div class="card">
                <div class="card-header">Total Patients</div>
                <div class="card-body">
                    <h3 class="card-title"><%= totalPatients %></h3>
                    <button onclick="window.location.href='ViewAppointmentDoctor.jsp'">View Patients</button>
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
