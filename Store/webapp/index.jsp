  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.Product" %>
<%@ page import="service.ProductService" %>
<!DOCTYPE html>
<html>
<head>
    <title>母婴淘一淘</title>
    <style>
        /* 基础样式重置 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", sans-serif;
        }

        body {
            background: #f0f2f5;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* 导航栏优化 */
        .navbar {
            background: #1a73e8;
            overflow: hidden;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .navbar a,
        .dropdown .dropbtn {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 0.95rem;
            transition: background 0.3s;
        }

        .navbar a:hover,
        .dropdown:hover .dropbtn {
            background: #1556b0;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background: white;
            min-width: 160px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            z-index: 1;
        }

        .dropdown-content a {
            color: #333;
            padding: 10px 16px;
            display: block;
            text-align: left;
            white-space: nowrap;
        }

        .dropdown-content a:hover {
            background: #f5f5f5;
        }

        /* 搜索栏 */
        .search-form {
            display: flex;
            gap: 10px;
            margin: 20px 0;
            max-width: 600px;
        }

        .search-form input[type="text"] {
            flex-grow: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        .search-form input[type="submit"] {
            padding: 10px 20px;
            background: #1a73e8;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .search-form input[type="submit"]:hover {
            background: #1556b0;
        }

        /* 购物车图标 */
        .search-cart {
            text-align: right;
            margin-bottom: 20px;
        }

        .search-cart a {
            color: #333;
            text-decoration: none;
            position: relative;
        }

        .search-cart .cart-count {
            background: #ff4444;
            color: white;
            border-radius: 50%;
            padding: 2px 6px;
            font-size: 0.8rem;
            position: absolute;
            right: -8px;
            top: -4px;
        }

        /* 商品表格 */
        .product-table {
            width: 100%;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .product-table th,
        .product-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
        }

        .product-table th {
            background: #f5f5f5;
            color: #666;
            font-weight: 500;
            text-align: left;
        }

        .product-table img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 4px;
        }

        .add-to-cart-btn {
            padding: 6px 12px;
            background: #1a73e8;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: opacity 0.3s;
        }

        .add-to-cart-btn:hover {
            opacity: 0.9;
        }

        /* 响应式适配 */
        @media (max-width: 768px) {
            .navbar a,
            .dropdown .dropbtn {
                padding: 10px 12px;
                font-size: 0.9rem;
            }
            
            .product-table th,
            .product-table td {
                padding: 8px 10px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 style="color: #1a73e8; text-align: center; margin-bottom: 20px;">母婴淘一淘</h1>

        <!-- 导航栏 -->
        <div class="navbar">
            <a href="index.jsp">首页</a>
            <div class="dropdown">
                <div class="dropdown-content">
                    <a href="naifenSeries.jsp">奶粉辅食</a>
                    <a href="tabletSeries.jsp">纸尿裤</a>
                    <a href="wristbandSeries.jsp">喂养洗护</a>
                    <a href="digitalSeries.jsp">儿童玩具</a>
                </div>
            </div> 
            <a href="adminCategoryManagement.jsp">商品分类</a>
            <a href="hotProducts.jsp">热销商品</a>
            <a href="newProducts.jsp">新品推荐</a>
            <a href="register.jsp">注册</a>
            <a href="Login.jsp">登录</a>
        </div>

        <!-- 搜索栏和购物车 -->
        <div class="search-form">
            <form action="ProductServlet?action=search" method="post">
                <input type="text" name="keyword" placeholder="请输入商品名称" required>
                <input type="submit" value="搜索商品">
            </form>
        </div>

        <div class="search-cart">
            <a href="cart.jsp">
                购物车
            </a>
        </div>

        <!-- 商品表格 -->
        <div class="product-table">
            <table>
                <tr>
                    <th>商品名称</th>
                    <th>价格</th>
                    <th>库存</th>
                    <th>图片</th>
                    <th>商品描述</th>
                    <th>操作</th>
                </tr>
                <%
                String keyword = request.getParameter("keyword");
                ProductService productService = new ProductService();
                List<Product> productList = productService.getAllProducts();
                if (keyword != null && !keyword.isEmpty()) {
                    productList = productService.searchProducts(keyword);
                }
                if (productList != null && !productList.isEmpty()) {
                    for (Product product : productList) {
                %>
                <tr>
                    <td><%= product.getProductName() %></td>
                    <td>¥<%= product.getPrice() %></td>
                    <td><%= product.getStock() %></td>
                    <td>
                    	<img src="<%= "images/" + product.getImagepath() %>" alt="<%= product.getProductName() %>">
                    </td>
                    <td><%= product.getDescrition() %></td>
                    <td>
                        <form action="CartServlet?action=add" method="post" style="display: inline;">
                            <input type="hidden" name="userId" value="<%= session.getAttribute("userId") %>">
                            <input type="hidden" name="productId" value="<%= product.getProductId() %>">
                            <input type="number" name="quantity" value="1" min="1" style="width: 50px; padding: 4px; border: 1px solid #ddd; border-radius: 3px; margin-right: 5px;">
                            <button type="submit" class="add-to-cart-btn">加入购物车</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" style="text-align: center; color: #999;">暂无商品信息</td>
                </tr>
                <%
                }
                %>
            </table>
        </div>
    </div>

    <script>
        function updateCartCount() {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.querySelector('.cart-count').textContent = xhr.responseText;
                }
            };
            xhr.open("GET", "getCartCount.jsp", true);
            xhr.send();
        }
        setInterval(updateCartCount, 5000);
    </script>
</body>
</html>