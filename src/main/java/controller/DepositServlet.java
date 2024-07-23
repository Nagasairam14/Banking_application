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

@WebServlet("/DepositServlet")
public class DepositServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DepositServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String accountNumber = request.getParameter("accountNumber");
        double depositAmount = Double.parseDouble(request.getParameter("depositAmount"));

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/new_banking_app";
        String jdbcUsername = "root";
        String jdbcPassword = "1234";

        // SQL query for depositing amount
        String sql = "UPDATE customer SET initialBalance = initialBalance + ? WHERE accountNumber = ?";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Create PreparedStatement
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDouble(1, depositAmount);
            statement.setString(2, accountNumber);

            // Execute the query
            int rows = statement.executeUpdate();

            // Check if deposit was successful
            if (rows > 0) {
                out.println("<h3>Deposit successful!</h3>");
            } else {
                out.println("<h3>Error depositing amount!</h3>");
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
