package controller;


import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/EditEventServlet")
public class EditEventServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int eventId = Integer.parseInt(request.getParameter("eventId"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String dateStr = request.getParameter("date");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            int clubId = Integer.parseInt(request.getParameter("clubId"));

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/CampusHub", "app", "app");

            String sql = "UPDATE EVENTS SET TITLE=?, DESCRIPTION=?, DATE=?, CAPACITY=?, CLUBID=? WHERE EVENTID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setDate(3, java.sql.Date.valueOf(dateStr)); // Format: YYYY-MM-DD
            ps.setInt(4, capacity);
            ps.setInt(5, clubId);
            ps.setInt(6, eventId);

            int result = ps.executeUpdate();
            conn.close();

            if (result > 0) {
                response.sendRedirect("manage_event.jsp");
            } else {
                response.sendRedirect("event_error.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
