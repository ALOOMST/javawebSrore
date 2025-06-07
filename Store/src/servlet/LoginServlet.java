package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String password = request.getParameter("password");

        List<Map<String, Object>> userMapList = userService.selectUser(name);
        if (userMapList == null || userMapList.isEmpty()) {
            response.sendRedirect("Login.jsp?loginMessage=userNotExist");
            return;
        }

        Map<String, Object> user = userMapList.get(0);
        if (!name.equals(user.get("name"))) {
            response.sendRedirect("Login.jsp?loginMessage=usernameError");
            return;
        }

        if (!password.equals(user.get("password"))) {
            response.sendRedirect("Login.jsp?loginMessage=passwordError");
            return;
        }

        // 检查是否为管理员
        int isAdmin = (int) user.get("isAdmin");
        if (isAdmin == 1) {
            // 管理员登录成功
            request.getSession().setAttribute("user", user);
            response.sendRedirect("AdminHome.jsp"); // 管理员跳转到后台管理页面
        } else {
            // 普通用户登录成功
            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("userId", user.get("UserID")); // 存储用户ID
            response.sendRedirect("index.jsp"); // 普通用户跳转到商品展示页面
        }
    }
}