<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员登录</title>
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
            .bg-gradient-blue {
                background: linear-gradient(135deg, #165DFF 0%, #36CFC9 100%);
            }
            .text-shadow {
                text-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .card-shadow {
                box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
            }
        }
    </style>
</head>
<body class="font-inter bg-neutral min-h-screen flex flex-col">
    <!-- 导航栏 -->
    <nav class="bg-white shadow-sm sticky top-0 z-50 transition-all duration-300" id="navbar">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    <span class="text-primary font-bold text-xl">管理系统</span>
                </div>
                <div class="flex items-center space-x-4">
                    <a href="<%= request.getContextPath() %>/index.jsp" class="text-gray-600 hover:text-primary transition-colors duration-200">
                        <i class="fa fa-home mr-1"></i>首页
                    </a>
                    <a href="#" class="text-gray-600 hover:text-primary transition-colors duration-200">
                        <i class="fa fa-question-circle mr-1"></i>帮助
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- 主要内容 -->
    <main class="flex-grow flex items-center justify-center p-4 sm:p-6 lg:p-8">
        <div class="w-full max-w-md">
            <!-- 卡片容器 -->
            <div class="bg-white rounded-2xl p-8 card-shadow transform hover:scale-[1.01] transition-all duration-300">
                <!-- 标题区域 -->
                <div class="text-center mb-8">
                    <div class="inline-flex items-center justify-center w-16 h-16 rounded-full bg-primary/10 mb-4">
                        <i class="fa fa-user-circle text-3xl text-primary"></i>
                    </div>
                    <h1 class="text-[clamp(1.5rem,3vw,2rem)] font-bold text-dark mb-2 text-shadow">管理员登录</h1>
                    <p class="text-gray-500">请输入您的账号和密码登录管理系统</p>
                </div>

                <!-- 表单区域 -->
                <form action="LoginServlet" method="post" class="space-y-4">
                    <div class="space-y-2">
                        <label for="name" class="block text-sm font-medium text-gray-700">用户名</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fa fa-user text-gray-400"></i>
                            </div>
                            <input type="text" name="name" id="name" required
                                class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all duration-200"
                                placeholder="请输入用户名">
                        </div>
                    </div>

                    <div class="space-y-2">
                        <label for="password" class="block text-sm font-medium text-gray-700">密码</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fa fa-lock text-gray-400"></i>
                            </div>
                            <input type="password" name="password" id="password" required
                                class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all duration-200"
                                placeholder="请输入密码">
                        </div>
                    </div>

                    <div class="pt-2">
                        <button type="submit"
                            class="w-full flex justify-center items-center py-3 px-4 border border-transparent rounded-lg shadow-sm text-base font-medium text-white bg-primary hover:bg-primary/90 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary transition-all duration-200 transform hover:translate-y-[-2px] hover:shadow-md">
                            <i class="fa fa-sign-in mr-2"></i>登录
                        </button>
                    </div>
                </form>

                <!-- 错误消息区域 -->
                <div class="mt-6">
                    <%
                        String loginMessage = request.getParameter("loginMessage");
                        if ("userNotExist".equals(loginMessage)) {
                    %>
                            <div class="bg-red-50 border-l-4 border-red-400 p-4 rounded-r-lg animate-pulse">
                                <div class="flex">
                                    <div class="flex-shrink-0">
                                        <i class="fa fa-exclamation-circle text-red-500"></i>
                                    </div>
                                    <div class="ml-3">
                                        <p class="text-sm text-red-700">
                                            用户不存在，请<a href="register.jsp" class="text-primary hover:underline">立即注册</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                    <%
                        } else if ("usernameError".equals(loginMessage)) {
                    %>
                            <div class="bg-red-50 border-l-4 border-red-400 p-4 rounded-r-lg">
                                <div class="flex">
                                    <div class="flex-shrink-0">
                                        <i class="fa fa-exclamation-circle text-red-500"></i>
                                    </div>
                                    <div class="ml-3">
                                        <p class="text-sm text-red-700">用户名错误</p>
                                    </div>
                                </div>
                            </div>
                    <%
                        } else if ("passwordError".equals(loginMessage)) {
                    %>
                            <div class="bg-red-50 border-l-4 border-red-400 p-4 rounded-r-lg">
                                <div class="flex">
                                    <div class="flex-shrink-0">
                                        <i class="fa fa-exclamation-circle text-red-500"></i>
                                    </div>
                                    <div class="ml-3">
                                        <p class="text-sm text-red-700">密码错误</p>
                                    </div>
                                </div>
                            </div>
                    <%
                        } else if ("notAdmin".equals(loginMessage)) {
                    %>
                            <div class="bg-red-50 border-l-4 border-red-400 p-4 rounded-r-lg">
                                <div class="flex">
                                    <div class="flex-shrink-0">
                                        <i class="fa fa-exclamation-circle text-red-500"></i>
                                    </div>
                                    <div class="ml-3">
                                        <p class="text-sm text-red-700">您不是管理员，请先登录管理员账号</p>
                                    </div>
                                </div>
                            </div>
                    <%
                        }
                    %>
                </div>
            </div>

            <!-- 底部链接 -->
            <div class="mt-6 text-center">
                <p class="text-sm text-gray-500">
                    <a href="#" class="text-primary hover:underline transition-colors duration-200">忘记密码？</a>
                </p>
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

    <script>
        // 导航栏滚动效果
        window.addEventListener('scroll', function() {
            const navbar = document.getElementById('navbar');
            if (window.scrollY > 10) {
                navbar.classList.add('shadow-md');
                navbar.classList.remove('shadow-sm');
            } else {
                navbar.classList.remove('shadow-md');
                navbar.classList.add('shadow-sm');
            }
        });

        // 添加表单输入动画效果
        const inputs = document.querySelectorAll('input');
        inputs.forEach(input => {
            input.addEventListener('focus', () => {
                input.parentElement.classList.add('scale-[1.02]');
                input.parentElement.classList.add('transition-transform');
                input.parentElement.classList.add('duration-200');
            });
            input.addEventListener('blur', () => {
                input.parentElement.classList.remove('scale-[1.02]');
            });
        });
    </script>
</body>
</html>
    