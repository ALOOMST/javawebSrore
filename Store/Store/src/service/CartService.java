package service;

import java.sql.SQLException;
import java.util.List;

import bean.Cart;
import dao.CartDao;

public class CartService {
    private final CartDao cartDao = new CartDao();

    public boolean addToCart(Cart cart) {
        try {
            return cartDao.addToCart(cart);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateCart(Cart cart) {
        try {
            return cartDao.updateCart(cart);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteFromCart(int cartId) {
        try {
            return cartDao.deleteFromCart(cartId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Cart> getCartItemsByUserId(int userId) {
        try {
            return cartDao.getCartItemsByUserId(userId);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}