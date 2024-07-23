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

@WebServlet("/ViewBalanceServlet")
public class ViewBalanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ViewBalanceServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve account number from the request
        String accountNumber = request.getParameter("accountNumber");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/banking_application";
        String jdbcUsername = "root";
        String jdbcPassword = "123456";

        // SQL query
        String sql = "SELECT initialBalance FROM customer WHERE accountNumber = ?";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Create PreparedStatement
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, accountNumber);

            // Execute the query
            ResultSet resultSet = statement.executeQuery();

            // Check if the account exists and display balance
            if (resultSet.next()) {
                double balance = resultSet.getDouble("initialBalance");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>View Balance</title>");
                out.println("<style>");
                out.println("body { font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333; }");
                out.println(".container { max-width: 600px; margin: 50px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }");
                out.println(".header { margin-bottom: 20px; }");
                out.println("h3 { margin-bottom: 10px; font-size: 24px; color: #444; }");
                out.println("p { margin: 5px 0; font-size: 18px; }");
                out.println(".button-container { margin-top: 20px; text-align: center; }");
                out.println("button { background: #007bff; color: #fff; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; font-size: 16px; }");
                out.println("button:hover { background: #0056b3; }");
                out.println("</style>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class='container'>");
                out.println("<div class='header'>");
                out.println("<h3>Account Balance</h3>");
                out.println("</div>");
                out.println("<p>Account Number: " + accountNumber + "</p>");
                out.println("<p>Current Balance: ₹" + String.format("%.2f", balance) + "</p>");
                out.println("<div class='button-container'>");
                out.println("<form action='customerdashboard.jsp' method='get'>");
                out.println("<button type='submit'>Go to Dashboard</button>");
                out.println("</form>");
                out.println("</div>");
                out.println("</div>");
                out.println("</body>");
                out.println("</html>");
            } else {
                out.println("<html>");
                out.println("<head><title>View Balance</title></head>");
                out.println("<body>");
                out.println("<h3>Account not found!</h3>");
                out.println("</body>");
                out.println("</html>");
            }

            // Close connection
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<html>");
            out.println("<head><title>Error</title></head>");
            out.println("<body>");
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }
}
