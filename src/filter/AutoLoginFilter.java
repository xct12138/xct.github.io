package filter;

import bean.User;
import service.UserService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebFilter(
        urlPatterns = {"*.jsp","/servlet/*"}
)
public class AutoLoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest) servletRequest;
        try {
            req.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        HttpSession session = req.getSession();
        Object user1 = session.getAttribute("user");
        System.out.println(user1);

        Cookie[] cookies = req.getCookies();
        User user = null;
        if (cookies != null && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                if ("user".equals(cookie.getName())) {
                    String np = cookie.getValue();
                    System.out.println(np);
                    if (np != null && np.length() > 32) {
                        String[] nps = np.split("-");
                        user = new UserService().getUserWithCookie(nps[0], nps[1]);
                        System.out.println("login：" + user);
                        break;
                    }
                } else if (cookie == cookies[cookies.length - 1] && user1==null) {
                    session.removeAttribute("user");
                }
            }
            if (user!=null) session.setAttribute("user", user);
            else System.out.println("autoLogin失败");
        }
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
