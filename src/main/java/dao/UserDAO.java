package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

import model.User; // Assuming you have a User model class

public class UserDAO {
    // Database connection parameters
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/banking_application";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "123456";

    // SQL queries
    private static final String SQL_SELECT_USER_BY_ID = "SELECT * FROM users WHERE user_id = ?";
    private static final String SQL_UPDATE_USER_PASSWORD = "UPDATE users SET password = ? WHERE user_id = ?";

    // Method to get user by ID
    public Optional<User> getUserById(String userId) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Optional<User> user = Optional.empty();

        try {
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            stmt = conn.prepareStatement(SQL_SELECT_USER_BY_ID);
            stmt.setString(1, userId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Assuming User model has appropriate constructors and setters
                User u = new User();
                u.setUserId(rs.getString("user_id"));
                u.setPassword(rs.getString("password"));
                // Add more fields as needed
                user = Optional.of(u);
            }
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }

        return user;
    }

    // Method to update user's password
    public boolean updateUser(User user) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean updated = false;

        try {
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            stmt = conn.prepareStatement(SQL_UPDATE_USER_PASSWORD);
            stmt.setString(1, user.getPassword());
            stmt.setString(2, user.getUserId());
            int rows = stmt.executeUpdate();

            if (rows > 0) {
                updated = true;
            }
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }

        return updated;
    }

	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	public Optional<User> getUserById(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public Optional<User> getUserById(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}
}
