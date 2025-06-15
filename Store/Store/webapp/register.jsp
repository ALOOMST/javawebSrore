<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.User" %>
<html>
<head>
    <title>用户注册</title>
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

        .register-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            width: 100%;
            max-width: 400px;
        }

        h1 {
            color: #1a73e8;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .form-group {
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
            font-weight: 500;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="tel"],
        input[type="text"] {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
        }

        input[type="submit"] {
            padding: 1rem;
            background: #1a73e8;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s;
        }

        input[type="submit"]:hover {
            background: #1556b0;
        }

        .message {
            text-align: center;
            margin-top: 1.5rem;
        }

        .error {
            color: #ff4444;
            margin-bottom: 0.5rem;
        }

        .success {
            color: #28a745;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h1>用户注册</h1>
        <form action="UserServlet" method="post">
            <div class="form-group">
                <label for="name">用户名:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">邮箱:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">密码:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="phone">手机号:</label>
                <input type="tel" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="address">地址:</label>
                <input type="text" id="address" name="address" required>
            </div>
            <input type="hidden" name="action" value="register">
            <input type="submit" value="提交">
        </form>
        
        <%
            String success = request.getParameter("success");
            if (success != null) {
        %>
        <div class="message">
            <% if ("userExist".equals(success)) { %>
                <p class="error">用户已存在，请重新注册</p>
            <% } else if ("1".equals(success)) { 
                User user = (User) session.getAttribute("user");
            %>
                <p class="success"><%= user.getName() %> 用户注册成功</p>
            <% } else if ("0".equals(success)) { %>
                <p class="error">用户注册失败</p>
            <% } %>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>