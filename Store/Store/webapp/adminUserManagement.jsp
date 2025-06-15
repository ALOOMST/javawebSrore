<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="service.UserService" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户管理</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#165DFF',
                        secondary: '#36CFC9',
                        neutral: '#F5F7FA',
                        dark: '#1D2129',
                        success: '#52C41A',
                        danger: '#FF4D4F',
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
            .table-hover-effect {
                transition: all 0.2s ease-in-out;
            }
            .table-hover-effect:hover {
                transform: translateY(-1px);
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.08);
            }
        }
    </style>
</head>
<body class="font-inter bg-neutral min-h-screen flex flex-col">
    <!-- 导航栏 -->
    <nav class="bg-white shadow-sm sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    <span class="text-primary font-bold text-xl">管理系统</span>
                </div>
                <div class="flex items-center space-x-4">
                    <a href="<%= request.getContextPath() %>/index.jsp" class="text-gray-600 hover:text-primary transition-colors duration-200">
                        <i class="fa fa-home mr-1"></i>首页
                    </a>
                    <a href="<%= request.getContextPath() %>/adminCategoryManagement.jsp" class="text-gray-600 hover:text-primary transition-colors duration-200">
                        <i class="fa fa-sign-out mr-1"></i>退出
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- 主要内容 -->
    <main class="flex-grow p-4 sm:p-6 lg:p-8">
        <div class="max-w-7xl mx-auto">
            <!-- 页面标题 -->
            <div class="mb-8">
                <h1 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-dark mb-2">
                    <i class="fa fa-users text-primary mr-1"></i>用户管理
                </h1>
                <p class="text-gray-500">管理系统用户信息和权限</p>
            </div>

            <!-- 用户列表卡片 -->
            <div class="bg-white rounded-xl p-6 shadow-lg transform hover:scale-[1.005] transition-all duration-300">
                <h2 class="text-xl font-bold text-dark mb-4 flex items-center">
                    <i class="fa fa-list text-primary mr-2"></i>用户列表
                </h2>
                
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">用户ID</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">用户名</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">邮箱</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">电话</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">地址</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">是否为管理员</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">操作</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <%
                                UserService userService = new UserService();
                                List<Map<String, Object>> userList = userService.selectUser("");
                                if (userList != null && !userList.isEmpty()) {
                                    for (Map<String, Object> user : userList) {
                            %>
                            <tr class="hover:bg-gray-50 table-hover-effect">
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-medium text-gray-900"><%= user.get("userid") %></div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-medium text-gray-900"><%= user.get("name") %></div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900"><%= user.get("email") %></div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900"><%= user.get("phone") %></div>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="text-sm text-gray-900"><%= user.get("address") %></div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">
                                        <%= "1".equals(user.get("isAdmin")) ? 
                                            "<span class='inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 color-green-800'>是</span>" : 
                                            "<span class='inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-100 color-gray-800'>否</span>" %>
                                    </div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    <div class="flex space-x-2">
                                        <a href="updateUser.jsp?userId=<%= user.get("userid") %>&name=<%= user.get("name") %>&email=<%= user.get("email") %>&password=<%= user.get("password") %>&phone=<%= user.get("phone") %>&address=<%= user.get("address") %>&isAdmin=<%= user.get("isAdmin") %>"
                                           class="inline-flex items-center px-3 py-1 bg-primary/10 text-primary rounded-md hover:bg-primary/20 transition-colors duration-200">
                                            <i class="fa fa-pencil mr-1"></i> 修改
                                        </a>
                                        <a href="UserServlet?action=delete&userId=<%= user.get("userid") %>"
                                           class="inline-flex items-center px-3 py-1 bg-red-50 text-red-700 rounded-md hover:bg-red-100 transition-colors duration-200">
                                            <i class="fa fa-trash-o mr-1"></i> 删除
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="7" class="px-6 py-4 text-center text-gray-500">暂无用户数据</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>

    <!-- 页脚 -->
    <footer class="bg-white border-t border-gray-200 py-6">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <p class="text-center text-sm text-gray-500">
                © 2025 管理系统 - 保留所有权利
            </p>
        </div>
    </footer>
</body>
</html>