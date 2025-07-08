package controller;

import dao.OrderDAO;
import model.bean.Order;
import model.bean.OrderDetail;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        int merchId = Integer.parseInt(request.getParameter("merch_id"));
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double total = price * quantity;

        OrderDAO dao = new OrderDAO();
        dao.placeOrder(userId, merchId, quantity, total);

        response.sendRedirect("orders.jsp");
    }
}
