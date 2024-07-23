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

@WebServlet("/TransactionHistoryServlet")
public class TransactionHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TransactionHistoryServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String accountNumber = request.getParameter("accountNumber");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/banking_application";
        String jdbcUsername = "root";
        String jdbcPassword = "123456";

        // SQL query to fetch transaction history
        String sql = "SELECT * FROM transactions WHERE fromAccount = ? OR toAccount = ? ORDER BY transactionDate DESC";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Create PreparedStatement
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, accountNumber);
            statement.setString(2, accountNumber);

            // Execute the query
            ResultSet resultSet = statement.executeQuery();

            // Display transaction history
            out.println("<h3>Transaction History</h3>");
            out.println("<table border='1'>");
            out.println("<tr><th>Date</th><th>From Account</th><th>To Account</th><th>Amount</th></tr>");
            while (resultSet.next()) {
                String date = resultSet.getString("transactionDate");
                String fromAccount = resultSet.getString("fromAccount");
                String toAccount = resultSet.getString("toAccount");
                double amount = resultSet.getDouble("amount");
                out.println("<tr><td>" + date + "</td><td>" + fromAccount + "</td><td>" + toAccount + "</td><td>$" + amount + "</td></tr>");
            }
            out.println("</table>");

            // Close connection
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            out.close();
        }
    }
}
