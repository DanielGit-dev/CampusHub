import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddEventServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String dateStr = request.getParameter("date");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        int clubID = Integer.parseInt(request.getParameter("clubID"));

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/event", "app", "app");

            String sql = "INSERT INTO Events (Title, Description, Date, Capacity, ClubID) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setDate(3, java.sql.Date.valueOf(dateStr));
            ps.setInt(4, capacity);
            ps.setInt(5, clubID);

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("event_success.jsp");
            } else {
                response.sendRedirect("event_error.jsp");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("event_error.jsp");
        }
    }
}
