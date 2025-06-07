package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import bean.Cart;
import bean.Product;
import bean.Order;
import service.CartService;
import service.ProductService;
import service.OrderService;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final CartService cartService = new CartService();
    private final ProductService productService = new ProductService();
    private final OrderService orderService = new OrderService();
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        Integer userId = (Integer) request.getSession().getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("Login.jsp"); // 用户未登录，重定向到登录页面
            return;
        }

        if ("add".equals(action)) {
            String productId = request.getParameter("productId");
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            // 获取商品信息
            Product product = productService.getProductById(productId);
            if (product == null) {
                response.sendRedirect("index.jsp?error=productNotFound");
                return;
            }

            // 检查库存
            if (quantity > Integer.parseInt(product.getStock())) {
                response.sendRedirect("index.jsp?error=stockNotEnough");
                return;
            }

            Cart cartItem = new Cart(userId, productId, quantity);
            boolean success = cartService.addToCart(cartItem);
            if (success) {
                response.sendRedirect("cart.jsp");
            } else {
                response.sendRedirect("index.jsp?error=addFailed");
            }
        } else if ("update".equals(action)) {
            int cartId = Integer.parseInt(request.getParameter("cartId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            Cart cart = new Cart();
            cart.setCartId(cartId);
            cart.setQuantity(quantity);

            boolean success = cartService.updateCart(cart);
            if (success) {
                response.sendRedirect("cart.jsp");
            } else {
                response.sendRedirect("cart.jsp?error=updateFailed");
            }
        } else if ("delete".equals(action)) {
            int cartId = Integer.parseInt(request.getParameter("cartId"));
            boolean success = cartService.deleteFromCart(cartId);
            if (success) {
                response.sendRedirect("cart.jsp");
            } else {
                response.sendRedirect("cart.jsp?error=deleteFailed");
            }
        } else if ("list".equals(action)) {
            List<Cart> cartItems = cartService.getCartItemsByUserId(userId);
            request.setAttribute("cartItems", cartItems);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else if ("checkout".equals(action)) {
            List<Cart> cartItems = cartService.getCartItemsByUserId(userId);
            request.setAttribute("cartItems", cartItems);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
