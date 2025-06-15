<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.Product" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改商品 - 管理系统</title>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            background-color: #f5f7fa;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 30px;
        }

        h1 {
            color: #1a73e8;
            margin-bottom: 25px;
            text-align: center;
            border-bottom: 2px solid #1a73e8;
            padding-bottom: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            transition: border-color 0.2s;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            outline: none;
            border-color: #1a73e8;
            box-shadow: 0 0 0 2px rgba(26, 115, 232, 0.2);
        }

        input[type="file"] {
            padding: 8px;
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #1a73e8;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.2s;
        }

        .btn-submit:hover {
            background-color: #0d47a1;
        }

        .btn-submit i {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fa fa-edit"></i> 修改商品</h1>
        
        <form action="ProductServlet?action=update" method="post" enctype="multipart/form-data">
            <input type="hidden" name="productId" value="${param.productId}">
            
            <div class="form-group">
                <label for="productName">商品名称：</label>
                <input type="text" id="productName" name="productName" value="${param.productName}" required>
            </div>
            
            <div class="form-group">
                <label for="price">价格：</label>
                <input type="number" id="price" name="price" value="${param.price}" step="0.01" required>
            </div>
            
            <div class="form-group">
                <label for="stock">库存：</label>
                <input type="text" id="stock" name="stock" value="${param.stock}" required>
            </div>
            
            <div class="form-group">
                <label for="imagePath">图片路径：</label>
                <input type="file" id="imagePath" name="imagePath">
            </div>
            
            <div class="form-group">
                <label for="descrition">商品描述：</label>
                <input type="text" id="descrition" name="descrition" value="${param.descrition}" required>
            </div>
            
            <button type="submit" class="btn-submit">
                <i class="fa fa-check-circle"></i> 更新商品
            </button>
        </form>
    </div>
</body>
</html>