<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.Cart" %>
<%@ page import="bean.Product" %>
<%@ page import="service.ProductService" %>
<%@ page import="service.CartService" %>
<%@ page import="bean.Order" %>
<%@ page import="service.OrderService" %>
<!DOCTYPE html>
<html>
<head>
    <title>结算</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 0.9em;
            font-family: sans-serif;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }
        table thead tr {
            background-color: #009879;
            color: #ffffff;
            text-align: left;
        }
        table th, table td {
            padding: 12px 15px;
        }
        table tbody tr {
            border-bottom: 1px solid #dddddd;
        }
        table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }
        table tbody tr:last-of-type {
            border-bottom: 2px solid #009879;
        }
        .total {
            text-align: right;
            margin: 20px 0;
            font-size: 1.2em;
        }
        .footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>结算</h1>
        <%
            ProductService productService = new ProductService();
            OrderService orderService = new OrderService();
            List<Cart> cartItems = (List<Cart>) request.getAttribute("cartItems");
            double total = 0;
            
            for (Cart cartItem : cartItems) {
                Product product = productService.getProductById(cartItem.getProductId());
                if (product != null) {
                    total += product.getPrice() * cartItem.getQuantity();
                } else {
                    
                }
            }        
            
            String userId = String.valueOf(session.getAttribute("userId")) ;
            String orderDate = new java.text.SimpleDateFormat("yyyy-MM-dd HH-mm-ss").format(new java.util.Date());
            String orderStatus = "已提交";
            String shippingAddress = "默认地址"; 

            Order order = new Order(userId, orderDate, String.valueOf(total), orderStatus, shippingAddress);
            orderService.addOrder(order);
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>商品名称</th>
                    <th>价格</th> 
                    <th>数量</th>
                    <th>小计</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Cart cartItem : cartItems) {
                        Product product = productService.getProductById(cartItem.getProductId());
                %>
                <tr>
                    <td><%= product != null ? product.getProductName() : "产品信息不可用" %></td>
                    <td><%= product != null ? product.getPrice() : "0" %></td>
                    <td><%= cartItem.getQuantity() %></td>
                    <td><%= product != null ? product.getPrice() * cartItem.getQuantity() : "0" %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <p class="total">总计：￥<%= total %></p>
        <p>谢谢您的购买，欢迎下次光临！</p>
        <form action="adminOrderManagement.jsp" method="get">
            <input type="submit" value="确定">
        </form>
    </div>
    <div class="footer">
        &copy; 2023 我的网站
    </div>
</body>
</html>
