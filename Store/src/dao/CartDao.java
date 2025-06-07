package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import bean.Cart;
import utils.C3pConnection;

public class CartDao {
    public boolean addToCart(Cart cart) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "INSERT INTO Cart (UserID, ProductID, Quantity) VALUES (?, ?, ?)";
        int i = r.update(sql, cart.getUserId(), cart.getProductId(), cart.getQuantity());
        return i > 0;
    }

    public boolean updateCart(Cart cart) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "UPDATE Cart SET Quantity=? WHERE CartID=?";
        int i = r.update(sql, cart.getQuantity(), cart.getCartId());
        return i > 0;
    }

    public boolean deleteFromCart(int cartId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "DELETE FROM Cart WHERE CartID=?";
        int i = r.update(sql, cartId);
        return i > 0;
    }

    public List<Cart> getCartItemsByUserId(int userId) throws SQLException {
        QueryRunner r = new QueryRunner(C3pConnection.getDataSource());
        String sql = "SELECT * FROM Cart WHERE UserID=?";
        return r.query(sql, new BeanListHandler<>(Cart.class), userId);
    }
}
