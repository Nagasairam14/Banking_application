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

@WebServlet("/TransferFundsServlet")
public class TransferFundsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TransferFundsServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String fromAccountNumber = request.getParameter("fromAccountNumber");
        String toAccountNumber = request.getParameter("toAccountNumber");
        double transferAmount = Double.parseDouble(request.getParameter("transferAmount"));

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/banking_application";
        String jdbcUsername = "root";
        String jdbcPassword = "123456";

        // SQL queries
        String withdrawSQL = "UPDATE customer SET initialBalance = initialBalance - ? WHERE accountNumber = ?";
        String depositSQL = "UPDATE customer SET initialBalance = initialBalance + ? WHERE accountNumber = ?";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Start transaction
            connection.setAutoCommit(false);

            // Withdraw from sender's account
            PreparedStatement withdrawStatement = connection.prepareStatement(withdrawSQL);
            withdrawStatement.setDouble(1, transferAmount);
            withdrawStatement.setString(2, fromAccountNumber);
            int rowsWithdrawn = withdrawStatement.executeUpdate();

            // Deposit into receiver's account
            PreparedStatement depositStatement = connection.prepareStatement(depositSQL);
            depositStatement.setDouble(1, transferAmount);
            depositStatement.setString(2, toAccountNumber);
            int rowsDeposited = depositStatement.executeUpdate();

            // Check if both operations were successful
            if (rowsWithdrawn > 0 && rowsDeposited > 0) {
                connection.commit();
                out.println("<h3>Funds transferred successfully!</h3>");
            } else {
                connection.rollback();
                out.println("<h3>Error transferring funds!</h3>");
            }

            // Close connection
            withdrawStatement.close();
            depositStatement.close();
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            out.close();
        }
    }
}
