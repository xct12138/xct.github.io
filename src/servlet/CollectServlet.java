package servlet;

import bean.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/userBehavior/collect")
public class CollectServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        String aid= req.getParameter("aid");
        UserService userService=new UserService();
        //是否已经收藏，没有则收藏
        boolean collectSuccess=!userService.hasCollected(user,aid);
        if (collectSuccess) userService.collect(user,aid);
        //通知具体文章页面
        req.setAttribute("collect",collectSuccess);
    }
}
