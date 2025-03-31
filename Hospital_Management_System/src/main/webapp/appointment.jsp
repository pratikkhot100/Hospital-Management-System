<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="conn.jsp"%>

<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<title>Book Appointment</title>
<%@ include file="../component/allcss.jsp" %>
<%@ include file="../component/AppointmentCSS.jsp" %>
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
                    <li class="nav-item">                  
                        <a class="btn btn-primary" href="index.jsp" aria-current="page">Logout</a>                      
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <br><br>

    <div class="container">
        <h1 style='font-weight: bold;'>Appointment Form</h1>
        <form action="appointment.jsp" method="post">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" placeholder="Enter Name" required>

            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="Enter Registered Email" required>

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

        if (name != null && email != null && phone != null && specialist != null && date != null && time != null) {

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
            } else {
                try {
                    // Check if the selected date and time are already booked
                    String checkQuery = "SELECT COUNT(*) FROM appointment WHERE Appointment_date = ? AND Appointment_time = ?";
                    PreparedStatement checkStmt = conn1.prepareStatement(checkQuery);
                    checkStmt.setString(1, date);
                    checkStmt.setString(2, time);
                    ResultSet checkResult = checkStmt.executeQuery();
                    
                    checkResult.next();
                    int count = checkResult.getInt(1);

                    if (count > 0) {
                        out.println("<script>alert('This time slot is already booked. Please select another time.');</script>");
                    } else {
                        // Insert appointment if the slot is free
                        String insertQuery = "INSERT INTO appointment (Full_Name, Email_id, Mobile_no, Specialist, Appointment_date, Appointment_time) VALUES (?, ?, ?, ?, ?, ?)";
                        PreparedStatement psmt = conn1.prepareStatement(insertQuery);

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
                            out.println("window.location='appointment.jsp';");
                            out.println("</script>");
                        } else {
                            out.println("<p>Error in Reservation</p>");
                        }
                        psmt.close();
                    }

                    checkResult.close();
                    checkStmt.close();

                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            }
        }
        %>

    </div>
</body>
</html>   