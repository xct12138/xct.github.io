package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/userBehavior/quit")
public class QuitServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        for (Cookie cookie : req.getCookies()) {
            if ("user".equals(cookie.getName())){
                cookie.setMaxAge(0);
            }
        }
        req.getSession().removeAttribute("user");
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
