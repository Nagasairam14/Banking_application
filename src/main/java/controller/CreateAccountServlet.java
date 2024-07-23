package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/banking_application";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "123456";

    // Constants for password generation
    private static final String PASSWORD_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_+=<>?";
    private static final int PASSWORD_LENGTH = 12;

    public CreateAccountServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String mobileNo = request.getParameter("mobileNo");
        String emailId = request.getParameter("emailId");
        String accountType = request.getParameter("accountType");
        double initialBalance = Double.parseDouble(request.getParameter("initialBalance"));
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idProof = request.getParameter("idProof");

        // Generate account number and password
        String accountNumber = generateAccountNumber();
        String password = generatePassword();

        // SQL query
        String sql = "INSERT INTO customer (fullName, address, mobileNo, emailId, accountType, initialBalance, "
                   + "dateOfBirth, idProof, accountNumber, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            // Create PreparedStatement
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fullName);
            statement.setString(2, address);
            statement.setString(3, mobileNo);
            statement.setString(4, emailId);
            statement.setString(5, accountType);
            statement.setDouble(6, initialBalance);
            statement.setString(7, dateOfBirth);
            statement.setString(8, idProof);
            statement.setString(9, accountNumber);
            statement.setString(10, password);

            // Execute the query
            int rows = statement.executeUpdate();

            // Check if insertion was successful
            if (rows > 0) {
                out.println("<html><body>");
                out.println("<h3>Account created successfully!</h3>");
                out.println("<p>Account Number: <input type='text' value='" + accountNumber + "' readonly></p>");
                out.println("<p>Password: <input type='text' value='" + password + "' readonly></p>");
                out.println("<form action='adminDashboard.jsp' method='get'>");
                out.println("<button type='submit'>Go to Dashboard</button>");
                out.println("</form>");
                out.println("</body></html>");
            } else {
                out.println("<h3>Error creating account!</h3>");
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

    // Method to generate a unique account number
    private String generateAccountNumber() {
        SecureRandom random = new SecureRandom();
        int randomNum = random.nextInt(1000000000); // Generates a number between 0 and 999999
        return String.format("ACC%06d", randomNum); // Format as ACCXXXXXX
    }

    // Method to generate a secure random password
    private String generatePassword() {
        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder(PASSWORD_LENGTH);
        for (int i = 0; i < PASSWORD_LENGTH; i++) {
            int index = random.nextInt(PASSWORD_CHARACTERS.length());
            password.append(PASSWORD_CHARACTERS.charAt(index));
        }
        return password.toString();
    }
}
