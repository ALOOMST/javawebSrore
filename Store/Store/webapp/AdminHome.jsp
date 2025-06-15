<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>管理员主页</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* 新增基础样式 */
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f0f2f5;
            box-sizing: border-box;
        }

        h1 {
            color: #1a73e8;
            text-align: center;
            margin-bottom: 30px;
            border-bottom: 2px solid #e0e0e0;
            padding-bottom: 10px;
        }

        .menu {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.05);
        }

        .menu a {
            display: block;
            padding: 12px 18px;
            margin-bottom: 8px;
            background-color: #f8f9fa;
            color: #333;
            text-decoration: none;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .menu a:hover {
            background-color: #1a73e8;
            color: white;
            padding-left: 20px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
        }

        .menu a:last-child {
            margin-bottom: 0;
        }
    </style>
</head>
<body>
    <h1>管理员主页</h1>
    <div class="menu">
        <a href="adminUserManagement.jsp">用户管理</a><br>
        <a href="admin.jsp">商品管理</a><br>
        <a href="adminCategoryManagement.jsp">类别管理</a><br>
        <a href="adminOrderManagement.jsp">订单管理</a><br>
    </div>
</body>
</html>