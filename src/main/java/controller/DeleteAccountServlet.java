package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteAccountServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String accountNumber = request.getParameter("accountNumber");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/new_banking_app";
        String jdbcUsername = "root";
        String jdbcPassword = "1234";

        // SQL query
        String sql = "DELETE FROM customer WHERE accountNumber = ?";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Create PreparedStatement
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, accountNumber);

            // Execute the query
            int rows = statement.executeUpdate();

            // Check if deletion was successful
            if (rows > 0) {
                out.println("<h3>Account deleted successfully!</h3>");
            } else {
                out.println("<h3>Account not found!</h3>");
            }

            // Close connection
            statement.close();
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Print to server logs
            out.println("<h3>Error: " + e.getMessage() + "</h3>"); // Display on the web page
        } finally {
            out.close();
        }
    }
}
