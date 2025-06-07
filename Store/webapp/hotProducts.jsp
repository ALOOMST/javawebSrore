<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.Product" %>
<%@ page import="service.ProductService" %>
<!DOCTYPE html>
<html>
<head>
    <title>热销商品</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }
        .product-item {
            width: 200px;
            border: 1px solid #ddd;
            margin: 10px;
            padding: 10px;
            text-align: center;
        }
        .product-item img {
            width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <h1>热销商品</h1>
    <div class="product-container">
        <%
            ProductService productService = new ProductService();
            List<Product> hotProducts = productService.getHotProducts();
            for (Product product : hotProducts) {
        %>
        <div class="product-item">
            <img src="<%= "images/" + product.getImagepath() %>" 
            alt="<%= product.getProductName() %>">
            <p><%= product.getProductName() %></p>
            <p>￥<%= product.getPrice() %></p>
            <form action="CartServlet?action=add" method="post">
                <input type="hidden" name="userId" value="<%= session.getAttribute("userId") %>">
                <input type="hidden" name="productId" value="<%= product.getProductId() %>">
                <input type="number" name="quantity" value="1" min="1">
                <input type="submit" value="加入购物车">
            </form>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>