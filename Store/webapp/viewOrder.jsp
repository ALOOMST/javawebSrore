<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.Order" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>查看订单</title>
</head>
<body>
    <h1>查看订单</h1>
    <%
        Order order = (Order) request.getAttribute("order");
        if (order != null) {
    %>
    <p>订单 ID: <%= order.getOrderid() %></p>
    <p>用户 ID: <%= order.getUserid() %></p>
    <p>订单日期: <%= order.getOrderdate() %></p>
    <p>总金额: <%= order.getTotalamount() %></p>
    <p>订单状态: <%= order.getOrderstatus() %></p>
    <p>收货地址: <%= order.getShippingaddress() %></p>
    <a href="adminOrderManagement.jsp">返回订单列表</a>
    <% } else { %>
        <p>未找到该订单。</p>
        <a href="adminOrderManagement.jsp">返回订单列表</a>
    <% } %>
</body>
</html>