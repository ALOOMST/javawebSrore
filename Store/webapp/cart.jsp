<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.Cart" %>
<%@ page import="bean.Product" %>
<%@ page import="service.ProductService" %>
<%@ page import="service.CartService" %>
<!DOCTYPE html>
<html>
<head>
    <title>购物车</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f0f0f0;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        .cart-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f8f8f8;
            font-weight: bold;
        }

        .action {
            white-space: nowrap;
        }

        input[type="number"] {
            width: 60px;
            padding: 6px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button, a {
            padding: 6px 12px;
            margin-left: 8px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button {
            background-color: #4CAF50;
            color: white;
        }

        a {
            background-color: #ff4444;
            color: white;
            text-decoration: none;
        }

        button:hover, a:hover {
            opacity: 0.8;
        }

        .empty {
            text-align: center;
            margin: 20px 0;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="cart-container">
        <h1>购物车</h1>
        
        <%
            List<Cart> cartItems = (List<Cart>) request.getAttribute("cartItems");
            if (cartItems == null) {
                response.sendRedirect("CartServlet?action=list");
                return;
            }
        %>
        
        <% if (!cartItems.isEmpty()) { %>
        <table>
            <tr>
                <th>商品名称</th>
                <th>单价（元）</th>
                <th>数量</th>
                <th>操作</th>
            </tr>
            <%
                for (Cart cart : cartItems) {
                    ProductService productService = new ProductService();
                    Product product = productService.getAllProducts().stream()
                            .filter(p -> p.getProductId().equals(cart.getProductId()))
                            .findFirst()
                            .orElse(null);
            %>
            <% if (product != null) { %>
            <tr>
                <td><%= product.getProductName() %></td>
                <td>¥<%= product.getPrice() %></td>
                <td>
                    <form action="CartServlet?action=update" method="post" class="action">
                        <input type="hidden" name="cartId" value="<%= cart.getCartId() %>">
                        <input type="number" name="quantity" value="<%= cart.getQuantity() %>" min="1">
                        <button type="submit">更新</button>
                    </form>
                </td>
                <td>
                    <a href="CartServlet?action=delete&cartId=<%= cart.getCartId() %>">删除</a>
                </td>
            </tr>
            <% } else { %>
            <tr>
                <td colspan="4">商品信息不存在</td>
            </tr>
            <% } %>
            <% } %>
        </table>
        
        <form action="CartServlet?action=checkout" method="post">
            <button type="submit" style="margin-top: 15px;">去结算</button>
        </form>
        
        <% } else { %>
        <p class="empty">购物车中没有商品</p>
        <% } %>
    </div>
</body>
</html> 