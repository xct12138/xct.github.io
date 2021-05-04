package servlet;

import sql.LoginSql;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String uname = req.getParameter("uname");
        String password = req.getParameter("password");

        try {
            Connection connection = LoginSql.getConnection();
            String nextPage="login.html";
            if (null!=connection) {
                PreparedStatement pre = connection.prepareStatement("select * from student where sname=? and pwd=password(?)");
                pre.setString(1, uname);
                pre.setString(2, password);
                ResultSet resultSet = pre.executeQuery();
                if (resultSet.next()) {
                    req.setAttribute("result", true);
                    nextPage="main.jsp";
                } else {
                    req.setAttribute("result", false);
                    resp.getWriter().print("no");
                    nextPage="index.jsp";
                }
            }
            req.getRequestDispatcher(nextPage).forward(req, resp);
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }

    }
}
