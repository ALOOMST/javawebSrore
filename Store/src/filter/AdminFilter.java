package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {
    public void init(FilterConfig fConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();

        User user = (User) session.getAttribute("user");
        if (user != null && user.getIsAdmin() == 1) {
            // 管理员，放行
            chain.doFilter(request, response);
        } else {
            // 非管理员，跳转到登录页面并显示提示
            httpResponse.sendRedirect("Login.jsp?loginMessage=notAdmin");
        }
    }

    public void destroy() {
    }
}