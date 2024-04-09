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

@WebServlet("/UpdateExpensesServlet")
public class UpdateExpensesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve parameters from the request
        String updatedProduct = request.getParameter("product");
        String updatedDate = request.getParameter("date");
        String updatedPaymentType = request.getParameter("paymentType");
        String oldProduct = request.getParameter("oldProduct"); // Retrieve the old product value

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

            // Prepare and execute the SQL query to update the expenses record
            String sql = "UPDATE Expenses_Details SET product=?, date=?, payment_type=? WHERE product=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, updatedProduct);
            statement.setString(2, updatedDate);
            statement.setString(3, updatedPaymentType);
            statement.setString(4, oldProduct); // Using the old product value for the WHERE clause
            int rowsUpdated = statement.executeUpdate();

            // Check if the update was successful
            if (rowsUpdated > 0) {
                out.println("Expenses record updated successfully!");
            } else {
                out.println("Failed to update expenses record.");
            }
        } catch (Exception e) {
            e.printStackTrace(out); // Print stack trace to the PrintWriter
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
                ex.printStackTrace(out); // Print stack trace to the PrintWriter
            }
        }
    }
}
