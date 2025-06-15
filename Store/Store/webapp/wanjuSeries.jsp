<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.Product" %>
<%@ page import="service.ProductService" %>
<!DOCTYPE html>
<html>
<head>
    <title>儿童玩具</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f0f0;
            padding: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 25px;
            border-bottom: 2px solid #ccc;
            padding-bottom: 8px;
        }

        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            max-width: 1000px;
            margin: 0 auto;
        }

        .product {
            background: white;
            border-radius: 6px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            text-align: center;
            padding: 15px;
            transition: transform 0.2s;
        }

        .product:hover {
            transform: translateY(-3px);
        }

        .product img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .name {
            font-weight: bold;
            color: #222;
            margin-bottom: 5px;
        }

        .price {
            color: #ff6600;
            font-size: 1.1em;
            margin-bottom: 15px;
        }

        .add-btn {
            padding: 8px 18px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .add-btn:hover {
            background: #0056b3;
        }

        .quantity-input {
            width: 60px;
            padding: 6px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <h1>儿童玩具</h1>
    <div class="products">
        <%
            ProductService productService = new ProductService();
            List<Product> wanjuSeriesProducts = productService.getwanjuSeriesProducts();
            for (Product product : wanjuSeriesProducts) {
        %>
        <div class="product">
            <img src="<%= "images/" + product.getImagepath() %>" 
                 alt="<%= product.getProductName() %>">
            <p class="name"><%= product.getProductName() %></p>
            <p class="price">￥<%= product.getPrice() %></p>
            <form action="CartServlet?action=add" method="post">
                <input type="hidden" name="userId" value="<%= session.getAttribute("userId") %>">
                <input type="hidden" name="productId" value="<%= product.getProductId() %>">
                <input type="number" class="quantity-input" name="quantity" value="1" min="1">
                <button type="submit" class="add-btn">加入购物车</button>
            </form>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>