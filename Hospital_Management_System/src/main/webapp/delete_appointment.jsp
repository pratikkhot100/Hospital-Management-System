<%@ page import="java.sql.PreparedStatement, java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="conn.jsp" %>

<%
    String appointmentId = request.getParameter("id");

    try {
        // Delete the appointment based on the appointment_id
        String query = "DELETE FROM appointment WHERE id = ?";
        PreparedStatement psmt = conn.prepareStatement(query);
        psmt.setString(1, appointmentId);
        int result = psmt.executeUpdate();

        if (result > 0) {
            out.println("<script>alert('Appointment deleted successfully!');</script>");
            out.println("<script>window.location='viewAppointment.jsp';</script>");
        } else {
            out.println("<p>Error in deleting the appointment.</p>");
        }
    } catch (Exception e) {
        out.println("Error deleting the appointment: " + e.getMessage());
    }
%>