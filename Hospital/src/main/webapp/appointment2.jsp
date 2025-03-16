<%@ page import="java.sql.PreparedStatement, java.sql.ResultSet, java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Appointment</title>
    <%@ include file="../component/allcss.jsp" %>

    <style type="text/css">
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            background-image: url("img/Appointment.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            height: 100vh;
        }

        nav {
            background-color: #28a745;
        }

        nav .navbar-brand {
            color: white;
            font-weight: bold;
        }

        nav .navbar-toggler {
            border-color: white;
        }

        nav .navbar-nav .nav-item .btn {
            background-color: #007bff;
            color: white;
        }

        /* Container for Form */
        .container {
            margin: 20px auto;
            max-width: 500px; /* Adjusted the max-width */
            padding: 15px;
            background-color: rgba(255, 255, 255, 0.8); /* Transparent background */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-height: 70vh; /* Set max height to make it scrollable */
            overflow-y: auto; /* Scrollable content */
        }

        h1 {
            font-size: 22px; /* Reduced font size */
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Image Styling */
        .appointment-image {
            width: 100%;
            max-width: 300px; /* Reduced image size */
            margin: 0 auto 20px;
            display: block;
            border-radius: 8px;
        }

        /* Form Styling */
        label {
            font-size: 14px; /* Reduced label font size */
            margin-bottom: 5px;
            display: block;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="date"],
        input[type="time"],
        select {
            width: 100%;
            padding: 8px; /* Reduced padding */
            margin-bottom: 10px; /* Reduced margin-bottom */
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button[type="submit"] {
            width: 100%;
            padding: 8px; /* Reduced padding */
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px; /* Reduced button font size */
        }

        button[type="submit"]:hover {
            background-color: #218838;
        }

        /* Scrollbar Styling for Container */
        .container::-webkit-scrollbar {
            width: 8px;
        }

        .container::-webkit-scrollbar-thumb {
            background-color: #888;
            border-radius: 10px;
        }

        .container::-webkit-scrollbar-thumb:hover {
            background-color: #555;
        }

        /* Responsive Media Queries */
        @media (max-width: 768px) {
            .container {
                margin: 10px;
                padding: 15px;
                max-width: 90%; /* Adjust form width on smaller screens */
            }

            h1 {
                font-size: 20px;
            }

            button[type="submit"] {
                font-size: 12px;
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
                    <li class="nav-item"><a class="btn btn-primary" aria-current="page" href="viewAdmin.jsp">Back</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <br><br>
    
    <div class="container">
        <h1 style='font-weight: bold;'>Appointment Form</h1>
        <form action="appointment2.jsp" method="post">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" placeholder="Enter Name" required>

            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="Enter Register Email" required>

            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone" placeholder="Enter Number" required>

            <label for="specialist">Specialist</label>
            <select id="specialist" name="specialist" required>
                <option value="">-- Select Specialist --</option>
                <% 
                Connection conn1 = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital", "root", "password");

                    String query1 = "SELECT Full_name, Specialization FROM doctor";
                    ps = conn1.prepareStatement(query1);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String doctorName = rs.getString("Full_name");
                        String specialization = rs.getString("Specialization");
                %>
                <option value="<%= doctorName %>" style="font-family:'Arial',sans-serif; font-weight:bold"> Dr. <%= doctorName %> - &nbsp;<%= specialization %> Specialist</option>
                <% 
                    }
                } catch (Exception e) {
                    out.println("Error fetching data: " + e.getMessage());
                }
                %>
            </select>

            <label for="date">Appointment Date</label>
            <input type="date" id="date" name="date" required min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
            

            <label for="time">Appointment Time</label>
            <input type="time" id="time" name="time" required><br><br>

            <button type="submit">Submit Appointment</button>
        </form>

        <% 
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String specialist = request.getParameter("specialist");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        // Check if all fields are filled out
        if (name == null || name.trim().isEmpty() || email == null || email.trim().isEmpty() || phone == null || phone.trim().isEmpty() ||
            specialist == null || specialist.trim().isEmpty() || date == null || date.trim().isEmpty() || time == null || time.trim().isEmpty()) {
            out.println("<script>alert('All fields are required. Please complete the form before proceeding.');</script>");
            return;
        }

        // Check if the email exists in the registration table
        boolean emailExists = false;
        try {
            String emailCheckQuery = "SELECT * FROM registration WHERE Email_id = ?";
            PreparedStatement psmtEmailCheck = conn1.prepareStatement(emailCheckQuery);
            psmtEmailCheck.setString(1, email);
            ResultSet rsEmailCheck = psmtEmailCheck.executeQuery();

            if (rsEmailCheck.next()) {
                emailExists = true;
            }

            rsEmailCheck.close();
            psmtEmailCheck.close();

        } catch (Exception e) {
            out.println("Error checking email: " + e.getMessage());
        }

        if (!emailExists) {
            out.println("<script>alert('The email provided is not registered. Please use a registered email ID.');</script>");
            return;
        }

        // If email exists, proceed with appointment booking
        try {
            String query = "INSERT INTO appointment (Full_Name, Email_id, Mobile_no, Specialist, Appointment_date, Appointment_time) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement psmt = conn1.prepareStatement(query);

            psmt.setString(1, name);
            psmt.setString(2, email);
            psmt.setString(3, phone);
            psmt.setString(4, specialist);
            psmt.setString(5, date);
            psmt.setString(6, time);

            int result = psmt.executeUpdate();

            if (result > 0) {
                out.println("<script>");
                out.println("alert('Appointment successfully booked!');");
                out.println("window.location='appointment2.jsp';");
                out.println("</script>");
            } else {
                out.println("<p>Error in Reservation</p>");
            }

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
        %>

    </div>
</body>
</html>
