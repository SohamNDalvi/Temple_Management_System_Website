import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateDonationServlet")
public class UpdateDonationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        // Retrieve parameters from the request
        String updatedFullName = request.getParameter("fullName");
        String updatedEmail = request.getParameter("email");
        String updatedCity = request.getParameter("city");
        String updatedPaymentDetails = request.getParameter("paymentDetails");
        String oldFullName = request.getParameter("oldFullName"); // Retrieve the old full name value

        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/Ram_Mandir";
        String dbUsername = "root";
        String dbPassword = "root";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Load and register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

            // Prepare and execute the SQL query to update the donation record
            String sql = "UPDATE total_donation SET full_name=?, email_id=?, city=?, payment_details=? WHERE full_name=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, updatedFullName);
            statement.setString(2, updatedEmail);
            statement.setString(3, updatedCity);
            statement.setString(4, updatedPaymentDetails);
            statement.setString(5, oldFullName); // Using the old full name value for the WHERE clause
            int rowsUpdated = statement.executeUpdate();

            // Check if the update was successful
            if (rowsUpdated > 0) {
                out.println("Donation record updated successfully!");
            } else {
                out.println("Failed to update donation record.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the resources
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
