<%@ page import="java.sql.PreparedStatement, java.sql.ResultSet, java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Appointment</title>
    <%@ include file="../component/allcss.jsp" %>

    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            background-image: url("img/hos3.jpg");
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

        .container {
            margin: 20px auto;
            max-width: 500px;
            padding: 15px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-height: 70vh;
            overflow-y: auto;
        }

        h1 {
            font-size: 22px;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .appointment-image {
            width: 100%;
            max-width: 300px;
            margin: 0 auto 20px;
            display: block;
            border-radius: 8px;
        }

        label {
            font-size: 14px;
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
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button[type="submit"] {
            width: 100%;
            padding: 8px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        button[type="submit"]:hover {
            background-color: #218838;
        }

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

        @media (max-width: 768px) {
            .container {
                margin: 10px;
                padding: 15px;
                max-width: 90%;
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
                    <li class="nav-item"><a class="btn btn-primary" aria-current="page" href="viewAppointment.jsp">Back</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h1 style='font-weight: bold;'>Update Appointment</h1>

        <% 
            String appointmentId = request.getParameter("id");
            if (appointmentId != null) {
                if ("GET".equalsIgnoreCase(request.getMethod())) {
                    try {
                        String query = "SELECT * FROM appointment WHERE id = ?";
                        PreparedStatement psmt = conn.prepareStatement(query);
                        psmt.setString(1, appointmentId);
                        ResultSet rs = psmt.executeQuery();

                        if (rs.next()) {
                            String fullName = rs.getString("Full_name");
                            String mobileNo = rs.getString("Mobile_no");
                            String doctorName = rs.getString("Specialist");
                            String appointmentDate = rs.getDate("Appointment_date").toString();
                            String appointmentTime = rs.getTime("Appointment_time").toString().substring(0, 5); 
        %>

        <form method="post" action="editAppointment.jsp">
            <input type="hidden" name="id" value="<%= appointmentId %>">
            
            <label for="fullName">Patient Name</label>
            <input type="text" name="fullName" value="<%= fullName %>" required>
            
            <label for="mobileNo">Mobile Number</label>
            <input type="text" name="mobileNo" value="<%= mobileNo %>" required>
            
            <label for="specialist">Specialist</label>
            <select id="specialist" name="specialist" required>
                <option value="">-- Select Specialist --</option>
                <% 
                PreparedStatement psmt1 = conn.prepareStatement("SELECT Full_name, Specialization FROM doctor");
                ResultSet rs1 = psmt1.executeQuery();
                while (rs1.next()) {
                    String doctorname = rs1.getString("Full_name");
                    String specialization = rs1.getString("Specialization");
                %>
                <option value="<%= doctorname %>"> Dr. <%= doctorname %> - <%= specialization %> Specialist</option>
                <% 
                    }
                %>
            </select>

            <label for="appointmentDate">Appointment Date</label>
            <input type="date" name="appointmentDate" value="<%= appointmentDate %>" min="<%= java.time.LocalDate.now() %>" required>

            <label for="appointmentTime">Appointment Time</label>
            <input type="time" name="appointmentTime" value="<%= appointmentTime %>" required>

            <button type="submit">Update Appointment</button>
        </form>

        <% 
                        } else {
                            out.println("<p>No appointment found with the given ID.</p>");
                        }
                        rs.close();
                        psmt.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    }
                }
            }
        %>
    </div>

    <% 
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String fullName = request.getParameter("fullName");
            String mobileNo = request.getParameter("mobileNo");
            String doctorName = request.getParameter("specialist");
            String appointmentDate = request.getParameter("appointmentDate");
            String appointmentTime = request.getParameter("appointmentTime");
            String appointmentid = request.getParameter("id");

            try {
                String updateQuery = "UPDATE appointment SET Full_name = ?, Mobile_no = ?, Specialist = ?, Appointment_date = ?, Appointment_time = ? WHERE id = ?";
                PreparedStatement psmt = conn.prepareStatement(updateQuery);
                psmt.setString(1, fullName);
                psmt.setString(2, mobileNo);
                psmt.setString(3, doctorName);
                psmt.setString(4, appointmentDate);
                psmt.setString(5, appointmentTime);
                psmt.setString(6, appointmentid);

                int rowsUpdated = psmt.executeUpdate();

                if (rowsUpdated > 0) {
                    out.println("<script>alert('Appointment updated successfully'); window.location='viewAppointment.jsp';</script>");
                } else {
                    out.println("<script>alert('Error: Unable to update appointment'); window.location='editAppointment.jsp?id=" + appointmentId + "';</script>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<script>alert('Error: " + e.getMessage() + "'); window.location='viewAppointment.jsp';</script>");
            }
        }
    %>
</body>
</html>
