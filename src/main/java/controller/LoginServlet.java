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
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String accountNumber = request.getParameter("accountNumber");
        String password = request.getParameter("password");
        String loginType = request.getParameter("loginType");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/banking_application";
        String jdbcUsername = "root";
        String jdbcPassword = "123456";

        // SQL queries
        String sqlCustomer = "SELECT * FROM customer WHERE accountNumber = ? AND password = ?";
        String sqlAdmin = "SELECT * FROM admin WHERE accountNumber = ? AND password = ?";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            PreparedStatement statement = null;
            ResultSet resultSet = null;
            boolean isValidUser = false;

            if ("customer".equals(loginType)) {
                // Check customer credentials
                statement = connection.prepareStatement(sqlCustomer);
                statement.setString(1, accountNumber);
                statement.setString(2, password);
                resultSet = statement.executeQuery();
                isValidUser = resultSet.next();
            } else if ("admin".equals(loginType)) {
                // Check admin credentials
                statement = connection.prepareStatement(sqlAdmin);
                statement.setString(1, accountNumber);
                statement.setString(2, password);
                resultSet = statement.executeQuery();
                isValidUser = resultSet.next();
            }

            if (isValidUser) {
                // Create a session and redirect to the appropriate home page
                HttpSession session = request.getSession();
                session.setAttribute("accountNumber", accountNumber);
                session.setAttribute("loginType", loginType);

                if ("customer".equals(loginType)) {
                    response.sendRedirect("customerhome.jsp");
                } else if ("admin".equals(loginType)) {
                    response.sendRedirect("adminhome.jsp");
                }
            } else {
                // If login fails, display an error message
                out.println("<h3>Invalid account number or password!</h3>");
                out.println("<a href='login.jsp'>Try Again</a>");
            }

            // Close resources
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Print to server logs
            out.println("<h3>Error: " + e.getMessage() + "</h3>"); // Display on the web page
        } finally {
            out.close();
        }
    }
}
