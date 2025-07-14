package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/DeleteMerchandiseServlet")
public class DeleteMerchandiseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int itemId = Integer.parseInt(request.getParameter("itemId"));

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CampusHub", "app", "app");

            String sql = "DELETE FROM MERCHANDISE WHERE ITEMID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, itemId);

            int result = ps.executeUpdate();
            conn.close();

            if (result > 0) {
                response.sendRedirect("manage_merchandise.jsp");
            } else {
                response.sendRedirect("merch_error.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
