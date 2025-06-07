<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.Product" %>
<%@ page import="service.ProductService" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>喂养洗护</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Helvetica Neue', sans-serif;
        }

        body {
            background-color: #f9f9f9;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin: 20px 0 30px;
        }

        .products {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .product {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #eee;
        }

        .product img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .product-info {
            padding: 15px;
        }

        .product-name {
            font-size: 1.1rem;
            font-weight: 500;
            margin-bottom: 8px;
        }

        .product-price {
            color: #e63946;
            font-weight: bold;
            margin-bottom: 12px;
        }

        .add-to-cart {
            width: 100%;
            padding: 10px;
            background-color: #4a8fe7;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .add-to-cart:hover {
            background-color: #3a78c9;
        }

        .quantity {
            width: 50px;
            padding: 8px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <h1>喂养洗护</h1>
    
    <div class="products">
        <%
            ProductService productService = new ProductService();
            List<Product> weiyangSeriesProducts = productService.getweiyangSeriesProducts();
            for (Product product : weiyangSeriesProducts) {
        %>
        <div class="product">
            <img src="<%= "images/" + product.getImagepath() %>" 
                 alt="<%= product.getProductName() %>">
            <div class="product-info">
                <h3 class="product-name"><%= product.getProductName() %></h3>
                <p class="product-price">￥<%= product.getPrice() %></p>
                <form action="CartServlet?action=add" method="post">
                    <input type="hidden" name="userId" value="<%= session.getAttribute("userId") %>">
                    <input type="hidden" name="productId" value="<%= product.getProductId() %>">
                    <div>
                        <input type="number" name="quantity" value="1" min="1" class="quantity">
                        <button type="submit" class="add-to-cart">加入购物车</button>
                    </div>
                </form>
            </div>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>