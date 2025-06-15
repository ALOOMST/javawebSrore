package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.Order;
import service.OrderService;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final OrderService orderService = new OrderService();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("view".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            Order order = orderService.getOrderById(orderId);
            request.setAttribute("order", order);
            request.getRequestDispatcher("viewOrder.jsp").forward(request, response);
        } else if ("update".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            Order order = orderService.getOrderById(orderId);
            request.setAttribute("order", order);
            request.getRequestDispatcher("editOrder.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            boolean success = orderService.deleteOrder(orderId);
            if (success) {
                response.sendRedirect("adminOrderManagement.jsp");
            } else {
                response.sendRedirect("adminOrderManagement.jsp?error=deleteFailed");
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("update".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String orderStatus = request.getParameter("orderStatus");
            String shippingAddress = request.getParameter("shippingAddress");
            
            Order order = new Order();
            order.setOrderid(orderId);
            order.setOrderstatus(orderStatus);
            order.setShippingaddress(shippingAddress);
            
            boolean success = orderService.updateOrder(order);
            if (success) {
                response.sendRedirect("adminOrderManagement.jsp");
            } else {
                response.sendRedirect("adminOrderManagement.jsp?error=updateFailed");
            }
        }
    }
}