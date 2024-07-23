package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/WithdrawalServlet")
public class WithdrawalServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public WithdrawalServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String accountNumber = request.getParameter("accountNumber");
        double amount = Double.parseDouble(request.getParameter("amount"));

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/banking_application";
        String jdbcUsername = "root";
        String jdbcPassword = "123456";

        // SQL queries
        String sqlCheckBalance = "SELECT initialBalance FROM customer WHERE accountNumber = ?";
        String sqlUpdateBalance = "UPDATE customer SET initialBalance = initialBalance - ? WHERE accountNumber = ?";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Check current balance
            PreparedStatement checkStatement = connection.prepareStatement(sqlCheckBalance);
            checkStatement.setString(1, accountNumber);
            ResultSet resultSet = checkStatement.executeQuery();

            if (resultSet.next()) {
                double currentBalance = resultSet.getDouble("initialBalance");

                // Check if there is enough balance for withdrawal
                if (amount <= currentBalance) {
                    // Perform withdrawal
                    PreparedStatement updateStatement = connection.prepareStatement(sqlUpdateBalance);
                    updateStatement.setDouble(1, amount);
                    updateStatement.setString(2, accountNumber);
                    int rows = updateStatement.executeUpdate();

                    if (rows > 0) {
                        out.println("<h3>Withdrawal successful!</h3>");
                    } else {
                        out.println("<h3>Error withdrawing amount!</h3>");
                    }
                    updateStatement.close();
                } else {
                    out.println("<h3>Insufficient balance!</h3>");
                }
            } else {
                out.println("<h3>Account not found!</h3>");
            }

            // Close resources
            resultSet.close();
            checkStatement.close();
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Print to server logs
            out.println("<h3>Error: " + e.getMessage() + "</h3>"); // Display on the web page
        } finally {
            out.close();
        }
    }
}
