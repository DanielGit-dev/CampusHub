package controller;

import model.bean.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("name");
        String password = request.getParameter("password");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CampusHub", "app", "app");

            String sql = "SELECT * FROM Users WHERE Username=? AND Password=? AND Role='Admin'";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Create user object and store in session
                User admin = new User();
                admin.setUserID(rs.getInt("UserID"));
                admin.setName(rs.getString("Username"));
                admin.setRole(rs.getString("Role"));
                request.getSession().setAttribute("user", admin);

                response.sendRedirect("admin_dashboard.jsp");
            } else {
                request.setAttribute("error", "Invalid credentials or not an admin.");
                request.getRequestDispatcher("admin_login.jsp").forward(request, response);
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Internal error: " + e.getMessage());
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);
        }
    }
}
