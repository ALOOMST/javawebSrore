<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.Product" %>
<%@ page import="service.ProductService" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品管理</title>
    <style>
        /* 全局样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Microsoft YaHei", sans-serif;
        }

        body {
            line-height: 1.6;
            background-color: #f5f7fa;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h1, h2 {
            color: #2c3e50;
            margin: 20px 0;
            border-bottom: 2px solid #3498db;
            padding-bottom: 8px;
        }

        /* 表单样式 */
        .form-group {
            margin-bottom: 15px;
        }

        form {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            max-width: 600px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: 500;
        }

        input[type="text"],
        input[type="number"],
        input[type="file"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        /* 表格样式 */
        table {
            width: 100%;
            background: white;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #f0f0f0;
        }

        th {
            background-color: #f8f9fa;
            color: #2c3e50;
            font-weight: 600;
        }

        td img {
            border-radius: 4px;
            vertical-align: middle;
            margin-right: 8px;
        }

        /* 操作按钮样式 */
        td a {
            color: #3498db;
            text-decoration: none;
            margin-right: 8px;
            font-size: 14px;
            transition: color 0.3s;
        }

        td a:hover {
            color: #2980b9;
        }

        /* 状态标签样式（热销/新品） */
        .status-tag {
            display: inline-block;
            padding: 3px 8px;
            border-radius: 18px;
            font-size: 12px;
            margin-left: 5px;
        }

        .hot-tag {
            background-color: #ffeb3b;
            color: #333;
        }

        .new-tag {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>商品管理</h1>
        <form action="ProductServlet?action=add" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>商品名称：</label>
                <input type="text" name="productName" required>
            </div>
            <div class="form-group">
                <label>价格：</label>
                <input type="number" name="price" step="0.01" required>
            </div>
            <div class="form-group">
                <label>库存：</label>
                <input type="text" name="stock" required>
            </div>
            <div class="form-group">
                <label>图片路径：</label>
                <input type="file" name="imagePath" required>
            </div>
            <div class="form-group">
                <label>商品描述:</label>
                <input type="text" name="descrition" required>
            </div>
            <input type="submit" value="添加商品">
        </form>

        <h2>商品列表</h2>
        <table border="1">
            <tr>
                <th>商品名称</th>
                <th>价格</th>
                <th>库存</th>
                <th>图片路径</th>
                <th>商品描述</th>
                <th>操作</th>
            </tr>
            <%
                ProductService productService = new ProductService();
                List<Product> productList = productService.getAllProducts();
                if (productList != null && !productList.isEmpty()) {
                    for (Product product : productList) {
            %>
            <tr>
                <td><%= product.getProductName() %>
                    <!-- 可选：如果有状态标记可添加 -->
                    <%--<c:if test="${product.isHot}"><span class="status-tag hot-tag">热销</span></c:if>--%>
                    <%--<c:if test="${product.isNew}"><span class="status-tag new-tag">新品</span></c:if>--%>
                </td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getStock() %></td>
                <td>
                    <img src="<%= "images/" + product.getImagepath() %>" alt="<%= product.getProductName() %>" width="50" height="50">
                </td>
                <td><%= product.getDescrition() %></td>
                <td>
                    <a href="ProductServlet?action=edit&productId=<%= product.getProductId() %>">修改</a>
                    <a href="ProductServlet?action=deleteInfo&productId=<%= product.getProductId() %>&deleteField=price">删除价格</a>
                    <a href="ProductServlet?action=deleteInfo&productId=<%= product.getProductId() %>&deleteField=stock">删除库存</a>
                    <a href="ProductServlet?action=deleteInfo&productId=<%= product.getProductId() %>&deleteField=imagepath">删除图片</a>
                    <a href="ProductServlet?action=deleteInfo&productId=<%= product.getProductId() %>&deleteField=descrition">删除描述</a>
                    <a href="ProductServlet?action=deleteInfo&productId=<%= product.getProductId() %>&deleteField=productName">删除商品</a>
                    <a href="ProductServlet?action=addHot&productId=<%= product.getProductId() %>">加入热销</a>
                    <a href="ProductServlet?action=addNew&productId=<%= product.getProductId() %>">加入新品</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>

        <h2>热销商品</h2>
        <table border="1">
            <tr>
                <th>商品名称</th>
                <th>价格</th>
                <th>库存</th>
                <th>图片路径</th>
                <th>商品描述</th>
                <th>操作</th>
            </tr>
            <%
                List<Product> hotProducts = productService.getHotProducts();
                if (hotProducts != null && !hotProducts.isEmpty()) {
                    for (Product product : hotProducts) {
            %>
            <tr>
                <td><%= product.getProductName() %> <span class="status-tag hot-tag">热销</span></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getStock() %></td>
                <td>
                    <img src="<%= "images/" + product.getImagepath() %>" alt="<%= product.getProductName() %>" width="50" height="50">
                </td>
                <td><%= product.getDescrition() %></td>
                <td>
                    <a href="ProductServlet?action=removeHot&productId=<%= product.getProductId() %>">移出热销</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>

        <h2>新品推荐</h2>
        <table border="1">
            <tr>
                <th>商品名称</th>
                <th>价格</th>
                <th>库存</th>
                <th>图片路径</th>
                <th>商品描述</th>
                <th>操作</th>
            </tr>
            <%
                List<Product> newProducts = productService.getNewProducts();
                if (newProducts != null && !newProducts.isEmpty()) {
                    for (Product product : newProducts) {
            %>
            <tr>
                <td><%= product.getProductName() %> <span class="status-tag new-tag">新品</span></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getStock() %></td>
                <td>
                    <img src="<%= "images/" + product.getImagepath() %>" alt="<%= product.getProductName() %>" width="50" height="50">
                </td>
                <td><%= product.getDescrition() %></td>
                <td>
                    <a href="ProductServlet?action=removeNew&productId=<%= product.getProductId() %>">移出新品</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </div>
</body>
</html>