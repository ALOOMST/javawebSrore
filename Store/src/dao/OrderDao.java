/*package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import bean.Order;
import utils.C3pConnection;

public class OrderDao {
    public List<Order> getAllOrders() throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT * FROM Order";
        return r.query(sql, new BeanListHandler<>(Order.class));
    }

    public boolean addOrder(Order order) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "INSERT INTO Order (userid, orderdate, totalamount, orderstatus, shippingaddress) VALUES (?, ?, ?, ?, ?)";
        int i = r.update(sql, order.getUserid(), order.getOrderdate(), order.getTotalamount(), order.getOrderstatus(), order.getShippingaddress());
        return i > 0;
    }

    public List<Order> getOrdersByUserId(int userId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT * FROM Order WHERE userid=?";
        return r.query(sql, new BeanListHandler<>(Order.class), userId);
    }
}*/
package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;

import bean.Order;
import utils.C3pConnection;

public class OrderDao {
    public List<Order> getAllOrders() throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT * FROM Order";
        return r.query(sql, new BeanListHandler<>(Order.class));
    }

    public boolean addOrder(Order order) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "INSERT INTO Order (userid, orderdate, totalamount, orderstatus, shippingaddress) VALUES (?, ?, ?, ?, ?)";
        int i = r.update(sql, order.getUserid(), order.getOrderdate(), order.getTotalamount(), order.getOrderstatus(), order.getShippingaddress());
        return i > 0;
    }

    public Order getOrderById(int orderId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT * FROM Order WHERE orderid=?";
        return r.query(sql, new BeanHandler<>(Order.class), orderId);
    }

    public boolean updateOrder(Order order) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "UPDATE Order SET orderstatus=?, shippingaddress=? WHERE orderid=?";
        int i = r.update(sql, order.getOrderstatus(), order.getShippingaddress(), order.getOrderid());
        return i > 0;
    }

    public boolean deleteOrder(int orderId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "DELETE FROM Order WHERE orderid=?";
        int i = r.update(sql, orderId);
        return i > 0;
    }

    public List<Order> getOrdersByUserId(int userId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT * FROM Order WHERE userid=?";
        return r.query(sql, new BeanListHandler<>(Order.class), userId);
    }
}