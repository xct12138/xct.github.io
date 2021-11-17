package filter;

import bean.User;
import dao.sql.UserQuery;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebFilter(
        urlPatterns = "/*"
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
        Cookie[] cookies = req.getCookies();
        User user=null;
        if (cookies!=null && cookies.length>0) {
            for (Cookie cookie : cookies) {
                if ("user".equals(cookie.getName())) {
                    String np = cookie.getValue();
                    System.out.println(np);
                    if (np != null && np.length() > 32) {
                        String[] nps=np.split("-");
                        user = new UserQuery().getUserWithCookie(nps[0],nps[1]);
                        System.out.println("login："+user);
                    }
                }
            }
            req.setAttribute("user", user);
        }
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
