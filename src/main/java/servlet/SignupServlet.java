package servlet;


import bean.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname = req.getParameter("upUname");
        String password = req.getParameter("upPassword");
        String email= req.getParameter("email");
        try {
            UserService userService=new UserService();
            //检查用户名是否重复
            User user = userService.getUser(uname, password);
            if (user==null){
                if (password != null && email != null) {
                    //添加用户
                    User user1=new User(uname,password,email);
                    int i=userService.addUser(user1);
                    if (i>0) req.setAttribute("signupResult",true);
                }
            }else{
                req.setAttribute("signupResult", false);
                req.setAttribute("isRepeat", true);
            }
            req.getRequestDispatcher("/source/page/Login.jsp").forward(req, resp);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
