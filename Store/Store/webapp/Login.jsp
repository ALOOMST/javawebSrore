<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>用户登录</title>
    <style>
        /* 基础样式 */
        body {
            font-family: "Segoe UI", sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background: #f0f2f5;
        }

        .login-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        h1 {
            color: #1a73e8;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        form {
            max-width: 300px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
        }

        input[type="submit"] {
            width: 100%;
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
            margin-top: 1.5rem;
            text-align: center;
        }

        .error {
            color: #ff4444;
            margin-bottom: 0.5rem;
        }

        .error a {
            color: #1a73e8;
            text-decoration: none;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>用户登录</h1>
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="name">用户名:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="password">密码:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <input type="submit" value="登录">
        </form>
        
        <%
            String loginMessage = request.getParameter("loginMessage");
            if (loginMessage != null) {
        %>
        <div class="message">
            <% if ("userNotExist".equals(loginMessage)) { %>
                <p class="error">用户不存在，请<a href="register.jsp">立即注册</a></p>
            <% } else if ("usernameError".equals(loginMessage)) { %>
                <p class="error">用户名错误</p>
            <% } else if ("passwordError".equals(loginMessage)) { %>
                <p class="error">密码错误</p>
            <% } else if ("notAdmin".equals(loginMessage)) { %>
                <p class="error">您不是管理员，无访问特权</p>
            <% } %>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>