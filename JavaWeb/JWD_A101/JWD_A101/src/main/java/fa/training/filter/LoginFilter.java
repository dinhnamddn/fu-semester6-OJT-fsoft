package fa.training.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter", urlPatterns = {"/*"})
public class LoginFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();

        String loginUrl = request.getContextPath() + "/login";
        boolean isLoginPage = request.getRequestURI().equals(loginUrl);
        boolean isLoggedIn = session.getAttribute("username") != null;
        if (isLoginPage || isLoggedIn) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            response.sendRedirect(loginUrl);
        }
    }
}
