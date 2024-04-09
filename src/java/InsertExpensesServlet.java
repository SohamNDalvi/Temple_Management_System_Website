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

@WebServlet("/InsertExpensesServlet")
public class InsertExpensesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            String sql = "INSERT INTO Expenses_Details (product, date, payment_type, proof, amount) VALUES (?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);

            // Set values for the prepared statement
            statement.setString(1, request.getParameter("product"));
            statement.setString(2, request.getParameter("date"));
            statement.setString(3, request.getParameter("paymentType"));
            statement.setString(4, request.getParameter("proof"));
            statement.setInt(5, Integer.parseInt(request.getParameter("amount")));

            // Execute the insertion query
            int rowsInserted = statement.executeUpdate();

            // Check if insertion was successful
            if (rowsInserted > 0) {
                // Inform the client-side JavaScript that the insertion was successful
                out.println("success");
            } else {
                // Inform the client-side JavaScript that the insertion failed
                out.println("failure");
            }
        } catch (Exception e) {
            e.printStackTrace(out); // Print stack trace to the PrintWriter
            out.println("failure");
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
                ex.printStackTrace(out); // Print stack trace to the PrintWriter
            }
        }
    }
}