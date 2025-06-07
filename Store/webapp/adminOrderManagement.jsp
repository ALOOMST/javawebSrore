<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, bean.Order, service.OrderService" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单管理系统</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#3b82f6',
                        secondary: '#10b981',
                        accent: '#f59e0b',
                        neutral: '#64748b',
                        danger: '#ef4444',
                    },
                    fontFamily: {
                        inter: ['Inter', 'system-ui', 'sans-serif'],
                    },
                }
            }
        }
    </script>
    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto {
                content-visibility: auto;
            }
            .card-shadow {
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            }
            .table-hover-effect {
                transition: all 0.2s ease;
            }
            .btn-effect {
                transition: all 0.3s ease;
            }
            .btn-effect:hover {
                transform: translateY(-2px);
            }
        }
    </style>
</head>
<body class="bg-gray-50 font-inter min-h-screen flex flex-col">
    <!-- 顶部导航栏 -->
    <header class="bg-white shadow-sm sticky top-0 z-50">
        <div class="container mx-auto px-4 py-3 flex justify-between items-center">
            <div class="flex items-center space-x-2">
                <i class="fa-solid fa-clipboard-list text-primary text-2xl"></i>
                <h1 class="text-xl font-bold text-gray-800">订单管理系统</h1>
            </div>
            <div class="flex items-center space-x-4">
                <a href="#" class="text-gray-600 hover:text-primary transition-colors">
                    <i class="fa-solid fa-bell-o"></i>
                </a>
                <div class="relative group">
                    <button class="flex items-center space-x-2 text-gray-700">
                        <img src="https://picsum.photos/id/1005/200/200" alt="用户头像" class="w-8 h-8 rounded-full object-cover">
                        <span class="hidden md:inline">管理员</span>
                        <i class="fa-solid fa-caret-down text-xs"></i>
                    </button>
                    <div class="absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 z-10">
                        <a href="<%= request.getContextPath() %>/AdminHome.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">个人资料</a>
                        <a href="<%= request.getContextPath() %>/adminLogin.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">设置</a>
                        <div class="border-t border-gray-100 my-1"></div>
                        <a href="<%= request.getContextPath() %>/adminCategoryManagement.jsp" class="block px-4 py-2 text-sm text-red-600 hover:bg-gray-100">退出登录</a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- 主内容区 -->
    <main class="flex-grow container mx-auto px-4 py-6">
        <!-- 页面标题 -->
        <div class="mb-6">
            <h2 class="text-[clamp(1.5rem,3vw,2rem)] font-bold text-gray-800">订单管理</h2>
            <p class="text-gray-500 mt-1">查看和管理所有客户订单</p>
        </div>

     
        <!-- 订单列表 -->
        <div class="bg-white rounded-xl p-5 card-shadow">
            <div class="flex flex-col md:flex-row md:items-center justify-between mb-6">
                <h3 class="text-lg font-semibold text-gray-800">订单列表</h3>
                <div class="flex items-center space-x-3 mt-4 md:mt-0">
                    <div class="relative">
                        <input type="text" placeholder="搜索订单..." class="pl-10 pr-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-primary/30 focus:border-primary transition-all w-full md:w-64">
                        <i class="fa-solid fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                    </div>
                    <select class="bg-white border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary/30 focus:border-primary transition-all">
                        <option>所有状态</option>
                        <option>待处理</option>
                        <option>已发货</option>
                        <option>已完成</option>
                        <option>已取消</option>
                    </select>
                </div>
            </div>

            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">订单 ID</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">用户</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">日期</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">金额</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">状态</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">地址</th>
                            <th scope="col" class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">操作</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <% 
                            OrderService orderService = new OrderService();
                            List<Order> orders = orderService.getAllOrders();
                            if (orders != null && !orders.isEmpty()) {
                                for (Order order : orders) { 
                                    // 根据订单状态设置不同的颜色
                                    String statusClass = "";
                                    String statusText = "";
                                    switch (order.getOrderstatus()) {
                                        case "pending":
                                            statusClass = "bg-yellow-100 text-yellow-800";
                                            statusText = "待处理";
                                            break;
                                        case "shipped":
                                            statusClass = "bg-blue-100 text-blue-800";
                                            statusText = "已发货";
                                            break;
                                        case "completed":
                                            statusClass = "bg-green-100 text-green-800";
                                            statusText = "已完成";
                                            break;
                                        case "cancelled":
                                            statusClass = "bg-red-100 text-red-800";
                                            statusText = "已取消";
                                            break;
                                        default:
                                            statusClass = "bg-gray-100 text-gray-800";
                                            statusText = order.getOrderstatus();
                                    }
                        %>
                        <tr class="table-hover-effect hover:bg-gray-50">
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#ORD-<%= order.getOrderid() %></td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex items-center">
                                    <div class="flex-shrink-0 h-10 w-10">
                                        <img class="h-10 w-10 rounded-full object-cover" src="https://picsum.photos/id/<%= 1000 + order.getUserid() %>/200/200" alt="用户头像">
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-sm font-medium text-gray-900">用户 #<%= order.getUserid() %></div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= order.getOrderdate() %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">¥<%= order.getTotalamount() %></td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full <%= statusClass %>">
                                    <%= statusText %>
                                </span>
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-500 truncate max-w-xs"><%= order.getShippingaddress() %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <a href="OrderServlet?action=view&orderId=<%= order.getOrderid() %>" class="text-primary hover:text-primary/80 mr-3 btn-effect">
                                    <i class="fa-solid fa-eye mr-1"></i> 查看
                                </a>
                                <a href="OrderServlet?action=update&orderId=<%= order.getOrderid() %>" class="text-secondary hover:text-secondary/80 mr-3 btn-effect">
                                    <i class="fa-solid fa-pencil mr-1"></i> 更新
                                </a>
                                <a href="OrderServlet?action=delete&orderId=<%= order.getOrderid() %>" class="text-danger hover:text-danger/80 btn-effect">
                                    <i class="fa-solid fa-trash mr-1"></i> 删除
                                </a>
                            </td>
                        </tr>
                        <% } } else { %>
                        <tr>
                            <td colspan="7" class="px-6 py-4 text-center text-gray-500">没有找到订单记录</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <!-- 分页控件 -->
            <div class="flex items-center justify-between mt-6">
                <div class="text-sm text-gray-500">
                    显示 <span class="font-medium">1</span> 到 <span class="font-medium">10</span> 条，共 <span class="font-medium">245</span> 条记录
                </div>
                <div class="flex space-x-1">
                    <a href="#" class="px-3 py-1 border border-gray-300 rounded-md text-sm font-medium text-gray-500 hover:bg-gray-50">上一页</a>
                    <a href="#" class="px-3 py-1 border border-primary bg-primary text-white rounded-md text-sm font-medium">1</a>
                    <a href="#" class="px-3 py-1 border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50">2</a>
                    <a href="#" class="px-3 py-1 border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50">3</a>
                    <span class="px-3 py-1 text-sm text-gray-700">...</span>
                    <a href="#" class="px-3 py-1 border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50">25</a>
                    <a href="#" class="px-3 py-1 border border-gray-300 rounded-md text-sm font-medium text-gray-500 hover:bg-gray-50">下一页</a>
                </div>
            </div>
        </div>
    </main>

    <!-- 页脚 -->
    <footer class="bg-white border-t border-gray-200 py-6">
        <div class="container mx-auto px-4">
            <div class="flex flex-col md:flex-row justify-between items-center">
                <div class="text-center md:text-left mb-4 md:mb-0">
                    <p class="text-sm text-gray-500">© 2025 订单管理系统. 保留所有权利.</p>
                </div>
                <div class="flex space-x-6">
                    <a href="#" class="text-gray-400 hover:text-gray-600 transition-colors">
                        <i class="fa-brands fa-facebook"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-gray-600 transition-colors">
                        <i class="fa-brands fa-twitter"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-gray-600 transition-colors">
                        <i class="fa-brands fa-instagram"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-gray-600 transition-colors">
                        <i class="fa-brands fa-linkedin"></i>
                    </a>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>