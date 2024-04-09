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

@WebServlet("/InsertDonationServlet")
public class InsertDonationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
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

            // Prepare the SQL statement for insertion
            String sql = "INSERT INTO total_donation (full_name, email_id, city, donation_amount, payment_details) VALUES (?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);

            // Set values for the prepared statement
            statement.setString(1, request.getParameter("fullName"));
            statement.setString(2, request.getParameter("email"));
            statement.setString(3, request.getParameter("city"));
            statement.setInt(4, Integer.parseInt(request.getParameter("donationAmount")));
            statement.setString(5, request.getParameter("paymentDetails"));

            // Execute the insertion query
            int rowsInserted = statement.executeUpdate();

            // Check if insertion was successful
            if (rowsInserted > 0) {
                out.println("New donation inserted successfully.");
            } else {
                out.println("Failed to insert new donation.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the resources in the finally block
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
