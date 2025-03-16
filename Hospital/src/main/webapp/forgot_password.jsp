<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <%@ include file="../component/allcss.jsp"%>
    <style type="text/css">
        body {
            background-image: url("img/Signup.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            height: 579px;
        }
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            border-radius: 20px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><i class="fa-solid fa-house-medical"></i> Global Hospital</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav>

    <br><br>
    <div class="container p-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 text-center" style="font-weight: bold;">Forgot Password</p>

                        <form action="forgot_password.jsp" method="post">
                            <div class="mb-3">
                                <label class="form-label">Enter Email</label>
                                <input type="email" name="email" class="form-control" placeholder="Registered Email" required>
                            </div>

                            <button type="submit" class="btn bg-success text-white col-md-12">Submit</button>
                        </form>

                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%
        String email = request.getParameter("email");

        if (email != null) {
            try {
                // Check if the email domain is for doctor or user
                boolean isDoctor = email.endsWith("@hospital.org"); // Doctor email domain
                boolean isUser = email.endsWith("@email.com"); // User email domain

                if (isDoctor || isUser) {
                    // If it's a doctor or user email, proceed to check the relevant tables
                    String queryUser = "SELECT * FROM registration WHERE Email_id = ?";
                    String queryDoctor = "SELECT * FROM doctor WHERE Email_id = ?";

                    PreparedStatement psmtUser = conn.prepareStatement(queryUser);
                    PreparedStatement psmtDoctor = conn.prepareStatement(queryDoctor);

                    psmtUser.setString(1, email);
                    psmtDoctor.setString(1, email);

                    ResultSet rsUser = psmtUser.executeQuery();
                    ResultSet rsDoctor = psmtDoctor.executeQuery();

                    if (rsUser.next()) {
                        // Redirect to reset password for user
                        response.sendRedirect("reset_password.jsp?email=" + email + "&role=user");
                    } else if (rsDoctor.next()) {
                        // Redirect to reset password for doctor
                        response.sendRedirect("reset_password.jsp?email=" + email + "&role=doctor");
                    } else {
                        out.println("<script>");
                        out.println("alert('Email not found. Please check the email and try again.');");
                        out.println("</script>");
                    }
                } else {
                    out.println("<script>");
                    out.println("alert('Invalid email domain. Please use a valid email address.');");
                    out.println("</script>");
                }

            } catch (Exception e) {
                e.printStackTrace();
                out.println("<script>");
                out.println("alert('Error occurred. Please try again later.');");
                out.println("</script>");
            }
        }
    %>
</body>
</html>
