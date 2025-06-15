package service;

import java.sql.SQLException;
import java.util.List;

import bean.Order;
import dao.OrderDao;

public class OrderService {
    private final OrderDao orderDao = new OrderDao();

    public List<Order> getAllOrders() {
        try {
            return orderDao.getAllOrders();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean addOrder(Order order) {
        try {
            return orderDao.addOrder(order);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Order getOrderById(int orderId) {
        try {
            return orderDao.getOrderById(orderId);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean updateOrder(Order order) {
        try {
            return orderDao.updateOrder(order);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteOrder(int orderId) {
        try {
            return orderDao.deleteOrder(orderId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Order> getOrdersByUserId(int userId) {
        try {
            return orderDao.getOrdersByUserId(userId);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
