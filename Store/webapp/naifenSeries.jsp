<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.Product" %>
<%@ page import="service.ProductService" %>
<!DOCTYPE html>
<html>
<head>
    <title>奶粉辅食</title>
    <style>
        /* 基础样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", sans-serif;
        }

        body {
            background: #f5f7fa;
            padding: 20px;
        }

        h1 {
            color: #1a73e8;
            text-align: center;
            margin: 30px 0;
            font-size: 1.7rem;
            border-bottom: 3px solid #e0e0e0;
            padding-bottom: 8px;
        }

        .product-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
            gap: 25px;
            max-width: 1000px;
            margin: 0 auto;
        }

        .product-item {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.05);
            text-align: center;
            padding: 15px;
            transition: transform 0.2s ease;
        }

        .product-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .product-item img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 6px;
            margin-bottom: 10px;
        }

        .product-name {
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 5px;
        }

        .product-price {
            font-size: 1.2rem;
            color: #ff5722;
            font-weight: 500;
            margin-bottom: 12px;
        }

        .add-to-cart-btn {
            padding: 7px 18px;
            background: #1a73e8;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .add-to-cart-btn:hover {
            background: #1556b0;
        }

        /* 输入框样式 */
        input[type="number"] {
            width: 60px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-align: center;
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <h1>奶粉辅食</h1>
    <div class="product-container">
        <%
            ProductService productService = new ProductService();
            List<Product> naifenSeriesProducts = productService.getnaifenSeriesProducts();
            for (Product product : naifenSeriesProducts) {
        %>
        <div class="product-item">
            <img src="<%= "images/" + product.getImagepath() %>" 
                 alt="<%= product.getProductName() %>">
            <div class="product-info">
                <p class="product-name"><%= product.getProductName() %></p>
                <p class="product-price">￥<%= product.getPrice() %></p>
                <form action="CartServlet?action=add" method="post">
                    <input type="hidden" name="userId" value="<%= session.getAttribute("userId") %>">
                    <input type="hidden" name="productId" value="<%= product.getProductId() %>">
                    <input type="number" name="quantity" value="1" min="1">
                    <button type="submit" class="add-to-cart-btn">加入购物车</button>
                </form>
            </div>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>