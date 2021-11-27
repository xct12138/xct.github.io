package servlet;

import bean.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signin")
public class SignInServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp){
        String uname = req.getParameter("uname");
        String password = req.getParameter("password");

        String nextPage="/source/page/Login.jsp";

        UserService userService=new UserService();
        User user1 = userService.getUser(uname, password);
        if (user1!=null){
            req.getSession().setAttribute("user",user1);
            nextPage="index.jsp";
            Cookie signinCookie=new Cookie("user", uname+"-"+user1.getPwd());
            signinCookie.setMaxAge(60*24*60*60);
            signinCookie.setPath("/");
            resp.addCookie(signinCookie);
        }
        try {
            req.getRequestDispatcher(nextPage).forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
