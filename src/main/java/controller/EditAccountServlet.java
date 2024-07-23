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

@WebServlet("/EditAccountServlet")
public class EditAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EditAccountServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String accountNumber = request.getParameter("accountNumber");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String mobileNo = request.getParameter("mobileNo");
        String emailId = request.getParameter("emailId");
        String accountType = request.getParameter("accountType");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/banking_application";
        String jdbcUsername = "root";
        String jdbcPassword = "123456";

        // SQL query
        String sql = "UPDATE customer SET fullName = ?, address = ?, mobileNo = ?, emailId = ?, accountType = ? WHERE accountNumber = ?";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Create PreparedStatement
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fullName);
            statement.setString(2, address);
            statement.setString(3, mobileNo);
            statement.setString(4, emailId);
            statement.setString(5, accountType);
            statement.setString(6, accountNumber);

            // Execute the query
            int rows = statement.executeUpdate();

            // Check if update was successful
            if (rows > 0) {
                out.println("<h3>Account details updated successfully!</h3>");
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
