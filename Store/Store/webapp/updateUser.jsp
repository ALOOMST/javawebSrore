<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>修改用户信息</title>
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

        .update-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            width: 100%;
            max-width: 600px;
        }

        h1 {
            color: #1a73e8;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        form {
            display: grid;
            gap: 1.2rem;
            max-width: 400px;
            margin: 0 auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 0.8rem 0;
        }

        label,
        td:first-child {
            color: #333;
            font-weight: 500;
            min-width: 80px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
        }

        select {
            background: white;
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
            width: 100%;
        }

        input[type="submit"]:hover {
            background: #1556b0;
        }
    </style>
</head>
<body>
    <div class="update-container">
        <h1>修改用户信息</h1>
        <form action="UserServlet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="userId" value="<%= request.getParameter("userId") %>">
            <table>
                <tr>
                    <td>用户名：</td>
                    <td><input type="text" name="name" value="<%= request.getParameter("name") %>" required></td>
                </tr>
                <tr>
                    <td>邮箱：</td>
                    <td><input type="email" name="email" value="<%= request.getParameter("email") %>" required></td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><input type="password" name="password" value="<%= request.getParameter("password") %>" required></td>
                </tr>
                <tr>
                    <td>电话：</td>
                    <td><input type="tel" name="phone" value="<%= request.getParameter("phone") %>" required></td> <!-- 修正为tel类型 -->
                </tr>
                <tr>
                    <td>地址：</td>
                    <td><input type="text" name="address" value="<%= request.getParameter("address") %>" required></td>
                </tr>
                <tr>
                    <td>是否为管理员：</td>
                    <td>
                        <select name="isAdmin">
                            <option value="0" <%= "0".equals(request.getParameter("isAdmin")) ? "selected" : "" %>>普通用户</option>
                            <option value="1" <%= "1".equals(request.getParameter("isAdmin")) ? "selected" : "" %>>管理员</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="提交修改"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>