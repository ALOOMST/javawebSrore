<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>订单提交成功</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background: #f0f2f5;
        }

        .success-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            text-align: center;
        }

        h1 {
            color: #1a73e8;
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
        }

        p {
            color: #333;
            font-size: 1.1rem;
            margin-bottom: 2rem;
        }

        .order-id {
            font-weight: 500;
            color: #ff5722;
        }

        a {
            display: inline-block;
            padding: 0.8rem 2rem;
            background: #1a73e8;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 1rem;
            transition: background 0.3s;
        }

        a:hover {
            background: #1556b0;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <h1>订单提交成功</h1>
        <p>您的订单已成功提交，订单号为：<span class="order-id"><%= request.getAttribute("orderId") %></span></p>
        <a href="index.jsp">返回首页</a>
    </div>
</body>
</html>