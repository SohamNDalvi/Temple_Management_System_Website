/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/UserDonateServlet")
public class UserDonateServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String fullName = request.getParameter("full-name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone-number");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");
        String country = request.getParameter("country");
        String donationAmount = request.getParameter("donation-amount");
        String paymentDetails = request.getParameter("payment-details");
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,}$";
         // Check if any required field is empty
    if (fullName.isEmpty() || email.isEmpty() || city.isEmpty() || donationAmount.isEmpty() || paymentDetails.isEmpty()) {
        // If any field is empty, show an alert and redirect back to the donation page
        PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Please fill in all required fields');");
        out.println("window.location.href = \"UserDonate.jsp\";");
        out.println("</script>");
    }
    
    else if (Integer.parseInt(donationAmount) == 0) {
    PrintWriter out = response.getWriter();
    out.println("<script type=\"text/javascript\">");
    out.println("alert('Please Enter The Donation Amount Greater Than 0');");
    out.println("window.location.href = \"UserDonate.jsp\";");
    out.println("</script>");}
    
    else if (phoneNumber.length() != 10) {
    PrintWriter out = response.getWriter();
    out.println("<script type=\"text/javascript\">");
    out.println("alert('Please Enter a Valid Phone Number. Phone Number Should Be 10 Digits.');");
    out.println("window.location.href = \"UserDonate.jsp\";");
    out.println("</script>");}
    
    else if (!email.matches(emailRegex)) {
    PrintWriter out = response.getWriter();
    out.println("<script type=\"text/javascript\">");
    out.println("alert('Please Enter a Valid Email_ID');");
    out.println("window.location.href = \"UserDonate.jsp\";");
    out.println("</script>");}
    
    else {
        // JDBC URL, username, and password of MySQL server
        String url = "jdbc:mysql://localhost:3306/ram_mandir";
        String dbUsername = "root";
        String dbPassword = "root";

        // JDBC variables for opening, closing and managing connection
        Connection con = null;
        PreparedStatement preparedStatement = null;

        try {
            // Establishing a connection to your database
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, dbUsername, dbPassword);

            // SQL query to insert data into the database
            String query = "INSERT INTO total_donation (full_name, email_id, city, donation_amount, payment_details) VALUES (?, ?, ?, ?, ?)";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, fullName);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, city);
            preparedStatement.setString(4, donationAmount);
            preparedStatement.setString(5, paymentDetails);

            // Executing the query
            preparedStatement.executeUpdate();
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Amount Donated Successfully !!!');");
            out.println("window.location.href = \"index.html\";");
            out.println("</script>");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Closing the connection
            try {
                if (con != null) {
                    con.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    }
}

           
