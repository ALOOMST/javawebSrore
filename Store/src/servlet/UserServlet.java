package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import bean.User;
import service.UserService;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if ("register".equals(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            User user = new User(name, email, password, phone, address);

            List<Map<String, Object>> userMap = userService.selectUser(name);
            if (userMap != null && !userMap.isEmpty()) {
                response.sendRedirect("register.jsp?success=userExist");
                return;
            }

            boolean success = userService.registerUser(user);
            if (success) {
                request.getSession().setAttribute("user", user);
                response.sendRedirect("register.jsp?success=1");
            } else {
                response.sendRedirect("register.jsp?success=0");
            }
        } else if ("update".equals(action)) {
            String userIdStr = request.getParameter("userId");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String isAdminStr = request.getParameter("isAdmin");

            int userId = Integer.parseInt(userIdStr);
            int isAdmin = Integer.parseInt(isAdminStr);

            User user = new User(userIdStr, name, email, password, phone, address, isAdmin);
            boolean success = userService.updateUser(user);
            if (success) {
                response.sendRedirect("adminUserManagement.jsp");
            } else {
                response.sendRedirect("adminUserManagement.jsp?error=updateFailed");
            }
        } else if ("delete".equals(action)) {
            String userIdStr = request.getParameter("userId");
            int userId = Integer.parseInt(userIdStr);
            boolean success = userService.deleteUser(userId);
            if (success) {
                response.sendRedirect("adminUserManagement.jsp");
            } else {
                response.sendRedirect("adminUserManagement.jsp?error=deleteFailed");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}