/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ram_mandir";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String Cpassword = request.getParameter("Cpassword");
        if (password.equals(Cpassword)){
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            // Check if email exists in Admin_Details table
            String query = "SELECT * FROM Admin_Details WHERE Email_Id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                // Update password in Admin_Details table
                String updateQuery = "UPDATE Admin_Details SET Password = ? WHERE Email_Id = ?";
                stmt = conn.prepareStatement(updateQuery);
                stmt.setString(1, password);
                stmt.setString(2, email);
                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    // Password updated successfully
                    out.println("<script>alert('Password updated successfully!'); window.location.href='admin';</script>");
                } else {
                    // Failed to update password
                    out.println("<script>alert('Failed to update password. Please try again later.'); window.location.href='ForgotPasswordPage1.jsp';</script>");
                }
            } else {
                // Email not found in database
                out.println("<script>alert('Email not found. Please recheck the email.'); window.location.href='ForgotPasswordPage1.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error occurred while processing your request. Please try again later.'); window.location.href='ForgotPasswordPage1.jsp';</script>");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
            out.close();
        }
        }
        else{
        response.sendRedirect("ForgotPasswordPage1.jsp?data=Invalid");}
        out.println("<script>alert('all the data collect in servlet file'); window.location.href='ForgotPasswordPage1.jsp';</script>");
    }
}
