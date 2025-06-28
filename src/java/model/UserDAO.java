package model;
import java.sql.*;

public class UserDAO {
    private Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean registerUser(User user) throws SQLException {
        String sql = "INSERT INTO Users (Name, Email, Password, Role) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, user.getName());
        stmt.setString(2, user.getEmail());
        stmt.setString(3, user.getPassword()); // (Note: hash in real apps!)
        stmt.setString(4, user.getRole());

        return stmt.executeUpdate() > 0;
    }

    public User checkLogin(String email, String password) throws SQLException {
        String sql = "SELECT * FROM Users WHERE Email=? AND Password=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);
        stmt.setString(2, password);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            User user = new User();
            user.setUserID(rs.getInt("UserID"));
            user.setName(rs.getString("Name"));
            user.setEmail(rs.getString("Email"));
            user.setRole(rs.getString("Role"));
            return user;
        }
        return null;
}

}
