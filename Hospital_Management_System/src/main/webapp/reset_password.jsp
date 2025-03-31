<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <%@ include file="../component/allcss.jsp"%>
    <style type="text/css">
        body {
            background-image: url("img/about.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            height: 14vh;
            margin: 0;
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
        </div>
    </nav>

    <br><br>
    <div class="container p-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 text-center" style="font-weight: bold;">Reset Password</p>

                        <%
                            String email = request.getParameter("email");
                            String role = request.getParameter("role");
                        %>

                        <form action="reset_password.jsp" method="post">
                            <input type="hidden" name="email" value="<%= email %>">
                            <input type="hidden" name="role" value="<%= role %>">

                            <div class="mb-3">
                                <label class="form-label">New Password</label>
                                <input type="password" name="new_password" class="form-control" required placeholder="Enter new password">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Confirm Password</label>
                                <input type="password" name="confirm_password" class="form-control" required placeholder="Confirm new password">
                            </div>

                            <button type="submit" class="btn bg-success text-white col-md-12">Reset Password</button>
                        </form>

                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");

        if (newPassword != null && confirmPassword != null) {
            if (!newPassword.equals(confirmPassword)) {
                out.println("<script>");
                out.println("alert('Passwords do not match. Please try again.');");
                out.println("</script>");
            } else {
                try {
                    // Determine if email is for doctor or user based on email domain
                    boolean isDoctor = email.endsWith("@globalhospital.com"); // Doctor email domain
                    boolean isUser = email.endsWith("@gmail.com"); // User email domain
                    
                    if (isDoctor || isUser) {
                        // If email is for user
                        if (isUser) {
                            String queryUser = "SELECT * FROM registration WHERE Email_id = ?";
                            PreparedStatement psmtUser = conn.prepareStatement(queryUser);
                            psmtUser.setString(1, email);
                            ResultSet rsUser = psmtUser.executeQuery();

                            if (rsUser.next()) {
                                String updateUser = "UPDATE registration SET password = ? WHERE Email_id = ?";
                                PreparedStatement psmtUpdateUser = conn.prepareStatement(updateUser);
                                psmtUpdateUser.setString(1, newPassword);
                                psmtUpdateUser.setString(2, email);
                                psmtUpdateUser.executeUpdate();
                            }
                        }

                        // If email is for doctor
                        if (isDoctor) {
                            String queryDoctor = "SELECT * FROM doctor WHERE Email_id = ?";
                            PreparedStatement psmtDoctor = conn.prepareStatement(queryDoctor);
                            psmtDoctor.setString(1, email);
                            ResultSet rsDoctor = psmtDoctor.executeQuery();

                            if (rsDoctor.next()) {
                                String updateDoctor = "UPDATE doctor SET password = ? WHERE Email_id = ?";
                                PreparedStatement psmtUpdateDoctor = conn.prepareStatement(updateDoctor);
                                psmtUpdateDoctor.setString(1, newPassword);
                                psmtUpdateDoctor.setString(2, email);
                                psmtUpdateDoctor.executeUpdate();
                            }
                        }

                        // Show success alert and redirect to login page
                        out.println("<script>");
                        out.println("alert('Password reset successful.');");
                        out.println("window.location = 'index.jsp';");
                        out.println("</script>");

                    } else {
                        out.println("<script>");
                        out.println("alert('Invalid email address. Please check and try again.');");
                        out.println("</script>");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<script>");
                    out.println("alert('Error occurred. Please try again later.');");
                    out.println("</script>");
                }
            }
        }
    %>
</body>
</html>