package controller;

import dao.UserDAO;
import model.User; // Assuming you have a User model class
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate password fields
        if (!newPassword.equals(confirmPassword)) {
            out.println("<html><body>");
            out.println("<h3>Passwords do not match!</h3>");
            out.println("<p><a href='changepassword.html'>Try Again</a></p>");
            out.println("</body></html>");
            return;
        }

        // Assuming you have a session attribute or parameter to identify the user,
        // fetch the user information from session or request parameters.
        String userId = "user123"; // Replace with actual user identification mechanism

        // Instantiate UserDAO to update password
        UserDAO userDAO = new UserDAO();

        try {
            // Retrieve user from DAO (optional, depending on your application flow)
            Optional<User> optionalUser = ((UserDAO) userDAO).getUserById(userId);

            if (optionalUser.isPresent()) {
                User user = optionalUser.get();
                // Update user's password
                user.setPassword(newPassword);
                // Save updated user in DAO
                boolean updated = userDAO.updateUser(user);

                if (updated) {
                    out.println("<html><body>");
                    out.println("<h3>Password updated successfully!</h3>");
                    out.println("<form action='dashboard.jsp' method='get'>");
                    out.println("<button type='submit'>Go to Dashboard</button>");
                    out.println("</form>");
                    out.println("</body></html>");
                } else {
                    out.println("<h3>Error updating password!</h3>");
                }
            } else {
                out.println("<h3>User not found!</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            out.close();
        }
    }
}
